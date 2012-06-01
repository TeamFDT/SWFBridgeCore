package fdt.ast {
	[FdtNodeOrder(exps,semicolon)]
	public class FdtAstForConditions extends FdtAstNode {
		public var exps : Vector.<IFdtAstNode>;				
		public var semicolon : int;
	}
}
