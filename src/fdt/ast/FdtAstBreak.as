package fdt.ast {
	[FdtNodeOrder(label,semicolon)]
	public class FdtAstBreak extends FdtAstNode {
		public var label : FdtAstString;
		public var semicolon : int;
	}
}
