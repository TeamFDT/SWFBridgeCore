package swf.bridge {
	import swf.plugin.ISwfActionPlugin;

	import mx.events.FlexEvent;
	import mx.managers.SystemManager;

	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.IEventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;

	public class SwfActionPluginFrame {
		private var _swfLoader : Loader;
		private var _swfActionPlugin : ISwfActionPlugin;
		private var _id : String;
		private var _path : String;
		private var _bridge : FdtMasterBridge;
		private var _masterPlugin : SwfMasterPlugin;
		private var _systemManager : SystemManager;

		public function SwfActionPluginFrame(bridge : FdtMasterBridge, id : String, path : String, masterPlugin : SwfMasterPlugin) {
			_masterPlugin = masterPlugin;
			_bridge = bridge;
			_path = path;
			_id = id;
		}

		public function get id() : String {
			return _id;
		}

		public function load() : void {
			var req : URLRequest = new URLRequest();
			req.url = _path;
			_swfLoader = new Loader();
			_masterPlugin.addChild(_swfLoader);
			_swfLoader.visible = false;
			setupListeners(_swfLoader.contentLoaderInfo);
			_swfLoader.load(req);
		}

		public function unload() : void {
			_swfLoader.unload();
			_swfActionPlugin = null;
		}

		private function setupListeners(dispatcher : IEventDispatcher) : void {
			dispatcher.addEventListener(Event.COMPLETE, swfLoadSuccess);
			dispatcher.addEventListener(IOErrorEvent.IO_ERROR, swfLoadFails);
			dispatcher.addEventListener(ProgressEvent.PROGRESS, preloadSWF);
		}

		private function removeListeners() : void {
			if (_systemManager != null) {
				_systemManager.removeEventListener(FlexEvent.APPLICATION_COMPLETE, appReady);
				_systemManager = null;
			}
			_swfLoader.contentLoaderInfo.removeEventListener(Event.COMPLETE, swfLoadSuccess);
			_swfLoader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, swfLoadFails);
			_swfLoader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, preloadSWF);
		}

		private function preloadSWF(event : ProgressEvent) : void {
			var _perc : int = (event.bytesLoaded / event.bytesTotal) * 100;
			trace("Loaded ", _path, " ", _perc);
		}

		private function swfLoadSuccess(event : Event) : void {
			var content : * = event.target.content;
			if (content is ISwfActionPlugin) {
				removeListeners();
				_swfActionPlugin = content;
				trace("Swf Action Plugin " + _id + " is loaded.");
				_bridge.loadSuccess(this);
			} else if (content is SystemManager) {
				_systemManager = SystemManager(content);
				_systemManager.addEventListener(FlexEvent.APPLICATION_COMPLETE, appReady);
			} else {
				trace("Expect SwfActionPlugin but was: " + (typeof content));
				swfLoadFails(event);
			}
		}

		private function appReady(event : FlexEvent) : void {
			var content : * = _systemManager == null ? null : _systemManager.application;
			if (content is ISwfActionPlugin) {
				removeListeners();
				_swfActionPlugin = content;
				trace("Swf Action Plugin " + _id + " is loaded.");
				_bridge.loadSuccess(this);
			} else {
				trace("Expect SwfActionPlugin but was: " + (typeof content));
				swfLoadFails(event);
			}
		}

		private function swfLoadFails(event : Event) : void {
			removeListeners();
			_bridge.loadFailed(this);
		}

		public function createProposals(pc : FdtEditorContext) : void {
			_swfActionPlugin.createProposals(pc);
		}

		public function get swfActionPlugin() : ISwfActionPlugin {
			return _swfActionPlugin;
		}

		public function get swfLoader() : Loader {
			return _swfLoader;
		}
	}
}
