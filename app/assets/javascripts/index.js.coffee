# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  userForm = 0
  showRegisterForm = ->
    userForm = 1
    $("#login_form").attr "action", "/users"
    $(".session_form").attr "id", (_, id) ->
        id.replace "session", "user"
    $(".session_form").attr "name", (_, name) ->
        name.replace "session", "user"
    $("#user_username_or_email").attr "placeholder", "Username"
    $(".user_form").prop 'disabled', false
    $(".user_form").fadeToggle()
    return
  hideRegisterForm = ->
    userForm = 0      
    $("#login_form").attr "action", "/session"
    $(".session_form").attr "id", (_, id) ->
        id.replace "user", "session"
    $(".session_form").attr "name", (_, name) ->
        name.replace "user", "session"
    $("#user_username_or_email").attr "placeholder", "Username or Email"
    $(".user_form").prop 'disabled', true
    $(".user_form").fadeToggle()
    return
  $("#reg_link").click ->
    if userForm is 0
      showRegisterForm()
    else
      hideRegisterForm()
  $(".user_form").hide().prop('disabled', true)  
  return