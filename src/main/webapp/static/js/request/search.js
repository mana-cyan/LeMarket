function search() {
    var form = $("<form method='get' action='/search'></form>");
    form.css("display", "none");
    var searchType = $("<input type='text' name='searchType'>");
    var type = $("#userSearch").find("option:selected").val();
    searchType.attr("value", type);
    form.append(searchType);
    var input = $("<input type='text' name='input'>");
    var searchString = $("#searchString").val();
    if(searchString.trim() === "")
        return;
    input.attr("value", searchString);
    form.append(input);
    form.appendTo("body");
    form.submit();
}

$("#search_href").on("click", search);

function loadResult() {
    var data = $('#searchList').attr('value');
    console.log(data[0])
}

$(document).ready(loadResult);