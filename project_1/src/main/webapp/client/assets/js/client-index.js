$('.action-view').click(function () {
    var bookId = $(this).attr('bId');
    $.ajax({
        type: "GET",
        contentType: "application/json",
        url: "/books/" + bookId,
        dataType: 'json',
        success: function (book) {
            genarateImage(book);
            $('#book-title').text(book.title);
            $('#book-price').text('$' + book.price);
            $('#book-description').text(book.description);

        },
        error: function (e) {
            alert("ERROR: " + e);
        }
    });
});

function genarateImage(book) {
    let url = book.avatar;
    let arrayUrl = url.split('#');
    for (let i = 0; i < arrayUrl.length; i++) {
        if (i == 0) {
            $('#bigImage').append("<div class=\"tab-pane active\" id=\"image-" + i + "\">\n" +
                "                                    <img src=\""+ arrayUrl[i] +"\" alt=\"\"/>\n" +
                "                                </div>");
            $('#smallImage').append("<a class=\"active\" href=\"#image-" + i +"\"><img src=\"\"+ arrayUrl[i] +\"\" alt=\"\"/></a>");
        }
        else {
            $('#bigImage').append("<div class=\"tab-pane\" id=\"image-" + i + "\">\n" +
                "                                    <img src=\""+ arrayUrl[i] +"\" alt=\"\"/>\n" +
                "                                </div>");
            $('#smallImage').append("<a href=\"#image-" + i +"\"><img src=\"\"+ arrayUrl[i] +\"\" alt=\"\"/></a>")
        }
    }
};

$('#btn-search').click(function () {
    $('#search-form').submit();
});

$('.add-to-cart').click(function () {
    var bookId = $(this).attr('bId');
    $.ajax({
        type: "GET",
        url: "/carts/add-to-cart/" + bookId,
        success: function (cart) {
            // var cartJs = JSON.parse(cart);
            var totalBook = 0;
            $('.cart-product').remove();
            $.each(cart.cartDetails, function (i, obj) {
                totalBook = totalBook + obj.amount;
                $('.mini-cart-sub').prepend('<div class="cart-product">\n' +
                    '                                    <div class="single-cart">\n' +
                    '                                        <div class="cart-img">\n' +
                    '                                            <a href="#"><img src="' + splitImage(obj.book.avatar) + '" alt="book"/></a>\n' +
                    '                                        </div>\n' +
                    '                                        <div class="cart-info">\n' +
                    '                                            <h5><a href="#">' + obj.book.title + '</a></h5>\n' +
                    '                                            <p>' + obj.amount + ' x $' + obj.book.price + '</p>\n' +
                    '                                        </div>\n' +
                    '                                        <div class="cart-icon">\n' +
                    '                                            <a href="#"><i class="fa fa-remove"></i></a>\n' +
                    '                                        </div>\n' +
                    '                                    </div>\n' +
                    '                                </div>');
            });
            $('#number-in-cart').text(totalBook);
            $('#view-cart').attr('href', '/carts/' + cart.id);
            $.notify("success!", {type: "success", align: "right", verticalAlign: "top", icon: "close"});
            displayMiniCart();
        },
        error: function (e) {
            $.notify("error!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});
        }
    });
});

function splitImage(stringImage){
    let url = stringImage
    let arrayUrl = url.split('#');
    return arrayUrl[0];
}
$(document).ready(function () {
    $('#number-in-cart').text($('.single-cart').length);
});