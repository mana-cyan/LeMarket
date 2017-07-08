var Panel={};
var url;
var table=$('#table');
Panel.show=function (jsonToNodeHandle) {
    Panel.showTotalPage($('#nextPage').attr('name'));
    Panel.showTurnPage($('#previousPage').attr('name'));
    Panel.showData($('#data').val(),jsonToNodeHandle);
};

Panel.showTotalPage=function (total) {
    var div=$('#count');
    div.html(total);
};

Panel.showTurnPage=function (nowPage) {
    var nodes= Panel.getNodeByAttr(document.getElementsByTagName('ul'),'class','page');
    var temp=nowPage-1;
    for(var i=0;i<nodes.length;++i)
    {
        if(temp<1) temp=1;
        nodes[i].html(temp++);
        nodes[i].href=Panel.getUrl('page',temp);
    }
};

Panel.getNodeByAttr=function(parent,attrName,attrValue) {
    var nodes=[];
    for(var i=0;i<parent.length;++i)
        if($(parent).find(i).attr(attrName)===attrValue) nodes.appendChild($(parent).find(i));
    return nodes;
};

Panel.showData=function (jsonArray,execute) {
    console.log(jsonArray);
    jsonArray=$.parseJSON(jsonArray);
    for(var i=0;i<jsonArray.length;++i)
        table.append(Panel.createNode(jsonArray[i],execute));
};

Panel.createNode=function (jsonObject,execute) {
    return execute(jsonObject);
};

Panel.showNextAndPreviousButton=function (nowPage) {
    var previousPage=nowPage-1;
    var nextPage=nowPage+1;
    var totalPage=$('#count').html();
    if(previousPage<1) previousPage=1;
    $('#previousPageLeap').attr('href',Panel.getUrl('page',previousPage));
    if(nextPage>totalPage) nextPage=totalPage;
    $('#nextPageLeap').attr('href',Panel.getUrl('page',nextPage));
};

Panel.setBaseUrl=function (url) {
    this.url=url;
};

Panel.setTable=function (div) {
    table=div;
};

Panel.getUrl=function (paramsName,paramsValue) {
    if(url.indexOf('?')>0) return url+'&'+paramsName+'='+paramsValue;
    else return url+"?"+paramsName+"="+ paramsValue;
};

