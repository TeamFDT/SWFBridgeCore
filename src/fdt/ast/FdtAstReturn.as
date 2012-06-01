package fdt.ast {
	[FdtNodeOrder(value,semicolon)]
	public class FdtAstReturn extends FdtAstNode {
		public var value : IFdtAstNode;
		public var semicolon : int;
	}
}
