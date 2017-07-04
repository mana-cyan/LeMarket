function loadPicture(pictureId, componentId, callback) {
    $.ajax({
        type: 'get',
        url: 'image',
        data: { 'id': pictureId },
        success: function (data) {
            callback(componentId, data)
        },
        error: function() {
            console.log("Cannot load picture")
;        }
    });
}
