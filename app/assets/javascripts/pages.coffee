# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

ready = ->
  $('#gallery').justifiedGallery(
    rowHeight: 300
    margins: 40
    border: 0
  )

$(document).ready(ready)
