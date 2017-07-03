//获取初始推荐商品数据
function getPreferCommodity() {
    var prefer = undefined;
    $.ajax({
        type:'get',
        url:'prefer',
        dataType:'json',
        success:function (data) {
            prefer = data;
        },
        error:function () {
            console.log('get prefer data error');
        }
    });
    return prefer;
}

//设置初始推荐商品
function preferSet(viewDiv, preferObject) {
    console.log(preferObject.id);
    viewDiv.find("img").attr("src", "/image?id=" + preferObject.id);
    viewDiv.children(".pricing .list-inline .pull-right").child(".c-price").html("￥" + preferObject.price);
    viewDiv.children(".pricing .list-inline .pull-right").child(".p-price").html( "￥" + gitparseInt( preferObject.price * 1.2));
    viewDiv.find("h6").html(preferObject.name);
    viewDiv.attr("id", preferObject.id);
}

//批量填充推荐商品数据
function setPreferDetail() {
    var preferData = getPreferCommodity();
    var preferDivs = $(".product-inner");
    for(var i=0; i<preferData.length; i++){
        preferSet($(preferDivs[i]), preferData[i]);
    }
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