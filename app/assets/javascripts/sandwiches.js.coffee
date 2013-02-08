# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.ingredient_button').click ->
    button_class = $(this).children('a').attr('class')
    if button_class == "btn btn-small"
      $(this).children('a').attr('class', 'btn-small btn-success')
      $(this).children('input[type=checkbox]').prop('checked', 'checked')
    else
      $(this).children('a').attr('class', 'btn btn-small')
      $(this).children('input[type=checkbox]').prop('checked', '')