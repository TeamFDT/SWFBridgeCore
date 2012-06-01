package fdt.ast {
	[FdtNodeOrder(colon,statements)]
	public class FdtAstDefault extends FdtAstNode {		
		public var colon : int;
		public var statements : Vector.<IFdtAstNode>;		
	}
}
