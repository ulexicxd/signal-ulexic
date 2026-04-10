# Signal by Ulexic

* My very own lightweight signal module, to make it into a table, for use in a all-in-one script, remove the "return Signal" at the end.
* Open for use by anyone.
  
# How to use
*Signal - required module.*
*CreatedSignal - created signal.*
*Connection - connection created upon connecting.*
  
* Creation and destruction
  
  * new  
  ``Signal.new()``
  Creates a signal object with all of the below listed methods.

  * Destroy  
  ``Signal:Destroy()``
  Destroys the signal object.
  
* Connecting

  * Connect  
  ``CreatedSignal:Connect(function(parameters))``
  Listens to the signal's calls, executing a function with the values passed in ``CreatedSignal:Fire()``.  
  Disconnect with ``Connection:Disconnect()``.  

  * Once  
  ``CreatedSignal:Once(function)``  
  Listens to the signal's calls, executing a function with the values passed in ``CreatedSignal:Fire()`` disconnecting after a single call.  
  Disconnect with ``Connection:Disconnect()``.  

  * Wait  
  ``CreatedSignal:Wait()``  
  Listens to the signal's calls, returning values passed in ``CreatedSignal:Fire()``.  
  Cannot be disconnected.  
  
* Firing

  * Fire  
  ``Signal:Fire(any)``  
  Fires a signal, calling all listeners with the passed values.

***
  
Thank you for using my Signal module, I greatly appreciate support.  
