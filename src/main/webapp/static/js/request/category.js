function getCategory() {
    $.ajax({
        type: 'get',
        url: 'category',
        success: function (data) {
            var category = data.category;
            var pos = 0;
            for (var key in category) {
                loadPicture(category[key].pictureId, pos, function (id, path) {
                    var banner_img = $($(".banner-img")[id]);
                    banner_img.attr('href', path);
                    banner_img.find('img').attr('src', path)
                });
                var banner_heading = $($(".banner-heading")[pos++]);
                banner_heading.html(key);
                banner_heading.attr('href', 'getCommodityByCategoryId?categoryId='+category[key].id+'&page=1')
            }
        },
        error: function() {
            console.log("Cannot load category")
        }
    })
}

$(document).ready(getCategory());