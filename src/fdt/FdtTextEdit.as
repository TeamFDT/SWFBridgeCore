package fdt {
	public class FdtTextEdit {
		/***
		 * offset the offset of the replacement area
		 */		
		public var offset : int;
		
		/***
		 * length the length of the replacement area
		 */ 
		public var length : int;
		
		/***
		 * text the text to insert at offset after the text in the replacement area is removed
		 */
		public var text : String;

		/***
		 * Creates a new Text edit.
		 * 
		 * @param offset the offset of the replacement area
		 * @param length the length of the replacement area
		 * @param text the text to insert at offset after the text in the replacement area is removed 
		 */
		public function FdtTextEdit(offset : int, length : int, text : String) {
			this.offset = offset;
			this.length = length;
			this.text = text;
		}
	}
}
