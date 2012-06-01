package swf.bridge {
	import swf.plugin.ISwfWindowPlugin;

	import flash.display.LoaderInfo;

	/**
	 * Another abstract class. Please use this class only indirect via
	 * <code>FdtViewBridge</code> or <code>FdtDialogBridge</code>. 
	 */
	public class AbstractFdtWindowBridge extends AbstractFdtUiBridge {
		private var _swfWindowPlugin : ISwfWindowPlugin;
		private var _windowRequestor : FdtWindowRequestor;
		private var _uiRequestor : FdtUiRequestor;

		/** @private **/
		public function AbstractFdtWindowBridge(loaderInfo : LoaderInfo, swfWindowPlugin : ISwfWindowPlugin) {
			super(loaderInfo, swfWindowPlugin);
			_swfWindowPlugin = swfWindowPlugin;
			_windowRequestor = new FdtWindowRequestor(this);
			_uiRequestor = new FdtUiRequestor(this);
		}

		/**
		 * Use this requestor to access window functions. 
		 */
		public function get window() : FdtWindowRequestor {
			return _windowRequestor;
		}
		
		/**
		 * Use this requestor to access ui functions. 
		 */
		public function get ui() : FdtUiRequestor {
			return _uiRequestor;
		}

	}
}
