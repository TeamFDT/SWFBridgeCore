package fdt.ast {
	[FdtNodeOrder(lbracket,name,open,params,close,rbracket,semicolon)]
	public class FdtAstMetaData extends FdtAstNode {
		public var lbracket : int;
		public var name : FdtAstString;
		public var open : int;
		public var params : Vector.<IFdtAstNode>;			
		public var close : int;
		public var rbracket : int;
		public var semicolon : int;
	}
}
