<?php

namespace App\Http\Resources\Activity;

use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ActivityResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            "id" => $this->resource->id,
            "subject" => $this->resource->subject,  
            "due_date" => $this->resource->due_date,
            "type" => $this->resource->type,
            "status" => $this->resource->status,
            "notes" => $this->resource->notes,
            "user_id" => $this->resource->user_id,
            "client_id" => $this->resource->client_id,
            "created_at" => $this->resource->created_at,
            "updated_at" => $this->resource->updated_at,
            "deleted_at" => $this->resource->deleted_at    
        ];
    }
}
