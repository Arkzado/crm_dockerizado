<?php

namespace App\Http\Controllers\Configuration;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Configuration\Provider;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;

class ProviderController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {
        $search = $request->get("search");

        $providers = Provider::where("full_name","like","%".$search."%")->orderBy("id","desc")->paginate(25);

        return response()->json([
            "total" => $providers->total(),
            "providers" => $providers->map(function($provider) {
                return [
                    "id" => $provider->id,
                    "full_name" => $provider->full_name,
                    "nit" => $provider->nit,
                    "email" => $provider->email,
                    "phone" => $provider->phone,
                    "address" => $provider->address,
                    "state" => $provider->state,
                    "imagen" => $provider->imagen ? env("APP_URL")."storage/".$provider->imagen : "",
                    "created_at" => $provider->created_at->format("Y-m-d h:i A")
                ];
            }),
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $is_exits_provider = Provider::where("full_name",$request->full_name)->first();
        if($is_exits_provider){
            return response()->json([
                "message" => 403,
                "message_text" => "El nombre del proveedor ya existe"
            ]);
        }
        $is_exits_provider = Provider::where("nit",$request->nit)->first();
        if($is_exits_provider){
            return response()->json([
                "message" => 403,
                "message_text" => "El nit del proveedor ya existe"
            ]);
        }

        if($request->hasFile("provider_imagen")){
            $path = Storage::putFile("providers",$request->file("provider_imagen"));
            $request->request->add(["imagen" => $path]);
        }

        $provider = Provider::create($request->all());
        return response()->json([
            "message" => 200,
            "provider" => [
                "id" => $provider->id,
                "full_name" => $provider->full_name,
                "nit" => $provider->nit,
                "email" => $provider->email,
                "phone" => $provider->phone,
                "address" => $provider->address,
                "state" => $provider->state || 1,
                "imagen" => $provider->imagen ? env("APP_URL")."storage/".$provider->imagen : "",
                "created_at" => $provider->created_at->format("Y-m-d h:i A")
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
    Log::info('--- INICIO UPDATE PROVIDER ---');
    Log::info('ID:', ['id' => $id]);
    Log::info('Request all:', $request->all());
        $is_exits_provider = Provider::where("full_name",$request->full_name)
                            ->where("id","<>",$id)->first();
        if($is_exits_provider){
            return response()->json([
                "message" => 403,
                "message_text" => "El nombre del proveedor ya existe"
            ]);
        }
        $is_exits_provider = Provider::where("nit",$request->nit)
                            ->where("id","<>",$id)->first();
        if($is_exits_provider){
            return response()->json([
                "message" => 403,
                "message_text" => "El nit del proveedor ya existe"
            ]);
        }
        $provider = Provider::findOrFail($id);

        if($request->hasFile("provider_imagen")){
            if($provider->imagen){
                Storage::delete($provider->imagen);
            }
            $path = Storage::putFile("providers",$request->file("provider_imagen"));
            $provider->imagen = $path;
        }

        // Asignar manualmente los camposr
        $provider->full_name = $request->input('full_name', $provider->full_name);
        $provider->nit = $request->input('nit', $provider->nit);
        $provider->email = $request->input('email', $provider->email);
        $provider->phone = $request->input('phone', $provider->phone);
        $provider->address = $request->input('address', $provider->address);
        $provider->state = $request->input('state', $provider->state);

    Log::info('Provider antes de guardar:', $provider->toArray());
        $provider->save();
    Log::info('Provider después de guardar:', $provider->toArray());
    Log::info('--- FIN UPDATE PROVIDER ---');

        return response()->json([
            "message" => 200,
            "provider" => [
                "id" => $provider->id,
                "full_name" => $provider->full_name,
                "nit" => $provider->nit,
                "email" => $provider->email,
                "phone" => $provider->phone,
                "address" => $provider->address,
                "state" => $provider->state,
                "imagen" => $provider->imagen ? env("APP_URL")."storage/".$provider->imagen : NULL,
                "created_at" => $provider->created_at->format("Y-m-d h:i A")
            ],
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $provider = Provider::findOrFail($id);
        // VALIDACION POR PRODUCTO
        $provider->delete();
        return response()->json([
            "message" => 200,
        ]);
    }
}
