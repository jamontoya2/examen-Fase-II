function start_game(subOne, subTwo) {
  
  var winner = randomCell();
  
    $('.cell').on("click", function(evento){
      var playerClick = $(this).attr('id'); 
      var url = $('#play').attr('action');
      var sub_kills = {};
    
      won(playerClick, winner)
      countForPlay += 1;

      if (countForPlay == 4) {
        if (nowWinner == 2) {
          sub_kills.score = "Win";
          $.post("/games",sub_kills);
        }else{
          sub_kills.score = "lose"
          $.post("/games",sub_kills);
        }
      }

    });
  
  function won(playerValue, subValue) {
    if (nowWinner >= 2){
      status = true;
      alert("Game Over");
    }
    if (countForPlay <= 2) {
      if (playerValue == subValue[0] || playerValue == subValue[1]) {
        $('' + playerValue).css("background","red");
        nowWinner += 1;
        score(nowWinner);
   
      }else{
        $('#' + playerValue).html("X");
      }
    }else{
      if (status == "false"){
        alert("Game Over");
      }
      if (countForPlay >= 2) {
        subValue.forEach(function(cel){
          $('#' + cel).css("background","red");
        });
      }
    }
    
  }
}

function score(value) {
  if (value <= 2){
    $('h3').text('Destroyed Submarines: ' + value );
  }
  if (value == 2){
    $('#win').text('WINNER!');
  }
}

//función que genera el tablero de juego
var resetInit = function() {
  $("#container").empty();
  $("#container").innerHTML = '';
  $("#container div").fadeOut();
  $('#container').css('background','#FE7E25');
  $('.cell').css('color', 'white');
  $('#container').css('background','#FFFFFF');
  $("#container").append("<tr><td id='c1' class='cell'></td><td id='c2' class='cell'></td><td id = 'c3' class='cell'></td></tr>");
  $("#container").append("<tr><td id ='c4' class='cell'></td><td id='c5' class='cell'></td><td id='c6' class='cell'></td></tr>");
  $("#container").append("<tr><td id= 'c7' class='cell'></td><td id='c8' class='cell'></td><td id='c9' class='cell'></td></tr>");
  //LISTO///////////////
}

var randomCell = function() {
  var one = 0;
  var two = 0;
  var subOne = 0;
  var subTwo = 0;
   one = (Math.round(Math.random() * 9) + 1);
   two = (Math.round(Math.random() * 9) + 1);
   
   if (one == two){
    subOne = 1;
    subTwo = 9;
   };
   
   subOne = one;
   subTwo = two;
  var valueSubOne = "c" + subOne;
  var valueSubTwo = "c" + subTwo;
  return [valueSubOne, valueSubTwo]
}


$(document).ready(function(){
  	$('#play').on("submit", function(evento){
  	  evento.preventDefault();
      var url = $('#play').attr('action');
      $('h3').text("");
      $('#win').text(" ");
      countForPlay = 0;
      nowWinner = 0;
      status = false;
      resetInit();
      start_game(randomCell()[0], randomCell()[1]);

	  });
});