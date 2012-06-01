package fdt.ast {
	[FdtNodeOrder(text,endToken)]
	public class FdtAstXmlComment extends FdtAstNode {
		public var text : FdtAstString;
		public var endToken : int;
	}
}
