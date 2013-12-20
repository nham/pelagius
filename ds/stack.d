import std.stdio;

void main() {
    auto x = new ArrayStack!int;
    x.push(2);
    x.push(3);
    x.push(4);
    x.push(5);
    writeln(x.size());

}
class LLStack(Item) {
    private class Node(Item) {
        Item item;
        Node next;

        this(Item i) {
            this.item = i;
        }
    }

    private Node first;
    private int N;

    void push(Item item) {
        Node oldfirst = first;
        first = new Node!Item(item);
        first.next = oldfirst;

        N += 1;
    }

    Item pop() {
        Item popped = first.item;
        first = first.next;
        N -= 1;
        return popped;
    }

    bool isEmpty() {
        return first == null;
    }

    int size() {
        return N;
    }
}

class ArrayStack(Item) {
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
        // do i need to address "loitering"?
        if (!isEmpty() && stack.length / 4 == N) {
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