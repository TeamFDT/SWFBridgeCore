package fdt.ast {
	[FdtNodeOrder(namespaceName,doubleColon)]
	public class FdtAstNamespaceQualifier extends FdtAstNode {
		public var namespaceName : IFdtAstNode;
		public var doubleColon : int;
	}
}
