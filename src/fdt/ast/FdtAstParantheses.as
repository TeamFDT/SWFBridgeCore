package fdt.ast {
	[FdtNodeOrder(open,exps,close)]
	public class FdtAstParantheses extends FdtAstNode {
		public var open : int;
		public var exps : Vector.<IFdtAstNode>;				
		public var close : int;
	}
}
