# Signal by Ulexic

* My very own lightweight signal module, to make it into a table, for use in a all-in-one script, remove the "return Signal" at the end.
* Open for use by anyone.

# How to use
*Signal - required module.*
*CreatedSignal - created signal.*
*Connection - connection created upon connecting.*

* Creation
  
  ``Signal.new()``
  Creates an object with all of the below listed methods.

* Connecting

  ``CreatedSignal:Connect(function)``
  Listens to the signal's calls, executing a function with the given parameters on call.
  Disconnect with ``Connection:Disconnect()``.

***

  ``CreatedSignal:Once(function)``
  
