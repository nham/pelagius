import std.math, std.stdio;

void main() {
    const int N = 10;
    // xs is a rectangular array since its static (and not dynamic)
    bool[N][N] xs;
    for(int i = 0; i < N; i++) {
        for(int j = 0; j < N; j++) {
            if (i == 0 && j == 0) {
                xs[i][j] = false;
            } else if (gcd(i, j) == 1) {
                xs[i][j] = true;
            } else {
                xs[i][j] = false;
            }
        }
    }

    writeln(xs);
}

int gcd(int a, int b) {
    if (a == 0)
        if (b == 0) {
            throw new Exception("can't both be zero");
        } else {
            return b;
        }
    else if (b == 0)
        return a;
    else
        return gcd(b, rem(a, b));
}

int rem(int a, int b) {
    if (b == 0) 
        if (a == 0)
            throw new Exception("can't both be zero");
        else
            return rem(b, a);
    return a - cast(int) floor(1.0 * a / b);
}

// -7/3 == -2

unittest {
    assert(rem(7, 3) == 1);
    assert(rem(3, 7) == 1);
    assert(rem(-7, 3) == 2);
    assert(rem(3, -7) == 2);
    assert(rem(5, 0) == 5);
    assert(rem(9, 1) == 0);
    assert(rem(-9, 1) == 0);
}
