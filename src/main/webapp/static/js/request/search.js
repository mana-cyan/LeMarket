function search() {
    var form = $("<form method='get' action='/search'></form>");
    form.css("display", "none");
    var input1 = $("<input type='text' name='type'>");
    var type = $("#userSearch").find("option:selected").attr("value");
    input1.attr("value", type);
    form.append(input1);
    var input2 = $("<input type='text' name='input'>");
    var searchString = $("#searchString").val();
    if(searchString.trim() === "")
        return;
    input2.attr("value", searchString);
    form.append(input2);
    form.appendTo("body");
    form.submit();
}

$("#search_href").on("click", search);
$("searchString").keyup(search);