$(document).ready(function() {

  $('.hamburger').click(function(event){
    event.preventDefault();
    $('.hamburger-menu').css('display','block');
  })

  $('.hamburger-menu').click(function(event){
    $('.hamburger-menu').css('display','none');
  })

});
