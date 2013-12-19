class Stack(Item) {
    Item[] stack;
    void push(Item item) {

    }

    Item pop() {

    }

    bool isEmpty() {

    }

    int size() {

    }
}

class FixedStack(Item) {
    Item[100] stack;
    int N;
    void push(Item item) {
        stack[N] = item;
        N += 1;
    }

    Item pop() {
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
