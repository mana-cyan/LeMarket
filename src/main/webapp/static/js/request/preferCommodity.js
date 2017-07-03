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
    console.log(preferObject.image);
    loadPicture(preferObject.image, function (id, path) {
        viewDiv.find("img").attr("src", path);
    });
    viewDiv.find(".c-price").html("￥" + preferObject.price);
    viewDiv.find("h6").html(preferObject.name);
    viewDiv.attr("id", preferObject.id);
}

//批量填充推荐商品数据
function setPreferDetail() {
    getPreferCommodity(function (data) {
        var preferDivs = $(".product-inner");
        for(var i=0; i<data.length; i++){
            preferSet($(preferDivs[i]), data[i]);
        }
    });
}

$(document).ready(setPreferDetail);

//发送商品详情跳转
function detailForward() {
    var id = $(this).attr("id");
    $.ajax({
        type:"get",
        url:"/commodity?id=" + id
    })
}

//设置商品详情跳转请求
function setPreferForward() {
    var preferDivs = $(".product-inner");
    for(var i=0; i<preferDivs.length; i++){
        $(preferDivs[i]).on("click", detailForward);
    }
}

setPreferForward();