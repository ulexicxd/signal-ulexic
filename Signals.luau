function RandomCharacters(length:number)
	local characters = ""

	for index = 1, length do
		characters = characters .. string.char(math.random(65,90))
	end

	return characters
end

local Signal = {}
Signal.__index = Signal

function Signal.new()
	local self = setmetatable({},Signal)

	self._listeners = {}

	return self
end

function Signal:Destroy()
	self:DisconnectAll()
	table.clear(self)
	setmetatable(self, nil)
end

function Signal:Fire(...)
	for _, listener in pairs(self._listeners) do
		local connectionType = listener._type

		task.spawn(listener._callback, ...)

		if connectionType == "Once" then
			listener:Disconnect()
		end

		if not success then warn(result) end
	end
end

function Signal:DisconnectAll()
	for _, listener in pairs(self._listeners) do
		listener:Disconnect()
	end
end

function Signal:Connect(callback:(any) -> ())
	local index = RandomCharacters(12)

	local signal = self

	self._listeners[index] = {
		["_callback"] = callback,
		["_type"] = "Connect",
		["_index"] = index
	}

	local listener = self._listeners[index]

	function listener:Disconnect()
		signal._listeners[index] = nil
	end

	return listener
end

function Signal:Once(callback:(any) -> ())
	local index = RandomCharacters(12)

	local signal = self

	self._listeners[index] = {
		["_callback"] = callback,
		["_once"] = "Once",
		["_index"] = index
	}

	local listener = self._listeners[index]

	function listener:Disconnect()
		signal._listeners[index] = nil
	end

	return listener
end

function Signal:Wait()
	local thread = coroutine.running()
	local connection

	connection = self:Connect(function(...)
		connection:Disconnect()
		if coroutine.status(thread) ~= "dead" then
			task.spawn(thread, ...)
		end
	end)

	return coroutine.yield()
end

return Signal
