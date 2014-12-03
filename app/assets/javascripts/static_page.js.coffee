# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('.g-map-wrap .drop-down-map').click ->
    $('.g-map-wrap #g-map').toggleClass('expand')
