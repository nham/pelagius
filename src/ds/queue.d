module ds.queue;

import ds.linked_list;

class LLQueue(Item) {
    private LinkedList!Item list;
    private int N;

    this() {
        list = new LinkedList!Item;
    }

    void enqueue(Item item) {
        list.addEnd(item);
        N += 1;
    }

    // TODO: should make this error if empty
    // idea: illustrate what would happen if we didnt do the check at the end
    // for isEmpty. if we dequeue and the result is empty queue and then enqueue
    // something, what happens?
    Item dequeue() {
        auto nextItem = list.first.item;
        list.deleteBeginning();
        N -= 1;
        return nextItem;
    }

    bool isEmpty() {
        return list.isEmpty();
    }

    int size() {
        return N;
    }
}

unittest {
    auto llq = new LLQueue!string("first!");
}
