package fdt.ast {
	[FdtNodeOrder(modifiers,interfaceToken,name,extendsToken,extendsTypes,block)]
	public class FdtAstInterface extends FdtAstNode {
		public var modifiers : FdtAstModifiers;
		public var interfaceToken : int;
		public var name : FdtAstString;
		public var extendsToken : int;
		public var extendsTypes : Vector.<IFdtAstNode>;
		public var block : FdtAstBlock;
	}
}
