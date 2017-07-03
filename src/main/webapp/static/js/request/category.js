function getCategory() {
    $.ajax({
        type: 'get',
        url: 'category',
        success: function (data) {
            var category = data.category;
            var pos = 0;
            for (var key in category) {
                $($(".banner-img")[pos]).find("img").attr('src', loadPicture(category[key].pictureId));
                $($(".banner-heading")[pos++]).html(key)
            }
        },
        error: function() {
            console.log("Cannot load category")
        }
    })
}

$(document).ready(getCategory());