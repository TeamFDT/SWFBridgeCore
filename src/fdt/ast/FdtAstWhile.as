package fdt.ast {
	[FdtNodeOrder(open,condition,close,statement)]
	public class FdtAstWhile extends FdtAstNode {
		public var open : int;
		public var condition : IFdtAstNode;
		public var close : int;
		public var statement : IFdtAstNode;
	}
}
