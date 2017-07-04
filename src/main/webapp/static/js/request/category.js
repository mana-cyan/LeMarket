function getCategory() {
    $.ajax({
        type: 'get',
        url: 'category',
        success: function (data) {
            var category = data.category;
            var pos = 0;
            for (var key in category) {
                loadPicture(category[key].pictureId, pos, function (id, path) {
                    $($(".banner-img")[id]).find("img").attr('src', path)
                });
                $($(".banner-heading")[pos++]).html(key)
            }
        },
        error: function() {
            console.log("Cannot load category")
        }
    })
}

$(document).ready(getCategory());