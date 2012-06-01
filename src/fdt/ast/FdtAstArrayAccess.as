package fdt.ast {
	[FdtNodeOrder(lbracket,exp,rbracket)]
	public class FdtAstArrayAccess extends FdtAstNode {
		public var lbracket : int;
		public var exp : IFdtAstNode;
		public var rbracket : int;
	}
}
