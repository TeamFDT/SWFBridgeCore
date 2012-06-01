package fdt.ast {
	[FdtNodeOrder(open,key,close,colon,value)]
	public class FdtAstObjectInitializerMember extends FdtAstNode {
		public var open : int;
		public var key : IFdtAstNode;
		public var close : int;
		public var colon : int;
		public var value : IFdtAstNode;
	}
}
