$(function () {
  $('form').submit(function (data) {
    var form = $(this);
    var errorContainer = form.find('.errors:first');
    $.ajax({
      type: form.attr('method') || 'get',
      url: form.attr('action'),
      data: form.serialize()
    }).done(function (data) {
      window.location = data.location;
    }).fail(function (d) {
      var data = JSON.parse(d.responseText);
      errorContainer.html('');
      console.log(data);
      for (var i=0; i < data.errors.length; i++) {
        var error = $('<div class="error" />');
        error.html(data.errors[i]);
        errorContainer.append(error);
      };
    });
    return false;
  });
});
