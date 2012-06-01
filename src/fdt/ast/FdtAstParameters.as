package fdt.ast {
	[FdtNodeOrder(open,params,close)]
	public class FdtAstParameters extends FdtAstNode {
		public var open : int;
		public var params : Vector.<IFdtAstNode>;				
		public var close : int;
	}
}
