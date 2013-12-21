module ds.linked_list;

class Node(Item) {
    Item item;
    Node!Item next;

    this(Item i) {
        this.item = i;
    }

    // The only degenerate case is when we are on the last node. Then it is quite
    // impossible to remove the next one.
    static Node!Item removeAfter(Node!Item n) {
        if (n.next !is null) {
            n.next = n.next.next;
        }

        return n;
    }
}

class LinkedList(Item) {
    Node!Item first;
    Node!Item last;

    bool isEmpty() {
        return first is null;
    }

    void addBeginning(Item i) {
        Node!Item oldfirst = first;
        first = new Node!Item(i);
        first.next = oldfirst;
    }

    void addEnd(Item i) {
        bool empty = isEmpty();
        Node!Item oldlast = last;
        last = new Node!Item(i);

        if (!empty) {
            oldlast.next = last;
        } else {
            first = last;
        }
    }

    void deleteBeginning() {
        // If already empty, we can't do anything
        if (first is last) {
            first = last = null;
        } else if (!isEmpty()) {
            first = first.next;
        }
    }

    void deleteNth(int N) {
        if (N == 0) {
            deleteBeginning();
            return;
        }

        auto i = 0;
        auto node = first;
        for(; node !is null, i < N-1; i++, node = node.next) {}

        if (node !is null) {
            node = Node!Item.removeAfter(node);
        }
    }
}

class DoubleNode(Item) {
    Item item;
    Node prev;
    Node next;

    this(Item i) {
        this.item = i;
    }

    static DoubleNode!Item removeAfter(DoubleNode!Item n) {
        if (n.next is null) return n;

        auto after = n.next.next;
        n.next = after;

        if (after !is null)
            after.prev = n;

        return n;
    }
}

class DoublyLinkedList(Item) {
    DoubleNode!Item first;
    DoubleNode!Item last;

    bool isEmpty() {
        return first is null;
    }

    void addBeginning(Item i) {
        auto oldfirst = first;
        first = new DoubleNode!Item(i);
        first.next = oldfirst;
        oldfirst.prev = first;
    }

    void addEnd(Item i) {
        auto oldlast = last;
        last = new DoubleNode!Item(i);
        last.prev = oldlast;
        oldlast.next = last;
    }

    void deleteBeginning() {
        if (first !is null) {
            first = first.next;

            if (first !is null) {
                first.prev = null;
            }
        }
    }

    void deleteEnd() {
        if (last !is null) {
            last = last.prev;

            if (last !is null) {
                last.next = null;
            }
        }
    }

    void deleteNth(int N) {
        if (N == 0) {
            deleteBeginning();
            return;
        }


        /* There are four cases to consider
            - cant make it to N-1
            - (N-1) is last
            - N is last (we are removing last)
            - otherwise (N+1 exists)

           In the first 2 cases, don't do anything. Our node doesnt exist. Note
           that the second case is handled by DoubleNode.removeAfter.
         */
        auto i = 0;
        auto before = first;
        // advance 'node' to right before the node to remove (so that node.next is what
        // we want gone). the Nth node might not exist.
        for(; next !is null, i < N-1; i++, before = before.next) {}

        if (node !is null) {
            node = DoubleNode.removeAfter(node);
        }
    }
}
