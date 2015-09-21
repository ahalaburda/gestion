// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

$(document).ready(function() {
	$("#gbtn1").click(function(){
		$('#form-toggle').fadeToggle();
		if($('#gbtn1').hasClass('glyphicon glyphicon-plus')){
			$('#gbtn1').removeClass('glyphicon glyphicon-plus');
			$('#gbtn1').addClass('glyphicon glyphicon-chevron-up');
		}else{
			$('#gbtn1').removeClass('glyphicon glyphicon-chevron-up');
			$('#gbtn1').addClass('glyphicon glyphicon-plus');
		}
	});
});

//validacion lado cliente para el 
//campo Descripcion del abm de 
//tipos de movimientos
$(document).ready(function() {
	$("#tipo_de_movimiento_descripcion").blur(function(){
		if ($("#tipo_de_movimiento_descripcion").val() == ""){
			$("#field_descripcion").addClass('form-group has-error');
			$('#field_descripcion').append('<div id="alertdiv"><span>'+"Este campo es requerido"+'</span></div>');
			setTimeout(function() { // this will automatically close the alert and remove this if the users doesnt close it in 5 secs
				$("#alertdiv").remove();
			}, 5000);
		}else if ($("#tipo_de_movimiento_descripcion").val().length > 20){
			$("#field_descripcion").addClass('form-group has-error');
			$('#field_descripcion').append('<div id="alertdiv"><span>'+"Este campo debe tener como maximo 20 caracteres"+'</span></div>');
			setTimeout(function() { // this will automatically close the alert and remove this if the users doesnt close it in 5 secs
				$("#alertdiv").remove();
			}, 5000);
		}else if (/^[a-zA-Z]+$/i.test($("#tipo_de_movimiento_descripcion").val()) == false){
			$("#field_descripcion").addClass('form-group has-error');
			$('#field_descripcion').append('<div id="alertdiv"><span>'+"Este campo solo debe tener letras"+'</span></div>');
			setTimeout(function() { // this will automatically close the alert and remove this if the users doesnt close it in 5 secs
				$("#alertdiv").remove();
			}, 5000);
		}else{
			$("#field_descripcion").removeClass("form-group has-error");
			$("#field_descripcion").addClass("form-group has-success");
		}
	});
});