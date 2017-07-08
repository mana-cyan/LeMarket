function createNodeByNewOrder(item) {
    var node=$(
        '<tr>'+
        '<td><a href="commodityDetails"><img src="" style="width:80%;height:50%;"></a></td>'+
        '<td><span>'+item.name+'</span></td>'+
        '<td><span>'+item.type+'</span></td>'+
        '<td><span>'+item.address+'</span></td>'+
        '<td><h4>￥'+item.price+'</h4></td> <td>'+
        '<div class="btn-group" role="group" aria-label="...">'+
        '<button type="button" class="btn btn-default">发货</button>'+
        '<button type="button" class="btn btn-default">删除</button>'+
        '</div></td></tr>'
    );

    loadPictureByCommodityId(item.commodityId,function (path) {
        node.find("img").attr("src", path);
    });

    return node;
}
function onPageReady() {
    var div=$('#table');
    showByData(div,createNodeByNewOrder);
}
$(document).ready(onPageReady);