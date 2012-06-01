package fdt.ast {
	[FdtNodeOrder(condition,question,left,colon,right)]
	public class FdtAstConditional extends FdtAstNode {
		public var condition : IFdtAstNode;
		public var question : int;
		public var left : IFdtAstNode;
		public var colon : int;
		public var right : IFdtAstNode;
	}
}
