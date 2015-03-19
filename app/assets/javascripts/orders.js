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
      })



  })
});
