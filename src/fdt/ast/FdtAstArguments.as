package fdt.ast {
	[FdtNodeOrder(open,children,close)]
	public class FdtAstArguments extends FdtAstNode {
		public var open : int;
		public var children : Vector.<IFdtAstNode>;				
		public var close : int;
	}
}
