$(function () {
  $('form').keypress(function (e) {
    if (e.which == 13) {
      e.preventDefault();
      $(this).submit();
    }
  });
  $('form').submit(function (data) {
    var form = $(this);
    var errorContainer = form.find('.errors:first');
    $.ajax({
      type: form.attr('method') || 'get',
      url: form.attr('action'),
      data: form.serialize()
    }).done(function (data) {
      if (data.location) {
        window.location = data.location;
      }
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
  $('.taggables').tagsInput({
    width:'90%',
    height:'70px',
    onChange: function(e) {
      var form = $(e).parents('form:first');

      if ($(e).data('loaded')) {
        if (form.data('first-change') === 'yes') {
          form.data('first-change', 'no');
        } else {
          $(e).parents('form:first').submit();
        }
      }
    }
  });
  $('.taggables').data('loaded', 'true');

});
