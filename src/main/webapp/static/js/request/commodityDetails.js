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
        data: { 'commodityId': id },
        success: function (data) {
            callback(data)
        },
        error: function () {
            console.log('Cannot load Same Catogory')
        }
    })
}

var commodityPicture = $('#commodityPicture');
var pictureId = commodityPicture.attr('name');
var commodityId = commodityPicture.attr('cid');

function loadComponents() {

    //Load Commodity Picture
    loadPicture(pictureId, null, function (id, path) {
        commodityPicture.attr('src', path);
        $('#thumbs').attr('src',  path)
    });

    //Load Commodity Type
    loadType(commodityId, function (data) {
        data.forEach(function (e) {
            $('#type').append('<div class="col-md-2"><button type="button" class="btn btn-default" data-toggle="tooltip">'+e+'</button></div>')
        })
    });

    //Load Commodity Comments
    var comment = $('#info-show');
    loadComment(commodityId, 1, function (data) {
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
    });

    //Load Same Category
    var products = $('.product-inner');
    loadSameCategory(commodityPicture.attr('cid'), function (data) {
        for (var p in data) {
            console.log(p);
            loadPicture(data[p].image, p, function (id, path) {
                $(products[id]).find('img').attr('src', path)
            });
            $(products[p]).find('.c-price').html(data[p].price);
            $(products[p]).find('.product-name').find('a').html(data[p].name);
            $(products[p]).find('a').attr('href', 'commodityDetails?id='+data[p].id)
        }
        for (var i = data.length; i < products.length; i++)
            $(products[i]).remove()
    })

}

$(document).ready(loadComponents());