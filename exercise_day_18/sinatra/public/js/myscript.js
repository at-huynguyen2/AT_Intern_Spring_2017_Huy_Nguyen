function loadList(){
  var name = $('#js-name').val();
      // seed = $('#js-seed').val();
  
  if ($('#js-seed').is(":checked") == true)
    var seed = 1;
  else
    var seed = 0; 
  $.ajax({
        type: "POST",
        url: '/add_team',
        data : { name: name, seed: seed },
        success: function (result) {
            $('#js-get-list-items').html(result);
        },
        error: function(){
         console.log('Can not load data');
        }
  });
  
}

function loadPage(){
    $.ajax({
        type: "GET",
        url: '/get_list_teams',
        success: function (result) {
            $('#js-get-list-items').html(result);
        },
        error: function(){
         console.log('Can not load data');
        }
    });
}
