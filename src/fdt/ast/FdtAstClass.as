package fdt.ast {
	[FdtNodeOrder(modifiers,classToken,name,extendsToken,extendsType,implementsToken,implementsTypes,block)]
	public class FdtAstClass extends FdtAstNode {
		public var modifiers : FdtAstModifiers;
		public var classToken : int;
		public var name : FdtAstString;
		public var extendsToken : int;
		public var extendsType : FdtAstTypeRef;
		public var implementsToken : int;
		public var implementsTypes : Vector.<IFdtAstNode>;
		public var block : FdtAstBlock;
	}
}
