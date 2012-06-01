package fdt.ast {
	[FdtNodeOrder(namespaceNode,attribute)]
	public class FdtAstAttributeAccess extends FdtAstNode {
		public var namespaceNode : IFdtAstNode;
		public var attribute : FdtAstString;
	}
}
