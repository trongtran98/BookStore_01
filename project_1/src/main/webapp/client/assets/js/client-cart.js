$('#update-cart').click(function () {
    $('#cart-form').attr('action', '/carts/update');
    $('#cart-form').attr('method', 'post');
    $('#cart-form').submit();
});

$('#purchase').click(function () {
    $('#cart-form').attr('action', '/orders/purchase');
    $('#cart-form').attr('method', 'post');
    $('#cart-form').submit();
});