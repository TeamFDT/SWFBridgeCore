package fdt.ast {
	[FdtNodeOrder(parameters,colon,returnType,block)]
	public class FdtAstAnonymousFunction extends FdtAstNode {
		public var parameters : FdtAstParameters;
		public var colon : int;
		public var returnType : FdtAstTypeRef;
		public var block : FdtAstBlock;
	}
}
