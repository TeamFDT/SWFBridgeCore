package swf.plugin {
	import swf.bridge.FdtEditorContext;
	import swf.bridge.IFdtActionBridge;

	/***
	 * A Swf Action Plugin should have one class implementing this interface.
	 */
	public interface ISwfActionPlugin extends ISwfPlugin {
		
		/***
		 * Initialization of anything (may contain calls to the bridge) 
		 */
		function init(bridge : IFdtActionBridge) : void;
				
		/***
		 * Requests the plugin to offer the proposals for the editor context.
		 * Proposals are offered by IFdtActionBridge.offerProposal (@see IFdtActionBridge).
		 */
		function createProposals(ec : FdtEditorContext) : void;
		
		/***
		 * This method is called if a Swf Plugin Menu Entry was selected by the user
		 * FdtUiRequestor.registerMenuEntry (@see FdtUiRequestor) 
		 */
		function callEntryAction(entryId : String) : void;
		
	}
}
