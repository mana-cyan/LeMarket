function loadPicture(pictureId, componentId, callback) {
    $.ajax({
        type: 'get',
        url: 'image',
        data: { 'id': pictureId },
        success: function (data) {
            callback(componentId, data)
        },
        error: function() {
            console.log("Cannot load picture");
        }
    });
}

function loadPictureByCommodityId(commodityId,callback) {
    $.ajax({
        type: 'get',
        url: '/image/commodity',
        data: { 'id': commodityId },
        success: function (data) {
            callback(data)
        },
        error: function() {
            console.log("Cannot load picture");
        }
    });
}
