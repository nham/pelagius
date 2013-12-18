import std.stdio;

void main() {
    int[] xs = [-5, -1, 0, 1, 2, 9, 17];
    writeln(binary_search(xs, 17) );

}

int binary_search(int[] xs, int v) {
    if (xs.length == 0) return -1;

    int mid = cast(int) xs.length / 2;

    if (xs[mid] > v) {
        return binary_search( xs[0 .. mid], v );
    } else if(xs[mid] < v) {
        auto x = binary_search( xs[(mid+1) .. $], v );
        if (x == -1) {
            return -1;
        } else {
            return mid + 1 + x;
        }
    } else {
        return mid;
    }
}

unittest {
    assert(binary_search([], 5) == -1);
    int[] xs = [-5, -1, 0, 1, 2, 9, 17];
    assert(binary_search(xs, -5) == 0);
    assert(binary_search(xs, 17) == 6);
    assert(binary_search(xs, 2) == 4);
    assert(binary_search(xs, -1) == 1);
    assert(binary_search(xs, -2) == -1);
    assert(binary_search(xs, 55) == -1);
}
