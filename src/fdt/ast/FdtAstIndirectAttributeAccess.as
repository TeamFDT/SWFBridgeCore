package fdt.ast {
	[FdtNodeOrder(namespaceNode,lbracket,attributeExp,rbracket)]
	public class FdtAstIndirectAttributeAccess extends FdtAstNode {
		public var namespaceNode : IFdtAstNode;
		public var lbracket : int;
		public var attributeExp : IFdtAstNode;
		public var rbracket : int;
	}
}
