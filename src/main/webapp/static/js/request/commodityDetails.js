function loadType(id, callback) {
    $.ajax({
        type: 'get',
        url: 'getCommodityType',
        data: { 'id': id },
        success: function (data) {
            callback(data)
        },
        error: function () {
            console.log("Cannot load Commodity Type!")
        }
    })
}

function loadComment(id, page, callback) {
    $.ajax({
        type: 'get',
        url: 'getComment',
        data: { 'id': id, 'page': page },
        success: function (data) {
            callback(data)
        },
        error: function () {
            console.log("Cannot load Comments")
        }
    })
}

function loadSameCategory(id, callback) {
    $.ajax({
        type: 'get',
        url: 'sameCategoryByCommodityId',
        data: { 'id': id },
        success: function (data) {
            callback(data)
        },
        error: function () {
            console.log('Cannot load Same Catogory')
        }
    })
}

function loadComponents() {

    //Load Commodity Picture
    var commodityPicture = $('#commodityPicture');
    loadPicture(commodityPicture.attr('name'), function (id, path) {
        commodityPicture.attr('src',  path);
        $('#thumbs').attr('src',  path)
    });

    //Load Commodity Type
    var type = $('#type');
    loadType(commodityPicture.attr('cid'), function (data) {
        data.forEach(function (e) {
            type.append('<div class="col-md-2"><button type="button" class="btn btn-default" data-toggle="tooltip">'+e+'</button></div>')
        })
    });

    //Load Commodity Comments
    var comment = $('#info-show');
    loadComment(commodityPicture.attr('cid'), 1, function (data) {
        data.forEach(function (e) {
            var date = new Date(e.time);
            var time_str = date.getFullYear()+'年'+date.getMonth()+'月'+date.getDay()+'日';
            comment.find('ul').append(
                '<li>' +
                    '<div class="head-face">' +
                        '<a href=""><img src="/static/images/huoying.jpg" /></a>' +
                    '</div>' +
                    '<div class="reply-cont">' +
                        '<a href=""><p class="username">' + e.user.username + '</p></a>' +
                        '<p class="comment-body">' + e.content + '</p>' +
                        '<p class="comment-footer">' + time_str +'</p>' +
                    '</div>' +
                '</li>'
            )
        })
    })
}

$(document).ready(loadComponents());