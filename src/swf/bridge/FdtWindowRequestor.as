package swf.bridge {
	import flash.net.Socket;

	/**
	 * The Window Requestor allows access to the window displaying the swf plugin.
	 */
	public final class FdtWindowRequestor {
		private var _bridge : AbstractFdtWindowBridge;
		private var _bridgeSocket : Socket;

		/***
		 * This constructor may change in future, please use the accessors of the
		 * bridge to get a requestor and do not use this constructor 
		 */
		public function FdtWindowRequestor(fdtViewBridge : AbstractFdtWindowBridge) {
			_bridge = fdtViewBridge;
			_bridgeSocket = fdtViewBridge.bridgeSocket;
		}

		/***
		 * Sets the title of the window.
		 * The request returns <code>true</code>, if the image could be set, otherwise <code>false</code>.  
		 * 
		 * @param title the title of the window
		 * 
		 */
		public function setName(title : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(4001, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(title);
			});
		}

		/***
		 * Sets the title image of the window.
		 * The request returns <code>true</code>, if the title could be set, otherwise <code>false</code>.  
		 * 
		 * @param iconId the iconId of a registered image
		 * 
		 */
		public function setImage(iconId : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(4002, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(iconId);
			});
		}

		/***
		 * Sets the tool tip text of the window (only used for view(s) plugins).
		 * The request returns <code>true</code>, if the tool tip text could be set, otherwise <code>false</code>.
		 * 
		 * @param text the tool tip text
		 * 
		 */
		public function setToolTip(text : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(4003, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(text);
			});
		}

		/***
		 * Sets the size of the browser area in dialog window (only used for dialog plugins).
		 * Then the size of the dialog window is set to the size of the browser area plus the window decoration. 
		 * The request returns <code>true</code>, if the size could be set, otherwise <code>false</code>.
		 * 
		 * @param width width of the browser area 
		 * @param height height of the browser area 
		 */
		public function resize(width : int, height : int) : Object {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(4005, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeInt(width);
				_bridgeSocket.writeInt(height);
			});
		}
	}
}
