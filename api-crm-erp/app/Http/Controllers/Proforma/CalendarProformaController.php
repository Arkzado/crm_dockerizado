<?php

namespace App\Http\Controllers\Proforma;

use App\Http\Controllers\Controller;
use App\Models\Proforma\Proforma;
use Illuminate\Http\Request;
use Carbon\Carbon;

class CalendarProformaController extends Controller
{
    public function cronograma(Request $request) {

        $search_client = $request->search_client;
        $categorie_id = $request->categorie_id;
        $segment_client_id = $request->segment_client_id;
        $status_pay = $request->status_pay;


        //Futura mejora solo traer los contratos que tengan entregas programadas en el mes seleccionado y no los que esten en cotizacion
     $contracts = Proforma::where("state_proforma",1)
                                ->filterCronograma($search_client,$categorie_id,$segment_client_id,$status_pay)
                                ->orderBy("id","desc")
                                ->get();

         return response()->json([
            "contracts" => $contracts->map(function($contract) {
                $proforma_deliverie = $contract->proforma_deliverie;
                return  [
                    "title" => '#'.$contract->id .' ('.$proforma_deliverie->sucursal_deliverie->name.')',
                    "start" => Carbon::parse($proforma_deliverie->date_entrega)->format("Y-m-d")."T00:00:00",
                    "className" => $proforma_deliverie->sucursal_deliverie->color,
                    "contract_id" => $contract->id,
                ];
            })
        ]);
    }
}
