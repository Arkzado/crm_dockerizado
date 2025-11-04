<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\Client\Client;
use Carbon\Carbon;

class Activity extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'subject',
        'due_date',
        'type',
        'status',
        'notes',
        'user_id',
        'client_id',
        // 'opportunity_id' ,
    ];

    public function setCreatedAtAttribute($value)
    {
        date_default_timezone_set("America/Bogota");
        $this->attributes['created_at'] = Carbon::now();
    }
    public function setUpdatedAtAttribute($value)
    {
        date_default_timezone_set("America/Bogota");
        $this->attributes['updated_at'] = Carbon::now();
    }


    public function user()
    {
        return $this->belongsTo(User::class, 'user_id');
    }

    public function client()
    {
        return $this->belongsTo(Client::class, 'client_id');
    }


    //Belongs to Opportunity esperando el modelo Opportunity
}
