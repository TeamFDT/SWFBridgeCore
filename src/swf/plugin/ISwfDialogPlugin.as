package swf.plugin {

	/***
	 * A Swf Dialog Plugin should have one class implementing this interface.
	 */
	public interface ISwfDialogPlugin extends ISwfWindowPlugin {

		/***
		 * Initialization of anything (may contain calls to the bridge)
		 * @param startInfo contains the string given by the caller of 
		 * FdtUiRequestor.openDialog (@see FdtUiRequestor)
		 */
		function init(startInfo : String) : void;

		/***
		 * This method is called if the use hits the close button of the dialog box.
		 */
		function closeRequest() : void;	
	}
}
