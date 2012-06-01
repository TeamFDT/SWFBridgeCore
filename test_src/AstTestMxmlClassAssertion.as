package {
	import fdt.ast.FdtAstMxmlSubExp;
	import fdt.ast.FdtAstPrimaryExpression;
	import fdt.ast.FdtAstStatement;
	import fdt.ast.FdtAstFields;
	import fdt.ast.FdtAstFunction;
	import fdt.ast.FdtAstMxmlAttribute;
	import fdt.ast.FdtAstMxmlAttributeValue;
	import fdt.ast.FdtAstMxmlAttributeValueStatements;
	import fdt.ast.FdtAstMxmlCData;
	import fdt.ast.FdtAstMxmlClassPart;
	import fdt.ast.FdtAstMxmlCloseTag;
	import fdt.ast.FdtAstMxmlComment;
	import fdt.ast.FdtAstMxmlCompleteTag;
	import fdt.ast.FdtAstMxmlNode;
	import fdt.ast.FdtAstMxmlOpenTag;
	import fdt.ast.FdtAstMxmlRoot;
	import fdt.ast.FdtAstMxmlTag;
	import fdt.ast.FdtAstMxmlText;
	import fdt.ast.IFdtAstNode;

	public class AstTestMxmlClassAssertion extends Assertion {
		public function verify(node : IFdtAstNode) : void {
			var root : FdtAstMxmlRoot = assertType(node, FdtAstMxmlRoot);
			var mainNode : FdtAstMxmlNode = assertType(root.children[0], FdtAstMxmlNode);
			verifyMainOpenTag(mainNode.children[0]);
			verifyText(mainNode.children[1], "\n\t");
			verifyScript(mainNode.children[2]);
			verifyText(mainNode.children[3], "\n\t");
			verifyStates(mainNode.children[4]);
			verifyText(mainNode.children[5], "\n\t");
			verifyComment(mainNode.children[6], " Commentoly ");
			verifyComment(mainNode.children[7], " Comment ");
			verifyText(mainNode.children[8], "\n\t");
			verifyButton(mainNode.children[9]);
			verifyText(mainNode.children[10], "\n");
			assertTag(mainNode.children[11], "s", "Application", FdtAstMxmlCloseTag, false);
		}

		private function verifyButton(node : IFdtAstNode) : void {
			var n : FdtAstMxmlNode = assertType(node, FdtAstMxmlNode);
			var attrs : Vector.<IFdtAstNode> = assertTag(n.children[0], "s", "Button", FdtAstMxmlOpenTag, true);
			verifyText(n.children[1], "\n\t\t");
			assertEquals(attrs.length, 2);
			assertEquals(assertAttributePostfix(attrs[0], null, "color", "lo", "0xFF0000", '"').children.length, 0);
			var asParts : Vector.<IFdtAstNode> = assertAttribute(attrs[1], null, "click", "fun(1)", '"').children;
			assertEquals(asParts.length, 1);
			var st : FdtAstMxmlAttributeValueStatements = assertType(asParts[0], FdtAstMxmlAttributeValueStatements);
			assertEquals(st.children.length, 1);
			assertType(st.children[0], FdtAstStatement);
			var ino : FdtAstMxmlNode = assertType(n.children[2], FdtAstMxmlNode);
			assertEquals(ino.children.length, 3);
			assertTagPostfix(ino.children[0], "s", "label", "lo", FdtAstMxmlOpenTag, false);
			var tn : FdtAstMxmlText = assertType(ino.children[1], FdtAstMxmlText);
			assertEquals(tn.text.content, "{jim}Jack{jim}");
			assertEquals(tn.subExps.length, 2);
			var subexp0 : FdtAstMxmlSubExp = assertType(tn.subExps[0], FdtAstMxmlSubExp);
			assertEquals(subexp0.lbrace, subexp0.offset);
			assertType(subexp0.exp, FdtAstPrimaryExpression);
			assertEquals(subexp0.rbrace, subexp0.length + subexp0.offset - 1);			
			var subexp1 : FdtAstMxmlSubExp = assertType(tn.subExps[1], FdtAstMxmlSubExp);
			assertEquals(subexp1.lbrace, subexp1.offset);
			assertType(subexp1.exp, FdtAstPrimaryExpression);
			assertEquals(subexp1.rbrace, subexp1.length + subexp1.offset - 1);
			assertTagPostfix(ino.children[2], "s", "label", "lo", FdtAstMxmlCloseTag, false);
			verifyText(n.children[3], "\n\t");
			assertTag(n.children[4], "s", "Button", FdtAstMxmlCloseTag, false);
		}

		private function verifyComment(cnode : IFdtAstNode, comment : String) : void {
			var cn : FdtAstMxmlComment = assertType(cnode, FdtAstMxmlComment);
			assertEquals(cn.text.content, comment);
			assertEquals(cn.endToken, cn.length + cn.offset - 3);
		}

		private function verifyStates(node : IFdtAstNode) : void {
			var n : FdtAstMxmlNode = assertType(node, FdtAstMxmlNode);
			assertTag(n.children[0], "s", "states", FdtAstMxmlOpenTag, false);
			verifyText(n.children[1], "\n\t\t");
			var ino : FdtAstMxmlNode = assertType(n.children[2], FdtAstMxmlNode);
			assertEquals(ino.children.length, 1);
			var attrs : Vector.<IFdtAstNode> = assertTag(ino.children[0], "s", "State", FdtAstMxmlCompleteTag, true);
			assertEquals(attrs.length, 1);
			assertEquals(assertAttribute(attrs[0], null, "name", "lo", '"').children.length, 0);
			verifyText(n.children[3], "\n\t");
			assertTag(n.children[4], "s", "states", FdtAstMxmlCloseTag, false);
		}

		private function verifyScript(node : IFdtAstNode) : void {
			var n : FdtAstMxmlNode = assertType(node, FdtAstMxmlNode);
			assertTag(n.children[0], "fx", "Script", FdtAstMxmlOpenTag, false);
			verifyText(n.children[1], "\n\t\t");
			var cp : FdtAstMxmlClassPart = assertType(assertCDATA(n.children[2]), FdtAstMxmlClassPart);
			assertEquals(cp.children.length, 2);
			assertType(cp.children[0], FdtAstFields);
			var fu : FdtAstFunction = assertType(cp.children[1], FdtAstFunction);
			assertEquals(fu.name.content, "fun");
			verifyText(n.children[3], "\n\t");
			assertTag(n.children[4], "fx", "Script", FdtAstMxmlCloseTag, false);
		}

		private function assertCDATA(node : IFdtAstNode) : IFdtAstNode {
			var c : FdtAstMxmlCData = assertType(node, FdtAstMxmlCData);
			assert(c.endToken == c.length + c.offset - 3, "CDATA EndToken");
			return c.content;
		}

		private function verifyText(textNode : IFdtAstNode, text : String) : void {
			var tn : FdtAstMxmlText = assertType(textNode, FdtAstMxmlText);
			assertEquals(tn.subExps.length, 0);
			assertEquals(tn.text.content.replace("\n\r", "\n"), text);
		}

		private function verifyMainOpenTag(tagNode : IFdtAstNode) : void {
			var attrs : Vector.<IFdtAstNode> = assertTag(tagNode, "s", "Application", FdtAstMxmlOpenTag, true);
			assertAttribute(attrs[0], "xmlns", "fx", "http://ns.adobe.com/mxml/2009", '"');
			assertAttribute(attrs[1], "xmlns", "s", "library://ns.adobe.com/flex/spark", '"');
			assertAttribute(attrs[2], "xmlns", "mx", "library://ns.adobe.com/flex/mx", '"');
		}

		private function assertAttribute(anode : IFdtAstNode, nsn : String, name : String, valueString : String, frame : String) : FdtAstMxmlAttributeValue {
			var attr : FdtAstMxmlAttribute = assertType(anode, FdtAstMxmlAttribute);
			assertEquals(attr.name == null ? null : attr.name.content, name);
			assertEquals(attr.namespaceNode == null ? null : attr.namespaceNode.name.content, nsn);
			assert(attr.namespaceNode == null || attr.namespaceNode.colon > 0, "Colon");
			assert(attr.postfix == null, "Postfix");
			assertEquals(attr.value.begin.content, frame);
			assertEquals(attr.value.content.content, valueString);
			assertEquals(attr.value.end.content, frame);
			return attr.value;
		}

		private function assertAttributePostfix(anode : IFdtAstNode, nsn : String, name : String, postfix : String, valueString : String, frame : String) : FdtAstMxmlAttributeValue {
			var attr : FdtAstMxmlAttribute = assertType(anode, FdtAstMxmlAttribute);
			assertEquals(attr.name == null ? null : attr.name.content, name);
			assertEquals(attr.namespaceNode == null ? null : attr.namespaceNode.name.content, nsn);
			assert(attr.namespaceNode == null || attr.namespaceNode.colon > 0, "Colon");
			assertEquals(attr.postfix.dot, attr.postfix.offset);
			assertEquals(attr.postfix.name.content, postfix);
			assertEquals(attr.value.begin.content, frame);
			assertEquals(attr.value.content.content, valueString);
			assertEquals(attr.value.end.content, frame);
			return attr.value;
		}

		private function assertTag(node : IFdtAstNode, nsn : String, name : String, tagClass : Class, getAttributes : Boolean) : Vector.<IFdtAstNode> {
			var tag : FdtAstMxmlTag = assertType(node, tagClass);
			assertEquals(tag.name == null ? null : tag.name.content, name);
			assertEquals(tag.namespaceNode == null ? null : tag.namespaceNode.name.content, nsn);
			assert(tag.namespaceNode == null || tag.namespaceNode.colon > 0, "Tag namespace colon");
			assertEquals(tag.postfix, null);
			assert(tag.endToken > 0, "Tag end token");
			return getAttributes ? tag["attributes"] : null;
		}

		private function assertTagPostfix(node : IFdtAstNode, nsn : String, name : String, postfix : String, tagClass : Class, getAttributes : Boolean) : Vector.<IFdtAstNode> {
			var tag : FdtAstMxmlTag = assertType(node, tagClass);
			assertEquals(tag.name == null ? null : tag.name.content, name);
			assertEquals(tag.namespaceNode == null ? null : tag.namespaceNode.name.content, nsn);
			assert(tag.namespaceNode == null || tag.namespaceNode.colon > 0, "Tag namespace colon");
			assertEquals(tag.postfix.dot, tag.postfix.offset);
			assertEquals(tag.postfix.name.content, postfix);
			assert(tag.endToken > 0, "Tag end token");
			return getAttributes ? tag["attributes"] : null;
		}
	}
}
