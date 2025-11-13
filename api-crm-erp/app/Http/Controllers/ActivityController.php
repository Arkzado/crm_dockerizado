<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Activity;
use App\Http\Resources\Activity\ActivityCollection;
use App\Http\Resources\Activity\ActivityResource;

class ActivityController extends Controller
{
    public function index(Request $request)
    {

        $id = $request->id;

        $actividades = Activity::where("user_id", $id)->join('clients','activities.client_id','=','clients.id')->select('activities.*', 'clients.full_name as client_name')->orderBy("due_date","asc")->get();
        
        return response()->json(
            [   
            "activities" => $actividades->map(function ($actividad) {
                return [
                    
                    "id" => $actividad->id,
                    "subject" => $actividad->subject,
                    "due_date" => $actividad->due_date,
                    "notes" => $actividad->notes,
                    "type" => $actividad->type,
                    "status" => $actividad->status,
                    "user_id" => $actividad->user_id,
                    "client_id" => $actividad->client_id,
                    "client_name" => $actividad->client_name,
                    "created_at" => $actividad->created_at,
                    "updated_at" => $actividad->updated_at,
                    "deleted_at" => $actividad->deleted_at,
                ];
            }),
            ]);
    }

    public function create()
    {   
        // Mostrar formulario para crear una nueva actividad
    }

    public function store(Request $request)
    {
      $actividad = Activity::create($request->all());
      return response()->json([
        "message"=>200,
        "activity" => ActivityResource::make($actividad),  
      ]);
    }

    public function show($id)
    {
        // Mostrar una actividad específica
    }

    public function edit($id)
    {
        // Mostrar formulario de edición
    }

    public function update(Request $request, string $id)
    {


        $activity = Activity::findOrFail($id);
        $activity -> update($request->all());
        return response()->json([
            "message"=>200,
            "activity" => ActivityResource::make($activity),
        ]);
    }

    public function destroy($id)
    {
        $activity = Activity::findOrFail($id);
        $activity -> delete();
        return response()->json([
            "message"=>200,
        ]);

    
    }
}
