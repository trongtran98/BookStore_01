function setQuery(title, avatar, price, id) {
    var structure = " <div class=\"col-lg-3 col-md-4 col-sm-6\">\n" +
        "                                    <!-- single-product-start -->\n" +
        "                                    <div class=\"product-wrapper mb-40\">\n" +
        "                                        <div class=\"product-img\">\n" +
        "                                            <a href=\"#\">\n" +
        "                                                <img src='" +splitImage(avatar)+ "' alt=\"book\" class=\"primary\">\n" +
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
        "                                            <h4><a href=\"/books/info/"+id+">" + title + "</a></h4>\n" +
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
        "                                </div>";
    return structure;
}


function setQueryList(title, avatar, price, id, des) {
    var structure = "<div class=\"single-shop mb-30\">\n" +
        "                                <div class=\"row\">\n" +
        "                                    <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-12\">\n" +
        "                                        <div class=\"product-wrapper-2\">\n" +
        "                                            <div class=\"product-img\">\n" +
        "                                                <a href=\"#\">\n" +
        "                                                    <img src='"+splitImage(avatar)+"' alt='book' class='primary'>\n" +
        "                                                </a>\n" +
        "                                            </div>\n" +
        "                                        </div>\n" +
        "                                    </div>\n" +
        "                                    <div class=\"col-lg-8 col-md-8 col-sm-8 col-xs-12\">\n" +
        "                                        <div class=\"product-wrapper-content\">\n" +
        "                                            <div class=\"product-details\">\n" +
        "                                                <h4><a href=\"/books/info/${b.id}\">"+title+"</a></h4>\n" +
        "                                                <div class=\"product-price\">\n" +
        "                                                    <ul>\n" +
        "                                                        <li>$"+price+"</li>\n" +
        "                                                    </ul>\n" +
        "                                                </div>\n" +
        "                                                <p>"+des+"</p>\n" +
        "                                            </div>\n" +
        "                                            <div class=\"product-link\">\n" +
        "                                                <div class=\"product-button\">\n" +
        "                                                    <a href=\"#\" class=\"add-to-cart\" bId="+id+" title=\"Add to cart\"><i\n" +
        "                                                            class=\"fa fa-shopping-cart\"></i>Add\n" +
        "                                                        to cart</a>\n" +
        "                                                </div>\n" +
        "                                                <div class=\"add-to-link\">\n" +
        "                                                    <ul>\n" +
        "                                                        <li><a href=\"product-details.html\" title=\"Details\"><i\n" +
        "                                                                class=\"fa fa-external-link\"></i></a></li>\n" +
        "                                                    </ul>\n" +
        "                                                </div>\n" +
        "                                            </div>\n" +
        "                                        </div>\n" +
        "                                    </div>\n" +
        "                                </div>\n" +
        "                            </div>"
    return structure;
}

$('#pagination-demo').twbsPagination({
    totalPages: $('#pages').val(),
    visiblePages: 4,
    next: 'Next',
    prev: 'Prev',
    onPageClick: function (event, page) {
        var url = new URL(window.location.href);
        var bookName = url.searchParams.get("bookName") == '' ? '%20' : url.searchParams.get("bookName");
        $.ajax({
            type: 'GET',
            url: '/books/pages/' + page + '/' + bookName,
            dataType: "json",
            success: function (data) {
                $('#th > .row').empty();
                $('#list').empty();

                $.each(data, function (key, value) {
                    $('#th > .row').append(" <div class=\"col-lg-3 col-md-4 col-sm-6\">\n" +
                        "                                    <!-- single-product-start -->\n" +
                        "                                    <div class=\"product-wrapper mb-40\">\n" +
                        "                                        <div class=\"product-img\">\n" +
                        "                                            <a href=\"#\">\n" +
                        "                                                <img src='" + splitImage(value.avatar) + "' alt=\"book\" class=\"primary\">\n" +
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
                        "                                            <h4><a href=\"/books/info/${b.id}\">" + value.title + "</a></h4>\n" +
                        "                                            <div class=\"product-price\">\n" +
                        "                                                <ul>\n" +
                        "                                                    <li>$" + value.price + "</li>\n" +
                        "                                                </ul>\n" +
                        "                                            </div>\n" +
                        "                                        </div>\n" +
                        "                                        <div class=\"product-link\">\n" +
                        "                                            <div class=\"product-button\">\n" +
                        "                                                <a class=\"add-to-cart\" bId='" + value.id + "' title=\"Add to cart\"><i\n" +
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
                        "                                    \n" +
                        "                                </div>");

                    $('#list').append(" <div class='single-shop mb-30'>\n" +
                        "<div class='row'>\n" +
                        "<div class='col-lg-4 col-md-4 col-sm-4 col-xs-12'>\n" +
                        "<div class='product-wrapper-2'>\n" +
                        "<div class='product-img'>\n" +
                        "<a href='#'>\n" +
                        "<img src='" + value.avatar + "' alt='book' class='primary'>\n" +
                        "</a>\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "<div class='col-lg-8 col-md-8 col-sm-8 col-xs-12'>\n" +
                        "<div class='product-wrapper-content'>\n" +
                        "<div class='product-details'>\n" +
                        "<h4><a href='/books/info/" + value.id + "'>" + value.title + "</a></h4>\n" +
                        "<div class='product-price'>\n" +
                        "<ul>\n" +
                        "<li>$" + value.price + "</li>\n" +
                        "</ul>\n" +
                        "</div>\n" +
                        "<p>" + value.description + "</p>\n" +
                        "</div>\n" +
                        "<div class='product-link'>\n" +
                        "<div class='product-button'>\n" +
                        "<a href='#' class='add-to-cart' bId='" + value.id + "' title='Add to cart'><i\n" +
                        "class='fa fa-shopping-cart'></i>Add\n" +
                        "to cart</a>\n" +
                        "</div>\n" +
                        "div class='add-to-link'>\n" +
                        "<ul>\n" +
                        "<li><a href='product-details.html' title='Details'><i\n" +
                        "class='fa fa-external-link'></i></a></li>\n" +
                        "</ul>\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "</div>\n" +
                        "</div>");
                });
                var searchData = [];
                $.each(data, function (key, value) {
                    searchData.push(value.title)
                });
                $("#tags").autocomplete({
                    source: searchData,
                    select: function (e, text) {
                        $.each(data, function (key, value) {
                            if (text.item.value.toLowerCase() == value.title.toLowerCase()) {
                                $('#th > .row').empty();
                                $('#list').empty();
                                var query = setQuery(value.title, value.avatar, value.price, value.id);
                                $('#th > .row').append(query);
                                var queryList = setQueryList(value.title, value.avatar, value.price, value.id, value.description)
                                $('#list').append(queryList);
                                return false;
                            }
                        });
                    }
                });
            }
            , error: function (data) {
                alert(data);
            }
        });
    }
});

