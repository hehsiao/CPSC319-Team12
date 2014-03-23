# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$("#filter_button").click ->
	  if $(this).html() is "<i class=\"fa fa-filter\"></i> Filter by Keywords <i class=\"fa fa-chevron-down\"></i>"
	    $(this).html "<i class=\"fa fa-filter\"></i> Filter by Keywords <i class=\"fa fa-chevron-up\"></i>"
	  else
	    $(this).html "<i class=\"fa fa-filter\"></i> Filter by Keywords <i class=\"fa fa-chevron-down\"></i>"
	  $("#tag_cloud_body").slideToggle()

  return
