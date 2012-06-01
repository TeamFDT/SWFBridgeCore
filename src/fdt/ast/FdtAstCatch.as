package fdt.ast {
	[FdtNodeOrder(open,varDec,close,block)]
	public class FdtAstCatch extends FdtAstNode {
		public var open : int;
		public var varDec : FdtAstVarDec;
		public var close : int;
		public var block : FdtAstBlock;
	}
}
