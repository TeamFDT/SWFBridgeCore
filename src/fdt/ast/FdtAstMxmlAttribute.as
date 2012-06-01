package fdt.ast {
	[FdtNodeOrder(namespaceNode,name,postfix,equal,value)]
	public class FdtAstMxmlAttribute extends FdtAstNode {
		public var namespaceNode : FdtAstMxmlNamespace;
		public var name : FdtAstString;
		public var postfix : FdtAstMxmlStatePostfix;
		public var equal : int;
		public var value : FdtAstMxmlAttributeValue;    
	}
}
