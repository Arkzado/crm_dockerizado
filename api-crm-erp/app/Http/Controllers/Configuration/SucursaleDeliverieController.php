<?php

namespace App\Http\Controllers\Configuration;

use App\Http\Controllers\Controller;
use App\Models\Configuration\SucursaleDeliverie;
use Illuminate\Http\Request;

class SucursaleDeliverieController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->get("search");

        $sucursal_deliveries = SucursaleDeliverie::where("name", "like", "%" . $search . "%")->orderBy("id", "desc")->paginate(25);

        return response()->json([
            "total" => $sucursal_deliveries->total(),
            "sucursal_deliveries" => $sucursal_deliveries->map(function ($sucursal_deliverie) {
                return [
                    "id" => $sucursal_deliverie->id,
                    "name" => $sucursal_deliverie->name,
                    "address" => $sucursal_deliverie->address,
                    "state" => $sucursal_deliverie->state,
                    "created_at" => $sucursal_deliverie->created_at->format("Y-m-d h:i A"),
                ];
            }),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $is_exist_sucural = SucursaleDeliverie::where("name", $request->name)->first();

        if ($is_exist_sucural) {
            return response()->json([
                "message" => 403,
                "message_text" => "El nombre del lugar de entrega ya está registrado",
            ]);
        }

        $sucursal_deliverie = SucursaleDeliverie::create($request->all());

        return response()->json([
            "message" => 200,
            "sucursal_deliveries" => [
                "id" => $sucursal_deliverie->id,
                "name" => $sucursal_deliverie->name,
                "address" => $sucursal_deliverie->address ?? "N/A",
                "state" => $sucursal_deliverie->state ?? 1,
                "created_at" => $sucursal_deliverie->created_at->format("Y-m-d h:i A"),
            ],
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $is_exist_sucural = SucursaleDeliverie::where("name", $request->name)->where("id", "<>", $id)->first();

        if ($is_exist_sucural) {
            return response()->json([
                "message" => 403,
                "message_text" => "El nombre del lugar de entrega ya está registrado",
            ]);
        }

        $sucursal_deliverie = SucursaleDeliverie::findOrFail($id);
        $sucursal_deliverie->update($request->all());

        return response()->json([
            "message" => 200,
            "sucursal_deliveries" => [
                "id" => $sucursal_deliverie->id,
                "name" => $sucursal_deliverie->name,
                "address" => $sucursal_deliverie->address,
                "state" => $sucursal_deliverie->state,
                "created_at" => $sucursal_deliverie->created_at->format("Y-m-d h:i A"),
            ],
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $sucursal_deliverie = SucursaleDeliverie::findOrFail($id);
        $sucursal_deliverie->delete();

        //validación por proforma

        return response()->json([
            "message" => 200
        ]);
    }
}