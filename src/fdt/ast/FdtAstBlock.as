package fdt.ast {
	[FdtNodeOrder(lbrace,statements,rbrace)]
	public class FdtAstBlock extends FdtAstNode {
		public var lbrace : int;
		public var statements : Vector.<IFdtAstNode>;				
		public var rbrace : int;
	}
}
