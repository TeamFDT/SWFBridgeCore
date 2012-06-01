package fdt.ast {
	[FdtNodeOrder(value,semicolon)]
	public class FdtAstThrow extends FdtAstNode {
		public var value : IFdtAstNode;
		public var semicolon : int;
	}
}
