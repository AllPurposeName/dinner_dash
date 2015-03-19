$(document).ready(function () {

  (function($) {
    $.fn.flash_message = function(options) {

      options = $.extend({
        text: 'Done',
        time: 1000,
        how: 'before',
        class_name: ''
      }, options);

      return $(this).each(function() {
        if( $(this).parent().find('.flash_message').get(0) )
          return;

        var message = $('<span />', {
          'class': 'flash_message ' + options.class_name,
          text: options.text
        }).hide().fadeIn('fast');

        $(this)[options.how](message);

        message.delay(options.time).fadeOut('normal', function() {
          $(this).remove();
        });

      });
    };
  })(jQuery);


  $("#cat_retire_updater").on('change', function () {
    var $this = $(this);
    var catID = $("[data-cat]").data("cat");
    var newStatus = $this.find("#cat_change_retire option:selected").text();
    $.ajax({
      method: "PUT", 
      data: {
        retired: "change"
      },
      url: '/admin/cats/js/'+catID
    }) 
    .always(function() {
      $('#status-area').flash_message({
        text: 'Updated',
        how: 'append'
      });
    });
  });
});
