$(document).ready(function(){
  $('.contact-form').hide();
  $('.contact-toggle-button').click(function(){
    $('.contact-form').toggle();
    console.log("hi");
  })
});