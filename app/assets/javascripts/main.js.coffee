# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# bind for main menu
#init = ()->
$(document).on "click", '.header-wrap .button-open-main-menu', ->
  $currentElement = $(this)
  parentElement = $currentElement.closest('.header-wrap')

  if $currentElement.hasClass('link-to-main-menu')
    if $('.link-to-contacts-menu').hasClass('active')
      $('.link-to-contacts-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    if $('.link-to-main-menu').hasClass('active')
      $('.link-to-main-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    else
      $('.link-to-main-menu').addClass('active')
      parentElement.addClass('expand')

    if $('#main-menu').hasClass('hide')
      $('#contacts-menu').addClass('hide')
      $('#main-menu').removeClass('hide')

  if $currentElement.hasClass('link-to-contacts-menu')
    if $('.link-to-main-menu').hasClass('active')
      $('.link-to-main-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    if $('.link-to-contacts-menu').hasClass('active')
      $('.link-to-contacts-menu').removeClass('active')
      if parentElement.hasClass('expand')
        parentElement.removeClass('expand')
    else
      $('.link-to-contacts-menu').addClass('active')
      parentElement.addClass('expand')

    if $('#contacts-menu').hasClass('hide')
      $('#main-menu').addClass('hide')
      $('#contacts-menu').removeClass('hide')

#$(document).on('page:load', init)


$(document).ready ->
#  tabs index
  $('.index-tour-tabs-wrap ul li').click ->
    current_position = $(this).index()
    $head_tabs = $(this).closest('.index-tour-tabs-wrap')
    $head_tabs_li = $head_tabs.find('li')
    $head_tabs_li.children().removeClass('active')
    $(this).children().first().addClass('active')
    $body_tabs_li = $('.index-tour-tabs-pages-wrap').find('.index-tour-page')
    $body_tabs_li.removeClass('active').addClass('hide')
    $body_tabs_li.eq(current_position).addClass('active').removeClass('hide')

# declare global
slider_array = new Array()
jQuery(document).ready ($) ->

  # launch bxslider
  a = {
    controls: true
    pause: 6000
#    auto: true
    pagerCustom: '#custom-thumbnails'
  }

  b = {
    controls: false
    pause: 6000
#    auto: true
    pagerCustom: '#custom-thumbnails'
  }

  $(".bxslider").each (i) ->
    if $(this).hasClass('first-main-banner')
      slider_array[i] = $(this).eq(0).bxSlider(a)
    else if $(this).hasClass('second-main-banner')
      slider_array[i] = $(this).eq(0).bxSlider(b)

  # bind controls on custom controls, and run functions on every slider
  $(".bx-controls-direction a").bind "click", (e) ->
    e.preventDefault()
    if $(this).hasClass("bx-prev")
      $.each slider_array, (i, elem) ->
        elem.goToPrevSlide()

    else if $(this).hasClass("bx-next")
      $.each slider_array, (i, elem) ->
        elem.goToNextSlide()






