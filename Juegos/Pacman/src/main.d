import std.stdio;
import raylib;

// - Configs - //
int windowWidth = 600;
int windowHeight = 800;
int fps = 30;
int tileSize = 32;
//----------------------------------------------------

// - Global - //
static wstring[][] level1 = [
    ["############################"],
    ["#············##············#"],
    ["#·####·#####·##·#####·####·#"],
    ["#*####·#####·##·#####·####*#"],
    ["#·####·#####·##·#####·####·#"],
    ["#··························#"],
    ["#·####·##·########·##·####·#"],
    ["#·####·##·########·##·####·#"],
    ["#······##····##····##······#"],
    ["######·#####-##-#####·######"],
    ["-----#·#####-##-#####·#-----"],
    ["-----#·##----------##·#-----"],
    ["-----#·##-###~~###-##·#-----"],
    ["######·##-#ssssss#-##·######"],
    ["L-----·---#ssssss#---·-----R"],
    ["######·##-#ssssss#-##·######"],
    ["-----#·##-########-##·#-----"],
    ["-----#·##----p-----##·#-----"],
    ["-----#·##-########-##·#-----"],
    ["######·##-########-##·######"],
    ["#············##············#"],
    ["#·####·#####·##·#####·####·#"],
    ["#*####·#####·##·#####·####*#"],
    ["#···##················##···#"],
    ["###·##·##·########·##·##·###"],
    ["###·##·##·########·##·##·###"],
    ["#······##····##····##······#"],
    ["#·##########·##·##########·#"],
    ["#·##########·##·##########·#"],
    ["#··························#"],
    ["############################"]
    ];
//----------------------------------------------------

// - Types - //
enum Direction
{
    none,
    left,
    rigth,
    up,
    down,
}

enum MapType
{
    space,
    wall,
    leftPoint,
    rigthPoint,
    dot,
    superDot,
    door,
    ghostSpawn,
    ghost,
    pacman,
}

struct Entity
{
    bool player;
    Color color;
    int[2] position;
    Direction direction;
    bool eaten;
    bool inmortal;
}

//----------------------------------------------------

auto createMap(wstring[][] level)
{
    auto rows = level.length;
    auto cols = level[0][0].length;

    auto lev = new MapType[][](rows, cols);

    for (int r = 0; r < rows; r++)
    {
        int c = 0;
        foreach (placeMap; level[r][0])
        {
            MapType mapType;

            switch (placeMap)
            {
            case '-':
                mapType = MapType.space;
                break;
            case '#':
                mapType = MapType.wall;
                break;
            case 'L':
                mapType = MapType.leftPoint;
                break;
            case 'R':
                mapType = MapType.rigthPoint;
                break;
            case '·':
                mapType = MapType.dot;
                break;
            case '*':
                mapType = MapType.superDot;
                break;
            case '~':
                mapType = MapType.door;
                break;
            case 's':
                mapType = MapType.ghostSpawn;
                break;
            case 'g':
                mapType = MapType.ghost;
                break;
            case 'p':
                mapType = MapType.pacman;
                break;
            default:
                stderr.writeln("Miss map type: ", placeMap);
                mapType = MapType.space;
                break;
            }
            lev[r][c] = mapType;
            c++;
        }
    }
    return lev;
}

void drawnMapPlace(MapType mapType, ref int posX, ref int posY)
{
    //RECORD: posX, posY = tileSize * c, tileSize * y
    
}

void drawnMap(ref MapType[][] currLevel)
{
    int posX = 0;
    int posY = 0;

    for (ulong r = 0; r < currLevel.length; r++)
    {
        for (ulong c = 0; c < currLevel[r][].length; c++)
        {
            switch (currLevel[r][c])
            {
                
            }
        }
    }
}

void main()
{
    // - Initialization - //
    validateRaylibBinding();
    InitWindow(windowWidth, windowHeight, "Pac-Man");
    scope(exit) CloseWindow();
    SetTargetFPS(fps);
    //------------------------------------------------

    auto currentLevel = createMap(level1);

    // - Game loop - //
    while (!WindowShouldClose())
    {

        // - Drawn - //
        BeginDrawing();
        scope(exit) EndDrawing();

        ClearBackground(Colors.BLACK);
        drawnMap(currentLevel);
        //--------------------------------------------
    }
    //------------------------------------------------
}
