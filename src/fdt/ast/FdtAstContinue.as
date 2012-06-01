package fdt.ast {
	[FdtNodeOrder(label,semicolon)]
	public class FdtAstContinue extends FdtAstNode {
		public var label : FdtAstString;
		public var semicolon : int;
	}
}
