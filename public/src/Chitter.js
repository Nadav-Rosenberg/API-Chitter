$(document).ready(function() {
  $.getJSON( "http://localhost:9292//api/all_peeps", function( data ) {
      var peep_string = '<ul>'
    for (var i = 0; i < data.length; i++) {

        peep_string = peep_string.concat('<li>',data[i]["text"],' by ',data[i]["author"],' at ',data[i]["time"],'</li>');
    };
    peep_string.concat('</ul>');
    $('#peepList').html(peep_string);
  });
});

// setInterval(function(){
// $.getJSON( "http://localhost:9292//api/all_peeps", function( data ) {
//     var peep_string = '<ul>'
//   for (var i = 0; i < data.length; i++) {

//       peep_string = peep_string.concat('<li>',data[i]["text"],' by ',data[i]["author"],' at ',data[i]["time"],'</li>');
//   };
//   peep_string.concat('</ul>');
//   $('#peepList').html(peep_string);
// });
// },6000);
 
function reloadPeeps(){
  $.getJSON( "/api/all_peeps", function( data ) {
    var peep_string = '<ul>'
    for (var i = 0; i < data.length; i++) {
      peep_string = peep_string.concat('<li>',data[i]["text"],' by ',data[i]["author"],' at ',data[i]["time"],'</li>');
    };
    peep_string.concat('</ul>');
    $('#peepList').html(peep_string);
  });
}