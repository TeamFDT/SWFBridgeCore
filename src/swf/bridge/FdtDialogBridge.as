package swf.bridge {
	import swf.plugin.ISwfDialogPlugin;

	import flash.display.LoaderInfo;
	import flash.net.Socket;

	/**
	 * The Fdt Dialog Bridge establishs a connection to Fdt for Swf Dialog Plugins.
	 * Every Swf Dialog Plugin should instantiate ONE <code>FdtDialogBridge</code>.
	 */
	public class FdtDialogBridge extends AbstractFdtWindowBridge {
		private var _swfDialogPlugin : ISwfDialogPlugin;
		private var _callerInstanceId : String;

		public function FdtDialogBridge(loaderInfo : LoaderInfo, swfDialogPlugin : ISwfDialogPlugin) {
			super(loaderInfo, swfDialogPlugin);
			_callerInstanceId = _parameters["CallerInstanceId"];
			_swfDialogPlugin = swfDialogPlugin;
		}

		override protected function readExtendedUiMessage(messageID : int) : void {
			switch (messageID) {
				case 4501:
					_swfDialogPlugin.closeRequest();
					return;
				case 4502:
					_swfDialogPlugin.init(_bridgeSocket.readUTF());
					return;
			}
			return;
		}

		/**
		 * Returns the systemwide unique instance id of the caller plugin (A Dialog, Action or View(s) Plugin).
		 */
		public function get callerInstanceId() : String {
			return _callerInstanceId;
		}

		/**
		 * Closes the current Swf Dialog Plugin and transfers the result to the caller plugin.
		 * 
		 * @param result result string transfered to the caller plugin  
		 */
		public function close(result : String) : void {
			new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				sendStampedMessage(4004, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(callerInstanceId);
				_bridgeSocket.writeUTF(result);
			}).sendTo(null, null);
		}
	}
}
