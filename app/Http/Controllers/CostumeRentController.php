<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\User;
use App\Models\Cosplay;
use App\Models\RentLogs;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Session;

class CostumeRentController extends Controller
{
    public function index()
    {
        $users = User::where('role_id', '!=', 1)->where('status', '!=', 'inactive' )->get();
        $cosplays = Cosplay::all();
       return view('costume-rent', ['users' => $users, 'cosplays' => $cosplays]);
    }
    public function store(Request $request)
    {
        //carbon berfungsi mengambil data tanggal today
        $request['rent_date'] = Carbon::now()->toDateString();
        $request['return_date'] = Carbon::now()->addDay(3)->toDateString();
        //mencari costume status
   $cosplay = Cosplay::findOrFail($request->cosplay_id)->only('status');
//mencari costume status yang outstock
   if($cosplay['status'] != 'in stock') {
    //costum yang outstock gagal pinjam
    Session::flash('message', 'Cannot rent, the costume is not available'); 
Session::flash('alert-class', 'alert-danger'); 
    return redirect('costume-rent');
}
else {
    //mencari user yang sudah rental lebih dari 3 dan belum mengembalikan costume
    $count = RentLogs::where('user_id', $request->user_id)->where('actual_return_date', null)
    ->count();
   if($count >= 3) {
    //jika sudah meminjam 3 costume dan blm mengembalikan costume 1 pun
    Session::flash('message', 'Cannot rent, user has reach limit of costume'); 
Session::flash('alert-class', 'alert-danger'); 
    return redirect('costume-rent');
}
else {
   //jika tidak dalam kondisi diatas
   //simpan dan update data ke database
    try {
                DB::beginTransaction();
                //process insert to rent_logs table
                RentLogs::create($request->all());
                //process update cosplay table
                $cosplay = Cosplay::findOrFail($request->cosplay_id);
                $cosplay->status = 'out stock';
                $cosplay->save();
                DB::commit();
                Session::flash('message', 'Rent costume is success'); 
        Session::flash('alert-class', 'alert-success'); 
            return redirect('costume-rent');
            } catch (\Throwable $th) {
                DB::rollback();
            }
        
}
   }
 
}

public function returnCostume()
{
    $users = User::where('role_id', '!=', 1)->where('status', '!=', 'inactive' )->get();
        $cosplays = Cosplay::all();
    return view('rent-return', ['users' => $users, 'cosplays' => $cosplays]);
}
public function saveRentCostume(Request $request)
{
    $rent = RentLogs::where('user_id', $request->user_id)->where('cosplay_id', $request->cosplay_id)
    ->where('actual_return_date','=', null);
    $rentData = $rent->first();
    $countData = $rent->count();
    if($countData == 1) {
        $rentData->actual_return_date = Carbon::now()->toDateString();
        $cosplay = Cosplay::findOrFail($request->cosplay_id);
                $cosplay->status = 'in stock';
                $cosplay->save();
        $rentData->save();
        Session::flash('message', 'The costume is returned success'); 
Session::flash('alert-class', 'alert-success'); 
    return redirect('rent-return');
    }
    else {
        Session::flash('message', 'User is not rent the costume'); 
        Session::flash('alert-class', 'alert-danger'); 
            return redirect('rent-return');
    }
}

    }



