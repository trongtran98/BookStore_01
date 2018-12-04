
CKEDITOR.replace('content');

function setQuery(title, avatar, price, id) {
    var structure = " <div class=\"col-lg-3 col-md-4 col-sm-6\">\n" +
        "                                    <!-- single-product-start -->\n" +
        "                                    <div class=\"product-wrapper mb-40\">\n" +
        "                                        <div class=\"product-img\">\n" +
        "                                            <a href=\"#\">\n" +
        "                                                <img src='/img-book/" + avatar + "' alt=\"book\" class=\"primary\">\n" +
        "                                            </a>\n" +
        "                                            <div class=\"quick-view\">\n" +
        "                                                <a class=\"action-view\" href=\"#\" data-target=\"#productModal\"\n" +
        "                                                   data-toggle=\"modal\" title=\"Quick View\">\n" +
        "                                                    <i class=\"fa fa-search-plus\"></i>\n" +
        "                                                </a>\n" +
        "                                            </div>\n" +
        "                                            <div class=\"product-flag\">\n" +
        "                                                <ul>\n" +
        "                                                    <li><span class=\"sale\">new</span></li>\n" +
        "                                                    <li><span class=\"discount-percentage\">-5%</span></li>\n" +
        "                                                </ul>\n" +
        "                                            </div>\n" +
        "                                        </div>\n" +
        "                                        <div class=\"product-details text-center\">\n" +
        "                                            <h4><a href=\"/books/info/${b.id}\">" + title + "</a></h4>\n" +
        "                                            <div class=\"product-price\">\n" +
        "                                                <ul>\n" +
        "                                                    <li>$" + price + "</li>\n" +
        "                                                </ul>\n" +
        "                                            </div>\n" +
        "                                        </div>\n" +
        "                                        <div class=\"product-link\">\n" +
        "                                            <div class=\"product-button\">\n" +
        "                                                <a class=\"add-to-cart\" bId='" + id + "' title=\"Add to cart\"><i\n" +
        "                                                        class=\"fa fa-shopping-cart\"></i>Add to cart</a>\n" +
        "                                            </div>\n" +
        "                                            <div class=\"add-to-link\">\n" +
        "                                                <ul>\n" +
        "                                                    <li><a href=\"product-details.html\" title=\"Details\"><i\n" +
        "                                                            class=\"fa fa-external-link\"></i></a></li>\n" +
        "                                                </ul>\n" +
        "                                            </div>\n" +
        "                                        </div>\n" +
        "                                    </div>\n" +
        "                                    <!-- single-product-end -->\n" +
        "                                    books\n" +
        "                                </div>";
    return structure;
}

var booksJson;

$("#review-submit").click(function (e) {
    e.preventDefault();
    for (instance in CKEDITOR.instances) {
        CKEDITOR.instances[instance].updateElement();
    }
    var data = $('#review-form').serialize();
    CKEDITOR.instances[instance].setData('');
    $('#content').text('');
    $.ajax({
        headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
        method: "POST",
        url: "/reviews/comment",
        dataType: 'json',
        data: data,
        success: function (message) {
            var email = $('#email').val();
            var content = $('#content').val();
            $('#review-form').trigger("reset");
            var now = new Date();
            var nowFormated = now.getDate() + '/' + (now.getMonth() + 1) + '/' + now.getFullYear();
            $('.list-review').append('<div class="review-title">\n' +
                '<p>\n' +
                '<b>' + email + ': </b>' + content +
                '<span style="float:right; padding-right: 50px;">\n' +
                nowFormated +
                '</span>\n' +
                '</p>\n' +
                '</div>');
        },
        error: function (e) {
            alert("ERROR: " + e);
        }
    });
});

function setData(data) {
    booksJson = data;
    var searchData = [];
    $.each(data, function (key, value) {
        searchData.push(value.title)
    });
    $("#tags").autocomplete({
        source: searchData,
        select: function (e, text) {
            console.log(text);
            $.each(booksJson, function (key, value) {
                if (text.item.value.toLowerCase() == value.title.toLowerCase()) {
                    $('#th > .row').empty();
                    var query = setQuery(value.title, value.avatar, value.price, value.id);
                    $('#th > .row').append(query);
                    return false;
                }
            });
        }
    });
}

// $('#on-search').click(function (e) {
//     e.preventDefault();
//     var text = $('#tags').val();
//
// });


