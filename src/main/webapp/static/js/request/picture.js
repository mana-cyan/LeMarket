function loadPicture(id, callback) {
    $.ajax({
        type: 'get',
        url: 'image',
        data: { 'id': id },
        success: function (data) {
            callback(id, data)
        },
        error: function() {
            console.log("Cannot load picture")
;        }
    });
}
