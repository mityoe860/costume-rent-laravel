<?php

namespace App\Models;

use App\Models\Category;
use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Cosplay extends Model
{
    use HasFactory;
    use Sluggable;
    use SoftDeletes;
    protected $fillable = [
        'cosplay_code', 'title', 'cover', 'slug'
    ]; 
    public function sluggable(): array
    {
        return[
            'slug' => [
                'source' => 'title'
            ]
            ];
    }
    /**
     * The categories that belong to the Cosplay
     *
     * @return \Illuminate\Database\Eloquent\Relations\BelongsToMany
     */
    public function categories(): BelongsToMany
    {
        return $this->belongsToMany(Category::class, 'cosplay_category', 'cosplay_id', 'category_id');
    }
}
