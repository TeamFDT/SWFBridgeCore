// Comment
package swf.bridge {
	import mx.managers.SystemManager;

	import flash.display.LoaderInfo;
	import flash.net.Socket;

	public class FdtMasterBridge extends AbstractFdtUiBridge {
		private var actionPluginMap : Array = new Array();
		private var _currentList : Array;
		private var _proposalMapping : Array;
		private var _swfMasterPlugin : SwfMasterPlugin;

		public function FdtMasterBridge(loaderInfo : LoaderInfo, swfMasterPlugin : SwfMasterPlugin) {
			super(loaderInfo, swfMasterPlugin);
			_swfMasterPlugin = swfMasterPlugin;
			SystemManager;
		}

		override protected function readBaseMessage(messageID : int) : void {
			// _swfMasterPlugin.handle(messageID);
			switch(messageID) {
				case 501:
					loadSwfActionPlugin();
					return;
				case 502:
					unloadSwfActionPlugin();
					return;
				case 503:
					readProposalsRequest();
					return;
				case 504:
					readProposalSelection();
					return;
				default:
					super.readBaseMessage(messageID);
			}
		}

		private function loadSwfActionPlugin() : void {
			var id : String = _bridgeSocket.readUTF();
			var path : String = _bridgeSocket.readUTF();
			if (actionPluginMap[id] == null) {
				trace("Activate: " + id);
				new SwfActionPluginFrame(this, id, path, _swfMasterPlugin).load();
			}
		}

		override protected function callEntryAction(entryId : String) : void {
			var parts : Array = entryId.split("#");
			var actionPlugionId : String = parts[0];
			var loader : SwfActionPluginFrame = actionPluginMap[actionPlugionId];
			trace("EntryId: " + entryId);
			trace("API: " + actionPlugionId);
			if (loader != null) {
				loader.swfActionPlugin.callEntryAction(entryId.substring(actionPlugionId.length + 1));
			}
		}

		public function loadSuccess(loader : SwfActionPluginFrame) : void {
			actionPluginMap[loader.id] = loader;
			actionPluginMap.sortOn("id");
			loader.swfActionPlugin.init(new FdtActionBridge(this, loader));
		}

		public function loadFailed(loader : SwfActionPluginFrame) : void {
		}

		private function unloadSwfActionPlugin() : void {
			var id : String = _bridgeSocket.readUTF();
			var loader : SwfActionPluginFrame = actionPluginMap[id];
			if (loader != null) {
				trace("Deactivate: " + id);
				loader.unload();
				delete actionPluginMap[id];
			}
		}

		private function readProposalsRequest() : void {
			var javaStamp : int = _bridgeSocket.readInt();
			var pc : FdtEditorContext = editor.readEditorContext();
			_bridgeSocket.writeShort(1);
			_bridgeSocket.writeInt(javaStamp);
			_proposalMapping = new Array();
			for each (var sapf : SwfActionPluginFrame in actionPluginMap) {
				_proposalMapping[sapf.id] = _currentList = new Array();
				_bridgeSocket.writeUTF(sapf.id);
				sapf.createProposals(pc);
				_bridgeSocket.writeUTF("");
			}
			_bridgeSocket.writeUTF("");
			_bridgeSocket.flush();
		}

		public function offerProposal(id : String, iconId : String, displayString : String, additionalInfo : String, onSelection : Function) : void {
			_bridgeSocket.writeUTF(id);
			_bridgeSocket.writeUTF(iconId);
			_bridgeSocket.writeUTF(displayString);
			_bridgeSocket.writeUTF(additionalInfo);
			_currentList[id] = onSelection;
		}

		private function readProposalSelection() : void {
			var pluginId : String = _bridgeSocket.readUTF();
			var subId : String = _bridgeSocket.readUTF();
			var pc : FdtEditorContext = editor.readEditorContext();
			_proposalMapping[pluginId][subId](subId, pc);
			_proposalMapping = new Array();
		}

		override protected function dialogClosed(callerInstanceId : String, dialogInstanceId : String, result : String) : void {
			var parts : Array = callerInstanceId.split("#");
			var loader : SwfActionPluginFrame = actionPluginMap[parts[0]];
			if (loader != null) {
				loader.swfActionPlugin.dialogClosed(dialogInstanceId, result);
			}
		}

		override protected function react(messageID : int) : void {
			_swfMasterPlugin.handle(messageID);
		}

		override protected function colorSet(colors : Array) : void {
			_swfMasterPlugin.setColors(colors);
		}

		public function click() : void {
			sendStampedMessage(2100, this, function(_bridgeSocket : Socket) : void {
				_bridgeSocket.readBoolean();
			});
			_bridgeSocket.flush();
		}
	}
}
