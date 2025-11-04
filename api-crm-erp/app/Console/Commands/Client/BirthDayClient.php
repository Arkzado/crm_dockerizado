<?php

namespace App\Console\Commands\Client;

use Illuminate\Console\Command;
use App\Models\Client\Client;
use Illuminate\Support\Facades\Mail;
use App\Mail\BirthDayClient as BirthDayClientF ;

class BirthDayClient extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'client:birth-day';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Correo electronico a los clientes que complan años';

    /**
     * Execute the console command.
     */
    public function handle()
    {   
        date_default_timezone_set("America/Bogota");
        $clients = Client::where("state",1)->whereMonth("birthdate",today())->whereDay("birthdate",today())->orderby("id","desc")->get(); 
        foreach ($clients as $key => $cliente){
            if($cliente->email){
                Mail::to($cliente->email)->send(new BirthDayClientF($cliente));
            }
        }
    }
}
