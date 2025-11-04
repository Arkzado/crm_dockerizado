<?php

namespace App\Models\Configuration;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Carbon\Carbon;

class MethodPayment extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $fillable = [
        "name",
        "method_payment_id",
        "state",
    ];

    public function setCreatedAtAttribute($value){
        date_default_timezone_set("America/Bogota");
        $this->attributes["created_at"] = Carbon::now();
    }

    public function setUpdatedAtAttribute($value){
        date_default_timezone_set("America/Bogota");
        $this->attributes["updated_at"] = Carbon::now();
    }

    public function method_payment(){
        return $this->belongsTo(MethodPayment::class, "method_payment_id");
    }

    public function method_payments(){
        return $this->hasMany(MethodPayment::class, "method_payment_id");
    }
}
