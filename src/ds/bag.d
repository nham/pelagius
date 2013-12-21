module ds.bag;

import ds.queue;
class Bag(Item) {
    private LLQueue!Item bag = new LLQueue!Item;

    void add(Item item) {
        bag.enqueue(item);
    }

    bool isEmpty() {
        return bag.isEmpty();
    }

    int size() {
        return bag.size();

    }
}
