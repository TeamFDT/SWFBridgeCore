package {
	import flash.events.MouseEvent;
	import flash.display.Shape;

	import swf.bridge.FdtMasterBridge;
	import swf.plugin.ISwfActionPlugin;
	import swf.plugin.ISwfWindowPlugin;

	import mx.managers.SystemManager;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.TimerEvent;
	import flash.system.Security;
	import flash.utils.Dictionary;
	import flash.utils.Timer;

	[SWF(width=0,height=0)]
	public class SwfMasterPlugin extends Sprite implements ISwfWindowPlugin {
		private var _bridge : FdtMasterBridge;
		private var size : int = 1;
		private var dir : int = 1;
		private var mWidth : Number;
		private var lastMessageIDs : Array = new Array();
		private var changed : Boolean;
		private const TIMER : int = 5000;
		private var fdtIcon : FDTIcon;
		private var timer : Timer;

		public function SwfMasterPlugin() {
			ISwfActionPlugin;
			SystemManager;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			trace("Sandbox: " + Security.sandboxType);
			_bridge = new FdtMasterBridge(loaderInfo, this);
			createAnimation();
			addEventListener(MouseEvent.CLICK, click);
			var id : String = _bridge.instanceId;
			if (id.lastIndexOf(".run") > 0 || id.lastIndexOf(".debug") > 0) {
				var shape : Shape = new Shape();
				shape.graphics.beginFill(0xFF3030);
				shape.graphics.drawCircle(0, 0, 4);
				shape.graphics.beginFill(0xB03030);
				shape.graphics.drawCircle(0, 0, 2);
				shape.graphics.endFill();
				shape.x = stage.stageWidth * .5 + 4;
				shape.y = stage.stageHeight * .5 + 4;				
				addChild(shape);
			}
			stage.showDefaultContextMenu = false;
			// oldAnimation();
		}

		private function click(event : MouseEvent) : void {
			_bridge.click();
		}

		private function oldAnimation() : void {
			initDemo();
			lastMessageIDs.push(4);
			lastMessageIDs.push(4);
			lastMessageIDs.push(5);
			lastMessageIDs.push(6);
			lastMessageIDs.push(7);
			lastMessageIDs.push(8);
			lastMessageIDs.push(9);
			lastMessageIDs.push(10);
			changed = true;
		}

		public function initDemo() : void {
			timer = new Timer(50);
			timer.addEventListener(TimerEvent.TIMER, showAction);
			timer.start();
		}

		private function showAction(event : TimerEvent) : void {
			size = size + dir;
			if (size % 5 == 0) {
				handle(0);
			}
			if (size == 5 * 25) {
				size = 0;
				handle(1);
			}
			// dir = -1;
			// graphics.clear();
			// } else if (size == 0) {
			// dir = 1;
			// }
			// var h : int = size + mWidth - 17;
			// graphics.beginFill(0xff00ff + size * 0x001100);
			// graphics.drawRect(8 - size / 2 - 1, 8 - size / 2 - 1, h + 3, size + 3);
			// graphics.beginFill(0xffffff);
			// graphics.drawRect(8 - size / 2, 8 - size / 2, h + 1, size + 1);
			// graphics.endFill();

			if (changed) {
				changed = false;
				graphics.clear();
				// graphics.beginFill(0xff00ff); // + size * 0x001100);
				var count : int = lastMessageIDs.length;
				var start : int = 0;
				if (count > mWidth) {
					start = count - mWidth;
				}
				var x : int = 0;
				var y : int = 0;
				var h : int = 16;
				// graphics.lineStyle(1);
				for (var i : int = start;i < count;i++) {
					var v : int = lastMessageIDs[i];
					// trace(i," -> "+v);
					if (v > 0) {
						v = 2 + (v % 13);
					}
					// trace(i," ---> "+v);
					for (var j : int = 0; j < v;j++) {
						var factorA : Number = j / v;
						var factorB : Number = 1.0 - factorA;
						var r : int = factorA * 0xFF + factorB * 0x20;
						var g : int = factorA * 0xFF + factorB * 0x80;
						var b : int = factorA * 0xFF + factorB * 0xD1;

						graphics.beginFill(r * 0x010000 + g * 0x000100 + b * 0x000001);
						graphics.drawRect(x, y + h - j, 1, 1);
					}
					graphics.beginFill(0x2080D1);
					graphics.drawRect(x, y + h - v, 1, 1);

					// graphics.lineStyle(4, 0x2080D1);
					// graphics.moveTo(x*4, (y + h - v)*4);
					// graphics.lineTo(x*4, (y + h - v + 1)*4);
					// graphics.lineStyle(4, 0x102B63);
					// graphics.moveTo(x*4, (y + h - v + 1)*4);
					// graphics.lineTo(x*4, (y + h+1)*4+0.01);
					x++;
				}
				graphics.endFill();
				scaleX = 1;
				scaleY = 1;
			}
		}

		override public function set width(value : Number) : void {
			super.width = value;
			mWidth = value;
		}

		public function setOptions(options : Dictionary) : void {
		}

		public function setSize(width : int, height : int) : void {
			this.width = width;
			this.height = height;
			scaleX = 1;
			scaleY = 1;
		}

		public function init() : void {
		}

		public function dialogClosed(dialogInstanceId : String, result : String) : void {
		}

		public function handle(messageID : int) : void {
			lastMessageIDs.push(messageID);
			changed = true;
			if (lastMessageIDs.length > 50) {
				lastMessageIDs.shift();
			}
		}

		public function createAnimation() : void {
			adjustScaleMode();
			stage.color = 0x707070;
			addIcon();
			createTimer();
		}

		private function createTimer() : void {
			timer = new Timer(TIMER);
			timer.addEventListener(TimerEvent.TIMER, animateIcon);
			timer.start();
		}

		private function animateIcon(event : TimerEvent) : void {
			//trace('event: ' + (event));
			fdtIcon.gotoAndPlay(1);
		}

		private function adjustScaleMode() : void {
			this.stage.scaleMode = StageScaleMode.NO_SCALE;
			this.stage.align = StageAlign.TOP_LEFT;
		}

		private function addIcon() : void {
			fdtIcon = new FDTIcon();
			fdtIcon.x = stage.stageWidth * .5;
			fdtIcon.y = stage.stageHeight * .5;
			addChild(fdtIcon);
		}

		public function setColors(colors : Array) : void {
			stage.color = colors[0];
		}
	}
}
