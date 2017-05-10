/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

$(function () {
    if (window.location == window.parent.location) {
        $('#fullscreen').html('<span class="fa fa-compress"></span>');
        $('#fullscreen').attr('href', 'http://bootsnipp.com/mouse0270/snippets/rVnOR');
        $('#fullscreen').attr('title', 'Back To Bootsnipp');
    }    
    $('#fullscreen').on('click', function(event) {
        event.preventDefault();
        window.parent.location =  $('#fullscreen').attr('href');
    });
    $('#fullscreen').tooltip();
});