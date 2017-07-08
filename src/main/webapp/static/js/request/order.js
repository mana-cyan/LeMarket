

function showByData(div,createNodeHandle) {
    var jsonObject= $.parseJSON($('#data').val());
    for(var i in jsonObject)
        div.append(createNodeHandle(i));
}