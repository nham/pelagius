import ds.linked_list;

class LLQueue(Item) {
    private LinkedList!Item first;
    private LinkedList!Item last;
    private int N;

    void enqueue(Item item) {
        LinkedList!Item oldlast = last;
        last = new LinkedList!Item(item);

        if (isEmpty()) {
            first = last;
        } else  {
            oldlast.next = last;
        }

        N += 1;
    }

    // TODO: should make this error if empty
    // idea: illustrate what would happen if we didnt do the check at the end
    // for isEmpty. if we dequeue and the result is empty queue and then enqueue
    // something, what happens?
    Item dequeue() {
        auto nextItem = first.item;
        first = first.next;
        if(isEmpty()) {
            last = null;
        }
        N -= 1;
        return nextItem;
    }

    boolean isEmpty() {
        return first == null;
    }

    int size() {
        return N;
    }
}

unittest {
    auto llq = new LLQueue!string("first!");
}
