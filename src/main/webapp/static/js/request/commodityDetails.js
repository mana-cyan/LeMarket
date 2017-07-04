function loadComponents() {
    var commodityPicture = $('#commodityPicture');
    loadPicture(commodityPicture.attr("name"), function (id, path) {
        commodityPicture.attr('src',  path)
        $('#thumbs').attr('src',  path)
    })
}

$(document).ready(loadComponents());