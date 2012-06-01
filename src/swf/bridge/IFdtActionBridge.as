package swf.bridge {
	
	/***
	 * The Fdt Action brige is offered to the Swf Action Plugin by the Swf Action Plugins Controller.
	 * This interface is not intended to be implemented by Swf Action Plugins.
	 */
	public interface IFdtActionBridge {
		/***
		 * Offers a Proposal to Fdt.
		 * Should be called only within ISwfActionPlugin.createProposals
		 * (@see ISwfActionPlugin)
		 * 
		 * @param id an unique id for this proposal
		 * @param iconId the id of icon (@see FdtUiRequestor.registerIcon)
		 * @param displayString text presented to the user in the proposal list 
		 * 						(should be human readable)   
		 * @param additionalInfo text describing this proposal in detail to the user
		 * @param onSelection function called if this proposal is selected by the user.
		 * The expected function signture is:  <br> 
		 * <code>function onSelection(id : String, ec : FdtEditorContext) : void</code><br> 
		 * The parameter <code>id</code> contains is the id of the proposal 
		 * and <code>ec</code> is the current editor context.  
		 */
		function offerProposal(id : String, iconId : String, displayString : String, additionalInfo : String, onSelection : Function) : void;

		/***
		 * Use this requestor to access model functions
		 */
		function get model() : FdtModelRequestor;
		
		/***
		 * Use this requestor to access workspace functions
		 */
		function get workspace() : FdtWorkspaceRequestor;

		/***
		 * Use this requestor to access ui functions
		 */
		function get ui() : FdtUiRequestor;
		
		/***
		 * Use this requestor to access core functions
		 */
		function get core() : FdtCoreRequestor;
		
		/***
		 * Use this requestor to access core functions
		 */
		function get editor() : FdtEditorRequestor;

		/***
		 * The instance id of the swf bridge. This id is unique among 
		 * all bridges to fdt.
		 */		
		function get instanceId() : String;
	
		/***
		 * Creates a new request. 
		 */
		function newRequest() : FdtRequest;
	}
}
