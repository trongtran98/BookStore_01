$('.action-view').click(function () {
    var bookId = $(this).attr('bId');
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/books/" + bookId,
        dataType: 'json',
        success: function (book) {
            $('#image-1').children(":first").attr("src", "/img-book/" + book.avatar);
            $('#book-title').text(book.title);
            $('#book-price').text('$' + book.price);
            $('#book-description').text(book.description);
        },
        error: function (e) {
            alert("ERROR: " + e);
        }
    });
});

$('#btn-search').click(function () {
    $('#search-form').submit();
});

$('.add-to-cart').click(function () {
    var bId = $(this).attr('bId');
    var bookId = $(this).attr('bId');
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/carts/add-to-cart/" + bookId,
        dataType: 'text',
        success: function (cart) {
            var cartJs = JSON.parse(cart);
            var totalBook = 0;
            $('.cart-product').remove();
            $.each(cartJs.cartDetails, function (i, obj) {
                totalBook = totalBook + obj.amount;
                $('.mini-cart-sub').prepend('<div class="cart-product">\n' +
                    '                                    <div class="single-cart">\n' +
                    '                                        <div class="cart-img">\n' +
                    '                                            <a href="#"><img src="/img-book/' + obj.book.avatar + '" alt="book"/></a>\n' +
                    '                                        </div>\n' +
                    '                                        <div class="cart-info">\n' +
                    '                                            <h5><a href="#">'+obj.book.title+'</a></h5>\n' +
                    '                                            <p>'+obj.amount+' x $'+obj.book.price+'</p>\n' +
                    '                                        </div>\n' +
                    '                                        <div class="cart-icon">\n' +
                    '                                            <a href="#"><i class="fa fa-remove"></i></a>\n' +
                    '                                        </div>\n' +
                    '                                    </div>\n' +
                    '                                </div>');
            });
            $('#number-in-cart').text(totalBook);
            $('#view-cart').attr('href','/carts/'+cartJs.id);
            $.notify("success!", {type:"success", align:"right", verticalAlign:"top", icon:"close"});
        },
        error: function (e) {
            $.notify("error!", {type:"danger", align:"right", verticalAlign:"top", icon:"close"});
        }
    });
});

$( document ).ready(function() {
    $('#number-in-cart').text($('.single-cart').length);
});