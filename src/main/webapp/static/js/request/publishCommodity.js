var commodityName = $('#commodityName');
var commodityDescription = $('#commodityDescription');
var commodityTypes = $('#commodityTypes');
var commodityPrice = $('#commodityPrice');
var commodityStorage = $('#commodityStorage');
var commodityPicture = $('#commodityPicture');

function getCategory() {
    $.ajax({
        type: 'get',
        url: 'getCategoryId',
        data: { 'name': $('#commodityCategory').val() },
        success: function (categoryId) {
            getShopId(categoryId)
        },
        error: function () {
            console.log('Category not found!');
            alert('没有此分类')
        }
    })
}

function getShopId(categoryId) {
    $.ajax({
        type: 'get',
        url: 'getShop',
        headers: { 'token': Cookie.getToken() },
        success: function (shop) {
            addCommodity(categoryId, shop.id)
        },
        error: function () {
            console.log('Cannot get shop info');
        }
    })
}

function savePicture() {

}

function addCommodity(category, shopId) {
    var commodity = {
        'category': category,
        'shop': shopId,
        'name': commodityName.val(),
        'storage': commodityStorage.val(),
        'price': commodityPrice.val(),
        'details': commodityDescription.val(),
        'image': 1,
        'status': 1
    };
    $.ajax({
        type: 'post',
        url: 'addCommodity',
        data: commodity,
        headers: { 'token': Cookie.getToken() },
        success: function (id) {
            addCommodityType(id)
        },
        error: function () {
            console.log('Cannot add commodity');
        }
    })
}

function addCommodityType(commodityId) {
    var types = commodityTypes.find('input');
    var status = true;
    for (var i = 0; i < types.length; i++) {
        $.ajax({
            type: 'post',
            url: 'addCommodityType',
            data: {
                'id': commodityId,
                'type': $(types[i]).val()
            },
            headers: { 'token': Cookie.getToken() },
            success: function (data) {
                console.log('保存成功')
            },
            error: function () {
                status = false;
                console.log('Cannot add commodity type')
            }
        });
    }
    if (status) alert('保存成功')
}


function editType() {
    commodityTypes.find('#add').remove();
    commodityTypes.append('<td><input type="text" class="form-control" placeholder="型号"></td>');
    commodityTypes.append('<td id="add"><button class="btn btn-primary" onclick="editType()">添加</button></td>')
}