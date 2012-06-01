package swf.bridge {
	import swf.plugin.ISwfViewPlugin;

	import flash.display.LoaderInfo;

	/**
	 * The Fdt View Bridge establishs a connection to Fdt for Swf View(s) Plugins.
	 * Every Swf View(s) Plugin should instantiate ONE <code>FdtViewBridge</code>.
	 */
	public final class FdtViewBridge extends AbstractFdtWindowBridge {
		private var _swfViewPlugin : ISwfViewPlugin;

		/**
		 * Use this constructor to create a new View Bridge for your Swf View(s) Plugin
		 * 
		 * @param loaderInfo the loaderInfo of the current swf
		 * @param swfViewPlugin the Swf View Plugin Handler to use. Any Swf View(s) Plugin 
		 * 		should have ONE implementation of this interface.
		 * 		 
		 */
		public function FdtViewBridge(loaderInfo : LoaderInfo, swfViewPlugin : ISwfViewPlugin) {
			super(loaderInfo, swfViewPlugin);
			_swfViewPlugin = swfViewPlugin;
		}
		
		/** @private **/
		override protected function initPlugin() : void {
			_swfViewPlugin.init();
		}
	}

}
