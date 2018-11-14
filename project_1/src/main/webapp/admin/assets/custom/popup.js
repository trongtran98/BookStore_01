var modal = $('#id01')[0];
var modal1 = $('#id02')[0];
var id, name, description;

window.onclick = function (event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
    if (event.target == modal1) {
        modal1.style.display = "none";
    }
}

function editAuthor(id, name, description) {
    this.id = id;
    this.name = name;
    this.description = description;
    modal1.style.display = 'block';
    $('#id2').val(id);
    $('#name2').val(name);
    $('#description2').val(description);
}

$(document).on('submit', '#idForm2', function (e) {
    var frm = $('#idForm2');
    e.preventDefault();

    var Form = this;
    var data = {};

    $.each(this, function (i, v) {
        var input = $(v);
        data[input.attr("name")] = input.val();
        delete data["undefined"];
    });
    if (data.fullName != name || data.description != description){
        $.ajax({
            headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            type: 'PUT',
            url: '/admin/authors/edit',
            data: JSON.stringify(data),
            success: function (data) {
                location.reload();
            },
            error: function (callback) {
                $.notify("Alert!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});
            }
        });
    }else $.notify("Error!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});

});

$(document).on('submit', '#idForm', function (e) {
    var frm = $('#idForm');
    e.preventDefault();

    var Form = this;
    var data = {};

    $.each(this, function (i, v) {
        var input = $(v);
        data[input.attr("name")] = input.val();
        delete data["undefined"];
    });

    $.ajax({
        headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        type: 'POST',
        url: '/admin/authors/create',
        data: JSON.stringify(data),
        success: function (data) {
            location.reload();
        },
        error: function (callback) {
            $.notify("Alert!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});
        }
    });
});
