package fdt.ast {
	[FdtNodeOrder(caseExp,colon,statements)]
	public class FdtAstCase extends FdtAstNode {
		public var caseExp : IFdtAstNode;
		public var colon : int;
		public var statements : Vector.<IFdtAstNode>;		
	}
}
