var $pathname = window.location.pathname;
var $arr = $pathname.split('/');
$('#section2').hide();



function readURL(input) {
    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $('.image-upload-wrap').hide();

            $('.file-upload-image').attr('src', e.target.result);
            $('.file-upload-content').show();

            $('.image-title').html(input.files[0].name);
        };

        reader.readAsDataURL(input.files[0]);

    } else {
        removeUpload();
    }
}

function removeUpload() {
    $('.file-upload-input').replaceWith($('.file-upload-input').clone());
    $('.file-upload-content').hide();
    $('.image-upload-wrap').show();
}

$('.image-upload-wrap').bind('dragover', function () {
    $('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function () {
    $('.image-upload-wrap').removeClass('image-dropping');
});

function edit(key) {
    $.ajax({
        type: 'GET',
        url: $arr[2] + '/' + key,
        dataType: "json",
        success: function (data) {
            if (data) {   // DO SOMETHING
                $.getJSON($arr[2] + '/' + key, function (data) {
                    for (var i in data) {
                        $('#' + i).val(data[i]);
                    }
                });
                $('#button-add').hide();
                $('#button-edit').show();
                displayBook(true);
            } else { // DO SOMETHING }
                $.notify("Error!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});
            }
        }
    });
}

function add() {
    $('#button-add').show();
    $('#button-edit').hide();
    $('#section1').hide();
    $('#section2').show();
    $('#idForm')[0].reset();
}

function displayBook() {
    $('#section1').hide();
    $('#section2').show();
}
function cancel() {
    $('#section1').show();
    $('#section2').hide();
}

$('#button-add').click(function() { // changed
    let $pathname = window.location.pathname;
    let $arr = $pathname.split('/');
    var data = $('#idForm').getForm2obj();
    $.ajax({
        headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
        type: "POST",
        contentType : 'application/json; charset=utf-8',
        dataType: "json",
        url: $arr[2],
        data: JSON.stringify(data),
        success: function (data) {
            location.reload();
        },
        error: function (callback) {
            $.notify("Alert!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});
        }
    });
});

$('#button-edit').click(function() { // changed
    let $pathname = window.location.pathname;
    let $arr = $pathname.split('/');
    var data = $('#idForm').getForm2obj();
    //var data = $('#idForm').serialize();
    $.ajax({
        headers: {"X-CSRF-TOKEN": $("input[name='_csrf']").val()},
        type: "PUT",
        contentType : 'application/json; charset=utf-8',
        dataType: "text",
        url: $arr[2],
        data: JSON.stringify(data),
        //data: data,
        success: function (data) {
            location.reload();
        },
        error: function (callback) {
            $.notify("Alert!", {type: "danger", align: "right", verticalAlign: "top", icon: "close"});
        }
    });
});

//Get json object from form
(function($){
    $.fn.getForm2obj = function(){
        var _ = {},_t=this;
        this.c = function(k,v){ eval("c = typeof "+k+";"); if(c == 'undefined') _t.b(k,v);}
        this.b = function(k,v,a = 0){ if(a) eval(k+".push("+v+");"); else eval(k+"="+v+";"); };
        $.map(this.serializeArray(),function(n){
            if(n.name.indexOf('[') > -1 ){
                var keys = n.name.match(/[a-zA-Z0-9_]+|(?=\[\])/g),le = Object.keys(keys).length,tmp = '_';
                $.map(keys,function(key,i){
                    if(key == ''){
                        eval("ale = Object.keys("+tmp+").length;");
                        if(!ale) _t.b(tmp,'[]');
                        if(le == (i+1)) _t.b(tmp,"'"+n['value']+"'",1);
                        else _t.b(tmp += "["+ale+"]",'{}');
                    }else{
                        _t.c(tmp += "['"+key+"']",'{}');
                        if(le == (i+1)) _t.b(tmp,"'"+n['value']+"'");
                    }
                });
            }else _t.b("_['"+n['name']+"']","'"+n['value']+"'");
        });
        return _;
    }
})(jQuery);




function readURL(input) {
    if (input.files && input.files[0]) {

        var reader = new FileReader();

        reader.onload = function (e) {
            $('.image-upload-wrap').hide();

            $('.file-upload-image').attr('src', e.target.result);
            $('.file-upload-content').show();

            $('.image-title').html(input.files[0].name);
        };

        reader.readAsDataURL(input.files[0]);

    } else {
        removeUpload();
    }
}

function removeUpload() {
    $('.file-upload-input').replaceWith($('.file-upload-input').clone());
    $('.file-upload-content').hide();
    $('.image-upload-wrap').show();
}

$('.image-upload-wrap').bind('dragover', function () {
    $('.image-upload-wrap').addClass('image-dropping');
});
$('.image-upload-wrap').bind('dragleave', function () {
    $('.image-upload-wrap').removeClass('image-dropping');
});
