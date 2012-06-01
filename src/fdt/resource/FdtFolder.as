package fdt.resource {

	/***
	 * Fdt folder
	 */
	public class FdtFolder extends FdtContainer {
		/***
		 * the package name of the folder if the folder is also a package in as 3 
		 */
		public var packageName : String;
		
		/***
		 * This flag is <code>true</code>, iff this folder is also a top source folder.
		 */
		public var sourceFolderRoot : Boolean;
	}
}
