package swf.bridge {
	import swf.plugin.ISwfWindowPlugin;

	import flash.display.LoaderInfo;

	/** @private **/
	public class AbstractFdtUiBridge extends AbstractFdtBridge {
		private var _swfUiPlugin : ISwfWindowPlugin;

		public function AbstractFdtUiBridge(loaderInfo : LoaderInfo, swfUiPlugin : ISwfWindowPlugin) {
			super(loaderInfo, swfUiPlugin);
			_swfUiPlugin = swfUiPlugin;
		}

		/** @private **/
		override protected function readExtendedMessage(messageID : int) : void {
			if (messageID < 4000) {
				readBaseUiMessage(messageID);
			} else {
				readExtendedUiMessage(messageID);
			}
		}

		private function readBaseUiMessage(messageID : int) : void {
			switch (messageID) {
				case 2500:
					baseOpened(_bridgeSocket.readInt(), _bridgeSocket.readInt());
					return;
				case 2501:
					_swfUiPlugin.setSize(_bridgeSocket.readInt(), _bridgeSocket.readInt());
					return;
				case 2502:
					var callerInstanceId : String = _bridgeSocket.readUTF();
					var dialogInstanceId : String = _bridgeSocket.readUTF();
					var result : String = _bridgeSocket.readUTF();
					dialogClosed(callerInstanceId, dialogInstanceId, result);
					return;
				case 2503:
					var count : int = _bridgeSocket.readInt();
					var colors : Array = new Array();
					for (var i : int = 0;i < count;i++) {
						colors.push(_bridgeSocket.readInt());
					}
					colorSet(colors);
					return;
				case 2525:
					var entryId : String = _bridgeSocket.readUTF();
					callEntryAction(entryId);
			}
		}

		/** @private **/
		protected function callEntryAction(entryId : String) : void {
		}

		/** @private **/
		protected function colorSet(colors : Array) : void {
		}

		/** @private **/
		protected function dialogClosed(callerInstanceId : String, dialogInstanceId : String, result : String) : void {
			_swfUiPlugin.dialogClosed(dialogInstanceId, result);
		}

		/** @private **/
		protected function readExtendedUiMessage(messageID : int) : void {
		}

		/** @private **/
		internal function baseOpened(width : int, height : int) : void {
			_swfUiPlugin.setSize(width, height);
		}
	}
}
