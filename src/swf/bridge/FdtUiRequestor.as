package swf.bridge {
	import flash.net.Socket;
	import flash.utils.ByteArray;

	/**
	 * The Ui Requestor allows access to ui parts of Fdt. 
	 */
	public final class FdtUiRequestor {
		private var _bridgeSocket : Socket;
		private var _bridge : AbstractFdtUiBridge;
		private var _idPrefix : String;
		private var _standardCloseRequestHandler : Function;

		/**
		 * Don't use directly. Instead, use <code>Requestor</code> accessors of the bridge to get a requestor. 
		 */
		public function FdtUiRequestor(bridge : AbstractFdtUiBridge, idPrefix : String = "") {
			_bridge = bridge;
			_bridgeSocket = bridge.bridgeSocket;
			_idPrefix = idPrefix;
			trace("IdPrefix: " + idPrefix);
		}

		/**
		 * Registers an image which could be used as icon in several locations
		 * (View Icon, Dialog Icon, Propsal Icon, Menu Entry Icon, ...) 
		 * @param imageId the id used within the swf plugin to identify the image
		 * @param imageData a byte stream containing gif image data (only the gif format decoding is 
		 * os independent available in each eclipse version)
		 * 
		 * The request returns <code>true</code>, if the image could be set, otherwise <code>false</code>.  
		 */
		public function registerImage(imageId : String, imageData : ByteArray) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(2001, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(_idPrefix + imageId);
				_bridgeSocket.writeInt(imageData.length);
				_bridgeSocket.writeBytes(imageData);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Registers a menu entry at some place in the in main menu of FDT.  
		 * 
		 * @param entryId the entry id to identify this entry within the swf plugin
		 * @param label the label is shown in the menu 
		 * @param tooltip this text is show as tool tip text of the menu entry 
		 * @param imageId this image is shown in front of the label
		 * @param path path to place the menu entry into the FDT main menu 
		 */
		 public function registerMenuEntry(entryId : String, label : String, toolTip : String, imageId : String, path : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(2010, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(_idPrefix + entryId);
				_bridgeSocket.writeUTF(label);
				_bridgeSocket.writeUTF(toolTip);
				_bridgeSocket.writeUTF(_idPrefix + imageId);
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Registers a menu at some place in the in main menu of FDT.  
		 * 
		 * @param entryId the entry id to identify this menu within the swf plugin
		 * @param label the label is shown in the menu 
		 * @param imageId this image is shown in front of the label
		 * @param path path to place the menu into the FDT main menu 
		 */
		public function registerMenu(entryId : String, label : String, imageId : String, path : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(2010, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(_idPrefix + entryId);
				_bridgeSocket.writeUTF(label);
				_bridgeSocket.writeUTF("##");
				_bridgeSocket.writeUTF(_idPrefix + imageId);
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Opens a swf dialog plugin as dialog.    
		 * 
		 * The requests returns the new system wide unique dialog plugin instance id to allow
		 * <code>LocalCommunication</code> between the swf dialog plugin and the calling swf plugin.   
		 *
		 * @param dialogPluginName the name of the dialog plugin to open
		 * @param startInfo this string is transfered to the swf dialog plugin. 
		 * It is free for any use.
		 */
		public function openDialog(dialogPluginName : String, startInfo : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(2002, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readUTF());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(dialogPluginName);
				_bridgeSocket.writeUTF(_idPrefix + _bridge.instanceId);
				_bridgeSocket.writeUTF(startInfo);
				_bridgeSocket.flush();
			});
		}
	}
}
