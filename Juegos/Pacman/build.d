import std.stdio;
import std.format;
import std.process;

string nombrePrograma = "Pacman";

bool cmd(scope const(char[])[] args)
{
    writeln("cmd: ", args);
    return wait(spawnProcess(args)) == 0;
}

int main()
{
    if (!cmd([
        "dmd",
        format("-of=./build/%s", nombrePrograma),
        "-i",
        "-I=./src/",
        "./src/main.d",
        "-I=./lib/raylib-d/source/",
        "-L=./lib/libraylib.a",
    ])) return 1;
    return 0;
}
