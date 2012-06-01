package fdt.resource {

	/***
	 * A project within fdt 
	 */
	public class FdtProject extends FdtContainer {
		/***
		 * A project is accessible if it is marked as open  
		 */
		public var accessible : Boolean;
		
		/***
		 * This flag is <code>true</code> iff the project is build.
		 */
		public var build : Boolean;
		
		/***
		 * the player version of the project settings 
		 */
		public var playerVersion : String;
		
		/***
		 * the runtime type of the project (Flash Player or AIR) 
		 */
		public var runtime : String; 
		
		/***
		 * the platform type of the project (web or mobile) 
		 */
		public var platformType : String;
		
		/***
		 * the compiler output folder of the project (typcally bin) 
		 */
		public var outputFolder : String;
		
		/***
		 * This flag is <code>true</code> if the project folder is also a source folder 
		 */
		public var sourceFolderRoot : Boolean;
	}
}
