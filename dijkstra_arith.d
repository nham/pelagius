import std.stdio, std.conv, stack;

void main() {
    Stack!string ops = new Stack!string;
    Stack!double vals = new Stack!double;
}


double eval(string[] expr) {
    Stack!string ops = new Stack!string;
    Stack!double vals = new Stack!double;

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
            }
            
        }
    }

    return vals.pop();
}
