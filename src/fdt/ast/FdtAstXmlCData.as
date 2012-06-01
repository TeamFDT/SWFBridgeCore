package fdt.ast {
	[FdtNodeOrder(text,endToken)]
	public class FdtAstXmlCData extends FdtAstNode {
		public var text : FdtAstString;
		public var endToken : int;
	}
}
