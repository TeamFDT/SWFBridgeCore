package fdt.ast {
	[FdtNodeOrder(packageName,block)]
	public class FdtAstPackage extends FdtAstNode {
		public var packageName : FdtAstString;
		public var block : FdtAstBlock;
	}
}
