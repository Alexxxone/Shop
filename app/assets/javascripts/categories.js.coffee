# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



$(document).on 'ready page:load', ->
  if $('#page-message')
    window.setTimeout ->
      $('#page-message').slideUp('fast')
    ,3000
    $('#page-message').click (el)->
      $(el.currentTarget).slideUp('fast')