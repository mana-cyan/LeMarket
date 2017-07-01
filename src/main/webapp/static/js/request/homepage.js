function getCategory() {
    $.ajax({
        type: 'get',
        url: 'category',
        success: function (data) {
            var category = data.category;
            var pos = 0;
            for (var key in category) {
                var id = category[key].pictureId
                var path = loadPicture(id)
                console.log(path)
                $($(".banner-img")[pos++]).find("img").attr('src', path)
            }
            for (var key in category)
                $($(".banner-heading")[pos++]).html(key)

        },
        error: function() {
            console.log("Cannot load category")
        }
    })
}

$(document).ready(getCategory());