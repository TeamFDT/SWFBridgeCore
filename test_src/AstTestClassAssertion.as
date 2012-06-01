package {
	import fdt.ast.FdtAstAllocation;
	import fdt.ast.FdtAstAnonymousFunction;
	import fdt.ast.FdtAstArguments;
	import fdt.ast.FdtAstArrayAccess;
	import fdt.ast.FdtAstArrayInitializer;
	import fdt.ast.FdtAstAssignment;
	import fdt.ast.FdtAstAttributeAccess;
	import fdt.ast.FdtAstBinary;
	import fdt.ast.FdtAstBlock;
	import fdt.ast.FdtAstBreak;
	import fdt.ast.FdtAstCase;
	import fdt.ast.FdtAstCatch;
	import fdt.ast.FdtAstClass;
	import fdt.ast.FdtAstConditional;
	import fdt.ast.FdtAstConstantLiteral;
	import fdt.ast.FdtAstContinue;
	import fdt.ast.FdtAstDefault;
	import fdt.ast.FdtAstDefaultXmlNamespace;
	import fdt.ast.FdtAstDoWhileLoop;
	import fdt.ast.FdtAstEquality;
	import fdt.ast.FdtAstFields;
	import fdt.ast.FdtAstFilterOperator;
	import fdt.ast.FdtAstFinally;
	import fdt.ast.FdtAstFor;
	import fdt.ast.FdtAstForConditions;
	import fdt.ast.FdtAstForEachIn;
	import fdt.ast.FdtAstForIn;
	import fdt.ast.FdtAstForInits;
	import fdt.ast.FdtAstForUpdates;
	import fdt.ast.FdtAstFunction;
	import fdt.ast.FdtAstIdentifierLiteral;
	import fdt.ast.FdtAstIf;
	import fdt.ast.FdtAstImport;
	import fdt.ast.FdtAstInclude;
	import fdt.ast.FdtAstIndirectAttributeAccess;
	import fdt.ast.FdtAstInterface;
	import fdt.ast.FdtAstLabel;
	import fdt.ast.FdtAstLogical;
	import fdt.ast.FdtAstMetaData;
	import fdt.ast.FdtAstMetaDataParameter;
	import fdt.ast.FdtAstNamespace;
	import fdt.ast.FdtAstNamespaceName;
	import fdt.ast.FdtAstNamespaceQualifier;
	import fdt.ast.FdtAstNumberLiteral;
	import fdt.ast.FdtAstObjectInitializer;
	import fdt.ast.FdtAstObjectInitializerMember;
	import fdt.ast.FdtAstPackage;
	import fdt.ast.FdtAstParameters;
	import fdt.ast.FdtAstParantheses;
	import fdt.ast.FdtAstPostfix;
	import fdt.ast.FdtAstPrimaryExpression;
	import fdt.ast.FdtAstRelational;
	import fdt.ast.FdtAstReturn;
	import fdt.ast.FdtAstRoot;
	import fdt.ast.FdtAstStatement;
	import fdt.ast.FdtAstString;
	import fdt.ast.FdtAstStringLiteral;
	import fdt.ast.FdtAstSwitch;
	import fdt.ast.FdtAstThrow;
	import fdt.ast.FdtAstToken;
	import fdt.ast.FdtAstTry;
	import fdt.ast.FdtAstTypeRef;
	import fdt.ast.FdtAstUnary;
	import fdt.ast.FdtAstUseNamespace;
	import fdt.ast.FdtAstVarDec;
	import fdt.ast.FdtAstVarDecs;
	import fdt.ast.FdtAstWhile;
	import fdt.ast.FdtAstWith;
	import fdt.ast.FdtAstXmlAttribute;
	import fdt.ast.FdtAstXmlAttributeName;
	import fdt.ast.FdtAstXmlAttributeValue;
	import fdt.ast.FdtAstXmlCData;
	import fdt.ast.FdtAstXmlCloseTag;
	import fdt.ast.FdtAstXmlComment;
	import fdt.ast.FdtAstXmlCompleteTag;
	import fdt.ast.FdtAstXmlEmbExp;
	import fdt.ast.FdtAstXmlNamespace;
	import fdt.ast.FdtAstXmlNode;
	import fdt.ast.FdtAstXmlOpenTag;
	import fdt.ast.FdtAstXmlTagName;
	import fdt.ast.FdtAstXmlText;
	import fdt.ast.IFdtAstNode;

	public class AstTestClassAssertion extends Assertion {
		public function verify(o : Object) : void {
			AstTestClass;
			var root : FdtAstRoot = assertType(o, FdtAstRoot);
			var p : FdtAstPackage = assertType(root.decls[0], FdtAstPackage);
			verifyClassMetaDatas(p.block);
			verifyTestClass1(assertType(p.block.statements[4], FdtAstClass));
			verifyImport(assertType(root.decls[2], FdtAstImport));
			assertType(root.decls[3], FdtAstInterface);
			verifyTestInterface(root.decls[4]);
			assertType(root.decls[5], FdtAstClass);
			assertType(root.decls[6], FdtAstClass);
			verifyTestFunction1(assertType(root.decls[7], FdtAstFunction));
			verifyTestFunction2(assertType(root.decls[8], FdtAstFunction));
			verifyTestFunction3(assertType(root.decls[9], FdtAstFunction));
			verifyTestFunction4(assertType(root.decls[10], FdtAstFunction));
		}

		private function verifyClassMetaDatas(block : FdtAstBlock) : void {
			verifyMetaData1(block.statements[0]);
			verifyMetaData2(block.statements[1]);
			verifyMetaData3(block.statements[2]);
			verifyMetaData4(block.statements[3]);			
		}

		private function verifyMetaData4(child : IFdtAstNode) : void {
			var md : FdtAstMetaData = assertType(child, FdtAstMetaData);
			assertEquals(md.lbracket, md.offset);
			assertEquals(md.name.content,"hik");
			assertEquals(md.open, md.name.length+md.name.offset);
			assertEquals(md.params.length, 3);
			var mdp : FdtAstMetaDataParameter = assertType(md.params[0], FdtAstMetaDataParameter);
			assertEquals(mdp.name.content, "pop");
			assertEquals(mdp.eq, mdp.name.length + mdp.name.offset);
			assertPeId(mdp.value, "mio");			
			assertEquals(md.close, md.offset+md.length-3);
			assertEquals(md.rbracket, md.offset+md.length-2);
			assertEquals(md.semicolon, md.offset+md.length-1);
			assertType(md.params[1], FdtAstToken);
			mdp = assertType(md.params[2], FdtAstMetaDataParameter);
			assertEquals(mdp.name, null);
			assertEquals(mdp.eq, -1);
			assertPeNum(mdp.value, "-9");			
			assertEquals(md.close, md.offset+md.length-3);
			assertEquals(md.rbracket, md.offset+md.length-2);
			assertEquals(md.semicolon, md.offset+md.length-1);
		}

		private function verifyMetaData3(child : IFdtAstNode) : void {
			var md : FdtAstMetaData = assertType(child, FdtAstMetaData);
			assertEquals(md.lbracket, md.offset);
			assertEquals(md.name.content,"hik");
			assertEquals(md.open, md.name.length+md.name.offset);
			assertEquals(md.params.length, 1);
			var mdp : FdtAstMetaDataParameter = assertType(md.params[0], FdtAstMetaDataParameter);
			assertEquals(mdp.name.content, "pop");
			assertEquals(mdp.eq, mdp.name.length + mdp.name.offset);
			assertPeId(mdp.value, "mio");			
			assertEquals(md.close, md.offset+md.length-3);
			assertEquals(md.rbracket, md.offset+md.length-2);
			assertEquals(md.semicolon, md.offset+md.length-1);
		}

		private function verifyMetaData2(child : IFdtAstNode) : void {
			var md : FdtAstMetaData = assertType(child, FdtAstMetaData);
			assertEquals(md.lbracket, md.offset);
			assertEquals(md.name.content,"hal");
			assertEquals(md.open, md.name.length+md.name.offset);
			assertEquals(md.params.length, 1);
			var mdp : FdtAstMetaDataParameter = assertType(md.params[0], FdtAstMetaDataParameter);
			assertEquals(mdp.name, null);
			assertEquals(mdp.eq, -1);
			assertPeId(mdp.value, "mio");			
			assertEquals(md.close, md.offset+md.length-2);
			assertEquals(md.rbracket, md.offset+md.length-1);
			assertEquals(md.semicolon, -1);
		}

		private function verifyMetaData1(child : IFdtAstNode) : void {
			var md : FdtAstMetaData = assertType(child, FdtAstMetaData);
			assertEquals(md.lbracket, md.offset);
			assertEquals(md.name.content,"hallo");
			assertEquals(md.open, -1);
			assertEquals(md.params.length, 0);
			assertEquals(md.close, -1);
			assertEquals(md.rbracket, md.offset+md.length-1);
			assertEquals(md.semicolon, -1);
		}

		private function verifyTestInterface(child : IFdtAstNode) : void {
			var i : FdtAstInterface = assertType(child, FdtAstInterface);
			assertEquals(i.name.content, "AstTestInterface2");
			var e1 : FdtAstTypeRef = assertType(i.extendsTypes[0], FdtAstTypeRef);
			assertEquals(e1.content, "AstTestInterface1");
			var e2 : FdtAstTypeRef = assertType(i.extendsTypes[2], FdtAstTypeRef);
			assertEquals(e2.content, "ISelectableList");
			var fu : FdtAstFunction = assertType(i.block.statements[0], FdtAstFunction);
			assertEquals(fu.block, null);
			assertEquals(fu.semicolon, fu.length + fu.offset - 1);
		}

		private function verifyTestFunction1(f : FdtAstFunction) : void {
			assert(f.functionToken > -1, "function Token missing");
			assertEquals(f.constructor, false);
			assertEquals(f.etter, null);
			assertEquals(f.name.content, "astTestFunction1");
			assertType(f.parameters, FdtAstParameters);
			assert(f.parameters.open > -1, "function open token missing");
			assertEquals(f.parameters.params.length, 0);
			assert(f.parameters.close > -1, "function close Token missing");
			assertEquals(f.colon, -1);
			assertEquals(f.returnType, null);
			assertEquals(f.block.statements.length, 6);

			var vds : FdtAstVarDecs = assertType(f.block.statements[1], FdtAstVarDecs);
			assertEquals(vds.decls.length, 3);
			var vd : FdtAstVarDec = assertType(vds.decls[0], FdtAstVarDec);
			assertEquals(vd.name.content, "pik");
			assert(vd.colon > 0, "colon token missing");
			assertEquals(vd.type.content, "int");
			assert(vd.eq > 0, "eq token missing");
			var ipe : FdtAstPrimaryExpression = assertType(vd.init, FdtAstPrimaryExpression);
			var nl : FdtAstNumberLiteral = assertType(ipe.parts[0], FdtAstNumberLiteral);
			assertEquals(nl.content, "1234");
			var comma : FdtAstToken = assertType(vds.decls[1], FdtAstToken);
			assert(comma.offset > 0, "comma token missing");

			var lab : FdtAstLabel = assertType(f.block.statements[2], FdtAstLabel);
			assertEquals(lab.name.content, "Hallo");
			assert(lab.colon > -1, " label end token");

			verifyDoWhileLoop(assertType(f.block.statements[3], FdtAstDoWhileLoop));
			var statement : FdtAstStatement = assertType(f.block.statements[4], FdtAstStatement);
			var a : FdtAstAssignment = assertType(statement.exp, FdtAstAssignment);
			assertPeId(a.left, "i");
			assertEquals(a.op.content, "=");
			assertPeId(a.right, "pik");
			statement = assertType(f.block.statements[5], FdtAstStatement);
			a = assertType(statement.exp, FdtAstAssignment);
			assertPeId(a.left, "pik");
			assertEquals(a.op.content, "+=");
			assertPeNum(a.right, "2000");
			assert(statement.semicolon > 0, "Semicolon missing");
		}

		private function verifyDoWhileLoop(dwl : FdtAstDoWhileLoop) : void {
			assertPeCon(dwl.condition, "true");
			var block : FdtAstBlock = assertType(dwl.statement, FdtAstBlock);
			assertEquals(block.statements.length, 5);
			var br : FdtAstBreak = assertType(block.statements[0], FdtAstBreak);
			assertEquals(br.label.content, "Hallo");
			assert(br.semicolon > 0, "semicolon missing");
			var co : FdtAstContinue = assertType(block.statements[1], FdtAstContinue);
			assertEquals(co.label.content, "Hallo");
			assert(co.semicolon > 0, "semicolon missing");
			var br2 : FdtAstBreak = assertType(block.statements[2], FdtAstBreak);
			assertEquals(br2.label, null);
			assert(br2.semicolon > 0, "semicolon missing");
			var co2 : FdtAstContinue = assertType(block.statements[3], FdtAstContinue);
			assertEquals(co2.label, null);
			assert(co2.semicolon > 0, "semicolon missing");
			var statement : FdtAstStatement = assertType(block.statements[4], FdtAstStatement);
			var pe : FdtAstPrimaryExpression = assertType(statement.exp, FdtAstPrimaryExpression);
			assertPeId(pe, "Sprite");
			assert(statement.semicolon > 0, "Semicolon missing");
		}

		private function verifyTestFunction2(f : FdtAstFunction) : void {
			assert(f.functionToken > -1, "function Token missing");
			assertEquals(f.etter, null);
			assertEquals(f.name.content, "astTestFunction2");
			assert(f.parameters.open > -1, "function open token missing");
			assertEquals(f.parameters.params.length, 1);
			assertType(f.parameters.params[0], FdtAstVarDec);
			assert(f.parameters.close > -1, "function close Token missing");
			assert(f.colon > -1, "function colon Token missing");
			assertEquals(f.returnType.content, "void");
		}

		private function verifyTestFunction3(f : FdtAstFunction) : void {
			assert(f.functionToken > -1, "function Token missing");
			assertEquals(f.etter, null);
			assertEquals(f.name.content, "astTestFunction3");
			assert(f.parameters.open > -1, "function open token missing");
			assertEquals(f.parameters.params.length, 3);
			assertType(f.parameters.params[0], FdtAstVarDec);
			assertType(f.parameters.params[1], FdtAstToken);
			assertType(f.parameters.params[2], FdtAstVarDec);
			assert(f.parameters.close > -1, "function close Token missing");
			assert(f.colon > -1, "function colon Token missing");
			assertEquals(f.returnType.content, "Sprite");
			var rt : FdtAstReturn = assertType(f.block.statements[0], FdtAstReturn);
			var con : FdtAstConditional = assertType(rt.value, FdtAstConditional);
			var rel : FdtAstRelational = assertType(con.condition, FdtAstRelational);
			assertPeId(rel.left, "i");
			assertEquals(rel.op.content, ">");
			assertPeNum(rel.right, "1");
			assert(con.question > 0, "question token missing");
			assertPeId(con.left, "sp");
			assert(con.colon > 0, "colon token missing");
			assertPeCon(con.right, "null");
		}

		private function verifyTestFunction4(f : FdtAstFunction) : void {
			assert(f.functionToken > -1, "function Token missing");
			assertEquals(f.etter, null);
			assertEquals(f.name.content, "astTestFunction4");
			assert(f.parameters.open > -1, "function open token missing");
			assertEquals(f.parameters.params.length, 3);
			assertType(f.parameters.params[0], FdtAstVarDec);
			assertType(f.parameters.params[1], FdtAstToken);
			assertType(f.parameters.params[2], FdtAstVarDec);
			assert(f.parameters.close > -1, "function close Token missing");
			assert(f.colon > -1, "function colon Token missing");
			assertEquals(f.returnType.content, "Sprite");
			checkForEachLoop1(f.block.statements[0]);
			checkForEachLoop2(f.block.statements[1]);
			checkForInLoop1(f.block.statements[2]);
			checkForInLoop2(f.block.statements[3]);
			checkForLoop1(f.block.statements[4]);
			checkForLoop2(f.block.statements[5]);
			checkForLoop3(f.block.statements[6]);
			checkForLoop4(f.block.statements[7]);
			checkForLoop5(f.block.statements[8]);
			checkForLoop6(f.block.statements[9]);
			checkFunctionCall1(f.block.statements[10]);
			checkFunctionCall2(f.block.statements[11]);
			checkFunctionCall3(f.block.statements[12]);
			checkIf1(f.block.statements[13]);
			checkIf2(f.block.statements[14]);
			checkThrow(f.block.statements[15]);
			checkUseNamespace(f.block.statements[16]);
			checkWhile(f.block.statements[17]);
			checkWith(f.block.statements[18]);
			checkTry1(f.block.statements[19]);
			checkTry2(f.block.statements[20]);
			checkTry3(f.block.statements[21]);
			checkInclude(f.block.statements[22]);
			checkSwitch(f.block.statements[23]);
			checkBinary(f.block.statements[24]);
			checkUnary1(f.block.statements[25]);
			checkUnary2(f.block.statements[27]);
			checkUnary3(f.block.statements[28]);
			checkNew1(f.block.statements[29]);
			checkNew2(f.block.statements[30]);
			checkParan(f.block.statements[31]);
			checkAnonFunc(f.block.statements[32]);
			checkObjectInit(f.block.statements[33]);
			checkFilterOp(f.block.statements[34]);
			checkArrayAccess(f.block.statements[35]);
			checkMemberAccess(f.block.statements[36], "*");
			checkMemberAccess(f.block.statements[37], "hallo");
			checkAttributeAccess(f.block.statements[38]);
			checkDefaultXmlNamespace1(f.block.statements[39]);
			checkDefaultXmlNamespace2(f.block.statements[40]);
			checkDefaultXmlNamespace3(f.block.statements[41]);
		}

		private function checkDefaultXmlNamespace3(child : IFdtAstNode) : void {
			var dxn : FdtAstDefaultXmlNamespace = assertType(child, FdtAstDefaultXmlNamespace);
			assertEquals(dxn.xmlToken, dxn.offset + 8);
			assertEquals(dxn.namespaceToken, dxn.offset + 12);
			assertEquals(dxn.eq, dxn.offset + 22);
			var sl : FdtAstAllocation = assertType(dxn.value, FdtAstAllocation);
		}

		private function checkDefaultXmlNamespace2(child : IFdtAstNode) : void {
			var dxn : FdtAstDefaultXmlNamespace = assertType(child, FdtAstDefaultXmlNamespace);
			assertEquals(dxn.xmlToken, dxn.offset + 8);
			assertEquals(dxn.namespaceToken, dxn.offset + 12);
			assertEquals(dxn.eq, dxn.offset + 22);
			var sl : FdtAstStringLiteral = assertType(dxn.value, FdtAstStringLiteral);
			assertEquals(sl.content, '"jio"');
			assertEquals(dxn.semicolon, dxn.offset+dxn.length-1);
		}

		private function checkDefaultXmlNamespae1(chil : IFdtAstNode) : void {
			trace("fskjdrsfkl");
		}		
		
		private function checkDefaultXmlNamespace1(child : IFdtAstNode) : void {
			var dxn : FdtAstDefaultXmlNamespace = assertType(child, FdtAstDefaultXmlNamespace);
			assertEquals(dxn.xmlToken, dxn.offset + 8);
			assertEquals(dxn.namespaceToken, dxn.offset + 12);
			assertEquals(dxn.eq, dxn.offset + 22);
			var s : FdtAstString = assertType(dxn.value, FdtAstString);
			assertEquals(s.content, "AS3");
			assertEquals(dxn.semicolon, dxn.offset+dxn.length-1);
		}

		private function checkAttributeAccess(child : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var p : FdtAstParantheses = assertType(a.right, FdtAstParantheses);
			assert(p.open > 0, "open");
			// assertEquals(p.children.length, 7);

			var pe : FdtAstPrimaryExpression = assertType(p.exps[0], FdtAstPrimaryExpression);
			assertIdLit(pe, "o");
			assertType(pe.parts[1], FdtAstString);
			var aa : FdtAstAttributeAccess = assertType(pe.parts[2], FdtAstAttributeAccess);
			assertEquals(aa.namespaceNode, null);
			assertEquals(aa.attribute.content, "hallo");

			pe = assertType(p.exps[2], FdtAstPrimaryExpression);
			assertIdLit(pe, "o");
			assertType(pe.parts[1], FdtAstString);
			var iaa : FdtAstIndirectAttributeAccess = assertType(pe.parts[2], FdtAstIndirectAttributeAccess);
			assertEquals(iaa.namespaceNode, null);
			assert(iaa.lbracket > 0, "lbra");
			assertPeId(iaa.attributeExp, "o");
			assert(iaa.rbracket > 0, "rbra");

			pe = assertType(p.exps[4], FdtAstPrimaryExpression);
			assertIdLit(pe, "o");
			assertType(pe.parts[1], FdtAstString);
			aa = assertType(pe.parts[2], FdtAstAttributeAccess);
			var nsq : FdtAstNamespaceQualifier = assertType(aa.namespaceNode, FdtAstNamespaceQualifier);
			var nsn : FdtAstNamespaceName = assertType(nsq.namespaceName, FdtAstNamespaceName);
			assertEquals(nsn.content, "AS3");
			assert(nsq.doubleColon > 0, "double colon");
			assertEquals(aa.attribute.content, "hallo");

			pe = assertType(p.exps[6], FdtAstPrimaryExpression);
			assertIdLit(pe, "o");
			assertType(pe.parts[1], FdtAstString);
			iaa = assertType(pe.parts[2], FdtAstIndirectAttributeAccess);
			nsq = assertType(iaa.namespaceNode, FdtAstNamespaceQualifier);
			nsn = assertType(nsq.namespaceName, FdtAstNamespaceName);
			assertEquals(nsn.content, "AS3");
			assert(nsq.doubleColon > 0, "double colon");
			assert(iaa.lbracket > 0, "lbra");
			assertPeId(iaa.attributeExp, "o");
			assert(iaa.rbracket > 0, "rbra");

			assert(p.close > 0, "close");
		}

		private function checkMemberAccess(child : IFdtAstNode, name : String) : void {
			var st : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var pe : FdtAstPrimaryExpression = assertType(a.right, FdtAstPrimaryExpression);
			assertIdLit(pe, "o");
			var s : FdtAstString = assertType(pe.parts[1], FdtAstString);
			assertEquals(s.content, ".");
			assertIdLit(pe, name, 2);
		}

		private function checkArrayAccess(child : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var pe : FdtAstPrimaryExpression = assertType(a.right, FdtAstPrimaryExpression);
			assertIdLit(pe, "o");
			var p : FdtAstArrayAccess = assertType(pe.parts[1], FdtAstArrayAccess);
			assert(p.lbracket > 0, "open");
			assertPeId(p.exp, "i");
			assert(p.rbracket > 0, "close");
		}

		private function checkFilterOp(child : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var pe : FdtAstPrimaryExpression = assertType(a.right, FdtAstPrimaryExpression);
			assertIdLit(pe, "o");
			var s : FdtAstString = assertType(pe.parts[1], FdtAstString);
			assertEquals(s.content, ".");
			var p : FdtAstFilterOperator = assertType(pe.parts[2], FdtAstFilterOperator);
			assert(p.open > 0, "open");
			assertEquals(p.exps.length, 3);
			assertPeId(p.exps[0], "o");
			assertType(p.exps[1], FdtAstToken);
			assertPeId(p.exps[2], "i");
			assert(p.close > 0, "close");
		}

		private function checkObjectInit(child : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var oi : FdtAstObjectInitializer = assertType(a.right, FdtAstObjectInitializer);
			assert(oi.lbrace > 0, "lbrace");

			var oim : FdtAstObjectInitializerMember = assertType(oi.members[0], FdtAstObjectInitializerMember);
			assertEquals(oim.open, -1);
			var sl : FdtAstStringLiteral = assertType(oim.key, FdtAstStringLiteral);
			assertEquals(sl.content, '"a"');
			assertEquals(oim.close, -1);
			assertPeNum(oim.value, "10");

			assertType(oi.members[1], FdtAstToken);

			oim = assertType(oi.members[2], FdtAstObjectInitializerMember);
			assertEquals(oim.open, -1);
			sl = assertType(oim.key, FdtAstStringLiteral);
			assertEquals(sl.content, "'a'");
			assertEquals(oim.close, -1);
			assertPeNum(oim.value, "10");

			assertType(oi.members[3], FdtAstToken);

			oim = assertType(oi.members[4], FdtAstObjectInitializerMember);
			assertEquals(oim.open, -1);
			var s : FdtAstString = assertType(oim.key, FdtAstString);
			assertEquals(s.content, "kl");
			assertEquals(oim.close, -1);
			assertPeNum(oim.value, "10");

			assertType(oi.members[5], FdtAstToken);

			oim = assertType(oi.members[6], FdtAstObjectInitializerMember);
			assertEquals(oim.open, -1);
			var nl : FdtAstNumberLiteral = assertType(oim.key, FdtAstNumberLiteral);
			assertEquals(nl.content, "10");
			assertEquals(oim.close, -1);
			assertPeNum(oim.value, "10");

			assertType(oi.members[7], FdtAstToken);

			oim = assertType(oi.members[8], FdtAstObjectInitializerMember);
			assertEquals(oim.open, -1);
			nl = assertType(oim.key, FdtAstNumberLiteral);
			assertEquals(nl.content, "10.1");
			assertEquals(oim.close, -1);
			assertPeNum(oim.value, "10");

			assertType(oi.members[9], FdtAstToken);

			oim = assertType(oi.members[10], FdtAstObjectInitializerMember);
			assert(oim.open > 0, "open");
			assertPeId(oim.key, "i");
			assert(oim.close > 0, "close");
			assertPeId(oim.value, "i");

			assert(oi.rbrace > 0, "rbrace");
		}

		private function checkAnonFunc(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var af : FdtAstAnonymousFunction = assertType(a.right, FdtAstAnonymousFunction);
			assert(af.parameters.open > -1, "function open token missing");
			assertEquals(af.parameters.params.length, 1);
			assertType(af.parameters.params[0], FdtAstVarDec);
			assert(af.parameters.close > -1, "function close Token missing");
			assert(af.colon > -1, "function colon Token missing");
			assertEquals(af.returnType.content, "Object");
			assertEquals(af.block.statements.length, 2);
		}

		private function checkParan(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var p : FdtAstParantheses = assertType(a.right, FdtAstParantheses);
			assert(p.open > 0, "open");
			assertEquals(p.exps.length, 3);
			assertPeNum(p.exps[0], "9");
			assertType(p.exps[1], FdtAstToken);
			assertPeId(p.exps[2], "i");
			assert(p.close > 0, "close");
		}

		private function checkNew1(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var u : FdtAstAllocation = assertType(a.right, FdtAstAllocation);
			assertEquals(u.generic, null);
			var pe : FdtAstPrimaryExpression = assertType(u.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "Sprite");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 0);
			assert(args.close > 0, "close");
		}

		private function checkNew2(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var u : FdtAstAllocation = assertType(a.right, FdtAstAllocation);
			assertEquals(u.generic.content, "<int>");
			var pe : FdtAstPrimaryExpression = assertType(u.exp, FdtAstPrimaryExpression);
			var ai : FdtAstArrayInitializer = assertType(pe.parts[0], FdtAstArrayInitializer);
			assertEquals(ai.lbracket, ai.offset);
			assert(ai.rbracket > 0, "rbracket");
			assertPeNum(ai.children[0], "1");
			assertType(ai.children[1], FdtAstToken);
			assertPeNum(ai.children[2], "2");
			assertType(ai.children[3], FdtAstToken);
			assertPeNum(ai.children[4], "3");
		}

		private function checkUnary1(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var u : FdtAstUnary = assertType(a.right, FdtAstUnary);
			assertEquals(u.op.content, "--");
			assertPeId(u.exp, "i");
		}

		private function checkUnary2(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var u : FdtAstUnary = assertType(a.right, FdtAstUnary);
			assertEquals(u.op.content, "delete");
			assertPeId(u.exp, "sp");
		}

		private function checkUnary3(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var u : FdtAstUnary = assertType(a.right, FdtAstUnary);
			assertEquals(u.op.content, "typeof");
			assertPeId(u.exp, "sp");
		}

		private function checkBinary(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var a : FdtAstAssignment = assertType(s.exp, FdtAstAssignment);
			var b : FdtAstBinary = assertType(a.right, FdtAstBinary);
			assertPeId(b.left, "i");
			assertEquals(b.op.content, "+");
			assertPeNum(b.right, "9");
		}

		private function checkSwitch(child : IFdtAstNode) : void {
			var sws : FdtAstSwitch = assertType(child, FdtAstSwitch);
			assertPeId(sws.condition, "i");
			assertEquals(sws.block.statements.length, 3);
			var c : FdtAstCase = assertType(sws.block.statements[0], FdtAstCase);
			assertPeNum(c.caseExp, "5");
			assert(c.colon > 0, "colon");
			assertEquals(c.statements.length, 2);
			assertType(c.statements[0], FdtAstStatement);
			assertType(c.statements[1], FdtAstReturn);
			c = assertType(sws.block.statements[1], FdtAstCase);
			assertPeNum(c.caseExp, "8");
			assert(c.colon > 0, "colon");
			assertEquals(c.statements.length, 1);
			assertType(c.statements[0], FdtAstReturn);
			var d : FdtAstDefault = assertType(sws.block.statements[2], FdtAstDefault);
			assert(d.colon > 0, "colon");
			assertEquals(d.statements.length, 1);
			assertType(d.statements[0], FdtAstReturn);
		}

		private function checkInclude(child : IFdtAstNode) : void {
			var i : FdtAstInclude = assertType(child, FdtAstInclude);
			assertEquals(i.file.content, '"../assets/Testinc.as"');
		}

		private function checkTry1(child : IFdtAstNode) : void {
			var ts : FdtAstTry = assertType(child, FdtAstTry);
			assertEquals(ts.block.statements.length, 1);
			assertEquals(ts.catches.length, 1);
			var c : FdtAstCatch = assertType(ts.catches[0], FdtAstCatch);
			assert(c.open > 0, "open");
			assertEquals(c.varDec.name.content, "e");
			assertEquals(c.varDec.type.content, "Error");
			assert(c.close > 0, "close");
			assertEquals(c.block.statements.length, 0);
			assertEquals(ts.finallyBlock, null);
		}

		private function checkTry2(child : IFdtAstNode) : void {
			var ts : FdtAstTry = assertType(child, FdtAstTry);
			assertEquals(ts.block.statements.length, 1);
			assertEquals(ts.catches.length, 0);
			var f : FdtAstFinally = assertType(ts.finallyBlock, FdtAstFinally);
			assertEquals(f.block.statements.length, 0);
		}

		private function checkTry3(child : IFdtAstNode) : void {
			var ts : FdtAstTry = assertType(child, FdtAstTry);
			assertEquals(ts.block.statements.length, 1);
			assertEquals(ts.catches.length, 1);
			var c : FdtAstCatch = assertType(ts.catches[0], FdtAstCatch);
			assert(c.open > 0, "open");
			assertEquals(c.varDec.name.content, "e");
			assertEquals(c.varDec.type.content, "Error");
			assert(c.close > 0, "close");
			assertEquals(c.block.statements.length, 0);
			var f : FdtAstFinally = assertType(ts.finallyBlock, FdtAstFinally);
			assertEquals(f.block.statements.length, 2);
		}

		private function checkWith(child : IFdtAstNode) : void {
			var ws : FdtAstWith = assertType(child, FdtAstWith);
			assert(ws.open > 0, "open");
			var pe : FdtAstPrimaryExpression = assertType(ws.exp, FdtAstPrimaryExpression);
			assertPeId(pe, "sp");
			assert(ws.close > 0, "close");
			var s : FdtAstStatement = assertType(ws.statement, FdtAstStatement);
			pe = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 0);
			assert(args.close > 0, "close");
		}

		private function checkWhile(child : IFdtAstNode) : void {
			var ws : FdtAstWhile = assertType(child, FdtAstWhile);
			assert(ws.open > 0, "open");
			var r : FdtAstRelational = assertType(ws.condition, FdtAstRelational);
			assertPeId(r.left, "j");
			assertEquals(r.op.content, "<");
			assertPeNum(r.right, "10");
			assert(ws.close > 0, "close");
			var s : FdtAstStatement = assertType(ws.statement, FdtAstStatement);
			var pe : FdtAstPrimaryExpression = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 0);
			assert(args.close > 0, "close");
		}

		private function checkUseNamespace(child : IFdtAstNode) : void {
			var un : FdtAstUseNamespace = assertType(child, FdtAstUseNamespace);
			assert(un.namespaceToken > 0, "semi");
			assertEquals(un.name.content, "AS3");
			assert(un.semicolon > 0, "semi");
		}

		private function checkThrow(child : IFdtAstNode) : void {
			var ts : FdtAstThrow = assertType(child, FdtAstThrow);
			assertPeId(ts.value, "sp");
			assert(ts.semicolon > 0, "semi");
		}

		private function checkIf1(child : IFdtAstNode) : void {
			var ifs : FdtAstIf = assertType(child, FdtAstIf);
			assert(ifs.open > 0, "open");
			var r : FdtAstEquality = assertType(ifs.condition, FdtAstEquality);
			assertPeId(r.left, "i");
			assertEquals(r.op.content, "==");
			assertPeNum(r.right, "10");
			assert(ifs.close > 0, "close");
			var s : FdtAstStatement = assertType(ifs.statement, FdtAstStatement);
			var pe : FdtAstPrimaryExpression = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 0);
			assert(args.close > 0, "close");
			assertEquals(ifs.elseToken, -1);
			assertEquals(ifs.elseStatement, null);
		}

		private function checkIf2(child : IFdtAstNode) : void {
			var ifs : FdtAstIf = assertType(child, FdtAstIf);
			assert(ifs.open > 0, "open");
			var l : FdtAstLogical = assertType(ifs.condition, FdtAstLogical);
			var r : FdtAstRelational = assertType(l.left, FdtAstRelational);
			assertPeId(r.left, "j");
			assertEquals(r.op.content, "<");
			assertPeNum(r.right, "10");
			assert(ifs.close > 0, "close");
			assertEquals(l.op.content, "&&");
			assertPeCon(l.right, "true");
			var s : FdtAstStatement = assertType(ifs.statement, FdtAstStatement);
			var pe : FdtAstPrimaryExpression = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 0);
			assert(args.close > 0, "close");
			assert(ifs.elseToken > 0, "else");
			s = assertType(ifs.elseStatement, FdtAstStatement);
			pe = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			args = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 1);
			assertPeId(args.children[0], "i");
			assert(args.close > 0, "close");
		}

		private function checkFunctionCall1(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var pe : FdtAstPrimaryExpression = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 0);
			assert(args.close > 0, "close");
		}

		private function checkFunctionCall2(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var pe : FdtAstPrimaryExpression = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 1);
			assertPeId(args.children[0], "i");
			assert(args.close > 0, "close");
		}

		private function checkFunctionCall3(child : IFdtAstNode) : void {
			var s : FdtAstStatement = assertType(child, FdtAstStatement);
			var pe : FdtAstPrimaryExpression = assertType(s.exp, FdtAstPrimaryExpression);
			assertIdLit(pe, "trace");
			var args : FdtAstArguments = assertType(pe.parts[1], FdtAstArguments);
			assert(args.open > 0, "open");
			assertEquals(args.children.length, 3);
			assertPeId(args.children[0], "i");
			var c : FdtAstToken = assertType(args.children[1], FdtAstToken);
			assert(c.offset > 0, "comma");
			assertPeId(args.children[2], "sp");
			assert(args.close > 0, "close");
		}

		private function checkForEachLoop1(loop : IFdtAstNode) : void {
			var fei : FdtAstForEachIn = assertType(loop, FdtAstForEachIn);
			assert(fei.eachToken > 0, "each");
			assert(fei.open > 0, "open");
			assert(fei.varToken > 0, "var");
			var s : FdtAstString = assertType(fei.target, FdtAstString);
			assertEquals(s.content, "h");
			assertEquals(fei.type.content, "Object");
			assertPeId(fei.source, "sp");
			assert(fei.close > 0, "close");
			var block : FdtAstBlock = assertType(fei.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForEachLoop2(loop : IFdtAstNode) : void {
			var fei : FdtAstForEachIn = assertType(loop, FdtAstForEachIn);
			assert(fei.eachToken > 0, "each");
			assert(fei.open > 0, "open");
			assert(fei.varToken == -1, "var");
			assertPeId(fei.target, "h");
			assertEquals(fei.type, null);
			assertPeId(fei.source, "sp");
			assert(fei.close > 0, "close");
			var block : FdtAstBlock = assertType(fei.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForInLoop1(loop : IFdtAstNode) : void {
			var fi : FdtAstForIn = assertType(loop, FdtAstForIn);
			assert(fi.open > 0, "open");
			assert(fi.varToken > 0, "var");
			var s : FdtAstString = assertType(fi.target, FdtAstString);
			assertEquals(s.content, "p");
			assertEquals(fi.type.content, "Object");
			assertPeId(fi.source, "sp");
			assert(fi.close > 0, "close");
			var block : FdtAstBlock = assertType(fi.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForInLoop2(loop : IFdtAstNode) : void {
			var fi : FdtAstForIn = assertType(loop, FdtAstForIn);
			assert(fi.open > 0, "open");
			assert(fi.varToken == -1, "var");
			assertPeId(fi.target, "p");
			assertEquals(fi.type, null);
			assertPeId(fi.source, "sp");
			assert(fi.close > 0, "close");
			var block : FdtAstBlock = assertType(fi.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForLoop1(loop : IFdtAstNode) : void {
			var fl : FdtAstFor = assertType(loop, FdtAstFor);
			assert(fl.open > 0, "open");
			var vds : FdtAstVarDecs = assertType(fl.inits, FdtAstVarDecs);
			var vd : FdtAstVarDec = assertType(vds.decls[0], FdtAstVarDec);
			assertEquals(vd.name.content, "j");
			assertEquals(vd.type.content, "int");
			assertPeNum(vd.init, "1");
			assert(vds.semicolon > 0, "semi1");
			assertType(fl.conditions, FdtAstForConditions);
			assertEquals(fl.conditions.exps.length, 1);
			var r : FdtAstRelational = assertType(fl.conditions.exps[0], FdtAstRelational);
			assertPeId(r.left, "j");
			assertEquals(r.op.content, "<");
			assertPeNum(r.right, "10");
			assert(fl.conditions.semicolon > 0, "semi2");
			assertType(fl.updates, FdtAstForUpdates);
			var pf : FdtAstPostfix = assertType(fl.updates.exps[0], FdtAstPostfix);
			assertPeId(pf.exp, "j");
			assertEquals(pf.op.content, "++");
			assert(fl.close > 0, "close");
			var block : FdtAstBlock = assertType(fl.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForLoop2(loop : IFdtAstNode) : void {
			var fl : FdtAstFor = assertType(loop, FdtAstFor);
			assert(fl.open > 0, "open");
			var fis : FdtAstForInits = assertType(fl.inits, FdtAstForInits);
			var fi : FdtAstAssignment = assertType(fis.exps[0], FdtAstAssignment);
			assertPeId(fi.left, "j");
			assertEquals(fi.op.content, "=");
			assertPeNum(fi.right, "1");
			assert(fis.semicolon > 0, "semi1");
			assertType(fl.conditions, FdtAstForConditions);
			assertEquals(fl.conditions.exps.length, 1);
			var r : FdtAstRelational = assertType(fl.conditions.exps[0], FdtAstRelational);
			assertPeId(r.left, "j");
			assertEquals(r.op.content, "<");
			assertPeNum(r.right, "10");
			assert(fl.conditions.semicolon > 0, "semi2");
			assertType(fl.updates, FdtAstForUpdates);
			var pf : FdtAstPostfix = assertType(fl.updates.exps[0], FdtAstPostfix);
			assertPeId(pf.exp, "j");
			assertEquals(pf.op.content, "++");
			assert(fl.close > 0, "close");
			var block : FdtAstBlock = assertType(fl.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForLoop3(loop : IFdtAstNode) : void {
			var fl : FdtAstFor = assertType(loop, FdtAstFor);
			assert(fl.open > 0, "open");
			var fis : FdtAstForInits = assertType(fl.inits, FdtAstForInits);
			assertEquals(fis.exps.length, 0);
			assert(fis.semicolon > 0, "semi1");
			assertType(fl.conditions, FdtAstForConditions);
			assertEquals(fl.conditions.exps.length, 1);
			var r : FdtAstRelational = assertType(fl.conditions.exps[0], FdtAstRelational);
			assertPeId(r.left, "j");
			assertEquals(r.op.content, "<");
			assertPeNum(r.right, "10");
			assert(fl.conditions.semicolon > 0, "semi2");
			assertType(fl.updates, FdtAstForUpdates);
			var pf : FdtAstPostfix = assertType(fl.updates.exps[0], FdtAstPostfix);
			assertPeId(pf.exp, "j");
			assertEquals(pf.op.content, "++");
			assert(fl.close > 0, "close");
			var block : FdtAstBlock = assertType(fl.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForLoop4(loop : IFdtAstNode) : void {
			var fl : FdtAstFor = assertType(loop, FdtAstFor);
			assert(fl.open > 0, "open");
			var fis : FdtAstForInits = assertType(fl.inits, FdtAstForInits);
			var fi : FdtAstAssignment = assertType(fis.exps[0], FdtAstAssignment);
			assertPeId(fi.left, "j");
			assertEquals(fi.op.content, "=");
			assertPeNum(fi.right, "1");
			assert(fis.semicolon > 0, "semi1");
			assertType(fl.conditions, FdtAstForConditions);
			assertEquals(fl.conditions.exps.length, 0);
			assert(fl.conditions.semicolon > 0, "semi2");
			assertType(fl.updates, FdtAstForUpdates);
			var pf : FdtAstPostfix = assertType(fl.updates.exps[0], FdtAstPostfix);
			assertPeId(pf.exp, "j");
			assertEquals(pf.op.content, "++");
			assert(fl.close > 0, "close");
			var block : FdtAstBlock = assertType(fl.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForLoop5(loop : IFdtAstNode) : void {
			var fl : FdtAstFor = assertType(loop, FdtAstFor);
			assert(fl.open > 0, "open");
			var fis : FdtAstForInits = assertType(fl.inits, FdtAstForInits);
			var fi : FdtAstAssignment = assertType(fis.exps[0], FdtAstAssignment);
			assertPeId(fi.left, "j");
			assertEquals(fi.op.content, "=");
			assertPeNum(fi.right, "1");
			assert(fis.semicolon > 0, "semi1");
			assertType(fl.conditions, FdtAstForConditions);
			assertEquals(fl.conditions.exps.length, 1);
			var r : FdtAstRelational = assertType(fl.conditions.exps[0], FdtAstRelational);
			assertPeId(r.left, "j");
			assertEquals(r.op.content, "<");
			assertPeNum(r.right, "10");
			assert(fl.conditions.semicolon > 0, "semi2");
			assertType(fl.updates, FdtAstForUpdates);
			assertEquals(fl.updates.exps.length, 0);
			assert(fl.close > 0, "close");
			var block : FdtAstBlock = assertType(fl.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function checkForLoop6(loop : IFdtAstNode) : void {
			var fl : FdtAstFor = assertType(loop, FdtAstFor);
			assert(fl.open > 0, "open");
			var fis : FdtAstForInits = assertType(fl.inits, FdtAstForInits);
			assertEquals(fis.exps.length, 0);
			assert(fis.semicolon > 0, "semi1");
			assertType(fl.conditions, FdtAstForConditions);
			assertEquals(fl.conditions.exps.length, 0);
			assert(fl.conditions.semicolon > 0, "semi2");
			assertType(fl.updates, FdtAstForUpdates);
			assertEquals(fl.updates.exps.length, 0);
			assert(fl.close > 0, "close");
			var block : FdtAstBlock = assertType(fl.statement, FdtAstBlock);
			assertEquals(block.statements.length, 0);
		}

		private function verifyImport(i : FdtAstImport) : void {
			trace("Verify Import: " + i.importName.content);
			assertEquals(i.importName.content, "flash.display.Sprite");
		}

		private function verifyTestClass1(c : FdtAstClass) : void {
			assertEquals(c.name.content, "AstTestClass");
			
			
			var fds : FdtAstFields = assertType(c.block.statements[0], FdtAstFields);
			var m : FdtAstString = assertType(fds.modifiers.modifiers[0], FdtAstString);
			assertEquals(m.content, "private");
			m = assertType(fds.modifiers.modifiers[1], FdtAstString);
			assertEquals(m.content, "static");
			var vd : FdtAstVarDec = assertType(fds.varDecs.decls[0], FdtAstVarDec);
			assertEquals(vd.name.content, "i");

			fds = assertType(c.block.statements[1], FdtAstFields);
			assertEquals(fds.modifiers.modifiers.length, 0);
			vd = assertType(fds.varDecs.decls[0], FdtAstVarDec);
			assertEquals(vd.name.content, "p");

			var nd : FdtAstNamespace = assertType(c.block.statements[2], FdtAstNamespace);
			assertEquals(nd.namespaceToken, nd.offset);
			assertEquals(nd.name.content, "KOP1");
			assert(nd.eq == -1, "eq");
			assertEquals(nd.init, null);
			assert(nd.semicolon > 0, "semi");

			nd = assertType(c.block.statements[3], FdtAstNamespace);
			assertEquals(nd.namespaceToken, nd.offset);
			assertEquals(nd.name.content, "KOP2");
			assert(nd.eq > 0, "eq");
			var nsn : FdtAstString = assertType(nd.init, FdtAstString);
			assertEquals(nsn.content, "KOP1");
			assert(nd.semicolon > 0, "semi");

			nd = assertType(c.block.statements[4], FdtAstNamespace);
			assertEquals(nd.namespaceToken, nd.offset);
			assertEquals(nd.name.content, "KOP3");
			assert(nd.eq > 0, "eq");
			nsn = assertType(nd.init, FdtAstStringLiteral);
			assertEquals(nsn.content, '"hallo"');
			assert(nd.semicolon > 0, "semi");

			var co : FdtAstFunction = assertType(c.block.statements[5], FdtAstFunction);
			assertEquals(co.name.content, co.name.content);
			assertEquals(co.constructor, true);
			verifyConstructorBlock(co.block);
		}

		private function verifyConstructorBlock(b : FdtAstBlock) : void {
			checkXml1(b.statements[1]);
			checkXml2(b.statements[2]);
			checkXml3(b.statements[3]);
			checkXml4(b.statements[4]);
			checkXml5(b.statements[5]);
		}

		private function checkXml5(statement : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(statement, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var xn : FdtAstXmlNode = assertType(a.right, FdtAstXmlNode);
			var xot : FdtAstXmlOpenTag = assertType(xn.children[0], FdtAstXmlOpenTag);
			var tn : FdtAstXmlTagName = assertType(xot.children[0], FdtAstXmlTagName);
			assertEquals(tn.content, "hi");
			assertEquals(xot.endToken, xot.offset + xot.length - 1);
			var xt : FdtAstXmlText = assertType(xn.children[1], FdtAstXmlText);
			assertEquals(xt.content, "Hallo");

			var xcd : FdtAstXmlCData = assertType(xn.children[2], FdtAstXmlCData);
			assertEquals(xcd.text.content, "KU");
			assertEquals(xcd.endToken, xcd.offset + xcd.length - 3);

			var xco : FdtAstXmlComment = assertType(xn.children[3], FdtAstXmlComment);
			assertEquals(xco.text.content, "bing");
			assertEquals(xco.endToken, xco.offset + xco.length - 3);

			var xee : FdtAstXmlEmbExp = assertType(xn.children[4], FdtAstXmlEmbExp);
			assertEquals(xee.lbrace, xee.offset);
			assertPeId(xee.exp, "o");
			assertEquals(xee.rbrace, xee.offset + xee.length - 1);

			var xct : FdtAstXmlCloseTag = assertType(xn.children[5], FdtAstXmlCloseTag);
			tn = assertType(xct.children[0], FdtAstXmlTagName);
			assertEquals(tn.content, "hi");
			assertEquals(xct.endToken, xct.offset + xct.length - 1);
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
		}

		private function checkXml4(statement : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(statement, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var xn : FdtAstXmlNode = assertType(a.right, FdtAstXmlNode);
			var xcot : FdtAstXmlCompleteTag = assertType(xn.children[0], FdtAstXmlCompleteTag);
			var tn : FdtAstXmlTagName = assertType(xcot.children[0], FdtAstXmlTagName);
			assertEquals(tn.content, "hi");
			assertEquals(xcot.endToken, xcot.offset + xcot.length - 2);
			var xa : FdtAstXmlAttribute = assertType(xcot.children[1], FdtAstXmlAttribute);
			assertEquals(xa.namespaceNode, null);
			var xan : FdtAstXmlAttributeName = assertType(xa.name, FdtAstXmlAttributeName);
			assertEquals(xan.content, "a");
			var xav : FdtAstXmlAttributeValue = assertType(xa.value, FdtAstXmlAttributeValue);
			assertEquals(xav.content, '"u"');

			xa = assertType(xcot.children[2], FdtAstXmlAttribute);
			var xns : FdtAstXmlNamespace = assertType(xa.namespaceNode, FdtAstXmlNamespace);
			assertEquals(xns.name.content, "z");
			xan = assertType(xa.name, FdtAstXmlAttributeName);
			assertEquals(xan.content, "p");
			xav = assertType(xa.value, FdtAstXmlAttributeValue);
			assertEquals(xav.content, '"u"');
		}

		private function checkXml3(statement : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(statement, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var xn : FdtAstXmlNode = assertType(a.right, FdtAstXmlNode);
			var xot : FdtAstXmlOpenTag = assertType(xn.children[0], FdtAstXmlOpenTag);
			var xns : FdtAstXmlNamespace = assertType(xot.children[0], FdtAstXmlNamespace);
			assertEquals(xns.name.content, "a");
			assertEquals(xns.colon, xns.offset + xns.length - 1);
			var tn : FdtAstXmlTagName = assertType(xot.children[1], FdtAstXmlTagName);
			assertEquals(tn.content, "hi");
			assertEquals(xot.endToken, xot.offset + xot.length - 1);
			var sxn : FdtAstXmlNode = assertType(xn.children[1], FdtAstXmlNode);
			var xcot : FdtAstXmlCompleteTag = assertType(sxn.children[0], FdtAstXmlCompleteTag);
		}

		private function checkXml2(statement : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(statement, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var xn : FdtAstXmlNode = assertType(a.right, FdtAstXmlNode);
			var xcot : FdtAstXmlCompleteTag = assertType(xn.children[0], FdtAstXmlCompleteTag);
			var tn : FdtAstXmlTagName = assertType(xcot.children[0], FdtAstXmlTagName);
			assertEquals(tn.content, "hi");
			assertEquals(xcot.endToken, xcot.offset + xcot.length - 2);
		}

		private function checkXml1(statement : IFdtAstNode) : void {
			var st : FdtAstStatement = assertType(statement, FdtAstStatement);
			var a : FdtAstAssignment = assertType(st.exp, FdtAstAssignment);
			var xn : FdtAstXmlNode = assertType(a.right, FdtAstXmlNode);
			var xot : FdtAstXmlOpenTag = assertType(xn.children[0], FdtAstXmlOpenTag);
			var tn : FdtAstXmlTagName = assertType(xot.children[0], FdtAstXmlTagName);
			assertEquals(tn.content, "hi");
			assertEquals(xot.endToken, xot.offset + xot.length - 1);
			var xct : FdtAstXmlCloseTag = assertType(xn.children[1], FdtAstXmlCloseTag);
			tn = assertType(xct.children[0], FdtAstXmlTagName);
			assertEquals(tn.content, "hi");
			assertEquals(xct.endToken, xct.offset + xct.length - 1);
		}

		private function assertPeId(node : IFdtAstNode, expected : String) : void {
			var pe : FdtAstPrimaryExpression = assertType(node, FdtAstPrimaryExpression);
			assertEquals(pe.parts.length, 1);
			assertIdLit(pe, expected);
		}

		private function assertIdLit(pe : FdtAstPrimaryExpression, expected : String, i : int = 0) : void {
			var il : FdtAstIdentifierLiteral = assertType(pe.parts[i], FdtAstIdentifierLiteral);
			assertEquals(il.content, expected);
		}

		private function assertPeCon(node : IFdtAstNode, expected : String) : void {
			var pe : FdtAstPrimaryExpression = assertType(node, FdtAstPrimaryExpression);
			assertEquals(pe.parts.length, 1);
			var il : FdtAstConstantLiteral = assertType(pe.parts[0], FdtAstConstantLiteral);
			assertEquals(il.content, expected);
		}

		private function assertPeNum(node : IFdtAstNode, expected : String) : void {
			var pe : FdtAstPrimaryExpression = assertType(node, FdtAstPrimaryExpression);
			assertEquals(pe.parts.length, 1);
			var il : FdtAstNumberLiteral = assertType(pe.parts[0], FdtAstNumberLiteral);
			assertEquals(il.content, expected);
		}

		private function assertPeStr(node : IFdtAstNode, expected : String) : void {
			var pe : FdtAstPrimaryExpression = assertType(node, FdtAstPrimaryExpression);
			assertEquals(pe.parts.length, 1);
			var il : FdtAstStringLiteral = assertType(pe.parts[0], FdtAstStringLiteral);
			assertEquals(il.content, expected);
		}
	}
}
