package fdt.ast {
	[FdtNodeOrder(namespaceToken,name,semicolon)]
	public class FdtAstUseNamespace extends FdtAstNode {
		public var namespaceToken : int;
		public var name : FdtAstString;
		public var semicolon : int;
	}
}
