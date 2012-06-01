package fdt.ast {
	[FdtNodeOrder(decls,semicolon)]
	public class FdtAstVarDecs extends FdtAstNode {
		public var decls : Vector.<IFdtAstNode>;				
		public var semicolon : int;
	}
}
