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
            $('#book-price').text('$'+book.price);
            $('#book-description').text(book.description);
        },
        error: function (e) {
            alert("ERROR: "+ e);
        }
    });
});

$('#btn-search').click(function () {
   $('#search-form').submit();
});