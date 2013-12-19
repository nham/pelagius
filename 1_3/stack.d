import std.stdio;

void main() {
    auto x = new FixedStack!int;
    x.push(2);
    x.push(3);
    x.push(4);
    x.push(5);
    writeln(x.size());

}
/*
class Stack(Item) {
    void push(Item item) {

    }

    Item pop() {

    }

    bool isEmpty() {

    }

    int size() {

    }
}
*/

class FixedStack(Item) {
    private Item[] stack;
    private int N;

    void push(Item item) {
        if (stack.length == N) {
            stack.length = 2 * stack.length + 1;
        }
        stack[N] = item;
        N += 1;
    }

    Item pop() {
        if (N > 0 && stack.length / 4 == N) {
            stack.length /= 2;
        }
        N -= 1;
        return stack[N+1];
    }

    bool isEmpty() {
        return N == 0;
    }

    int size() {
        return N;
    }
}
