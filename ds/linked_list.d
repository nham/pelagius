class Node(Item) {
    Item item;
    Node!Item next;

    this(Item i) {
        this.item = i;
    }
}


// TODO: figure out if we need ref
void deleteNth(Node n, int k) {
    auto i = 0;
    auto node = n;
    for(; next !is null, i < k-1; i++, node = node.next) {}

    if (node !is null) {
        node = removeAfter(node);
    }

    return n;
}

void removeAfter(Node!Item n) {
    if (n.next !is null) {
        n.next = n.next.next;
    }

    return n;
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
