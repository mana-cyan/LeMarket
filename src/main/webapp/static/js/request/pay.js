var receiverName = $('#receiverNname');
var address = $('#address');
var phoneNumber = $('#phoneNumber');

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
        'type': type,
        'count': count,
        'name': receiverName,
        'address': address,
        'phoneNumber': phoneNumber
    }
}