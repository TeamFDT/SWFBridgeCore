package fdt.ast {
	[FdtNodeOrder(generic,exp)]
	public class FdtAstAllocation extends FdtAstNode {
		public var generic : FdtAstGenericType;
		public var exp : IFdtAstNode;
	}
}

