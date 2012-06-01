package swf.bridge {
	public class FdtActionBridge implements IFdtActionBridge {
		private var _masterBridge : FdtMasterBridge;
		private var _uiRequestor : FdtUiRequestor;
		private var _frameId : String;

		public function FdtActionBridge(masterBridge : FdtMasterBridge, frame : SwfActionPluginFrame) {
			_masterBridge = masterBridge;
			_frameId = frame.id;
			_uiRequestor = new FdtUiRequestor(masterBridge, _frameId + "#");
		}

		public function offerProposal(id : String, iconId : String, displayString : String, additionalInfo : String, onSelection : Function) : void {
			_masterBridge.offerProposal(id, _frameId + "#" + iconId, displayString, additionalInfo, onSelection);
		}

		public function get model() : FdtModelRequestor {
			return _masterBridge.model;
		}

		public function get workspace() : FdtWorkspaceRequestor {
			return _masterBridge.workspace;
		}

		public function get ui() : FdtUiRequestor {
			return _uiRequestor;
		}

		public function get core() : FdtCoreRequestor {
			return _masterBridge.core;
		}

		public function get editor() : FdtEditorRequestor {
			return _masterBridge.editor;
		}

		public function get instanceId() : String {
			return _frameId + "#" + _masterBridge.instanceId;
		}

		public function newRequest() : FdtRequest {
			return _masterBridge.newRequest();
		}
		
	}
}
