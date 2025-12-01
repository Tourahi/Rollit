--
-- log.lua
--
-- Copyright (c) 2016 rxi
--
-- This library is free software; you can redistribute it and/or modify it
-- under the terms of the MIT license. See LICENSE for details.
--

local log = { _version = "0.1.1" }

log.usecolor = true
log.outfile = nil
log.level = "trace"
log.ptf = false
log.showFileInfo = true

local concat = table.concat

local modes = {
	{ name = "trace", color = "\27[34m" },
	{ name = "debug", color = "\27[36m" },
	{ name = "info", color = "\27[32m" },
	{ name = "warn", color = "\27[33m" },
	{ name = "error", color = "\27[31m" },
	{ name = "fatal", color = "\27[35m" },
}

log.logFileName = function(name)
	if name ~= nil and name ~= "" then
		log.outfile = name or log.outfile
	end
	return log.outfile
end

log.setShowFileInfo = function(bool)
	log.showFileInfo = bool
end

local levels = {}
for i, v in ipairs(modes) do
	levels[v.name] = i
end

local round = function(x, increment)
	increment = increment or 1
	x = x / increment
	return (x > 0 and math.floor(x + 0.5) or math.ceil(x - 0.5)) * increment
end

local _tostring = tostring

local tostring = function(...)
	local t = {}
	for i = 1, select("#", ...) do
		local x = select(i, ...)
		if type(x) == "number" then
			x = round(x, 0.01)
		end
		t[#t + 1] = _tostring(x)
	end
	return table.concat(t, " ")
end

local dump = function(value)
	local _dump -- recursive func
	_dump = function(value, depth)
		if depth == nil then
			depth = 0
		end
		local v_t = type(value)
		if v_t == "string" then
			return '"' .. value .. '"\n'
		elseif v_t == "table" then
			depth = depth + 1
			local lines
			do
				local _lines = {}
				local _len = 1
				for k, v in pairs(value) do
					_lines[_len] = (" "):rep(depth * 4) .. "[" .. tostring(k) .. "] = " .. _dump(v, depth)
					_len = _len + 1
				end
				lines = _lines
			end
			-- Moonscript Only
			local class_name
			if value.__call then
				class_name = "<" .. tostring(value.__class.__name) .. ">"
			end
			return tostring(class_name or "") .. "{\n" .. concat(lines) .. (" "):rep((depth - 1) * 4) .. "}\n"
		else
			return tostring(value) .. "\n"
		end
	end
	return _dump(value)
end

log.t = dump

for i, x in ipairs(modes) do
	local nameupper = x.name:upper()
	log[x.name] = function(...)
		-- Return early if we're below the log level
		if i < levels[log.level] then
			return
		end

		local msg = tostring(...)
		local info = debug.getinfo(2, "Sl")
		local lineinfo = info.short_src .. ":" .. info.currentline

		-- Output to console
		print(
			string.format(
				"%s[%-6s%s]%s %s: %s",
				log.usecolor and x.color or "",
				nameupper,
				os.date("%H:%M:%S"),
				log.usecolor and "\27[0m" or "",
				lineinfo,
				msg
			)
		)

		if log.outfile then
			-- Output to log file
			local fp = io.open(log.outfile, "a")
			if fp ~= nil then
				local str
				if log.showFileInfo then
					str = string.format("[%-6s%s] %s: %s\n", nameupper, os.date(), lineinfo, msg)
				else
					str = string.format("[%-6s%s]: %s\n", nameupper, os.date(), msg)
				end
				fp:write(str)
				fp:close()
			end
		end
	end
end

return log
