package fdt.ast {
	[FdtNodeOrder(statement,whileToken,open,condition,close)]
	public class FdtAstDoWhileLoop extends FdtAstNode {
		public var statement : IFdtAstNode;
		public var whileToken : int;
		public var open : int;
		public var condition : IFdtAstNode;
		public var close : int; 
	}
}
