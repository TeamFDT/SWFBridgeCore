package fdt.ast {
	[FdtNodeOrder(exps,semicolon)]
	public class FdtAstForInits extends FdtAstNode {
		public var exps : Vector.<IFdtAstNode>;				
		public var semicolon : int;
	}
}
