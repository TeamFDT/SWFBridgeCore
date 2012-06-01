package fdt.ast {
	[FdtNodeOrder(modifiers,namespaceToken,name,eq,init,semicolon)]
	public class FdtAstNamespace extends FdtAstNode {
		public var modifiers : FdtAstModifiers;
		public var namespaceToken : int;
		public var name : FdtAstString;
		public var eq : int;
		public var init : IFdtAstNode;
		public var semicolon : int;
	}
}
