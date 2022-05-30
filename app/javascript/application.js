// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
//= require jquery3
//= require jquery_ujs
//= require popper
//= require bootstrap-sprockets

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
