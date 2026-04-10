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

function Signal:Fire(...)
	for _, listener in self._listeners do
		local connectionType = listener._type

		if connectionType == "Wait" then
			listener._active = false
			listener._callback(...)
			listener:Disconnect()
		elseif connectionType == "Once" then
			listener._callback(...)
			listener:Disconnect()
		else
			listener._callback(...)
		end
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
		["_type"] = "Once",
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
		task.spawn(thread,...)
	end)

	return coroutine.yield()
end

return Signal
