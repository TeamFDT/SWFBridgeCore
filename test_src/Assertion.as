package {
	import flash.utils.getQualifiedClassName;

	public class Assertion {
		public function assertType(o : *, c : Class) : * {
			if (!(o is c)) {
				var s : String = getQualifiedClassName(o);
				throw new Error("Assertion failed: " + s + " is not " + c);
			}
			return o;
		}

		public function assertEquals(current : Object, expected : Object) : void {
			if (!(current == expected)) {
				throw new Error("String '" + current + "' is not '" + expected + "' as expected");
			}
		}
		
		public function assert(b : Boolean, text : String) : void {
			if (!b){
				throw new Error("Assertion failed: "+text);
			}
		}
	}
}
