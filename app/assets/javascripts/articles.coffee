# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $('#tag-form').tagit
    fieldName:   'tags'
    singleField: true
  $('#tag-form').tagit()
  tag_string = $("#tags_hidden").val()
  try
    tag_list = tag_string.split(',')
    for tag in tag_list
      $('#tag-form').tagit 'createTag', tag
  catch error