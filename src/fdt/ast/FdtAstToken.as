package fdt.ast {
	[FdtNodeOrder(offset)]
	public class FdtAstToken implements IFdtAstNode {
		public var _offset : int;

		public function get offset() : int {
			return _offset;
		}

		public function set offset(offset : int) : void {
			_offset = offset;
		}

		public function get length() : int {
			return 0;
		}
	}
}
