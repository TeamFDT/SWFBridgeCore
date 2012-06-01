package swf.bridge {
	import fdt.FdtTextEdit;
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
	import fdt.ast.FdtAstDualOpExp;
	import fdt.ast.FdtAstEmptyStatement;
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
	import fdt.ast.FdtAstGenericType;
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
	import fdt.ast.FdtAstModifiers;
	import fdt.ast.FdtAstMxmlAttribute;
	import fdt.ast.FdtAstMxmlAttributeValue;
	import fdt.ast.FdtAstMxmlCData;
	import fdt.ast.FdtAstMxmlClassPart;
	import fdt.ast.FdtAstMxmlCloseTag;
	import fdt.ast.FdtAstMxmlComment;
	import fdt.ast.FdtAstMxmlCompleteTag;
	import fdt.ast.FdtAstMxmlImplementsTypes;
	import fdt.ast.FdtAstMxmlMetaDataPart;
	import fdt.ast.FdtAstMxmlNamespace;
	import fdt.ast.FdtAstMxmlNode;
	import fdt.ast.FdtAstMxmlOpenTag;
	import fdt.ast.FdtAstMxmlRoot;
	import fdt.ast.FdtAstMxmlStatePostfix;
	import fdt.ast.FdtAstMxmlSubExp;
	import fdt.ast.FdtAstMxmlText;
	import fdt.ast.FdtAstMxmlAttributeValueStatements;
	import fdt.ast.FdtAstNamespace;
	import fdt.ast.FdtAstNamespaceName;
	import fdt.ast.FdtAstNamespaceQualifier;
	import fdt.ast.FdtAstNode;
	import fdt.ast.FdtAstNumberLiteral;
	import fdt.ast.FdtAstObjectInitializer;
	import fdt.ast.FdtAstObjectInitializerMember;
	import fdt.ast.FdtAstPackage;
	import fdt.ast.FdtAstParameters;
	import fdt.ast.FdtAstParantheses;
	import fdt.ast.FdtAstPostfix;
	import fdt.ast.FdtAstPrimaryExpression;
	import fdt.ast.FdtAstRelational;
	import fdt.ast.FdtAstReqularExpLiteral;
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
	import fdt.ast.FdtAstXmlTag;
	import fdt.ast.FdtAstXmlTagName;
	import fdt.ast.FdtAstXmlText;
	import fdt.ast.IFdtAstNode;

	import flash.net.Socket;

	/**
	 * The Model Requestor allows access to models of Fdt. 
	 */
	public class FdtModelRequestor {
		private var _bridge : AbstractFdtBridge;
		private var _bridgeSocket : Socket;

		/**
		 * Don't use directly. Instead, use <code>Requestor</code> accessors of the bridge to get a requestor. 
		 */
		public function FdtModelRequestor(bridge : AbstractFdtBridge) {
			_bridge = bridge;
			_bridgeSocket = bridge.bridgeSocket;
		}

		/**
		 * Modifies a document. The request returns an integer describing the status:
		 * <br><br>
		 *     0 Indicates success <br>
		 *     1 Indicates overlapping of the text edits <br>
		 *     2 Indicates some offsets or length are not valid in the document <br> <br>
		 *   
		 * 
		 * @param Path the file document which should be modified (the document currently in memory)
		 * @param TextEdits the changes to apply to the document (they are not allowed to overlap) 
		 * @param WriteToFile after application of the changes the document is written to file system 
		 * 		(default is <code>false</code>). In case you try to modify a not open file use <code>true</code>
		 * 		It is recommended not change files of unsave editors for good user experience.
		 * 		Also it is recommended to ask the user to accept changes to the file system.   
		 */
		public function fileDocumentModify(path : String, textEdits : Vector.<FdtTextEdit>, writeToFile : Boolean = false) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1502, this, function(_bridgeSocket : Socket) : void {
					a.push(_bridgeSocket.readInt());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.writeBoolean(writeToFile);				
				_bridgeSocket.writeShort(textEdits.length);				
				for each (var fte : FdtTextEdit in textEdits) {
					send(fte);
				}
				_bridgeSocket.flush();
			});
		}

		private function send(fte : FdtTextEdit) : void {
			_bridgeSocket.writeInt(fte.offset);
			_bridgeSocket.writeInt(fte.length);
			_bridgeSocket.writeUTF(fte.text);
		}

		/**
		 * Request the abstract syntax tree of an .as, .mxml, or .fxg file. 
		 * The request returns the root of the ast of the file. 
		 * 
		 * @param path to the file within the workspace  
		 */
		public function fileAst(path : String) : FdtRequest {
			return new FdtRequest(function(thisObject : Object, a : Array, rt : Function) : void {
				_bridge.sendStampedMessage(1501, this, function(_bridgeSocket : Socket) : void {
					a.push(readNode());
					rt.apply(thisObject, a);
				});
				_bridgeSocket.writeUTF(path);
				_bridgeSocket.flush();
			});
		}

		private function readNode() : IFdtAstNode {
			return readNodeContent(readId());
		}

		private function readId() : int {
			return _bridgeSocket.readShort();
		}

		private function readNodeContent(id : int) : IFdtAstNode {
			trace("Read Node:  " + id);
			switch(id) {
				case    0:
					return null;
				case 2048:
					return readContentString();
				case 2049:
					return readContentToken();
				case 2050:
					return readContentPackage();
				case 2051:
					return readContentBlock();
				case 2052:
					return readContentModifiers();
				case 2053:
					return readContentImport();
				case 2054:
					return readContentInterface();
				case 2055:
					return readContentClass();
				case 2056:
					return readContentRoot();
				case 2057:
					return readContentFunction(false);
				case 2058:
					return readContentParameters();
				case 2059:
					return readContentVarDec();
				case 2060:
					return readContentVarDecs();
				case 2061:
					return readContentTypeRef();
				case 2062:
					return readContentDualOpExp(new FdtAstAssignment());
				case 2063:
					return readContentBreak();
				case 2064:
					return readContentConditional();
				case 2065:
					return readContentContinue();
				case 2066:
					return readContentDoWhileLoop();
				case 2067:
					return readContentSpecialStringTo(new FdtAstEmptyStatement());
				case 2068:
					return readContentForEachIn();
				case 2069:
					return readContentForIn();
				case 2070:
					return readContentFor();
				case 2071:
					return readContentForConditions();
				case 2072:
					return readContentForUpdates();
				case 2073:
					return readContentForInits();
				case 2074:
					return readContentArguments();
				case 2075:
					return readContentFieldDecs();
				case 2076:
					return readContentIf();
				case 2077:
					return readContentReturn();
				case 2078:
					return readContentThrow();
				case 2079:
					return readContentUseNamespace();
				case 2080:
					return readContentWhile();
				case 2081:
					return readContentWith();
				case 2082:
					return readContentTry();
				case 2083:
					return readContentCatch();
				case 2084:
					return readContentFinally();
				case 2085:
					return readContentSwitch();
				case 2086:
					return readContentNamespace();
				case 2087:
					return readContentInclude();
				case 2088:
					return readContentDualOpExp(new FdtAstBinary());
				case 2089:
					return readContentDualOpExp(new FdtAstEquality());
				case 2090:
					return readContentDualOpExp(new FdtAstRelational());
				case 2091:
					return readContentDualOpExp(new FdtAstLogical());
				case 2092:
					return readContentUnaryExp();
				case 2093:
					return readContentPostfix();
				case 2094:
					return readContentParantheses();
				case 2095:
					return readContentSpecialStringTo(new FdtAstIdentifierLiteral());
				case 2096:
					return readContentAnonymousFunction();
				case 2097:
					return readContentObjectInitializer();
				case 2098:
					return readContentObjectInitializerMember();
				case 2099:
					return readContentArrayInitializer();
				case 2100:
					return readContentFilterOperator();
				case 2101:
					return readContentArrayAccess();
				case 2102:
					return readContentPrimaryExpression();
				case 2103:
					return readContentSpecialStringTo(new FdtAstIdentifierLiteral());
				case 2104:
					return readContentAttributeAccess();
				case 2105:
					return readContentIndirectAttributeAccess();
				case 2106:
					return readContentSpecialStringTo(new FdtAstNamespaceName());
				case 2107:
					return readContentSpecialStringTo(new FdtAstNamespaceName());
				// unkown use case 
				case 2108:
					return readContentSpecialStringTo(new FdtAstGenericType());
				case 2109:
					return readContentFunction(true);
				case 2110:
					return readContentSpecialStringTo(new FdtAstConstantLiteral());
				case 2111:
					return readContentSpecialStringTo(new FdtAstReqularExpLiteral());
				case 2112:
					return readContentSpecialStringTo(new FdtAstStringLiteral());
				case 2113:
					return readContentSpecialStringTo(new FdtAstNumberLiteral());
				case 2114:
					return readContentNamespaceQualifier();
				case 2115:
					return readContentLabel();
				case 2116:
					return readContentCase();
				case 2117:
					return readContentDefault();
				case 2118:
					return readContentDefaultXmlNamespace();
				case 2119:
					return readContentXmlNode();
				case 2120:
					return readContentXmlOpenTag(new FdtAstXmlOpenTag());
				case 2121:
					return readContentXmlOpenTag(new FdtAstXmlCloseTag());
				case 2122:
					return readContentXmlOpenTag(new FdtAstXmlCompleteTag());
				case 2123:
					return readContentSpecialStringTo(new FdtAstXmlTagName());
				case 2124:
					return readContentXmlNamespace();
				case 2125:
					return readContentSpecialStringTo(new FdtAstXmlAttributeName());
				case 2126:
					return readContentSpecialStringTo(new FdtAstXmlAttributeValue());
				case 2127:
					return readContentXmlAttribute();
				case 2128:
					return readContentSpecialStringTo(new FdtAstXmlText());
				case 2129:
					return readContentXmlCDATA();
				case 2130:
					return readContentXmlComment();
				case 2131:
					return readContentXmlEmbExp();
				case 2137:
					return readContentMetaDataParameter();
				case 2138:
					return readContentMetaData();
				case 2139:
					return readContentAllocation();
				case 2140:
					return readContentStatement();
				case 2150:
					return readContentMxmlRoot();
				case 2151:
					return readContentMxmlNode();
				case 2152:
					return readContentMxmlOpenTag();
				case 2153:
					return readContentMxmlStatePostfix();
				case 2154:
					return readContentMxmlNamespace();
				case 2155:
					return readContentMxmlCloseTag();
				case 2156:
					return readContentMxmlCompleteTag();
				case 2157:
					return readContentMxmlAttribute();
				case 2158:
					return readContentMxmlSubExp();
				case 2159:
					return readContentMxmlImplementsTypes();
				case 2160:
					return readContentMxmlAttributeValue();
				case 2161:
					return readContentMxmlCData();
				case 2162:
					return readContentMxmlClassPart();
				case 2163:
					return readContentMxmlMetaDataPart();
				case 2164:
					return readContentMxmlValueStatements();
				case 2165:
					return readContentMxmlComment();
				case 2166:
					return readContentMxmlText();
			}
			throw new Error("Read Node:  Unknown node id:  " + id);
			return null;
		}

		private function readContentMxmlText() : IFdtAstNode {
			var mxmlText : FdtAstMxmlText = new FdtAstMxmlText();
			readPrologTo(mxmlText);
			mxmlText.text = readKnownString();
			mxmlText.subExps = readChildren();
			return mxmlText;
		}

		private function readContentMxmlComment() : IFdtAstNode {
			var xn : FdtAstMxmlComment = new FdtAstMxmlComment();
			readPrologTo(xn);
			xn.text = readKnownString();
			xn.endToken = readKnownTokenOffset();
			return xn;
		}

		private function readContentMxmlValueStatements() : IFdtAstNode {
			var mxmlValueStatements : FdtAstMxmlAttributeValueStatements = new FdtAstMxmlAttributeValueStatements();
			readPrologTo(mxmlValueStatements);
			mxmlValueStatements.children = readChildren();
			return mxmlValueStatements;
		}

		private function readContentMxmlMetaDataPart() : IFdtAstNode {
			var mxmlMetaDataPart : FdtAstMxmlMetaDataPart = new FdtAstMxmlMetaDataPart();
			readPrologTo(mxmlMetaDataPart);
			mxmlMetaDataPart.children = readChildren();
			return mxmlMetaDataPart;
		}

		private function readContentMxmlClassPart() : IFdtAstNode {
			var mxmlClassPart : FdtAstMxmlClassPart = new FdtAstMxmlClassPart();
			readPrologTo(mxmlClassPart);
			mxmlClassPart.children = readChildren();
			return mxmlClassPart;
		}

		private function readContentMxmlCData() : IFdtAstNode {
			var mxmlCData : FdtAstMxmlCData = new FdtAstMxmlCData();
			readPrologTo(mxmlCData);
			mxmlCData.content = readNode();
			mxmlCData.endToken = readKnownTokenOffset();
			return mxmlCData;
		}

		private function readContentMxmlImplementsTypes() : IFdtAstNode {
			var mxmlImplementsTypes : FdtAstMxmlImplementsTypes = new FdtAstMxmlImplementsTypes();
			readPrologTo(mxmlImplementsTypes);
			mxmlImplementsTypes.implementsTypes = readChildren();
			return mxmlImplementsTypes;
		}

		private function readContentMxmlSubExp() : IFdtAstNode {
			var mxmlSubExp : FdtAstMxmlSubExp = new FdtAstMxmlSubExp();
			readPrologTo(mxmlSubExp);
			mxmlSubExp.lbrace = readKnownTokenOffset();
			mxmlSubExp.exp = readNode();
			mxmlSubExp.rbrace = readKnownTokenOffset();
			return mxmlSubExp;
		}

		private function readContentMxmlAttributeValue() : IFdtAstNode {
			var mxmlAttributeValue : FdtAstMxmlAttributeValue = new FdtAstMxmlAttributeValue();
			readPrologTo(mxmlAttributeValue);
			mxmlAttributeValue.begin = readKnownString();
			mxmlAttributeValue.content = readKnownString();
			mxmlAttributeValue.children = readChildren();
			mxmlAttributeValue.end = readKnownString();
			return mxmlAttributeValue;
		}

		private function readContentMxmlAttribute() : IFdtAstNode {
			var mxmlAttribute : FdtAstMxmlAttribute = new FdtAstMxmlAttribute();
			readPrologTo(mxmlAttribute);
			mxmlAttribute.namespaceNode = readKnownMxmlNamespaceNode();
			mxmlAttribute.name = readKnownString();
			mxmlAttribute.postfix = readKnownMxmlStatePostfix();
			mxmlAttribute.equal = readKnownTokenOffset();
			mxmlAttribute.value = readKnownMxmlAttributeValue();
			return mxmlAttribute;
		}

		private function readKnownMxmlAttributeValue() : FdtAstMxmlAttributeValue {
			return FdtAstMxmlAttributeValue(checkOn(2160));
		}

		private function readContentMxmlCompleteTag() : IFdtAstNode {
			var mxmlCompleteTag : FdtAstMxmlCompleteTag = new FdtAstMxmlCompleteTag();
			readPrologTo(mxmlCompleteTag);
			mxmlCompleteTag.namespaceNode = readKnownMxmlNamespaceNode();
			mxmlCompleteTag.name = readKnownString();
			mxmlCompleteTag.postfix = readKnownMxmlStatePostfix();
			mxmlCompleteTag.attributes = readChildren();
			mxmlCompleteTag.endToken = readKnownTokenOffset();
			return mxmlCompleteTag;
		}

		private function readContentMxmlCloseTag() : IFdtAstNode {
			var mxmlCloseTag : FdtAstMxmlCloseTag = new FdtAstMxmlCloseTag();
			readPrologTo(mxmlCloseTag);
			mxmlCloseTag.namespaceNode = readKnownMxmlNamespaceNode();
			mxmlCloseTag.name = readKnownString();
			mxmlCloseTag.postfix = readKnownMxmlStatePostfix();
			mxmlCloseTag.endToken = readKnownTokenOffset();
			return mxmlCloseTag;
		}

		private function readContentMxmlNamespace() : IFdtAstNode {
			var mxmlNamespace : FdtAstMxmlNamespace = new FdtAstMxmlNamespace();
			readPrologTo(mxmlNamespace);
			mxmlNamespace.name = readKnownString();
			mxmlNamespace.colon = readKnownTokenOffset();
			return mxmlNamespace;
		}

		private function readContentMxmlStatePostfix() : IFdtAstNode {
			var mxmlStatePostfix : FdtAstMxmlStatePostfix = new FdtAstMxmlStatePostfix();
			readPrologTo(mxmlStatePostfix);
			mxmlStatePostfix.dot = readKnownTokenOffset();
			mxmlStatePostfix.name = readKnownString();
			return mxmlStatePostfix;
		}

		private function readContentMxmlOpenTag() : IFdtAstNode {
			var mxmlOpenTag : FdtAstMxmlOpenTag = new FdtAstMxmlOpenTag();
			readPrologTo(mxmlOpenTag);
			mxmlOpenTag.namespaceNode = readKnownMxmlNamespaceNode();
			mxmlOpenTag.name = readKnownString();
			mxmlOpenTag.postfix = readKnownMxmlStatePostfix();
			mxmlOpenTag.attributes = readChildren();
			mxmlOpenTag.endToken = readKnownTokenOffset();
			return mxmlOpenTag;
		}

		private function readKnownMxmlStatePostfix() : FdtAstMxmlStatePostfix {
			return FdtAstMxmlStatePostfix(checkOn(2153));
		}

		private function readKnownMxmlNamespaceNode() : FdtAstMxmlNamespace {
			return FdtAstMxmlNamespace(checkOn(2154));
		}

		private function readContentMxmlNode() : IFdtAstNode {
			var mxmlNode : FdtAstMxmlNode = new FdtAstMxmlNode();
			readPrologTo(mxmlNode);
			mxmlNode.children = readChildren();
			return mxmlNode;
		}

		private function readContentMxmlRoot() : IFdtAstNode {
			var mxmlRoot : FdtAstMxmlRoot = new FdtAstMxmlRoot();
			readPrologTo(mxmlRoot);
			mxmlRoot.children = readChildren();
			return mxmlRoot;
		}

		private function readContentMetaDataParameter() : IFdtAstNode {
			var mdp : FdtAstMetaDataParameter = new FdtAstMetaDataParameter();
			readPrologTo(mdp);
			mdp.name = readKnownString();
			mdp.eq = readKnownTokenOffset();
			mdp.value = readNode();
			return mdp;
		}

		private function readContentMetaData() : IFdtAstNode {
			var md : FdtAstMetaData = new FdtAstMetaData();
			readPrologTo(md);
			md.lbracket = readKnownTokenOffset();
			md.name = readKnownString();
			md.open = readKnownTokenOffset();
			md.params = readChildren();
			md.close = readKnownTokenOffset();
			md.rbracket = readKnownTokenOffset();
			md.semicolon = readKnownTokenOffset();
			return md;
		}

		private function readContentDefaultXmlNamespace() : IFdtAstNode {
			var dxn : FdtAstDefaultXmlNamespace = new FdtAstDefaultXmlNamespace();
			readPrologTo(dxn);
			dxn.xmlToken = readKnownTokenOffset();
			dxn.namespaceToken = readKnownTokenOffset();
			dxn.eq = readKnownTokenOffset();
			dxn.value = readNode();
			dxn.semicolon = readKnownTokenOffset();
			return dxn;
		}

		private function readContentXmlEmbExp() : IFdtAstNode {
			var xee : FdtAstXmlEmbExp = new FdtAstXmlEmbExp();
			readPrologTo(xee);
			xee.lbrace = readKnownTokenOffset();
			xee.exp = readNode();
			xee.rbrace = readKnownTokenOffset();
			return xee;
		}

		private function readContentXmlComment() : IFdtAstNode {
			var xn : FdtAstXmlComment = new FdtAstXmlComment();
			readPrologTo(xn);
			xn.text = readKnownString();
			xn.endToken = readKnownTokenOffset();
			return xn;
		}

		private function readContentXmlCDATA() : IFdtAstNode {
			var xn : FdtAstXmlCData = new FdtAstXmlCData();
			readPrologTo(xn);
			xn.text = readKnownString();
			xn.endToken = readKnownTokenOffset();
			return xn;
		}

		private function readContentXmlNode() : IFdtAstNode {
			var xn : FdtAstXmlNode = new FdtAstXmlNode();
			readPrologTo(xn);
			xn.children = readChildren();
			return xn;
		}

		private function readContentXmlAttribute() : IFdtAstNode {
			var xa : FdtAstXmlAttribute = new FdtAstXmlAttribute();
			readPrologTo(xa);
			xa.namespaceNode = readNode();
			xa.name = readNode();
			xa.equal = readKnownTokenOffset();
			xa.value = readNode();
			return xa;
		}

		private function readContentXmlNamespace() : IFdtAstNode {
			var ns : FdtAstXmlNamespace = new FdtAstXmlNamespace();
			readPrologTo(ns);
			ns.name = readKnownString();
			ns.colon = readKnownTokenOffset();
			return ns;
		}

		private function readContentXmlOpenTag(xt : FdtAstXmlTag) : IFdtAstNode {
			readPrologTo(xt);
			xt.children = readChildren();
			xt.endToken = readKnownTokenOffset();
			return xt;
		}

		private function readContentNamespaceQualifier() : IFdtAstNode {
			var nsq : FdtAstNamespaceQualifier = new FdtAstNamespaceQualifier();
			readPrologTo(nsq);
			nsq.namespaceName = readNode();
			nsq.doubleColon = readKnownTokenOffset();
			return nsq;
		}

		private function readContentAttributeAccess() : IFdtAstNode {
			var p : FdtAstAttributeAccess = new FdtAstAttributeAccess();
			readPrologTo(p);
			p.namespaceNode = readNode();
			p.attribute = readKnownString();
			return p;
		}

		private function readContentIndirectAttributeAccess() : IFdtAstNode {
			var p : FdtAstIndirectAttributeAccess = new FdtAstIndirectAttributeAccess();
			readPrologTo(p);
			p.namespaceNode = readNode();
			p.lbracket = readKnownTokenOffset();
			p.attributeExp = readNode();
			p.rbracket = readKnownTokenOffset();
			return p;
		}

		private function readContentArrayAccess() : IFdtAstNode {
			var p : FdtAstArrayAccess = new FdtAstArrayAccess();
			readPrologTo(p);
			p.lbracket = readKnownTokenOffset();
			p.exp = readNode();
			p.rbracket = readKnownTokenOffset();
			return p;
		}

		private function readContentFilterOperator() : IFdtAstNode {
			var p : FdtAstFilterOperator = new FdtAstFilterOperator();
			readPrologTo(p);
			p.open = readKnownTokenOffset();
			p.exps = readChildren();
			p.close = readKnownTokenOffset();
			return p;
		}

		private function readContentObjectInitializerMember() : IFdtAstNode {
			var oim : FdtAstObjectInitializerMember = new FdtAstObjectInitializerMember();
			readPrologTo(oim);
			oim.open = readKnownTokenOffset();
			oim.key = readNode();
			oim.close = readKnownTokenOffset();
			oim.colon = readKnownTokenOffset();
			oim.value = readNode();
			return oim;
		}

		private function readContentObjectInitializer() : IFdtAstNode {
			var oi : FdtAstObjectInitializer = new FdtAstObjectInitializer();
			readPrologTo(oi);
			oi.lbrace = readKnownTokenOffset();
			oi.members = readChildren();
			oi.rbrace = readKnownTokenOffset();
			return oi;
		}

		private function readContentAnonymousFunction() : IFdtAstNode {
			var af : FdtAstAnonymousFunction = new FdtAstAnonymousFunction();
			readPrologTo(af);
			af.parameters = readKnownParameters();
			af.colon = readKnownTokenOffset();
			af.returnType = readKnownTypeRef();
			af.block = readKnownBlock();
			return af;
		}

		private function readContentParantheses() : IFdtAstNode {
			var p : FdtAstParantheses = new FdtAstParantheses();
			readPrologTo(p);
			p.open = readKnownTokenOffset();
			p.exps = readChildren();
			p.close = readKnownTokenOffset();
			return p;
		}

		private function readContentArrayInitializer() : IFdtAstNode {
			var u : FdtAstArrayInitializer = new FdtAstArrayInitializer();
			readPrologTo(u);
			u.lbracket = readKnownTokenOffset();
			u.children = readChildren();
			u.rbracket = readKnownTokenOffset();
			return u;
		}

		private function readContentAllocation() : IFdtAstNode {
			var a : FdtAstAllocation = new FdtAstAllocation();
			readPrologTo(a);
			a.generic = readKnownGenericType();
			a.exp = readNode();
			return a;
		}

		private function readKnownGenericType() : FdtAstGenericType {
			return FdtAstGenericType(checkOn(2108));
		}

		private function readContentUnaryExp() : IFdtAstNode {
			var u : FdtAstUnary = new FdtAstUnary();
			readPrologTo(u);
			u.op = readKnownString();
			u.exp = readNode();
			return u;
		}

		private function readContentNamespace() : IFdtAstNode {
			var n : FdtAstNamespace = new FdtAstNamespace();
			readPrologTo(n);
			n.modifiers = readKnownModifiers();
			n.namespaceToken = readKnownTokenOffset();
			n.name = readKnownString();
			n.eq = readKnownTokenOffset();
			n.init = readNode();
			n.semicolon = readKnownTokenOffset();
			return n;
		}

		private function readContentCase() : IFdtAstNode {
			var c : FdtAstCase = new FdtAstCase();
			readPrologTo(c);
			c.caseExp = readNode();
			c.colon = readKnownTokenOffset();
			c.statements = readChildren();
			return c;
		}

		private function readContentDefault() : IFdtAstNode {
			var d : FdtAstDefault = new FdtAstDefault();
			readPrologTo(d);
			d.colon = readKnownTokenOffset();
			d.statements = readChildren();
			return d;
		}

		private function readContentSwitch() : IFdtAstNode {
			var sws : FdtAstSwitch = new FdtAstSwitch();
			readPrologTo(sws);
			sws.open = readKnownTokenOffset();
			sws.condition = readNode();
			sws.close = readKnownTokenOffset();
			sws.block = readKnownBlock();
			return sws;
		}

		private function readContentFinally() : IFdtAstNode {
			var f : FdtAstFinally = new FdtAstFinally();
			readPrologTo(f);
			f.block = readKnownBlock();
			return f;
		}

		private function readContentCatch() : IFdtAstNode {
			var c : FdtAstCatch = new FdtAstCatch();
			readPrologTo(c);
			c.open = readKnownTokenOffset();
			c.varDec = readKnownVarDec();
			c.close = readKnownTokenOffset();
			c.block = readKnownBlock();
			return c;
		}

		private function readContentTry() : IFdtAstNode {
			var ts : FdtAstTry = new FdtAstTry();
			readPrologTo(ts);
			ts.block = readKnownBlock();
			ts.catches = readChildren();
			ts.finallyBlock = readKnownFinallyBlock();
			return ts;
		}

		private function readKnownFinallyBlock() : FdtAstFinally {
			return FdtAstFinally(checkOn(2084));
		}

		private function readContentWhile() : IFdtAstNode {
			var ws : FdtAstWhile = new FdtAstWhile();
			readPrologTo(ws);
			ws.open = readKnownTokenOffset();
			ws.condition = readNode();
			ws.close = readKnownTokenOffset();
			ws.statement = readNode();
			return ws;
		}

		private function readContentWith() : IFdtAstNode {
			var ws : FdtAstWith = new FdtAstWith();
			readPrologTo(ws);
			ws.open = readKnownTokenOffset();
			ws.exp = readNode();
			ws.close = readKnownTokenOffset();
			ws.statement = readNode();
			return ws;
		}

		private function readContentIf() : IFdtAstNode {
			var ifs : FdtAstIf = new FdtAstIf();
			readPrologTo(ifs);
			ifs.open = readKnownTokenOffset();
			ifs.condition = readNode();
			ifs.close = readKnownTokenOffset();
			ifs.statement = readNode();
			ifs.elseToken = readKnownTokenOffset();
			ifs.elseStatement = readNode();
			return ifs;
		}

		private function readContentFieldDecs() : IFdtAstNode {
			var fds : FdtAstFields = new FdtAstFields();
			readPrologTo(fds);
			fds.modifiers = readKnownModifiers();
			fds.varDecs = readKnownVarDecs();
			return fds;
		}

		private function readContentArguments() : IFdtAstNode {
			var args : FdtAstArguments = new FdtAstArguments();
			readPrologTo(args);
			args.open = readKnownTokenOffset();
			args.children = readChildren();
			args.close = readKnownTokenOffset();
			return args;
		}

		private function readContentPostfix() : IFdtAstNode {
			var pf : FdtAstPostfix = new FdtAstPostfix();
			readPrologTo(pf);
			pf.exp = readNode();
			pf.op = readKnownString();
			return pf;
		}

		private function readContentForConditions() : IFdtAstNode {
			var fc : FdtAstForConditions = new FdtAstForConditions();
			readPrologTo(fc);
			fc.exps = readChildren();
			fc.semicolon = readKnownTokenOffset();
			return fc;
		}

		private function readContentForUpdates() : IFdtAstNode {
			var fu : FdtAstForUpdates = new FdtAstForUpdates();
			readPrologTo(fu);
			fu.exps = readChildren();
			return fu;
		}

		private function readContentForInits() : IFdtAstNode {
			var fi : FdtAstForInits = new FdtAstForInits();
			readPrologTo(fi);
			fi.exps = readChildren();
			fi.semicolon = readKnownTokenOffset();
			return fi;
		}

		private function readContentFor() : IFdtAstNode {
			var f : FdtAstFor = new FdtAstFor();
			readPrologTo(f);
			f.open = readKnownTokenOffset();
			f.inits = readNode();
			f.conditions = readKnownForConditions();
			f.updates = readKnownForUpdates();
			f.close = readKnownTokenOffset();
			f.statement = readNode();
			return f;
		}

		private function readContentForEachIn() : IFdtAstNode {
			var fei : FdtAstForEachIn = new FdtAstForEachIn();
			readPrologTo(fei);
			fei.eachToken = readKnownTokenOffset();
			fei.open = readKnownTokenOffset();
			fei.varToken = readKnownTokenOffset();
			fei.target = readNode();
			fei.colon = readKnownTokenOffset();
			fei.type = readKnownTypeRef();
			fei.inToken = readKnownTokenOffset();
			fei.source = readNode();
			fei.close = readKnownTokenOffset();
			fei.statement = readNode();
			return fei;
		}

		private function readContentForIn() : IFdtAstNode {
			var fi : FdtAstForIn = new FdtAstForIn();
			readPrologTo(fi);
			fi.open = readKnownTokenOffset();
			fi.varToken = readKnownTokenOffset();
			fi.target = readNode();
			fi.colon = readKnownTokenOffset();
			fi.type = readKnownTypeRef();
			fi.inToken = readKnownTokenOffset();
			fi.source = readNode();
			fi.close = readKnownTokenOffset();
			fi.statement = readNode();
			return fi;
		}

		private function readContentStatement() : IFdtAstNode {
			var s : FdtAstStatement = new FdtAstStatement();
			readPrologTo(s);
			s.exp = readNode();
			s.semicolon = readKnownTokenOffset();
			return s;
		}

		private function readContentDualOpExp(b : FdtAstDualOpExp) : IFdtAstNode {
			readPrologTo(b);
			b.left = readNode();
			b.op = readKnownString();
			b.right = readNode();
			return b;
		}

		private function readContentConditional() : IFdtAstNode {
			var c : FdtAstConditional = new FdtAstConditional();
			readPrologTo(c);
			c.condition = readNode();
			c.question = readKnownTokenOffset();
			c.left = readNode();
			c.colon = readKnownTokenOffset();
			c.right = readNode();
			return c;
		}

		private function readContentLabel() : IFdtAstNode {
			var l : FdtAstLabel = new FdtAstLabel();
			readPrologTo(l);
			l.name = readKnownString();
			l.colon = readKnownTokenOffset();
			return l;
		}

		private function readContentDoWhileLoop() : IFdtAstNode {
			var dwl : FdtAstDoWhileLoop = new FdtAstDoWhileLoop();
			readPrologTo(dwl);
			dwl.statement = readNode();
			dwl.whileToken = readKnownTokenOffset();
			dwl.open = readKnownTokenOffset();
			dwl.condition = readNode();
			dwl.close = readKnownTokenOffset();
			return dwl;
		}

		private function readContentReturn() : IFdtAstNode {
			var r : FdtAstReturn = new FdtAstReturn();
			readPrologTo(r);
			r.value = readNode();
			r.semicolon = readKnownTokenOffset();
			return r;
		}

		private function readContentThrow() : IFdtAstNode {
			var r : FdtAstThrow = new FdtAstThrow();
			readPrologTo(r);
			r.value = readNode();
			r.semicolon = readKnownTokenOffset();
			return r;
		}

		private function readContentUseNamespace() : IFdtAstNode {
			var r : FdtAstUseNamespace = new FdtAstUseNamespace();
			readPrologTo(r);
			r.namespaceToken = readKnownTokenOffset();
			r.name = readKnownString();
			r.semicolon = readKnownTokenOffset();
			return r;
		}

		private function readContentInclude() : IFdtAstNode {
			var r : FdtAstInclude = new FdtAstInclude();
			readPrologTo(r);
			r.file = readKnownString();
			r.semicolon = readKnownTokenOffset();
			return r;
		}

		private function readContentBreak() : IFdtAstNode {
			var b : FdtAstBreak = new FdtAstBreak();
			readPrologTo(b);
			b.label = readKnownString();
			b.semicolon = readKnownTokenOffset();
			return b;
		}

		private function readContentContinue() : IFdtAstNode {
			var c : FdtAstContinue = new FdtAstContinue();
			readPrologTo(c);
			c.label = readKnownString();
			c.semicolon = readKnownTokenOffset();
			return c;
		}

		private function readContentVarDecs() : IFdtAstNode {
			var vds : FdtAstVarDecs = new FdtAstVarDecs();
			readPrologTo(vds);
			vds.decls = readChildren();
			vds.semicolon = readKnownTokenOffset();
			return vds;
		}

		private function readContentVarDec() : IFdtAstNode {
			var vd : FdtAstVarDec = new FdtAstVarDec();
			readPrologTo(vd);
			vd.name = readKnownString();
			vd.colon = readKnownTokenOffset();
			vd.type = readKnownTypeRef();
			vd.eq = readKnownTokenOffset();
			vd.init = readNode();
			return vd;
		}

		private function readContentFunction(con : Boolean) : IFdtAstNode {
			var f : FdtAstFunction = new FdtAstFunction();
			readPrologTo(f);
			f.modifiers = readKnownModifiers();
			f.functionToken = readKnownTokenOffset();
			f.constructor = con;
			f.etter = readKnownString();
			f.name = readKnownString();
			f.parameters = readKnownParameters();
			f.colon = readKnownTokenOffset();
			f.returnType = readKnownTypeRef();
			f.block = readKnownBlock();
			f.semicolon = readKnownTokenOffset();
			return f;
		}

		private function readKnownParameters() : FdtAstParameters {
			return FdtAstParameters(checkOn(2058));
		}

		private function readContentPrimaryExpression() : FdtAstPrimaryExpression {
			var p : FdtAstPrimaryExpression = new FdtAstPrimaryExpression();
			readPrologTo(p);
			p.parts = readChildren();
			return p;
		}

		private function readContentParameters() : FdtAstParameters {
			var p : FdtAstParameters = new FdtAstParameters();
			readPrologTo(p);
			p.open = readKnownTokenOffset();
			p.params = readChildren();
			p.close = readKnownTokenOffset();
			return p;
		}

		private function readContentImport() : IFdtAstNode {
			var i : FdtAstImport = new FdtAstImport();
			readPrologTo(i);
			i.importName = readKnownString();
			i.semicolon = readKnownTokenOffset();
			return i;
		}

		private function readContentTypeRef() : IFdtAstNode {
			var tr : FdtAstTypeRef = new FdtAstTypeRef();
			readContentSpecialStringTo(tr);
			return tr;
		}

		private function readContentClass() : IFdtAstNode {
			var c : FdtAstClass = new FdtAstClass();
			readPrologTo(c);
			c.modifiers = readKnownModifiers();
			c.classToken = readKnownTokenOffset();
			c.name = readKnownString();
			c.extendsToken = readKnownTokenOffset();
			c.extendsType = readKnownTypeRef();
			c.implementsToken = readKnownTokenOffset();
			c.implementsTypes = readChildren();
			c.block = readKnownBlock();
			return c;
		}

		private function readContentInterface() : IFdtAstNode {
			var c : FdtAstInterface = new FdtAstInterface();
			readPrologTo(c);
			c.modifiers = readKnownModifiers();
			c.interfaceToken = readKnownTokenOffset();
			c.name = readKnownString();
			c.extendsToken = readKnownTokenOffset();
			c.extendsTypes = readChildren();
			c.block = readKnownBlock();
			return c;
		}

		private function readKnownTypeRef() : FdtAstTypeRef {
			return FdtAstTypeRef(checkOn(2061));
		}

		private function readKnownModifiers() : FdtAstModifiers {
			return FdtAstModifiers(checkOn(2052));
		}

		private function readKnownVarDecs() : FdtAstVarDecs {
			return FdtAstVarDecs(checkOn(2060));
		}

		private function readKnownVarDec() : FdtAstVarDec {
			return FdtAstVarDec(checkOn(2059));
		}

		private function readContentModifiers() : IFdtAstNode {
			var modifiers : FdtAstModifiers = new FdtAstModifiers();
			readPrologTo(modifiers);
			modifiers.modifiers = readChildren();
			return modifiers;
		}

		private function readContentToken() : IFdtAstNode {
			var t : FdtAstToken = new FdtAstToken();
			t.offset = _bridgeSocket.readInt();
			return t;
		}

		private function readContentBlock() : IFdtAstNode {
			var b : FdtAstBlock = new FdtAstBlock();
			readPrologTo(b);
			b.lbrace = readKnownTokenOffset();
			b.statements = readChildren();
			b.rbrace = readKnownTokenOffset();
			return b;
		}

		private function readKnownTokenOffset() : int {
			var rid : int = readId();
			if (rid == 2049) {
				return _bridgeSocket.readInt();
			}
			if (rid != 0) {
				throw new Error("Unexpected " + rid + " expect 2049");
			}
			return -1;
		}

		private function readContentPackage() : IFdtAstNode {
			var p : FdtAstPackage = new FdtAstPackage();
			readPrologTo(p);
			p.packageName = readKnownString();
			p.block = readKnownBlock();
			return p;
		}

		private function checkOn(id : int) : IFdtAstNode {
			var rid : int = readId();
			if (rid == id) {
				return readNodeContent(id);
			}
			if (rid != 0) {
				throw new Error("Unexpected " + rid + " expect " + id);
			}
			return null;
		}

		private function readKnownForUpdates() : FdtAstForUpdates {
			return FdtAstForUpdates(checkOn(2072));
		}

		private function readKnownForConditions() : FdtAstForConditions {
			return FdtAstForConditions(checkOn(2071));
		}

		private function readKnownString() : FdtAstString {
			return FdtAstString(checkOn(2048));
		}

		private function readKnownBlock() : FdtAstBlock {
			return FdtAstBlock(checkOn(2051));
		}

		private function readContentString() : FdtAstString {
			return readContentSpecialStringTo(new FdtAstString());
		}

		private function readContentSpecialStringTo(s : FdtAstString) : FdtAstString {
			readPrologTo(s);
			s.content = _bridgeSocket.readUTF();
			return s;
		}

		private function readContentRoot() : IFdtAstNode {
			var root : FdtAstRoot = new FdtAstRoot();
			readPrologTo(root);
			root.decls = readChildren();
			return root;
		}

		private function readPrologTo(node : FdtAstNode) : void {
			node.offset = _bridgeSocket.readInt();
			node.length = _bridgeSocket.readInt();
		}

		private function readChildren() : Vector.<IFdtAstNode> {
			var children : Vector.<IFdtAstNode> = new Vector.<IFdtAstNode>();
			var id : int = _bridgeSocket.readShort();
			//trace("Start reading children");
			if (id != 254) {
				trace("Unexpected node id:  " + id);
				throw new Error("Unexpected node id:  " + id);
			}
			while ((id = _bridgeSocket.readShort()) != 255) {
				//trace(id);
				children.push(readNodeContent(id));
			}
			//trace("End reading children");
			//trace(id);
			return children;
		}
		// private function readChildrenFilterEndNull() : Vector.<IFdtAstNode> {
		// var children : Vector.<IFdtAstNode> = readChildren();
		// if (children.length > 0) {
		// if (children[children.length - 1] == null) {
		// children.pop();
		// }
		// }
		// return children;
		// }
	}
}
