import std.stdio;
import raylib;

immutable int ANCHO = 400;
immutable int ALTO = 400;
immutable int TAMANNO = ANCHO / 3;

struct Cuadrado {
    Rectangle rect;
    Texture2D tex;

    char tipo = ' ';

    this(Rectangle r){
        rect = r;
    }

    void dibujo() {
        if (tipo == ' '){
            return;
        }

        DrawTextureRec(tex, rect, Vector2(rect.x, rect.y), Colors.WHITE);
    }
}

void dubujar_grilla() {
    DrawLineEx(Vector2(ANCHO / 3, 0), Vector2(ANCHO / 3, ALTO), 3, Colors.WHITE);
    DrawLineEx(Vector2(ANCHO * 2 / 3, 0), Vector2(ANCHO * 2 / 3, ALTO), 3, Colors.WHITE);
    DrawLineEx(Vector2(0, ALTO / 3), Vector2(ANCHO, ALTO / 3), 3, Colors.WHITE);
    DrawLineEx(Vector2(0, ALTO * 2 / 3), Vector2(ANCHO, ALTO * 2 / 3), 3, Colors.WHITE);
}

void main(){

    validateRaylibBinding();
    InitWindow(ANCHO, ALTO, "Ta-Te-Ti 3D");
    SetTargetFPS(60);
    SetMouseScale(1.0, 1.0);

    Cuadrado[3][3] cuadrados;
    for (int i = 0; i < cuadrados.length; i += 1) {
        for (int j = 0; j < cuadrados[i].length; j += 1) {
            cuadrados[i][j] = Cuadrado(Rectangle(i * TAMANNO, j * TAMANNO, TAMANNO, TAMANNO));
        }
    }

    while (!WindowShouldClose())
    {
        BeginDrawing();
        {
            ClearBackground(Colors.SKYBLUE);
        }
        EndDrawing();
    }
    CloseWindow();
}
