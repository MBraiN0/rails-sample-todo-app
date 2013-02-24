// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){


    $(document).on('click', '.show_todo_items', function(){
        $(this).next().slideToggle('slow');
    });

    $(document).on('click', '.open_new_todo_item_form', function(){
        $(this).hide();
        $(this).next().slideDown('slow');
    })
})