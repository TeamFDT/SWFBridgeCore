package fdt.ast {
	[FdtNodeOrder(exp,semicolon)]
	public class FdtAstStatement extends FdtAstNode {
		public var exp : IFdtAstNode;
		public var semicolon : int;
	}
}
