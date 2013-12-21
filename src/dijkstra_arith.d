import std.stdio;
import std.conv : to;
import std.array;
import ds.stack;

void main(string[] args) {
    auto inp1 = replace(replace(args[1], ")", " )"), "(", "( ");
    auto inp2 = split(inp1);
    writeln("parsed input: ", inp2);
    writeln( eval(inp2) );
}


// TODO: parameterize over the stacks so that we can use LLStack and ArrayStack
// without writing two eval functions?
double eval(string[] expr) {
    LLStack!string ops = new LLStack!string;
    LLStack!double vals = new LLStack!double;

    foreach(ele; expr) {
        if (ele == "(")
            continue;

        if (ele == "+" || ele == "-" || ele == "*" || ele == "/") {
            ops.push(ele);
        } else if (ele != ")") {
            vals.push ( std.conv.to!double(ele) );
        } else {
            auto op = ops.pop();
            auto v2 = vals.pop();
            auto v1 = vals.pop();

            switch(op) {
                case "+":
                    vals.push(v1 + v2);
                    break;
                case "-":
                    vals.push(v1 - v2);
                    break;
                case "*":
                    vals.push(v1 * v2);
                    break;
                case "/":
                    vals.push(v1 / v2);
                    break;
                default:
                    throw new Exception("unrecognized operator");
            }
            
        }
    }

    return vals.pop();
}
