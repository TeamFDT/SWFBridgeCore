package fdt.ast {
	public class FdtAstMxmlTag extends FdtAstNode {
		public var namespaceNode : FdtAstMxmlNamespace;
		public var name : FdtAstString;
		public var postfix : FdtAstMxmlStatePostfix;   
		public var endToken : int;
	}
}
