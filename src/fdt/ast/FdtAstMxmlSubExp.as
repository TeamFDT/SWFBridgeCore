package fdt.ast {
	[FdtNodeOrder(lbrace,exp,rbrace)]
	public class FdtAstMxmlSubExp extends FdtAstNode {
		public var lbrace : int;
		public var exp : IFdtAstNode;				
		public var rbrace : int;
	}
}
