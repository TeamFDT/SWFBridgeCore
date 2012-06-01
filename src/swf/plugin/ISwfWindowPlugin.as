package swf.plugin {
	
	/***
	 * Abstract Interface you should not implement this directly 
	 * Please use:
	 * 
	 * ISwfActionPlugin
	 * ISwfDialogPlugin 
	 * ISwfViewPlugin 
	 */
	public interface ISwfWindowPlugin extends ISwfPlugin {
		
		/***
		 * This method is called every time the user resizes (indiect or direct)  
		 * the graphic component containing the browser presenting the plugin
		 *  
		 * @param height the current height of the presenting context of the plugin
		 * @param width the current width of the presenting context of the plugin
		 */
		function setSize(width : int, height : int) : void;
	}
}
