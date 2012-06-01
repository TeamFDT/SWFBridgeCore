package fdt.ast {
	[FdtNodeOrder(modifiers,functionToken,constructor,etter,name,parameters,colon,returnType,block,semicolon)]
	public class FdtAstFunction extends FdtAstNode {
		public var modifiers : FdtAstModifiers;
		public var functionToken : int;
		public var constructor : Boolean;
		public var etter : FdtAstString;
		public var name : FdtAstString;
		public var parameters : FdtAstParameters;
		public var colon : int;
		public var returnType : FdtAstTypeRef;
		public var block : FdtAstBlock;
		public var semicolon : int;
	}
}
