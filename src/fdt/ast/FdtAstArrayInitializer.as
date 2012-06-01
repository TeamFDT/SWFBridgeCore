package fdt.ast {
	[FdtNodeOrder(lbracket,children,rbracket)]
	public class FdtAstArrayInitializer extends FdtAstNode {
		public var lbracket : int;
		public var children : Vector.<IFdtAstNode>;				
		public var rbracket : int;
	}
}
