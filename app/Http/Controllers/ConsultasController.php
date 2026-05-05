<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Team;
use App\Models\Player;
use App\Models\Game;
use App\Models\President;

class ConsultasController extends Controller
{
    public function consultas()
    {
        //todos los equipos con sus respectivos presidentes.
        $consulta1 = Team::with('president')->get();

        //todos los jugadores con sus respectivos goles.
        $consulta2 = Player::with('goals')->get();

        //todos los juegos con sus respectivos goles y el jugador que anoto cada gol.
        $consulta3 = Game::with('goals.player')->get();

        //todos los juegos con los equipos que se enfrentaron y los goles marcados y que jugador los anoto.
        $consulta4 = Game::with(['teams', 'goals.player'])->get();

        //todos los presidentes con sus equipos, los jugadores de cada equipo, los goles y el partido en el cual se hiso ese gol.
        $consulta5 = President::with('teams.players.goals.game')->get();

        return response()->json([
            'consulta1' => $consulta1,
            'consulta2' => $consulta2,
            'consulta3' => $consulta3,
            'consulta4' => $consulta4,
            'consulta5' => $consulta5
        ]);
    }
}
