$(document).ready(function() {
  var newAnswer = $('form#new_answer');
  
  newAnswer.on('submit', function(event) {
    event.preventDefault();
    var newAnswerData = newAnswer.serialize();
    var newAnswerURL = newAnswer.attr('action');
    var newAnswerTextArea = $('#answer_content');
    
    $.post(newAnswerURL, newAnswerData, function(response){
      newAnswerTextArea.val(" ");
      $('#answers').empty();
      $('#answers').append(response);
    });
  });
});
