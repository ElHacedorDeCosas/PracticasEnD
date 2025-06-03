import std.stdio;
import std.random;

/*
  // - JUEGO DE LA VIDA - //

  ___Reglas___
  Jugadores:
    -Ninguno, este juego no tiene, te jodes
  Nace:
    -Una celula nace si tiene 3 celulas vecinas vivas
  Muere:
    -Sobrepoblación: tiene más de 3 vecinos vivos
    -Aislamiento: si tiene solo 1 vecino alrededor o ninguno
  Vive:
    -Una celula sigue viva si tiene 2 o 3 vecinos a su alrededor

*/

const int tamanno = 20;
const wchar muerta = '·';
const wchar viva = '@';

void dibujoTablero(ref wchar[tamanno][tamanno] refTablero)
{
    for (int i = 0; i < refTablero.length;)
    {
        foreach (casilla; refTablero[i][0..$])
        {
            write(casilla);
        }
        write("\n");
        i++;
    }
}

void establecerTablero(ref wchar[tamanno][tamanno] refTablero)
{

    for (int i = 0; i < refTablero.length; i++)
    {
        for (int j = 0; j < refTablero.length; j++)
        {
            int r = uniform(0, 2);
            switch (r)
            {
            case 0:
                refTablero[i][j] = muerta;
            case 1:
                refTablero[i][j] = viva;
            }
        }

    }
}

void main()
{
    wchar[tamanno][tamanno] tablero;
    int generación;
    int población;
    bool iniciado = true;


    establecerTablero(tablero);
    while (iniciado)
    {
        dibujoTablero(tablero);
        iniciado = false;
    }
}
