package fdt.ast {
	[FdtNodeOrder(begin,content,children,end)]	
	public class FdtAstMxmlAttributeValue extends FdtAstNode {
		public var begin : FdtAstString;
		public var content : FdtAstString;
		public var children : Vector.<IFdtAstNode>;
		public var end : FdtAstString;
	}
}
