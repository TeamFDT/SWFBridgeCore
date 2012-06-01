package {
	import fdt.ast.IFdtAstNode;

	import swf.bridge.FdtRequest;
	import swf.bridge.FdtViewBridge;
	import swf.plugin.ISwfViewPlugin;

	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.display.StageScaleMode;
	import flash.utils.Dictionary;
	import flash.utils.getQualifiedClassName;

	[SWF(width=0,height=0)]
	[FdtSwfPlugin(name="Test View", pluginType="views", toolTip="This is the test view")]
	public class TestMain extends Sprite implements ISwfViewPlugin {
		private var _fdtViewBridge : FdtViewBridge;
		private var lastWidth : int;
		private var lastHeight : int;

		public function TestMain() {
			FdtSwfPluginIcon;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			_fdtViewBridge = new FdtViewBridge(loaderInfo, this);
		}

		public function init() : void {
			_fdtViewBridge.window.setName("Test View1").sendTo(this, initRes);
		}

		private function initRes(b : Boolean) : void {
			trace("SetName:" + b);
			var request : FdtRequest = new FdtRequest();
			request.add(_fdtViewBridge.model.fileAst("/contribution.com.powerflasher.fdt.ui.professional.swf.bridge/test_src/AstTestClass.as"));
			request.sendTo(this, testRes);			
			request = new FdtRequest();
			request.add(_fdtViewBridge.model.fileAst("/contribution.com.powerflasher.fdt.ui.professional.swf.bridge/test_src/AstTestMxmlClass.mxml"));
			request.sendTo(this, testResMxml);			
			_fdtViewBridge.ui.registerMenuEntry("HalloId22", "Hallo", "Poppp", "", "mainMenu/file/close:after").sendTo(this, null);
		}

		private function testRes(node : IFdtAstNode) : void {
			trace("As Request Finished");
			trace("Start As Tests.");
			new AstTestClassAssertion().verify(node);
			new ShowAll().visit(node);
			new AllStatements().visit(node);
			// FdtAstUtil.visit(null, "", -1, node, f);
			trace("Finish As Tests.");
		}

		private function testResMxml(node : IFdtAstNode) : void {
			trace("Mxml Request Finished");
			trace("Start Mxml Tests.");
			new ShowAll().visit(node);
			new AstTestMxmlClassAssertion().verify(node);
			trace("Finish Mxml Tests.");
		}

		private function f(parent : IFdtAstNode, name : String, index : int, node : Object) : Boolean {
			if (node is int || node == null) {
				trace(getQualifiedClassName(parent), " ", name, "_", index, " -> ", node);
			} else if (node is IFdtAstNode) {
				trace(getQualifiedClassName(parent), " ", name, "_", index, " -> ", node["offset"], " ", getQualifiedClassName(node));
			}
			return true;
		}

		public function setOptions(options : Dictionary) : void {
		}

		public function getScreenShot() : BitmapData {
			var bmd : BitmapData = new BitmapData(lastWidth, lastHeight, true, 0);
			bmd.draw(this);
			return bmd;
		}

		public function setSize(x : int, y : int) : void {
			var px : int = x / 2;
			var py : int = y / 2;
			lastWidth = x;
			lastHeight = y;
			this.x = -px;
			this.y = -py;
		}

		public function dialogClosed(dialogInstanceId : String, result : String) : void {
		}

	}
}
import fdt.ast.FdtAstStatement;
import fdt.ast.IFdtAstNode;
import fdt.ast.util.FdtAstVisitor;

import flash.utils.getQualifiedClassName;

class ShowAll extends FdtAstVisitor {
	private function space(depth : int) : String {
		return "                                                                                                     ".substr(0, depth);
	}

	override protected function enterNode(depth : int, parent : IFdtAstNode, name : String, index : int, node : IFdtAstNode) : Boolean {
		trace(">",space(depth), name, " ", index, " ", getQualifiedClassName(node));
		return true;
	}

	override protected function leaveNode(depth : int, parent : IFdtAstNode, name : String, index : int, node : IFdtAstNode) : void {
		trace("<",space(depth), name, " ", index, " ", getQualifiedClassName(node));
	}

	override protected function visitToken(depth : int, parent : IFdtAstNode, name : String, index : int, tokenOffset : int) : void {
		trace(" ",space(depth), name, " ", index, " ", tokenOffset);
	}
}


class AllStatements extends FdtAstVisitor {

	override protected function enterNode(depth : int, parent : IFdtAstNode, name : String, index : int, node : IFdtAstNode) : Boolean {
		var extracted : FdtAstStatement = node as FdtAstStatement;
		if (extracted != null) {
			var o = extracted.exp;
			if (o.offset != undefined){
			}
			trace(extracted.offset," ",extracted.semicolon);		
		}
		return true;		
	}

}

