package fdt.ast {
	[FdtNodeOrder(name,colon,type,eq,init)]
	public class FdtAstVarDec extends FdtAstNode {
		public var name : FdtAstString;
		public var colon : int;
		public var type : FdtAstTypeRef;
		public var eq : int;
		public var init : IFdtAstNode;
	}
}
