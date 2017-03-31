$(document).ready(function() {
    $('#data-table').DataTable();
} );

function loadList(){
  var name = $('#js-name').val(),
      seed = $('#js-seed').val();
  $.ajax({
    url : "/add_team",
    type : "post",
    dataType: "json",
    data : { name: name, seed: seed },
    success: function (result) {
      $('#js-get-list-items').html(result);
      console.log('result');
    },
    error: function(){          
    console.log('Can not load data POST');
    }
  });
};






// function loadList(_name, _seed){
//     $.ajax({
//         type: "GET",
//         contentType: "application/json; charset=utf-8",
//         url: 'http://localhost:4567/get-list-teams',
//         data: {number_tab : 3},
//         success: function (result) {
//             $('#js-get-list-items').html(result);
//         },
//         error: function(){
//         	console.log('Can not load data');
//         }
//     });
// }