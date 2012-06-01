package fdt.resource {
	/***
	 * Any fdt resource has a workspace path and filesystem location  
	 */
	public class FdtResource implements IFdtResource {
		
		/***
		 * the workspace relative path to the resource 
		 */
		public var path : String;
		
		/***
		 * the absolute filesystem location 
		 */
		public var location : String;
	}
}
