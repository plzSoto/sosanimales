<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Especie extends Model
{
    use HasFactory;

    protected $primaryKey = 'ID';

    protected $table = 't_especie';

    protected $fileable = [
        'ID',
        'ESPECIE',
    ];

    public function animales()
    {
        return $this->hasMany(Animal::class, 'COLOR_ID');
    }
}
