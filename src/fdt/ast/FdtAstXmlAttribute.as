package fdt.ast {
	[FdtNodeOrder(namespaceNode,name,equal,value)]
	public class FdtAstXmlAttribute extends FdtAstNode {
		public var namespaceNode : IFdtAstNode;
		public var name : IFdtAstNode;
		public var equal : int;
		public var value : IFdtAstNode;
	}
}
