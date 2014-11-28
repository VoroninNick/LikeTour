# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "click", ".fancy-select ul.options li", ->
  $value = $(this).attr "data-raw-value"
  alert $value
$(document).ready ->
  $('.fancy-select').fancySelect()
  $(".select-category select").change ->
    alert $(this).val()