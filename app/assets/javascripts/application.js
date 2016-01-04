// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require materialize

$(document).ready(function() {
	
	// Hide new memory form on page load	
	$('.newMemory').hide();

	// show new memory form when button is pressed
	$('.addNewMemory').click( function(event) {
		$('.child_memories').toggle();
		$('.newMemory').toggle();
	});
  
  // disable positive flash notices after 3 seconds
  setTimeout(function() {
    $('.flash_notice').slideUp();
  }, 3000);

  // rotate child name letters in random ways
  $('span').each(function() {
    var rotate = (Math.floor(Math.random()* 20) + 1) -10 ;
    $(this).css({
    	"transform": "rotate("+(rotate)+"deg)" 
    });
 });

});