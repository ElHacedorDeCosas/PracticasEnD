import std.stdio;
import std.format;
import std.conv;

enum Color
{
    blanco = 0,
    negro = 1,
}

enum TipoPieza
{
    ninguna = 0,
    peon = 1,
    torre = 2,
    caballo = 3,
    alfil = 4,
    reina = 5,
    rey = 6,
}

struct Pieza
{
    Color color;
    TipoPieza tipoPieza;
    string nombre;

    this()
    {
        this.nombre = format("%s%s", to!string(c), to!string(t));
    }
}

void main()
{
    Pieza p;
    p.color = Color.blanco;
    p.tipoPieza = TipoPieza.peon;

    writeln(p.nombre);

}
