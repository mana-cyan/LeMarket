//获取初始推荐商品数据
function getPreferCommodity(callback) {
    $.ajax({
        type:'get',
        url:'prefer',
        dataType:'json',
        success:function (data) {
            callback(data)
        },
        error:function () {
            console.log('get prefer data error');
        }
    });
}

//设置初始推荐商品
function preferSet(viewDiv, preferObject) {
    loadPicture(preferObject.image, null, function (id, path) {
        viewDiv.find("img").attr("src", path);
    });
    viewDiv.find(".c-price").html("￥" + preferObject.price);
    viewDiv.find("h6").html(preferObject.name);
    viewDiv.find('a').attr('href', '/commodityDetails?id='+preferObject.id)
}

//批量填充推荐商品数据
function setPreferDetail() {
    getPreferCommodity(function (data) {
        var preferDivs = $(".product-inner");
        for(var i=0; i<data.length; i++){
            preferSet($(preferDivs[i]), data[i]);
        }
        for (var i = data.length; i < preferDivs.length; i++)
            $(preferDivs[i]).remove();
    });
}

$(document).ready(setPreferDetail);
