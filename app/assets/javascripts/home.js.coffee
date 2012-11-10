# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready () ->

	# accept the incoming connection and start two-way audio
	call = ->
	  # get the phone number to connect the call to
	  params = PhoneNumber: $("#number").val()
	  Twilio.Device.connect params
	  
	hangup = ->
	  Twilio.Device.disconnectAll()
	  
	Twilio.Device.setup "<%= @token %>",
	  debug: true

	Twilio.Device.ready (device) ->
	  $("#log").text "Ready"

	Twilio.Device.error (error) ->
	  $("#log").text "Error: " + error.message

	Twilio.Device.connect (conn) ->
	  $("#log").text "Successfully established call"

	Twilio.Device.disconnect (conn) ->
	  $("#log").text "Call ended"

	Twilio.Device.incoming (conn) ->
	  $("#log").text "Incoming connection from " + conn.parameters.From
	  conn.accept()




