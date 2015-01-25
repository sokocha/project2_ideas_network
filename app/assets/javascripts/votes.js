$(function (){

// 'listen' for the form to be submitted. Submitting the form, i.e. clicking one of the five buttons, triggers an ajax request. If the ajax request is successful, the updated score will be inserted onto the page.
  $('.originality_score_form').
    on('submit', function(){
      console.log("originality score submitted");
    }).
    on('ajax:success', function(evt, data, status, xhr){
      // console.log('success: ', data);   
      $('#originality_score').html(data);
    }).
    on('ajax:error', function(xhr, status, error){
      console.log('error: ', error);
    }); // end listener for submitting the form

  $('.idea_score').
    on('submit', '.idea-voting-form', function(){
      console.log("vote submitted");
    }).
    on('ajax:success', '.idea-voting-form', function(evt, data, status, xhr){
      // console.log('success: ', data); 
      // if user hit the downvote, this class, and if upvote, this other class (and remove other one if it's there)
      // if it's a repeat click, get rid of the all the styley classes

      // this will not work if 
      var $fragmentToUpdate = $(evt.target).closest('.idea_score');
      $fragmentToUpdate.html(data);

      
    }).
    on('ajax:error', '.idea-voting-form', function(xhr, status, error){
      console.log('error: ', error);
    }); // end listener for submitting the form

}); // end document ready
