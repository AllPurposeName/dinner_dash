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




  var $orders = $('.orders');

  $('#order_filter_status').on('change', function () {
    var currentStatus = this.value;
    $orders.each(function (index, order) {
      $order = $(order);
      if ($order.data("status") === currentStatus || currentStatus === "all") {
        $order.show();
      } else {
        $order.hide();
      }
    });
  });

  $("[data-order]").on('change', function () {
    var $this = $(this);
    var orderID = $this.data("order");
    var newStatus = $this.find("#order_" + orderID + "_change_status option:selected").text();
    $.ajax({
      method: "PUT", 
      data: {
        status: newStatus
      },
      url: '/admin/orders/' + orderID
    }) 
    .always(function(response) {
      $this.data("status", newStatus).attr('data-status', newStatus);
      $('#status-area').flash_message({
        text: 'Updated',
        how: 'append'
      });

    });



  })
});
