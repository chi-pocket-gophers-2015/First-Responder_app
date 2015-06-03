$(document).ready(function(){
  $('.contact-form').hide();
  $('#cb1').click(function(){
    $('.contact-form').slideToggle();
    console.log("hi");
  })
});