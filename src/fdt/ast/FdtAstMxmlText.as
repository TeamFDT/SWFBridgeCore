package fdt.ast {
	[FdtNodeOrder(text, subExps)]		
	public class FdtAstMxmlText extends FdtAstNode {
		public var text : FdtAstString;
		public var subExps : Vector.<IFdtAstNode>;
	}
}
