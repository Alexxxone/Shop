# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on 'ready page:load', ->
  $(document).on 'click','.remove_review', ()->
    $(@).parents('.review_item').remove()
  $(document).on 'click','.remove_review_index', ()->
    $(@).parents('.review_item').remove()
  $(document).on 'ajax:error ','#new_review', ()->
    textarea = $(@).find('textarea')
    textarea.parents('.form-group').addClass('has-error')
  $(document).on 'ajax:success ','#new_review', ()->
    textarea = $(@).find('textarea')
    textarea.parents('.form-group').removeClass('has-error')
    textarea.val('')

