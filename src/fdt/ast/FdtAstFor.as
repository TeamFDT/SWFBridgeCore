package fdt.ast {
	[FdtNodeOrder(open,inits,conditions,updates,close,statement)]
	public class FdtAstFor extends FdtAstNode {
		public var open : int;
		public var inits : IFdtAstNode;
		public var conditions : FdtAstForConditions;
		public var updates : FdtAstForUpdates;
		public var close : int;
		public var statement : IFdtAstNode;
	}
}
