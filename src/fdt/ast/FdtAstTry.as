package fdt.ast {
	[FdtNodeOrder(block,catches,finallyBlock)]
	public class FdtAstTry extends FdtAstNode {
		public var block : FdtAstBlock;
		public var catches : Vector.<IFdtAstNode>;
		public var finallyBlock : FdtAstFinally;
	}
}
