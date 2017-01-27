function template(locals) {
var jade_debug = [ new jade.DebugItem( 1, "./test.jade" ) ];
try {
var buf = [];
var jade_mixins = {};
var jade_interp;

jade_debug.unshift(new jade.DebugItem( 0, "./test.jade" ));
jade_debug.unshift(new jade.DebugItem( 1, "./test.jade" ));
buf.push("<div class=\"well\">");
jade_debug.unshift(new jade.DebugItem( undefined, jade_debug[0].filename ));
jade_debug.shift();
buf.push("</div>");
jade_debug.shift();
jade_debug.shift();;return buf.join("");
} catch (err) {
  jade.rethrow(err, jade_debug[0].filename, jade_debug[0].lineno, "div.well\n  \n");
}
}