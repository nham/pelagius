import std.stdio;

void main() {
    writeln("hi");
}

double max(double[] xs) {
    auto max = -(double.infinity);

    foreach(elem; xs) {
        if (elem > max) {
            max = elem;
        }
    }
    return max;
}

double min(double[] xs) {
    auto min = double.infinity;

    foreach(elem; xs) {
        if (elem < min) {
            min = elem;
        }
    }
    return min;
}

int max(int[] xs) {
    auto max = int.min;

    foreach(elem; xs) {
        if (elem > max) {
            max = elem;
        }
    }
    return max;
}

int min(int[] xs) {
    auto min = int.max;

    foreach(elem; xs) {
        if (elem < min) {
            min = elem;
        }
    }
    return min;
}

/***/

double mean(double[] xs) {
    if (xs.length == 0) return double.nan;

    double sum = 0.0;
    foreach(elem; xs) {
        sum += elem;
    }
    return sum / xs.length;
}

double mean(int[] xs) {
    if (xs.length == 0) return double.nan;

    double sum = 0.0;
    foreach(elem; xs) {
        sum += elem;
    }
    return sum / xs.length;
}


double var(double[] xs) {
    if (xs.length == 0) return double.nan;

    double avg = mean(xs);
    double sum = 0.0;
    // TODO: profile whether exponentiation is slower than mult
    foreach(elem; xs) {
        sum += (elem - avg)^^2;
    }
    return sum;
}

double var(int[] xs) {
    if (xs.length == 0) return double.nan;

    double avg = mean(xs);
    double sum = 0.0;
    // TODO: profile whether exponentiation is slower than mult
    foreach(elem; xs) {
        sum += (elem - avg)^^2;
    }
    return sum;
}

unittest {
    double[] x;
    int[] y;
    assert(min(x) == double.infinity);
    assert(max(x) == -double.infinity);
    assert(min(y) == int.max);
    assert(max(y) == int.min);
    double[] w = [1.0, -5.78, 5.8, -1.0, 1.0, -5.9];
    assert(min(w) == -5.9);
    assert(max(w) == 5.8);
}
