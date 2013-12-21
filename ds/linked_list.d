class Node(Item) {
    Item item;
    Node!Item next;

    this(Item i) {
        this.item = i;
    }

    // The only degenerate case is when we are on the last node. Then it is quite
    // impossible to remove the next one.
    static void removeAfter(Node!Item n) {
        if (n.next !is null) {
            n.next = n.next.next;
        }
    }
}

class LinkedList(Item) {
    Node!Item first;

    void add(Item i) {
        Node!Item oldfirst = first;
        first = new Node!Item(i);
        first.next = oldfirst;
    }

    void delete() {
        if (first.next !is null) {
            first = first.next;
        }
    }

    void deleteNth(int N) {
        auto i = 0;
        auto node = first;
        // at the end:
        //  -- if N == 0, loop never executes
        for(; next !is null, i < N-1; i++, node = node.next) {}

        if (node !is null) {
            node = removeAfter(node);
        }
    }
}



class DoubleNode {
    Item item;
    Node prev;
    Node next;

    this(Item i) {
        this.item = i;
    }
}

void deleteNth(Node!Item n, int k) {
    auto i = 0;
    auto node = first;
    for(; next !is null, i < k-1; i++, node = node.next) {}

    if (node !is null) {
        node = removeAfter(node);
    }
}

private void removeAfter(Node n) {
    if (n.next !is null) {
        n.next = n.next.next;
    }
}
