package fdt.resource {
	
	/***
	 * Fdt File
	 */
	public class FdtFile extends FdtResource {
		/***
		 * the size of the file in bytes
		 */
		public var size : int;
		
		/***
		 * the qualified name of the file within the project if it contains an as3, mxml or fxg 
		 * file.
		 */
		public var qualifiedName : String;
	}
}
