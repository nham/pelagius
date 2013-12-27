import std.stdio, std.string, std.file, std.conv, std.array, std.datetime, std.random;

void main(string[] args) {
    if (args[1] == "f")
        file_test(args[2]);
    else
        rand_test();

}

void file_test(string file) {
    auto inp = readText(file);
    string[] lines = splitLines(inp);
    
    int[] ints;
    foreach(line; lines) {
        ints ~= std.conv.to!int( replace(line, " ", "") );
    }

    StopWatch sw;

    sw.start();
    auto res = brute_count(ints);
    sw.stop();

    writeln(res, "; time= ", sw.peek().msecs);
}


void rand_test() {
    auto gen = Random(unpredictableSeed);

    foreach(i; 3 .. 12) {
        auto x = 2^^i;
        writeln("size = ", x, "; ", run_rand_test(x));
    }


}

double run_rand_test(int size) {
    int max = 1_000_000;
    int[] a = new int[size];

    StopWatch sw;

    auto gen = Random(unpredictableSeed);
    foreach(i; 0 .. size) {
        a[i] = uniform(-max, max, gen);
    }

    sw.start();
    auto res = brute_count(a);
    sw.stop();

    return sw.peek().msecs;
}


uint brute_count(int[] a) {
    auto N = a.length;
    uint count = 0;

    for(int i = 0; i < N; i++) {
        for(int j = i+1; j < N; j++) {
            for(int k = j+1; k < N; k++) {
                if (a[i] + a[j] + a[k] == 0) {
                    count += 1;
                }

            }
        }
    }

    return count;
}
