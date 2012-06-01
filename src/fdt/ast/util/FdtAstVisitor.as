package fdt.ast.util {
	import fdt.ast.FdtAstToken;
	import fdt.ast.IFdtAstNode;

	import flash.utils.describeType;

	/***
	 * This class is intended to be subclasses by calles of Swf Plugins.
	 * An ast visitor recursivly visits all the nodes of an abstract syntax tree.  
	 */
	public class FdtAstVisitor {
		private function getMembers(node : IFdtAstNode) : XMLList {
			return describeType(node)..metadata.(@name=="FdtNodeOrder")..arg.@value;
		}

		private function visiteMember(depth : int, parent : IFdtAstNode, name : String, index : int, node : Object) : void {
			if (node == null) {
				visitNode(depth, parent, name, index, null);
			}
			var astNode : IFdtAstNode = node as IFdtAstNode;
			if (astNode == null) {
				var vector : Vector.<IFdtAstNode> = node as Vector.<IFdtAstNode>;
				if (vector == null) {
					visitToken(depth, parent, name, index, int(node));
				} else {
					visitVector(depth, parent, name, vector);
				}
			} else {
				var astToken : FdtAstToken = astNode as FdtAstToken;
				if (astToken == null) {
					visitNode(depth, parent, name, index, astNode);
				} else {
					visitToken(depth, parent, name, index, astToken.offset);
				}
			}
		}

		final public function visit(start : IFdtAstNode) : void {
			visitNode(0, null, "start", -1, start);
		}

		private function visitNode(depth : int, parent : IFdtAstNode, name : String, index : int, node : IFdtAstNode) : void {
			if (enterNode(depth, parent, name, index, node)) {
				var ndepth : int = depth + 1;
				for each (var m : String in getMembers(node)) {
					visiteMember(ndepth, node, m, -1, node[m]);
				}
			}
			leaveNode(depth, parent, name, index, node);
		}

		private function visitVector(depth : int, parent : IFdtAstNode, name : String, vector : Vector.<IFdtAstNode>) : void {
			var index : int = 0;
			for each (var node : IFdtAstNode in vector) {
				visitNode(depth, parent, name, index, node);
				index++;
			}
		}

		/***
		 * Override this method to investigate tokens of the ast.
		 * 
		 * @param depth the current depth within the ast
		 * @param parent the parent of the current token
		 * @param name the name of the current token
		 * @param index the index of the current token or -1 if this token has an unique name  
		 * @param tokenOffset the offset of the current token
		 */
		protected function visitToken(depth : int, parent : IFdtAstNode, name : String, index : int, tokenOffset : int) : void {
		}

		/***
		 * Override this method to investigate a node of the ast before its children are visited.
		 * The return value should set to <code>true</code> if the children should also being visited,
		 * otherwise <code>false</code>. 
		 * 
 		 * @param depth the current depth within the ast
		 * @param parent the parent of the current node
		 * @param name the name of the current node
		 * @param index the index of the current node or -1 if this node has an unique name  
		 * @param node the current node
		 */
		protected function enterNode(depth : int, parent : IFdtAstNode, name : String, index : int, node : IFdtAstNode) : Boolean {
			return true;
		}

		/***
		 * Override this method to investigate a node of the ast after its children are visited.
		 * 
  		 * @param depth the current depth within the ast
		 * @param parent the parent of the current node
		 * @param name the name of the current node
		 * @param index the index of the current node or -1 if this node has an unique name  
		 * @param node the current node
		 */
		protected function leaveNode(depth : int, parent : IFdtAstNode, name : String, index : int, node : IFdtAstNode) : void {
		}
	}
}
