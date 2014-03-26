# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $("#user_signup").validate
    debug: true
    rules:
      "user[email]":
        required: true
        email: true

      "user[password]":
        required: true
        minlength: 8

      "user[first_name]":
      	required: true
      	minlength: 3

     	"user[last_name]":
     		required: true
     		minlength: 3

      "user[password_confirmation]":
        required: true
        equalTo: "#user_password"


  $("edit_user").validate
    debug: true
    rules:

      "user[current_password]":
        required: true
        minlength: 8

      "user[email]":
        required: true
        email: true

      "user[password]":
        minlength: 8

      "user[password_confirmation]":
        equalTo: "#user_password"

      "user[first_name]":
        required: true
        minlength: 3

      "user[last_name]":
        required: true
        minlength: 3

    $("#user_signin").validate
    debug: true
    rules:
      "user[email]":
        required: true
        email: true

      "user[password]":
        required: true
        minlength: 8

  return
  