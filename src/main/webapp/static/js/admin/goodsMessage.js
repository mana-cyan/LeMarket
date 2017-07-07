function createNodeByGoods(goods) {
    var node=document.createElement('tr');

    var idColumn=document.createElement('td');
    $(idColumn).html(goods.id);

    var nameColumn=document.createElement('td');
    $(nameColumn).html(goods.name);

    var statusColumn=document.createElement('td');
    $(statusColumn).html(getStatus(goods.status));


    var button=document.createElement('button');
    $(button).attr('status',goods.status);
    $(button).html(getButtonOperationName(goods.status));
    $(button).attr('commodityId',goods.id);
    statusColumn.appendChild(button);
    node.appendChild(idColumn);
    node.appendChild(nameColumn);
    node.appendChild(statusColumn);
    node.appendChild(button);
    return node;
}

function getStatus(status) {
    if(status===0) return '已下架';
    else return '销售中';
}

function setStatus(div,status) {
    div.attr('status',status);
    div.html(getButtonOperationName(status));
}

function getButtonOperationName(status) {
    if(status===0) return '上架商品';
    else return '下架商品';
}

function onPageReady() {
    Panel.setBaseUrl('admin/goods');
    Panel.show(createNodeByGoods);
}

function operationDo(div) {
   var containStatusAttr= div.hasAttribute('status');
   if(containStatusAttr)
   {
       $.ajax(
           {
               type: 'post',
               url:'admin/goods/status',
               data: {id:div.attr('commodityId')},
               success: function (response) {
                   if(response.status==='SUCCESS')
                       setStatus(div,Math.abs(div.attr('status')-1));
                   else if(response.status==='ERROR')
                       console.log('用户名不存在');
                   else if(response.st==='LOGOUT')
                       window.location.href='admin/login';
               }
           }
       )
   }
}

$(document).ready(onPageReady);
$(document).click(operationDo);


