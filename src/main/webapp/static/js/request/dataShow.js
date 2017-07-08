function createNodeWithItem(item) {
    var type=$("#type").val();
    console.log(type);
    if(type==='0') //代表商品
        return createNodeWithCommodity(item);
    else
        return createNodeWIthShop(item);
}

function createNodeWithCommodity(commodity) {
    console.log('commodity');
    var nodeTemplate = $("<div class='product-inner col-md-3'>" +
        "<a href='commodityDetails?id='" + commodity.id + ">" +
        "<div class='product-img b-img'>" +
        "<img src='' alt=''>" +
        "</div>" +
        "</a>" +
        "<span class='product-tag text-uppercase orang-bg' style='margin-left:14px;'>-0%</span>" +
        "<div class='product-text'>" +
        "<ul class='pull-left list-inline ratings'>" +
        "<li><i class='rated fa fa-star'></i></li>" +
        "<li><i class='rated fa fa-star'></i></li>" +
        "<li><i class='rated fa fa-star'></i></li>" +
        "<li><i class='rated fa fa-star'></i></li>" +
        "<li><i class='rated fa fa-star'></i></li>" +
        "</ul>" +
        "<ul class='pricing list-inline pull-right'>" +
        "<li class='text-right p-price'>$" + commodity.price + "</li>" +
        "</ul>" +
        "<div class='clear'></div>" +
        "<h6 class='product-name'>" +
        "<a href='commodityDetails?id='" + commodity.id + " title='Eletria ostma'>" + commodity.name + "</a>" +
        "</h6> </div> </div>");
    loadPicture(commodity.image, null, function (id, path) {
        nodeTemplate.find("img").attr("src", path);
    });
    return nodeTemplate;
}
function createNodeWIthShop(shop) {

}

function onPageReady() {
    var categoryId=$('#categoryId').val();
    Panel.setBaseUrl("getCommodityByCategoryId?categoryId="+categoryId);
    Panel.setTable($('#table'));
    Panel.show(createNodeWithItem);
}

$(document).ready(onPageReady);