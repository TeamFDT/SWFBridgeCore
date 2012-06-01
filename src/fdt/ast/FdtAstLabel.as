package fdt.ast {
	[FdtNodeOrder(name,colon)]
	public class FdtAstLabel extends FdtAstNode {
		public var name : FdtAstString;
		public var colon : int;
	}
}
