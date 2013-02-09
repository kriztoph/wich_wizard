# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  $('.ingredient_button').click ->
    ingredient_selected = $(this).siblings('input[type=checkbox]').prop('checked')
    if ingredient_selected
      $(this).attr('class', 'btn btn-small')
      $(this).siblings('input[type=checkbox]').prop('checked', '')
    else
      $(this).attr('class', 'btn-small btn-success')
      $(this).siblings('input[type=checkbox]').prop('checked', 'checked')

  $('.ingredient_listing input[type=checkbox]').click ->
    ingredient_selected = $(this).prop('checked')
    if ingredient_selected
      $(this).siblings('a').attr('class', 'btn-small btn-success')
    else
      $(this).siblings('a').attr('class', 'btn btn-small')

  $('.ingredient_checkbox').each ->
    if $(this).prop('checked')
      $(this).siblings('a').attr('class', 'btn-small btn-success')


