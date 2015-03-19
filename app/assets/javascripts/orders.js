$(document).ready(function () {

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

});
