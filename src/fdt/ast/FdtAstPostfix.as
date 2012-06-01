package fdt.ast {
	[FdtNodeOrder(exp,op)]
	public class FdtAstPostfix extends FdtAstNode {
		public var exp : IFdtAstNode;
		public var op : FdtAstString;
	}
}
