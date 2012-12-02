$(function () {
  $('form').keypress(function (e) {
    if (e.which == 13) {
      e.preventDefault();
      $(this).submit();
    }
  });
  $('.vote > a').click(function (e) {
    $.post($(this).attr('href'), function (data) {
      for (var i = 0; i<data.options.length; i++) {
        var option = data.options[i];
        var obj = $('#option' + option.id);
        obj.addClass('admin');
        obj.removeClass('vote');
        obj.html(option.text + '&nbsp;' + '(' + option.count + ')');
      }
    });
    return false;
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
      var form = $(e).parents('form.people:first');

      if ($(e).data('loaded')) {
        //$(e).parents('form:first').submit();
      }
    }
  });
  $('.taggables').data('loaded', 'true');

});
