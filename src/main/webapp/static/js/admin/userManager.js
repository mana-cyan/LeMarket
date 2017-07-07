function createNodeWithUser(user) {
    console.log(user.id);
    var node=document.createElement('tr');

    var idColumn=document.createElement('td');
    $(idColumn).html(user.id);

    var nameColumn=document.createElement('td');
    $(nameColumn).html(user.username);

    var fixColumn=document.createElement('td');
    var button=document.createElement('button');
    $(button).attr('userId',user.id);
    $(button).html('重置密码');
    $(button).on('click',resetPassword);
    fixColumn.appendChild(button);
    node.appendChild(idColumn);
    node.appendChild(nameColumn);
    node.appendChild(fixColumn);

    return node;
}

function resetPassword() {
    $.ajax(
        {
            type: 'post',
            url: '/resetPassword',
            data: {id:$(this).attr('userId')},
            success: function (response) {
                if(response.status==='SUCCESS')
                    alert('重置成功，初始密码为123456');
                else
                    alert('重置失败');
            }
        }
    )
}

function onPageReady() {
    Panel.setBaseUrl('admin/user');
    Panel.show(createNodeWithUser);
}

$(document).ready(onPageReady);