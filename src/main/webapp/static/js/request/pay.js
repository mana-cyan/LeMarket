var receiverName = $('#receiverName');
var receiverAddress = $('#receiverAddress');
var receiverPhoneNumber = $('#receiverPhoneNumber');

// function loadReceiveInfo() {
//     $.ajax({
//         type: 'get',
//         url: 'getAllAddress',
//         headers: { 'token': Cookie.getToken() },
//         success: function (data) {
//             if (data !== undefined && data.length !== 0) {
//                 var address = $(data[0]);
//                 $('#name').val(address.name);
//                 address.val(address.address);
//                 phoneNumber.val(address.phoneNumber)
//             }
//         },
//         error: function () {
//             console.log('Cannot load address')
//         }
//     })
// }

// $(document).ready(loadReceiveInfo);

function pay() {
    var payData = {
        'id': $('#commodityDetails').attr('value'),
        'type': $('#commodityType').attr('value'),
        'count': $('#commodityCount').attr('value'),
        'name': receiverName.val(),
        'address': receiverAddress.val(),
        'phoneNumber': receiverPhoneNumber.val()
    };
    console.log(payData)
    $.ajax({
        type: 'post',
        url: 'pay',
        date: JSON.stringify(payData),
        headers: { 'token': Cookie.getToken() },
        success: function (data) {
            console.log(data);
            if (data.status === 'SUCCESS')
                console.log('paid')
        },
        error: function () {
            console.log('Cannot pay')
        }
    })
}