@extends('master')
@section('content')
    <div class="login-dialog">
        <form id="recharge-form">
            <div id="result"></div>
            <label for="">Chọn loại thẻ:</label>
            <select name="type_card" id="">
                <option value="1">VIETTEL</option>
                <option value="2">VINAPHONE</option>
                <option value="3">MOBIFONE</option>
                <option value="4">GATE</option>
            </select>
            <label for="">Mã thẻ:</label>
            <input type="text" name="pin">
            <label for="">Số seri:</label>
            <input type="text" name="seri">
            <button class="button">NẠP THẺ</button>
        </form>
    </div>
@endsection