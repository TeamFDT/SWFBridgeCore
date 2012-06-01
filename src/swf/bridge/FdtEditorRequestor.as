package swf.bridge {
	import flash.net.Socket;

	/**
	 * Editor Requestors allow access to FDT's open editors. 
	 */
	public class FdtEditorRequestor {
		private var _bridge : AbstractFdtBridge;
		private var _bridgeSocket : Socket;

		/**
		 * Don't use directly. Instead, use <code>Requestor</code> accessors of the bridge to get a requestor. 
		 */
		public function FdtEditorRequestor(bridge : AbstractFdtBridge) {
			_bridge = bridge;
			_bridgeSocket = bridge.bridgeSocket;
		}

		/**
		 * Selects a document part in an editor. 
		 * The request returns <code>true</code> if the selection could be set, otherwise <code>false</code>
		 * 
		 * @param editorFile the selection of the editor of this editor file should be modified
		 * @param offset the start offset of the selection
		 * @param length the length of the selection
		 */
		public function select(editorFile : String, offset : int, length : int) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(5001, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(editorFile);
				_bridgeSocket.writeInt(offset);
				_bridgeSocket.writeInt(length);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Opens an editor for a file. 
		 * The request returns <code>true</code> if the file could be opened, otherwise <code>false</code>
		 * 
		 * @param editorFile the file to open an editor for
		 */
		public function open(editorFile : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(5002, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(editorFile);
				_bridgeSocket.flush();
			});
		}

		/**
		 * The request returns the editor context of the current selected editor or <code>null</code>
		 * if no editor has been focused.  
		 */
		public function getCurrentContext() : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(5003, this, function(_bridgeSocket : Socket) : void {
					a.push(readEditorContext());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.flush();
			});
		}
		
		/** @private **/
		internal function readEditorContext() : FdtEditorContext {
			var pc : FdtEditorContext = new FdtEditorContext();
			pc.currentFile = _bridgeSocket.readUTF();
			pc.currentLine = _bridgeSocket.readUTF();
			pc.currentLineOffset = _bridgeSocket.readInt();
			pc.selectionOffset = _bridgeSocket.readInt();
			pc.selectionLength = _bridgeSocket.readInt();
			pc.currentLineSeperator = _bridgeSocket.readUTF();
			return pc;
		}
	}
}
