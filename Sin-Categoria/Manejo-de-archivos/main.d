import std.stdio;
import std.file;

void recibirArchivos(ref string[] refArgs, ref File[] refArchivos)
{
    foreach (arg; refArgs[1..$])
    {
        refArchivos ~= File(arg, "w");
    }
}

void editarArchivos(ref File[] refArchivos)
{
    foreach (archivo; refArchivos)
    {
        archivo.writeln("Hellope");
    }
}

int main(string[] args)
{
    File[] archivos;

    if (args.length > 1)
    {
        recibirArchivos(args, archivos);
        if (archivos.length > 0)
        {
            editarArchivos(archivos);
        }
    }

    scope (exit)
    {
        foreach (archivo; archivos)
        {
            archivo.close();
        }
    }


    return 69;
}
