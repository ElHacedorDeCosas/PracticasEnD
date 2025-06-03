module dcat;

/*
  dcat: copia de 'cat' que lo que hace es mostrar el contenido de uno o multiples archivos en consola
*/

import std.stdio;
import std.file;
import std.string;

int main(string[] args)
{
	if (args.length > 1)
	{
		foreach (arg; args[1..$])
		{
			if (exists(arg))
			{
				if(isFile(arg))
				{
					File(arg, "r");
					writefln("%s", chop(readText(arg)));
				}else
				{
					writefln("\"%s\" es un directorio", arg);
				}
			}else
			{
				writefln("\"%s\" no existe", arg);
			}
		}
		return 0;
	}
	return 1;
}
