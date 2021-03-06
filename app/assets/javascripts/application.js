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
//= require turbolinks
//= require underscore
//= require gmaps/google
//= require moment
//= require bootstrap-datetimepicker
//= require_tree .
$(document).ready(function(){
  $('#datetimepicker1').datetimepicker({
    format: 'DD-MM-YYYY HH:mm:ss'
  });
  $('#datetimepicker2').datetimepicker({
    format: 'LT'
  });
  $('#datetimepicker3').datetimepicker({
    format: 'LT'
  });
  $(document).on('click','#add-address',function(e){
    // alert('here');
    e.preventDefault();
    $('.address-form').slideToggle("fast", function() {
      window.location.hash = "#address";
    }).bind();
   // Animation complete.
  });
  $(document).on('click', '#show-calendar', function(e){
    // alert('here');
    e.preventDefault();
    $('#events_calendar').fadeToggle("");

    var $this = $(this);
    $this.toggleClass('show-calendar');
    if($this.hasClass('show-calendar')){
      $this.html('<span class="glyphicon glyphicon-minus"> </span> Hide Calendar');
      $('#events_calendar').show();
    } else {
      $this.html('<span class="glyphicon glyphicon-plus"> </span> Show calendar');
      $('#events_calendar').hide();
    }
   // Animation complete.
  }).bind();
});
