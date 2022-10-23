<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Cosplay;
use Illuminate\Http\Request;

class CosplayController extends Controller
{
    public function index()
    {
        $cosplays = Cosplay::all();
        return view('menu-costume', ['cosplays' => $cosplays]);
    }
    
    public function add()
    {
        $categories = Category::all();
        return view('costume-add', ['categories' => $categories]);
    }

    public function store(Request $request)
    {
        $validated = $request->validate([
            'cosplay_code' => 'required|unique:cosplays|max:255',
            'title' => 'required|max:255'
        ]);

        $newName = '';
        if ($request->file('image')) {
            $extension = $request->file('image')->getClientOriginalExtension();
            $newName = $request->title.'-'.now()->timestamp.'.'.$extension;
            $request->file('image')->storeAs('cover', $newName);
        }
        $request['cover'] = $newName;
       $cosplay = Cosplay::create($request->all());
       $cosplay->categories()->sync($request->categories);
       return redirect('menu-costume')->with('status','Costume Added Successfully');
    }
public function edit($slug)
{
    $cosplay = Cosplay::where('slug', $slug)->first();
    $categories = Category::all();
   return view('costume-edit', ['categories' => $categories, 'cosplay' => $cosplay]);
}
public function update(Request $request, $slug)
{  
    
    if ($request->file('image')) {
        $extension = $request->file('image')->getClientOriginalExtension();
        $newName = $request->title.'-'.now()->timestamp.'.'.$extension;
        $request->file('image')->storeAs('cover', $newName);
        $request['cover'] = $newName;
    }

    
    $cosplay = Cosplay::where('slug', $slug)->first();
    $cosplay->update($request->all());
    if ($request->categories) {
        $cosplay->categories()->sync($request->categories);
     }
     return redirect('menu-costume')->with('status','Costume Edited Successfully');
    }
    public function delete($slug)
    {
        $cosplay = Cosplay::where('slug', $slug)->first();
        $cosplay->delete();
        return redirect('menu-costume')->with('status','Costume Deleted Successfully');
    }
    public function deletedCostume()
    {  $deletedCostume = Cosplay::onlyTrashed()->get();
        return view('costume-deleted-list', ['deletedCostume' => $deletedCostume]);
    }
    public function restore($slug)
    {
        $cosplay = Cosplay::withTrashed()->where('slug', $slug)->first();
        $cosplay->restore();
        return redirect('menu-costume')->with('status','Costume Restored Successfully');
    }
}
