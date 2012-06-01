package swf.bridge {
	/**
	 * The editor context describes the current focused editor and its selection (cursor).
	 */
	public class FdtEditorContext {
		/**
		 * The file of associated with the currently active editor. 
		 */
		public var currentFile : String;
		
		/**
		 * This is the current line of which the cursor is at. 
		 * It is relative to thof the selection start of the current document.
		 */
		public var currentLine : String;
		
		/**
		 * Within the current line, this is the offset (distance) from the start of the file to the beginning of the line.
		 * 
		 * This is usefull because you are likely wanting to grab and entire line and analyze it.
		 * 
		 * @example
		 * I want to mimic FDT's 'Quick Trace' functionality. In this case I don't jsut want to know where the cursor is
		 * (selectionOffset), I want to grab the whole line and analye what's in it and then determine how much to copy to 'trace("foo")'.
		 * 
		 * As an Example, inside a method type 'this.constructor' and if your cursor is just on 'constuctor' or 'this' you're 
		 * going to want to know what is all around your cursor in order to figure out just how much to grab.
		 * 
		 */		
		public var currentLineOffset : int;
		
		/**
		 * Within the current line, this is the offset (distance) from the start of the file to the cursor.
		 */		
		public var selectionOffset : int;
		
		/**
		 * The length of the currently active selection. 
		 */
		public var selectionLength : int;
		
		/**
		 * The line seperator of the current line 
		 */
		public var currentLineSeperator : String;
	}
}
