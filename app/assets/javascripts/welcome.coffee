# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(document).on 'change focus select', '#countries_select', (evt) ->
    $.ajax 'update_states',
      type: 'GET'
      dataType: 'script'
      data: {
        country_id: $("#countries_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic country select OK!")

  $(document).on 'focus change select', '#states_select', (evt) ->
    $.ajax 'update_cities',
      type: 'GET'
      dataType: 'script'
      data: {
        state_id: $("#states_select option:selected").val()
      }
      error: (jqXHR, textStatus, errorThrown) ->
        console.log("AJAX Error: #{textStatus}")
      success: (data, textStatus, jqXHR) ->
        console.log("Dynamic State select OK!")
