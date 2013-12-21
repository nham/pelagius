import ds.linked_list;

class LLDeque(Item) {
    private DoublyLinkedList!Item list;
    private int N;

    bool isEmpty() {
        return list.isEmpty();
    }

    int size(){
        return N;   
    }

    void pushLeft(Item item) {
        list.addBeginning(item);
        N += 1;
    }

    void pushRight(Item item) {
        list.addEnd(item);
        N += 1;
    }

    Item popLeft() {
        auto popped = list.first.item;   
        list.deleteBeginning();
        N -= 1;
    }

    Item popRight() {
        auto popped = list.last.item;   
        list.deleteEnd();
        N -= 1;
    }
}
