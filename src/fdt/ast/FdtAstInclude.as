package fdt.ast {
	[FdtNodeOrder(file,semicolon)]
	public class FdtAstInclude extends FdtAstNode {
		public var file : FdtAstString;
		public var semicolon : int;
	}
}
