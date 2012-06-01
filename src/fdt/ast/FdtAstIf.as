package fdt.ast {
	[FdtNodeOrder(open,condition,close,statement,elseToken,elseStatement)]
	public class FdtAstIf extends FdtAstNode {
		public var open : int;
		public var condition : IFdtAstNode;
		public var close : int;
		public var statement : IFdtAstNode;
		public var elseToken : int;
		public var elseStatement : IFdtAstNode;
	}
}
