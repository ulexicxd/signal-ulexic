# Signal by Ulexic

* My very own lightweight signal module, to make it into a table, for use in a all-in-one script, remove the "return Signal" at the end.
* Open for use by anyone.
  
# How to use
*Signal - required module.*
*CreatedSignal - created signal.*
*Connection - connection created upon connecting.*
  
* Creation and destruction
    
  ``Signal.new()``
  Creates a signal object with all of the below listed methods.
  
  ``Signal:Destroy()``
  Destroys the signal object.
  
* Connecting
  
  ``CreatedSignal:Connect(function(parameters))``
  Listens to the signal's calls, executing a function with the values passed in ``CreatedSignal:Fire()``.  
  Disconnect with ``Connection:Disconnect()``.  
  
  ``CreatedSignal:Once(function)``  
  Listens to the signal's calls, executing a function with the values passed in ``CreatedSignal:Fire()`` disconnecting after a single call.  
  Disconnect with ``Connection:Disconnect()``.  
  
  ``CreatedSignal:Wait()``  
  Listens to the signal's calls, returning values passed in ``CreatedSignal:Fire()``.  
  Cannot be disconnected.  
  
* Firing
  
  ``Signal:Fire(any)``  
  Fires a signal, calling all listeners with the passed values.

***
  
Thank you for using my Signal module, I greatly appreciate support.  
