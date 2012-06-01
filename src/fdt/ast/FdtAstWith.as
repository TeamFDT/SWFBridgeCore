package fdt.ast {
	[FdtNodeOrder(open,exp,close,statement)]
	public class FdtAstWith extends FdtAstNode {
		public var open : int;
		public var exp : IFdtAstNode;
		public var close : int;
		public var statement : IFdtAstNode;
	}
}
