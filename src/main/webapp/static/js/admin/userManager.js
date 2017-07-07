function createNodeWithUser(user) {
    console.log(user.id);
    var node=document.createElement('tr');

    var idColumn=document.createElement('td');
    $(idColumn).html(user.id);

    var nameColumn=document.createElement('td');
    $(nameColumn).html(user.username);

    var fixColumn=document.createElement('td');
    var button=document.createElement('button');
    $(button).html('重置密码');
    fixColumn.appendChild(button);
    node.appendChild(idColumn);
    node.appendChild(nameColumn);
    node.appendChild(fixColumn);

    return node;
}

function onPageReady() {
    Panel.setBaseUrl('admin/user');
    Panel.show(createNodeWithUser);
}

$(document).ready(onPageReady);