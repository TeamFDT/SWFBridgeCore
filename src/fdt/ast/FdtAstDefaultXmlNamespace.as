package fdt.ast {
	[FdtNodeOrder(xmlToken,namespaceToken,eq,value,semicolon)]
	public class FdtAstDefaultXmlNamespace extends FdtAstNode {
		public var xmlToken : int;
		public var namespaceToken : int;
		public var eq : int;
		public var value : IFdtAstNode;
		public var semicolon : int;
	}
}
