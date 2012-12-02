$(function() {
  $('a').click(function() {
    var link = $(this);
    var target = $('#'+link.data('target'));
    if (target.html().length === 0) {
      $.get(link.attr('href'), function(data) {
        target.html(data);
      });
    } else {
      target.html('');
    }
    return false; //never do this
  });
})
