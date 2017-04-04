/*
  function getTeam: use to get list team after show popup with ajax
  argument1 order: is order battle in group
*/
function getTeams(order){
  var id1 = $('#js-team-1').val(),
      id2 = $('#js-team-2').val();
  $.ajax({
      type: "GET",
      url: '/choose_team',
      data : {id1: id1, id2: id2, order: order},
      success: function (result) {
          $('#js-get-list-items').html(result);
      },
      error: function(){
       console.log('Can not load data');
      }
  });
};
function getIdTeam(id, name, order){
  $('#js-team-'+order).text(name); 
  $('#js-team-'+order).attr('value', id);
};
function saveBattle(order, idGroup, notification, numberTeam1, numberTeam2){
  var id1 = $('#js-team-' + numberTeam1).val(),
      id2 = $('#js-team-'+numberTeam2).val(),
      score1 = $('#js-scord-' + numberTeam1).val(),
      score2 = $('#js-scord-' + numberTeam2).val();
  var totalBattle = $('#js-total-battle').text();
  if(totalBattle == ''){
    totalBattle = 0;
  }
  alert(score1);
  alert(score2);
  $.ajax({
    type: "GET",
      url: '/save_battle',
      data : {id1: id1, id2: id2, score1: score1, score2: score2, order: order, idGroup: idGroup, totalBattle: totalBattle},
      success: function (result) {        
        $('#js-resulf-'+order).html(result);
        $('#js-team-' + numberTeam1).attr('disabled','disabled');
        $('#js-team-' + +numberTeam2).attr('disabled','disabled');
        // $('#js-scord-1').attr('disabled','disabled');
        // $('#js-scord-2').attr('disabled','disabled');
      },
      error: function(){
      }
  });
};
