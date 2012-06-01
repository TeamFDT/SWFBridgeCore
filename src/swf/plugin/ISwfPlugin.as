package swf.plugin {
	import flash.utils.Dictionary;

	/***
	 * Abstract Interface you should not implement this directly 
	 * Please use:
	 * 
	 * ISwfActionPlugin
	 * ISwfDialogPlugin 
	 * ISwfViewPlugin 
	 */
	public interface ISwfPlugin {
		
		/***
		 * for future use, currently unused
		 */
		function setOptions(options : Dictionary) : void;

		/***
		 * This method is called if a dialog is close which was opened before
		 * by FdtUiRequestor.openDialog (@see FdtUiRequestor) 
		 */
		function dialogClosed(dialogInstanceId : String, result : String) : void;
		
	}
}
