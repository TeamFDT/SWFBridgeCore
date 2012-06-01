package fdt.ast {
	[FdtNodeOrder(text,endToken)]
	public class FdtAstMxmlComment extends FdtAstNode {
		public var text : FdtAstString;
		public var endToken : int;
	}
}
