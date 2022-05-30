// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery
//= require jquery_ujs


$(function() {

  $('.activate-button').click(function() {
    var $button = $(this);

    $.ajax(
      $button.attr('href'), {
        method: 'post'
      }
    ).done(function(data) {
      $button.text(data.active);
    });


    return false;
  });


})
