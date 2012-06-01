package fdt.ast {
	[FdtNodeOrder(name,eq,value)]
	public class FdtAstMetaDataParameter extends FdtAstNode {
		public var name : FdtAstString;
		public var eq : int;
		public var value : IFdtAstNode;
	}
}
