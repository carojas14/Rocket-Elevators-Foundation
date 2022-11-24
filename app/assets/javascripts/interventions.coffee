# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'turbolinks:load', ->

    $('#step2').hide()
    $('#step3').hide()
    $('#step4').hide()
    $('#step5').hide()

    building = $('#intervention_BuildingID').html()
    customer = $('#intervention_CustomerID').html()
    $('#buttonCustomer').click ->
        customer = $('#intervention_CustomerID :selected').text()
        escaped_customer = customer.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        buildingOptions = $(building).filter("optgroup[label='#{escaped_customer}']").html()
        if buildingOptions
            $('#intervention_BuildingID').html(buildingOptions).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#step2').show()
        else
            $('#intervention_BuildingID').empty()
            $('#step2').hide()


    battery = $('#intervention_BatteryID').html()
    $('#buttonBuilding').click ->
        building = $('#intervention_BuildingID :selected').text()
        escaped_building = building.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        batteryOptions = $(battery).filter("optgroup[label='#{escaped_building}']").html()
        if  batteryOptions
            $('#intervention_BatteryID').html(batteryOptions).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#step3').show()
        else
            $('#intervention_BatteryID').empty()
            $('#step3').hide()


    column = $('#intervention_ColumnID').html()
    $('#buttonBattery').click ->
        battery = $('#intervention_BatteryID :selected').text()
        escaped_battery = battery.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        columnOptions = $(column).filter("optgroup[label='#{escaped_battery}']").html()
        if  columnOptions
            $('#intervention_ColumnID').html(columnOptions).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#step4').show()
        else
            $('#intervention_ColumnID').empty()
            $('#step4').hide()


    elevator = $('#intervention_ElevatorID').html()
    $('#buttonColumn').click ->
        column = $('#intervention_ColumnID :selected').text()
        escaped_column = column.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
        elevatorOptions = $(elevator).filter("optgroup[label='#{escaped_column}']").html()
        if  elevatorOptions
            $('#intervention_ElevatorID').html(elevatorOptions).val("None").prepend("<option value=" + '0' + ">" + 'None' + "</option>")
            $('#step5').show()
        else
            $('#intervention_ElevatorID').empty()
            $('#step5').hide()




