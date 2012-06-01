package fdt.ast {
	public class FdtAstNode implements IFdtAstNode {
		public var _offset : int;
		public var _length : int;

		public function get offset() : int {
			return _offset;
		}

		public function set offset(offset : int) : void {
			_offset = offset;
		}

		public function get length() : int {
			return _length;
		}

		public function set length(length : int) : void {
			_length = length;
		}

	}
}
