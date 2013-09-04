$(document).ready(function() {

  $('.hamburger').click(function(event){
    event.preventDefault();
    console.log("hi");
    $('.hamburger-menu').css('display','block');
  })
});
