import std.stdio, std.string, std.file, std.conv, std.array;

void main(string[] args) {
    auto inp = readText(args[1]);
    string[] lines = splitLines(inp);
    
    int[] ints;
    foreach(line; lines) {
        ints ~= std.conv.to!int( replace(line, " ", "") );
    }
    writeln(brute_count(ints));
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
