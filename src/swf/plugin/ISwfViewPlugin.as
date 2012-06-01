package swf.plugin {
	
	/***
	 * A Swf View(s) Plugin should have one class implementing this interface.
	 */
	public interface ISwfViewPlugin extends ISwfWindowPlugin {
				
		/***
		 * Initialization of anything (may contain calls to the bridge)
		 */
		function init() : void;
	}
}
