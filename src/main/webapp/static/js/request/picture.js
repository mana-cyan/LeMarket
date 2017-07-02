function loadPicture(id) {
    var path;
    $.ajax({
        async: false,
        type: 'get',
        url: 'image',
        data: { 'id': id },
        success: function (data) {
            path = data;
        },
        error: function() {
            console.log("Cannot load picture")
;        }
    })
    return path
}