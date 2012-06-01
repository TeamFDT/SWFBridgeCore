package fdt.resource {

	/***
	 * A container (a folder or a project) contains children 
	 */
	public class FdtContainer extends FdtResource implements IFdtContainer {
		/***
		 * The real children count 
		 */		
		public var childCount : int;
		
		/***
		 * the list of children. 
		 * This list could be empty even if the children count is greater than 0.
		 * This happens if the depth parameter during the reqeuts of this container structure
		 * is reached. Deeper children are not returned. This behavior can avoid time consuming 
		 * reuqests within large projects.   
		 */ 
		public var children : Vector.<IFdtResource>;
	}
}
