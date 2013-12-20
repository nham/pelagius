class LinkedList(Item) {
    Item item;
    LinkedList!Item next;

    this(Item i) {
        this.item = i;
    }
}
