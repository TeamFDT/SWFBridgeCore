package fdt.ast {
	[FdtNodeOrder(name,colon)]
	public class FdtAstXmlNamespace extends FdtAstNode {
		public var name : FdtAstString;
		public var colon : int;
	}
}
