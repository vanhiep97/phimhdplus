<div class="login-dialog">
    <span class="closex"></span>
    <div id="result"></div>
    <form id="report-form">
        <input type="hidden" name="film" value="{{$film->id}}">
        <label for="">Email của bạn:</label>
        <input type="email" name="email"
               @if (Auth::check())
               value="{{Auth::user()->email}}"
                @endif
        >
        <label for="">Phim: <b>{{$film->name}}</b></label>
        <label for="">Nội dung:</label>
        <textarea name="message"></textarea>
        <button class="button">Gửi báo lỗi</button>
    </form>
</div>