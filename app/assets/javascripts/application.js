// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require popper
//= require bootstrap-sprockets

//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .
/*global $*/

// ハンバーガーメニュー→navの表示のためclassを付与
$(document).on('turbolinks:load', function() {
  $('.openbtn').on('click', function(){
    $(this).toggleClass('active');
     $("#g-nav").toggleClass('panelactive');
  });
});
// nav→ハンバーガーのためclassを外す
$(document).on('turbolinks:load', function() {
  $("#g-nav a").click(function () {
      $(".openbtn").removeClass('active');
      $("#g-nav").removeClass('panelactive');
  });
});