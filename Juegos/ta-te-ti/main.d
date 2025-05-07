import std.stdio, std.conv, std.string, std.exception, std.random;

void msj(char[9] *ref_tab, char *ref_jug, char *ref_com) {
    writefln("  %s  |  %s  |  %s  ", (*ref_tab)[0], (*ref_tab)[1], (*ref_tab)[2]);
    writefln("-----|-----|-----");
    writefln("  %s  |  %s  |  %s  ", (*ref_tab)[3], (*ref_tab)[4], (*ref_tab)[5]);
    writefln("-----|-----|-----");
    writefln("  %s  |  %s  |  %s  ", (*ref_tab)[6], (*ref_tab)[7], (*ref_tab)[8]);
}

void turno_jugador(char[9] *ref_tab, char *ref_jug, char *ref_com, bool *ref_turno_jug){
    // - Entrada por consola - //
    writeln("Por favor ingrese la pocición en la que quiere colocar su ficha (1-9)");
    auto entrada_txt = readln();

    // - Manejo de la entrada - //
    if (isNumeric(chomp(entrada_txt)) == true) {
        int entrada_int = to!int(chomp(entrada_txt));
        if ((entrada_int - 1) >= 0 && (entrada_int - 1) < 9) {
            if ((*ref_tab)[entrada_int - 1] != *ref_jug && (*ref_tab)[entrada_int - 1] != *ref_com) {
                (*ref_tab)[entrada_int - 1] = *ref_jug;
                *ref_turno_jug = false;
            }else {
                writeln("Esa casilla ya está ocupada");
            }
        }else {
            writeln("El numero ingresado está por fuera de las casillas del tablero");
        }
    }else {
        writeln("Vuelva a ingresar su opción");
    }
}

void turno_computador(char[9] *ref_tab, char *ref_jug, char *ref_com, bool *ref_turno_com){

    auto num_rand = uniform(1, 10);//1..9
    if ((*ref_tab)[num_rand - 1] != *ref_jug && (*ref_tab)[num_rand - 1] != *ref_com) {
        (*ref_tab)[num_rand - 1] = *ref_com;
        *ref_turno_com = false;
        writefln("Computador elige: %d", num_rand);
    }
}

string verificar_victoria(char[9] *ref_tab, char *ref_jug, char *ref_com, bool *ref_victoria){
    string salida = "Error";
    int no_espacio = 0;

    // - Verificación de victoria del Jugador/Computador o Empate - //
    if ((*ref_tab)[0] == *ref_jug && (*ref_tab)[1] == *ref_jug && (*ref_tab)[2] == *ref_jug || //Primera Linea
        (*ref_tab)[3] == *ref_jug && (*ref_tab)[4] == *ref_jug && (*ref_tab)[5] == *ref_jug || //Segunda Linea
        (*ref_tab)[6] == *ref_jug && (*ref_tab)[7] == *ref_jug && (*ref_tab)[8] == *ref_jug || //Tercera Linea
        (*ref_tab)[0] == *ref_jug && (*ref_tab)[4] == *ref_jug && (*ref_tab)[8] == *ref_jug || //Diagonal Derecha
        (*ref_tab)[2] == *ref_jug && (*ref_tab)[4] == *ref_jug && (*ref_tab)[6] == *ref_jug || //Diagonal Izquierda
        (*ref_tab)[0] == *ref_jug && (*ref_tab)[3] == *ref_jug && (*ref_tab)[6] == *ref_jug || //Primera Columna
        (*ref_tab)[1] == *ref_jug && (*ref_tab)[4] == *ref_jug && (*ref_tab)[7] == *ref_jug || //Segunda Columna
        (*ref_tab)[2] == *ref_jug && (*ref_tab)[5] == *ref_jug && (*ref_tab)[8] == *ref_jug ){ //Tercera Columna
        salida = "¡VICTORIA DEL JUGADOR, FELICIDADES!";
        *ref_victoria = true;
    }else if ((*ref_tab)[0] == *ref_com && (*ref_tab)[1] == *ref_com && (*ref_tab)[2] == *ref_com || //Primera Linea
              (*ref_tab)[3] == *ref_com && (*ref_tab)[4] == *ref_com && (*ref_tab)[5] == *ref_com || //Segunda Linea
              (*ref_tab)[6] == *ref_com && (*ref_tab)[7] == *ref_com && (*ref_tab)[8] == *ref_com || //Tercera Linea
              (*ref_tab)[0] == *ref_com && (*ref_tab)[4] == *ref_com && (*ref_tab)[8] == *ref_com || //Diagonal Derecha
              (*ref_tab)[2] == *ref_com && (*ref_tab)[4] == *ref_com && (*ref_tab)[6] == *ref_com || //Diagonal Izquierda
              (*ref_tab)[0] == *ref_com && (*ref_tab)[3] == *ref_com && (*ref_tab)[6] == *ref_com || //Primera Columna
              (*ref_tab)[1] == *ref_com && (*ref_tab)[4] == *ref_com && (*ref_tab)[7] == *ref_com || //Segunda Columna
              (*ref_tab)[2] == *ref_com && (*ref_tab)[5] == *ref_com && (*ref_tab)[8] == *ref_com ){ //Tercera Columna
        salida = "¡VICTORIA DEL COMPUTADOR, MEJOR SUERTE PARA LA PROXIMA!";
        *ref_victoria = true;
    }else {
        foreach(caracter; *ref_tab) {
            if (caracter != ' ') {
                    no_espacio++;
                }
        }
        if (no_espacio == 9) {
            salida = "¡EMPATE!";
            *ref_victoria = true;
        }
    }
    no_espacio = 0;
    return salida;
}

void main(){

    char jugador = 'O';
    char computador = 'X';
    char[9] tablero = [' ', ' ', ' ', ' ', ' ', ' ', ' ', ' ', ' '];
    bool es_victoria = false;
    string ganador;
    bool es_turno_jugador = false;
    bool es_turno_computador = false;

    writeln("___Ta-Te-Ti___");
    while (es_victoria == false) {
        msj(&tablero, &jugador, &computador);
        es_turno_jugador = true;
        while (es_turno_jugador == true) {
            turno_jugador(&tablero, &jugador, &computador, &es_turno_jugador);
        }
        ganador = verificar_victoria(&tablero, &jugador, &computador, &es_victoria);
        es_turno_computador = true;
        while (es_turno_computador == true) {
            turno_computador(&tablero, &jugador, &computador, &es_turno_computador);
        }
        ganador = verificar_victoria(&tablero, &jugador, &computador, &es_victoria);
    }
    msj(&tablero, &jugador, &computador);
    writeln(ganador);
}
