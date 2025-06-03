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
    string id;

    this(Color c, TipoPieza p)
    {
        this.color = c;
        this.tipoPieza = p;
        this.id = format("%d%d", to!int(c), to!int(p));
    }
}

void main()
{
    auto p = Pieza(Color.blanco, TipoPieza.peon);

    writeln(p.id);

}
