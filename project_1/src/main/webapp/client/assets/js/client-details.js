$("#review-submit").click(function () {
    var data = $('#review-form').serialize();
    $.ajax({
        headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
        method: "POST",
        url: "/review/comment",
        dataType: 'json',
        data: data,
        success: function (message) {
            var email = $('#email').val();
            var content = $('#content').val();
           $('#review-form').trigger("reset");
           var now = new Date();
            var nowFormated = now.getDate() + '/' + (now.getMonth() + 1) + '/' +  now.getFullYear();
           $('.list-review').append('<div class="review-title">\n' +
               '<p>\n' +
               '<b>'+email+': </b>' +content+
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


