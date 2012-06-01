package swf.bridge {
	import flash.net.Socket;
	import flash.utils.Dictionary;

	/**
	 * The Core Requestor allows access to core parts of Fdt. Currently not used. 
	 */
	public class FdtCoreRequestor {
		private var _bridge : AbstractFdtBridge;
		private var _bridgeSocket : Socket;

		/**
		 * Don't use directly. Instead, use <code>Requestor</code> accessors of the bridge to get a requestor. 
		 */
		public function FdtCoreRequestor(abstractFdtBridge : AbstractFdtBridge) {
			_bridge = abstractFdtBridge;
			_bridgeSocket = abstractFdtBridge.bridgeSocket;
		}

		private function requestOptions() : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1001, this, function(_bridgeSocket : Socket) : void {
					var count : int = _bridgeSocket.readShort();
					var options : Dictionary;
					for (var i : int = 0; i < count; i++) {
						options[_bridgeSocket.readUTF()] = _bridgeSocket.readUTF();
					}
					a.push(options);
					rt.apply(thisObject, a);
				});
				_bridgeSocket.flush();
			});
		}

		private function setOption(key : String, value : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1002, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(key);
				_bridgeSocket.writeUTF(value);
				_bridgeSocket.flush();
			});
		}
	}
}
