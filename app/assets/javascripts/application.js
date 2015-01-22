// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require turbolinks
//= require_tree .

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

  $('#idea_score').
    on('submit', '.idea-voting-form', function(){
      console.log("vote submitted");
    }).
    on('ajax:success', '.idea-voting-form', function(evt, data, status, xhr){
      // console.log('success: ', data); 
      // if user hit the downvote, this class, and if upvote, this other class (and remove other one if it's there)
      // if it's a repeat click, get rid of the all the styley classes

      $('#idea_score').html(data);

      // console.log($(this).attr("id"));
      // voteDirection = ($(this).attr("id"));
      // $('#show-score').removeClass('score-up');
      // $('#show-score').removeClass('score-down');
      
      // if(voteDirection == "upvote-form"){
      //   $('#show-score').addClass('score-up');
      // }
      // else {
      //   $('#show-score').addClass('score-down');
      // }

      
    }).
    on('ajax:error', '.idea-voting-form', function(xhr, status, error){
      console.log('error: ', error);
    }); // end listener for submitting the form

}); // end document ready

$(document).ready(function () {
  $('.accordion-tabs').each(function(index) {
    $(this).children('li').first().children('a').addClass('is-active').next().addClass('is-open').show();
  });

  $('.accordion-tabs').on('click', 'li > a', function(event) {
    if (!$(this).hasClass('is-active')) {
      event.preventDefault();
      var accordionTabs = $(this).closest('.accordion-tabs');
      accordionTabs.find('.is-open').removeClass('is-open').hide();

      $(this).next().toggleClass('is-open').toggle();
      accordionTabs.find('.is-active').removeClass('is-active');
      $(this).addClass('is-active');
    } else {
      event.preventDefault();
    }
  });
});



