import std.stdio;

void main() {

}

struct NarrowState {
    int[] xs;
    int loc = -1;

    this(int[] xs, int loc) {
        this.xs = xs;
        this.loc = loc;   
    }
}

NarrowState narrow(int[] xs, int v) {
    if (xs.length == 0) return xs;

    int mid = xs.length / 2;
    if (xs[mid] > v) {
        return xs[0 .. mid];
    } else if(xs[mid] < v) {
        return xs[(mid+1) .. $];
    } else {
        
    }
    // if len == 2k + 1,
    // len / 2 = k. since arrays are 0-indexed, [0, k-1] [k, 2k]
    // [6, 7, 8, 9]
    // mid == ^
    //
    // [5, 6, 7, 8, 9]
    //mid ==  ^
}
