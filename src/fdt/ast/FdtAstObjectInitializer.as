package fdt.ast {
	[FdtNodeOrder(lbrace,members,rbrace)]
	public class FdtAstObjectInitializer extends FdtAstNode {
		public var lbrace : int;
		public var members : Vector.<IFdtAstNode>;				
		public var rbrace : int;
	}
}
