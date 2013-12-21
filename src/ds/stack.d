module ds.stack;

import ds.linked_list;

class LLStack(Item) {
    private LinkedList!Item list;
    private int N;

    void push(Item item) {
        list.addNode(item);
        N += 1;
    }

    Item pop() {
        Item popped = list.first.item;
        list.deleteNode();
        N -= 1;
        return popped;
    }

    bool isEmpty() {
        return list.first is null;
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

unittest {
    auto x = new ArrayStack!int;
    x.push(2);
    x.push(3);
    x.push(4);
    x.push(5);
}
