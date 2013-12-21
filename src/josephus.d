import std.stdio;
import std.conv;
import ds.queue;

void main(string[] args) {
    int M = std.conv.to!int(args[1]);
    int N = std.conv.to!int(args[2]);
    auto q = new LLQueue!int;

    for(int i = 0; i < M; i++) {
        q.enqueue(i);
    }

    while(!q.isEmpty()) {
        for(int i = 0; i < N-1; i++) {
            q.enqueue(q.dequeue());
        }

        write(q.dequeue(), " ");
    }
    writeln();
}
