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
      $('#idea_score').html(data);
    }).
    on('ajax:error', '.idea-voting-form', function(xhr, status, error){
      console.log('error: ', error);
    }); // end listener for submitting the form

}); // end document ready



