package fdt.ast {
	[FdtNodeOrder(eachToken,open,varToken,target,colon,type,inToken,source,close,statement)]
	public class FdtAstForEachIn extends FdtAstNode {
		public var eachToken : int;
		public var open : int;
		public var varToken : int;
		public var target : IFdtAstNode;
		public var colon : int;
		public var type : FdtAstTypeRef;
		public var inToken : int;
		public var source : IFdtAstNode;
		public var close : int;
		public var statement : IFdtAstNode;
	}
}
