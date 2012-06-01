package swf.bridge {
	/*
	 * 	
	 * <p>When you want FDT to execute a behaviour, you create a request, add a function to it and then send it to the SWFBridge to be executed.
	 * While each request only takes one function as an arugument, multiple requests can be submitted at once.</p>
	 * 
	 * <b>EXAMPLE:</b><br /><br /><code>
	 * // In this examnple, we sent multiple requests to the SWFBridge to set some basic properties of our plugin.
	 * public function init() : void { <br /><br />
	 *  // This request will register an image with the SWFBrige. Before an image can be used (displayed), it must be registered so it can be held in memory.<br />
	 * 	_bridge.ui.registerImage("DemoIcon", new _picture1()).sendTo(this,null);<br /><br />
	 * 	// After an image is registered, you can use it in your plugin. This request tells the SWFBridge to set the registered graphic, "DemoIcon", as the icon for the view panel.<br />     
	 * 	_bridge.window.setImage("DemoIcon").sendTo(this, null);<br /><br />
	 * 	// This request sets the name of the view panel.<br />
	 * 	_bridge.window.setName("Demo View").sendTo(this, null);<br /><br />
	 * 	// This request sets description when the tooltip hover over is activated.<br />
     * 	_bridge.window.setToolTip("Demo View").sendTo(this, null);<br /><br />
	 * }<br />
	 * </code>
	 * <br />
	 * The results of these functions are collected and send to the function 
	 * given to the method <code>sendTo</code>.
	 */
	public class FdtRequest {
		private var _make : Function;

		/**
		 * <p>FDTRequests are not directly instanciated. Instead, create requests via the bridge instance that is provided in the <code>init</code> menthod.</p>
		 */
		public function FdtRequest(make : Function = null) {
			if (make == null) {
				_make = function(thisObject : Object, a : Array, rt : Function) : void {
					rt.apply(thisObject, a);
				};
			} else {
				_make = make;
			}
		}

		/**
		 * Transfers the request to FDT and calls the supplied function <code>f</code>
		 * with the request result.
		 * 
		 * <pre>
		 * function deleteResourceAndCreateFolder(path1 : String, path2 : String) : void {
		 *     var r : FdtRequest = _bridge.newRequest();
		 *     r.add(_bridge.workspace.deleteResource(path1));
		 *     r.add(_bridge.workspace.createFolder(path2));
		 *     r.sendTo(this, res);				
		 * }
		 * 
		 * private function res(deleteResult : Boolean, createdFolder : IFdtResource) : void {
		 *     trace( "Is resource deleted: ", deleteResult);	
		 *     trace( "New create folder: ", createdFolder as FdtFolder);
		 * }
		 * </pre>
		 *
		 * @param thisObject the object to use as this in the call of function <code>f</code>
		 * i.e.: <br> <code> f.apply(this.object, result1, result2, ...) </code>  
		 * @param f After the request is processed by FDT the function <code>f</code> is called 
		 * with the request results as parameters.
		 * 
		 */
		public function sendTo(thisObject : Object, f : Function) : void {
			if (f == null) {
				f = function(... args) : void {
				};
			}
			_make(thisObject, new Array(), f);
			_make = null;
		}

		/**
		 * Extends this request with another one.
		 * @param request the other request
		 * 
		 * returns this 
		 */
		public function add(request : FdtRequest) : FdtRequest {
			if (_make == null) {
				throw new Error("FDT Request is already send.");
			}
			_make = create(_make, request._make);
			return this;
		}

		private function create(make1 : Function, make2 : Function) : Function {
			return function(thisObject : Object, a : Array, rt : Function) : void {
				make1(thisObject, a, function(... args) : void {
					make2(thisObject, args, rt);
				});
			} ;
		}
	}
}
