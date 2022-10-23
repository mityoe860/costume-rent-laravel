<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Cosplay;
use Illuminate\Http\Request;

class PublicController extends Controller
{
    public function index(Request $request)
    {
        $categories = Category::all(); 

        if ($request->category) { 
            $cosplays = Cosplay::WhereHas('categories', function($q) use($request){
        $q->where('categories.id', $request->category);
          })->get();
        }
          elseif ($request->category || $request->title) {
           
         $cosplays = Cosplay::where('title', 'like', '%'.$request->title.'%')
                            ->orWhereHas('categories', function($q) use($request){
                        $q->where('categories.id', $request->category);
                          })->get();
        } 
        else {
            $cosplays = Cosplay::all();
        }
       
        return view('costume-list', ['cosplays' => $cosplays, 'categories' => $categories]);
    }
}
