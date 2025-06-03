import std.stdio;
import std.process;

bool cmd(scope const(char[])[] args)
{
    writeln("cmd: ", args);
    return wait(spawnProcess(args)) == 0;
}

int main()
{
    if (!cmd([
        "dmd",
        "-of=cajalmeja",
        "-I=./src/",
        "-i",
        "./src/main.d"
    ])) return 1;
    return 0;
}
