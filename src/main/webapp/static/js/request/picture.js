function loadPicture(id) {
    $.ajax({
        type: 'get',
        url: 'image',
        data: { 'id': id },
        success: function (data) {
            console.log(data.path)
            return data.path;
        },
        error: function() {
            console.log("Cannot load picture")
;        }
    })
}