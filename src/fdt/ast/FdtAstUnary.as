package fdt.ast {
	[FdtNodeOrder(op,exp)]
	public class FdtAstUnary extends FdtAstNode {
		public var op : FdtAstString;
		public var exp : IFdtAstNode;
	}
}
