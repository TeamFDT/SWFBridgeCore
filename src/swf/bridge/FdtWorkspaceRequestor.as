package swf.bridge {
	import fdt.resource.FdtContainer;
	import fdt.resource.FdtFile;
	import fdt.resource.FdtFolder;
	import fdt.resource.FdtProject;
	import fdt.resource.FdtResource;
	import fdt.resource.IFdtResource;

	import flash.net.Socket;
	import flash.utils.ByteArray;

	/**
	 * The Workspace Requestor allows access to the workspace of Fdt 
	 */
	public final class FdtWorkspaceRequestor {
		private var _bridge : AbstractFdtBridge;
		private var _bridgeSocket : Socket;

		/**
		 * This constructor may change in future, please use the accessors of the
		 * bridge to get a requestor and do not use this constructor 
		 */
		public function FdtWorkspaceRequestor(bridge : AbstractFdtBridge) {
			_bridge = bridge;
			_bridgeSocket = bridge.bridgeSocket;
		}

		/**
		 * Move a resource from path to destination.
		 * If the move is successful the request returns a <code>IFdtResource</code>
		 * otherwise <code>null</code>
		 *  
		 * @param path source path of the resource to move
		 * @param destination destination path of the resource to move (contains also the new name of the resource, not only the new parent path)
		 * 
		 */
		public function moveResource(path : String, destination : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1221, this, function(_bridgeSocket : Socket) : void {
					a.push(readResource(_bridgeSocket));
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.writeUTF(destination);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Deletes a resource from the workspace (no undo possible, please use with confirmation of the user).
		 * If the resource could be deleted the request returns true otherwise <code>false</code>.
		 *  
		 * @param path the path to the resource to remove
		 */
		public function deleteResource(path : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1220, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readBoolean());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Creates a file in the workspace.
		 * If the file could be created the request returns the new resource as <code>IFdtResource</code>, otherwise
		 * <code>null</code>.
		 * 
		 * @param path the path to the new file
		 * @param content content of the new file
		 * @param overwrite true, if already existing file should be overwritten or false, if not 
		 */
		public function createFile(path : String, content : ByteArray, overwrite : Boolean) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1211, this, function(_bridgeSocket : Socket) : void {
					a.push(readResource(_bridgeSocket));
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.writeBoolean(overwrite);
				_bridgeSocket.writeInt(content.length);
				_bridgeSocket.writeBytes(content);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Creates a folder in the workspace.
		 * If the folder could be created the request returns the new resource as <code>IFdtResource</code>, otherwise
		 * <code>null</code>.
		 * 
		 * @param path the path to the new folder
		 * 
		 */
		public function createFolder(path : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1212, this, function(_bridgeSocket : Socket) : void {
					a.push(readResource(_bridgeSocket));
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Reads the file content.
		 * If the file could be read the request returns a <code>ByteArray</code> containing the 
		 * files content up to a fourth of available memory, otherwise the byte array is empty. 
		 * 
		 * @param path the path to the file to get the content of
		 */
		public function fileContent(path : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1201, this, function(_byteBuffer : ByteArray) : void {
					a.push(_byteBuffer);
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Reads the file resource.
		 * If the file is found the request returns a <code>IFdtResource</code> describing the file, otherwise 
		 * <code>null</code>.
		 * 
		 * @param path the path to the file to get the resource descriptor of
		 */
		public function file(path : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1202, this, function(_bridgeSocket : Socket) : void {
					a.push(readResource(_bridgeSocket));
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Reads the container resource (directory, project).
		 * If the container could be found the request returns a <code>IFdtResource</code> describing the container, otherwise 
		 * <code>null</code>.
		 * 
		 * @param path the path to the container
		 * @param depth the depth until the folder should be read (<code>-1</code> for infinite depth) 
		 *  
		 */
		public function container(path : String, depth : int) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1203, this, function(_bridgeSocket : Socket) : void {
					a.push(readResource(_bridgeSocket));
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.writeShort(depth);
				_bridgeSocket.flush();
			});
		}

		/**
		 * Reads all project resources of the workspace
		 *
		 * The request returns a <code>Vector.&#60;IFdtResource&#62;</code> containing all workspace projects. 
		 */
		public function projects() : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1204, this, function(_bridgeSocket : Socket) : void {
					a.push(readChildren(_bridgeSocket.readShort(), _bridgeSocket));
					rt.apply(thisObject, a);
				});
				_bridgeSocket.flush();
			});
		}

		private function readResource(bridgeSocket : Socket) : IFdtResource {
			var infoByte : int = bridgeSocket.readByte();
			var extraInfo : Boolean = (infoByte & 16) > 0;
			switch (infoByte & 15) {
				case 0 :
					return null;
				case 1 :
					return readFile(bridgeSocket, extraInfo);
				case 2 :
					return readFolder(bridgeSocket, extraInfo);
				case 4 :
					return readProject(bridgeSocket, extraInfo);
			}
			return null;
		}

		private function readProject(bridgeSocket : Socket, extraInfo : Boolean) : IFdtResource {
			var project : FdtProject = new FdtProject();
			project.accessible = bridgeSocket.readBoolean();
			if (extraInfo) {
				project.sourceFolderRoot = bridgeSocket.readBoolean();
				project.build = bridgeSocket.readBoolean();
				project.playerVersion = bridgeSocket.readUTF();
				project.runtime = bridgeSocket.readUTF();
				project.platformType = bridgeSocket.readUTF();
				project.outputFolder = bridgeSocket.readUTF();
			}
			readResourceBase(project, bridgeSocket);
			readMembers(project, bridgeSocket);
			return project;
		}

		private function readFolder(bridgeSocket : Socket, extraInfo : Boolean) : IFdtResource {
			var folder : FdtFolder = new FdtFolder();
			if (extraInfo) {
				folder.sourceFolderRoot = bridgeSocket.readBoolean();
				folder.packageName = bridgeSocket.readUTF();
			}
			readResourceBase(folder, bridgeSocket);
			readMembers(folder, bridgeSocket);
			return folder;
		}

		private function readMembers(container : FdtContainer, bridgeSocket : Socket) : void {
			container.childCount = bridgeSocket.readShort();
			container.children = readChildren(container.childCount, bridgeSocket);
		}

		private function readChildren(childCount : int, bridgeSocket : Socket) : Vector.<IFdtResource> {
			var vec : Vector.<IFdtResource> = new Vector.<IFdtResource>();
			for (var i : int = 0; i < childCount; i++) {
				vec.push(readResource(bridgeSocket));
			}
			return vec;
		}

		private function readFile(bridgeSocket : Socket, extraInfo : Boolean) : IFdtResource {
			var file : FdtFile = new FdtFile();
			file.size = bridgeSocket.readInt();
			if (extraInfo) {
				file.qualifiedName = bridgeSocket.readUTF();
			}
			return readResourceBase(file, bridgeSocket);
		}

		private function readResourceBase(resource : FdtResource, bridgeSocket : Socket) : FdtResource {
			resource.path = bridgeSocket.readUTF();
			if (bridgeSocket.readBoolean()) {
				resource.location = bridgeSocket.readUTF();
			}
			return resource;
		}
	}
}
