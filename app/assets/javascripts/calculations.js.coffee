# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('#method_hourly').click -> 
    $.ajax({
      type: 'POST',
      url: 'calculations/preferences'
      data: {default_method: 'hourly'}
      })
    if $('.reveal_answer').css('display') == 'none'
      $('.daily_answer').css('display','none') and $('.hourly_answer').css('display','block')
    
  $('#method_daily').click -> 
    $.ajax({
      type: 'POST',
      url: 'calculations/preferences'
      data: {default_method: 'daily'}
      })
    if $('.reveal_answer').css('display') == 'none'
      $('.hourly_answer').css('display','none') and $('.daily_answer').css('display','block')
  
  class Answer
    reveal: ->
      $('.reveal_answer').css('display', 'none')
      $('.answer').css('display', 'block') 
      $('.hourly_answer').css('display', 'block') if $('#method_hourly').is(':checked')
      $('.daily_answer').css('display', 'block') if $('#method_daily').is(':checked')
  window.Answer = new Answer