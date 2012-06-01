package {
	[hallo]
	[hal(mio)]
	[hik(pop=mio)];
	[hik(pop=mio, -9)];
	public class AstTestClass {
		private static var i : int;
		var p : int;
		namespace KOP1;
		namespace KOP2 = KOP1;
		namespace KOP3 = "hallo";
		function AstTestClass() : void {
			var o : *;
			o = <hi></hi>;
			o = <hi/>;
			o = <a:hi><a:hi/></a:hi>;
			o = <hi a="u" z:p="u"/>;
			o = <hi>Hallo<![CDATA[KU]]><!--bing-->{o}</hi>;
		};
	}
}
import mx.core.ISelectableList;

import flash.display.Sprite;

interface AstTestInterface1 {
}
interface AstTestInterface2 extends AstTestInterface1, ISelectableList {
	function pi() : void;
}
class AstTestClass2 extends AstTestClass implements AstTestInterface1 {
}
class AstTestClass3 extends Sprite {
}

function astTestFunction1() {
	var i : int;
	var pik : int = 1234, j : int;
	Hallo:
	do {
		break Hallo;
		continue Hallo;
		break;
		continue;
		Sprite;
	} while (true);
	i = pik;
	pik += 2000;
}

function astTestFunction2(sp : Sprite) : void {
}

function astTestFunction3(sp : Sprite, i : int) : Sprite {
	return i > 1 ? sp : null;
}

function astTestFunction4(sp : Sprite, i : int) : Sprite {
	for each (var h : Object in sp) {
	}
	for each (h in sp) {
	}
	for (var p : Object in sp) {
	}
	for (p in sp) {
	}
	for (var j : int = 1;j < 10;j++) {
	}
	for (j = 1;j < 10;j++) {
	} 
	for (;j < 10;j++) {
	}
	for (j = 1;;j++) {
	}
	for (j = 1;j < 10;) {
	}
	for (;;) {
	}
	trace();
	trace(i);
	trace(i, sp);
	if (i == 10) trace();
	if (j < 10 && true) trace();
	else trace(i);
	throw sp;
	use namespace AS3;
	while (j < 10) trace();
	with (sp) trace();
	try {
		trace(1);
	} catch (e : Error) {
	}
	try {
		trace(1);
	} finally {
	}
	try {
		trace(1);
	} catch (e : Error) {
	} finally {
		trace(1);
		trace(2);
	}
	include "../assets/Testinc.as";
	switch (i) {
		case 5:
			trace(1);
			return sp;
		case 8:
			return null;
		default:
			return sp;
	}
	i = i + 9;
	i = --i;
	var o : *;
	o = delete sp;
	o = typeof sp;
	sp = new Sprite(); 
	o = new <int>[1, 2, 3];
	i = (9,i);
	o = function(i : int) : Object {  
		trace();
		return 9;
	};
	o = {"a":10, 'a':10, kl:10, 10:10, 10.1:10, (i):i};
	o = o.(o, i);
	o = o[i];
	o = o.*;  
	o = o.hallo;
	o = (o.@hallo, o.@[o], o.@AS3::hallo, o.@AS3::[o]);
	default xml namespace = AS3;
	default xml namespace = "jio";
	default xml namespace = new Namespace();
	return sp;
}