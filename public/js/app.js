var homeUrl = $('base').attr('href');
var error = $('<div/>').addClass('alert alert-danger center');
var success = $('<div/>').addClass('alert alert-success center');
var csrfToken = $('meta[name="csrf-token"]').attr('content');
$.ajaxSetup({
  headers: {
    'X-CSRF-TOKEN': csrfToken
  }
});
$(document).ready(function () {
  $('.film-name').tooltip();
  $('.btn-toggle').click(function () {
    if ($(this).hasClass('on')) {
      $(this).removeClass('on');
      $('.slide').removeClass('slide-toggle');
      $('.over').remove();
    } else {
      $(this).addClass('on');
      $('.slide').addClass('slide-toggle');
      $('<div/>').addClass('over').appendTo('#content');
    }
  });
  $('.search-box_button').click(function () {
    if ($(this).children().hasClass('fa-search')) {
      $(this).children().removeClass('fa-search').addClass('fa-close');
      $('.search-box_input').addClass('search-box_input_show');
      $('.search-box_button_open').toggle('slide');
    } else {
      $(this).children().removeClass('fa-close').addClass('fa-search');
      $('.search-box_input').removeClass('search-box_input_show');
      $('.search-box_button_open').toggle('slide');
    }
  });
  $('.icon-user').click(function () {
    $('.slide-collapse').toggle("scale");
  });
});

