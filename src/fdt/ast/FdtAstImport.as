package fdt.ast {
	[FdtNodeOrder(importName,semicolon)]
	public class FdtAstImport extends FdtAstNode {
		public var importName : FdtAstString;
		public var semicolon : int;
	}
}
