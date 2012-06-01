package fdt.ast {
	[FdtNodeOrder(open,condition,close,block)]
	public class FdtAstSwitch extends FdtAstNode {
		public var open : int;
		public var condition : IFdtAstNode;
		public var close : int;
		public var block : FdtAstBlock;
	}
}