$(document).on('submit', '#login-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/login',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $("#login-form").remove();
      success.text(res.message).appendTo('#result');
      setTimeout(function () {
        location.href = res.redirectUrl;
      }, 2000);
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#register-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/register',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'btn');
      $("#register-form").remove();
      success.text(res.message).appendTo('#result');
      setTimeout(function () {
        location.href = res.redirectUrl;
      }, 2000);
    },
    error: function (err) {
      btn.attr('class', 'btn');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('click', '.film-eposide span', function () {
  var id = $(this).data('eposide');
  var active = $('.film-eposide span.active');
  if ($(this).hasClass('active')) {
    return false;
  }
  active.removeClass('active');
  $(this).addClass('active');
  $.ajax({
    url: homeUrl + '/ajax/source/' + id,
    processData: false,
    success: function (res) {
      play(res.source, res.poster, res.name);
    }
  });
});
$(document).on('click', '.film-eposide-download span', function () {
  var id = $(this).data('eposide');
  var active = $('.film-eposide-download span.active');
  if ($(this).hasClass('active')) {
    return false;
  }
  active.removeClass('active');
  $(this).addClass('active');
  $('#download-div').hide();
  $.ajax({
    url: homeUrl + '/ajax/download/' + id,
    processData: false,
    success: function (res) {
      $('#download-div').show();
      $('#download-m18').attr('href', res.m18);
      $('#download-m22').attr('href', res.m22);
      $('#download-m36').attr('href', res.m36);
    }
  });
});
$(document).on('click', '.over, .closex', function () {
  $('.login-dialog').remove();
  $('.over').remove();
});
$(document).on('click', '.report', function () {
  var id = $(this).data('film');
  $.ajax({
    url: homeUrl + '/ajax/report/' + id,
    processData: false,
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('submit', '#report-form', function (event) {
  event.preventDefault();
  error.remove();
  var id = $('input[name=film]').val();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/ajax/report/' + id,
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $("#report-form").remove();
      success.text(res.message).appendTo('#result');
    },
    error: function (err) {
      btn.attr('class', 'button');
      console.log(err)
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#change-pass-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/user/change-password',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      success.text(res.message).appendTo('#result');
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#change-avatar-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/user/change-avatar',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      success.text(res.message).appendTo('#result');
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('click', '#like-button', function (event) {
  var id = $(this).data('id');
  var _this = this;
  $.ajax({
    url: homeUrl + '/ajax/like/' + id,
    processData: false,
    success: function (res) {
      if (res.code) {
        $(_this).children('i').css({
          color: '#f00'
        });
        $(_this).children('span').text('Đã thích');
      } else {
        $(_this).children('i').css('color', '');
        $(_this).children('span').text('Yêu thích');
      }
    }
  });
});
var selected = false;
$(document).on('click', '.star-white', function (e) {
  if (selected) {
    return false;
  }
  var index = $(this).index();
  var id = $(this).parent().data('id');
  $('.list-star').children().removeClass('star');
  for (var i = 0; i <= index; i++) {
    $('.list-star .star-white:eq(' + i + ')').addClass('star');
  }
  $.ajax({
    url: homeUrl + '/ajax/vote/' + id,
    type: "POST",
    data: {'point': ++index},
    async: false,
    success: function (res) {
      if (res.code) {
        selected = true;
        $('.film-vote span:eq(0)').text("BẠN ĐÃ ĐÁNH GIÁ");
        $('.star-point').text(index);
      }
    }
  });
});
$(document).on('mouseover', '.star-white', function (e) {
  if (selected) {
    return false;
  }
  var index = $(this).index();
  for (var i = 0; i <= index; i++) {
    $('.list-star .star-white:eq(' + i + ')').addClass('star');
  }
  $('.star-point').text(++index);
});
$(document).on('mouseleave', '.star-white', function (e) {
  if (selected) {
    return false;
  }
  $('.list-star').children().removeClass('star');
  $('.star-point').text(0);
});
$(document).on('change', 'input[name=category_parent]', function (e) {
  var id = this.value;
  $.ajax({
    url: homeUrl + '/admin/film/category',
    data: {'id': id},
    success: function (res) {
      var html = '';
      $.each(res, function (key, val) {
        html += '<li><input type="checkbox" name="category[]" value="' + val.id + '">' + val.name + '</li>';
      });
      $('#dropSelect').html(html);
    }
  });
});
$(document).on('click', '#category_parent li', function (e) {
  var id = $(this).children('input')[0].value;
  $.ajax({
    url: homeUrl + '/admin/film/category',
    data: {'id': id},
    success: function (res) {
      var html = '';
      $.each(res, function (key, val) {
        html += '<li><input type="checkbox" name="category[]" value="' + val.id + '">' + val.name + '</li>';
      });
      $('#dropSelect').html(html);
    }
  });
});
$(document).on('click', '.dropSelect li', function (e) {
  $(this).children('input')[0].checked = true;
});
$(document).on('submit', '#add-film-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children().find('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/film/add',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $('<div/>').addClass('over').appendTo('body');
      $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-success">' + res.message + '</div></div>');
      $('#add-film-form')[0].reset();
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#edit-film-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children().find('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/film/edit',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $('<div/>').addClass('over').appendTo('body');
      $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-success">' + res.message + '</div></div>');
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#add-category-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/category/add',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $('<div/>').addClass('over').appendTo('body');
      $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-success">' + res.message + '</div></div>');
      $('#add-category-form')[0].reset();
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#edit-category-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/category/edit',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $('<div/>').addClass('over').appendTo('body');
      $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-success">' + res.message + '</div></div>');
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#recharge-form', function (event) {
  event.preventDefault();
  error.remove();
  var btn = $(this).children('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/user/recharge',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      error.text(res.success).appendTo('#result');
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('click', '#upgrade-button', function (e) {
  $.ajax({
    url: homeUrl + '/ajax/upgrade',
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#confirm-upgrade', function (e) {
  var btn = $(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/user/upgrade',
    type: "POST",
    success: function (res) {
      btn.attr('class', 'button');
      $('.login-dialog').remove();
      $('.over').remove();
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#delete-film', function (e) {
  var id = $(this).data('id');
  $.ajax({
    url: homeUrl + '/admin/film/delete',
    data: {'id': id},
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#delete-source', function (e) {
  var id = $(this).data('id');
  var filmId = $(this).data('film-id');
  $.ajax({
    url: homeUrl + '/admin/film/source/' + filmId + '/delete/' + id,
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#delete-category', function (e) {
  var id = $(this).data('id');
  $.ajax({
    url: homeUrl + '/admin/category/delete',
    data: {'id': id},
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#delete-user', function (e) {
  var id = $(this).data('id');
  $.ajax({
    url: homeUrl + '/admin/user/delete',
    data: {'id': id},
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#block-user', function (e) {
  var id = $(this).data('id');
  $.ajax({
    url: homeUrl + '/admin/user/block',
    data: {'id': id},
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#upgrade-user', function (e) {
  var id = $(this).data('id');
  $.ajax({
    url: homeUrl + '/admin/user/upgrade',
    data: {'id': id},
    success: function (res) {
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#confirm-delete-film', function (e) {
  var id = $(this).data('id');
  var _this = $(this);
  _this.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/film/delete',
    type: "POST",
    data: {'id': id},
    success: function (res) {
      $('.login-dialog').remove();
      $('.over').remove();
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});

$(document).on('click', '#confirm-delete-resource', function (e) {
  var id = $(this).data('id');
  var filmId = $(this).data('film-id');
  var _this = $(this);
  _this.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/film/source/' + filmId + '/delete/' + id,
    type: "POST",
    success: function (res) {
      $('.login-dialog').remove();
      $('.over').remove();
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});

$(document).on('click', '#confirm-delete-category', function (e) {
  var id = $(this).data('id');
  var _this = $(this);
  _this.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/category/delete',
    type: "POST",
    data: {'id': id},
    success: function (res) {
      $('.login-dialog').remove();
      $('.over').remove();
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#confirm-delete-user', function (e) {
  var id = $(this).data('id');
  var _this = $(this);
  _this.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/user/delete',
    type: "POST",
    data: {'id': id},
    success: function (res) {
      $('.login-dialog').remove();
      $('.over').remove();
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#confirm-block-user', function (e) {
  var id = $(this).data('id');
  var _this = $(this);
  _this.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/user/block',
    type: "POST",
    data: {'id': id},
    success: function (res) {
      $('.login-dialog').remove();
      $('.over').remove();
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('click', '#confirm-upgrade-user', function (e) {
  var id = $(this).data('id');
  var _this = $(this);
  _this.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/user/upgrade',
    type: "POST",
    data: {'id': id},
    success: function (res) {
      $('.login-dialog').remove();
      $('.over').remove();
      $('<div/>').addClass('over').appendTo('body');
      $('body').append(res);
    }
  });
});
$(document).on('keypress', '.search-box_input', function (e) {
  if (e.keyCode == 13)
    location.href = homeUrl + '/search/?keys=' + encodeURIComponent($('.search-box_input_show').val()).replace(/%20/g, '+');
});
$(document).on('click', '.search-box_button_open', function (e) {
  location.href = homeUrl + '/search/?keys=' + encodeURIComponent($('.search-box_input_show').val()).replace(/%20/g, '+');
});


$(document).on('submit', '#add-source-form', function (event) {
  var filmId = $(this).data('film-id');
  event.preventDefault();
  error.remove();
  var btn = $(this).children().find('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/film/source/' + filmId + '/add',
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $('<div/>').addClass('over').appendTo('body');
      $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-success">' + res.message + '</div></div>');
      $('#add-source-form')[0].reset();
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});
$(document).on('submit', '#edit-source-form', function (event) {
  var filmId = $(this).data('film-id');
  var id = $(this).data('id');
  event.preventDefault();
  error.remove();
  var btn = $(this).children().find('.button');
  var data = new FormData(this);
  btn.attr('class', 'btn-loading');
  $.ajax({
    url: homeUrl + '/admin/film/source/' + filmId + '/edit/' + id,
    data: data,
    contentType: false,
    cache: false,
    processData: false,
    type: 'POST',
    success: function (res) {
      btn.attr('class', 'button');
      $('<div/>').addClass('over').appendTo('body');
      $('body').append('<div class="login-dialog"><span class="closex"></span><div class="alert alert-success">' + res.message + '</div></div>');
      $('#edit-source-form')[0].reset();
    },
    error: function (err) {
      btn.attr('class', 'button');
      error.text(err.responseJSON.message).appendTo('#result');
    }
  });
});

//play function
function play(source, poster, title) {
  $('#player').children().remove();
  jwplayer('player').setup({
    sources: [{
      file: source.m18,
      type: 'video/mp4',
      label: "480p"
    },
      {
        file: source.m22,
        type: 'video/mp4',
        label: "720p"
      },
      {
        file: source.m36,
        type: 'video/mp4',
        label: "1080p"
      }
    ],
    image: poster,
    title: title
  });
}