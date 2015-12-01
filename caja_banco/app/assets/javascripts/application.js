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
// require turbolinks
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap-sprockets
//= require select2
//= require select2_locale_es
//= require rails.validations
// require client_side_select2
//= require moment
//= require moment/es
//= require bootstrap-datetimepicker
//= require autoNumeric
//= require data-confirm-modal
//= require jquery_nested_form
//= require_tree .

$(document).ready(function() {
	$('.datepicker').datetimepicker({
		locale:'es'
	});
	$("#btn1").click(function(){
		$('#form-toggle').fadeToggle();
		if($('#gbtn1').hasClass('glyphicon glyphicon-plus')){
			$('#gbtn1').removeClass('glyphicon glyphicon-plus');
			$('#gbtn1').addClass('glyphicon glyphicon-chevron-up');
		}else{
			$('#gbtn1').removeClass('glyphicon glyphicon-chevron-up');
			$('#gbtn1').addClass('glyphicon glyphicon-plus');
		}
	});
	$("#button-up").click(function(){
		$('.subnavbar').fadeToggle();
		if($('#button-up-icon').hasClass('glyphicon glyphicon-down')){
			$('#button-up-icon').removeClass('glyphicon glyphicon-down');
			$('#button-up-icon').addClass('glyphicon glyphicon-chevron-up');
		}else{
			$('#button-up-icon').removeClass('glyphicon glyphicon-chevron-up');
			$('#button-up-icon').addClass('glyphicon glyphicon-down');
		}
	});
		$("#button-up-apertura").click(function(){
		$('#input_saldo_inicial_efectivo').fadeToggle();
		$('#input_saldo_inicial_cheque').fadeToggle();
		$('#input_cajero').fadeToggle();
		$('#input_fecha').fadeToggle();
		if($('#button-up-apertura-icon').hasClass('glyphicon glyphicon-chevron-down')){
			$('#button-up-apertura-icon').removeClass('glyphicon glyphicon-chevron-down');
			$('#button-up-apertura-icon').addClass('glyphicon glyphicon-chevron-up');
			$('.well').css('padding','19px');
		}else{
			$('#button-up-apertura-icon').removeClass('glyphicon glyphicon-chevron-up');
			$('#button-up-apertura-icon').addClass('glyphicon glyphicon-chevron-down');
			$('.well').css('padding','5px');
			$('.well').css('padding-left','160px');
			$('.well').css('margin-bottom','1px');
			$('#button-up-apertura').css('margin-top','-10px');
		}
	});
	$('#table').DataTable({
		 "language": {
	        "sProcessing":    "Procesando...",
	        "sLengthMenu":    "Mostrar _MENU_ registros",
	        "sZeroRecords":   "No se encontraron resultados",
	        "sEmptyTable":    "Ningún dato disponible en esta tabla",
	        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
	        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
	        "sInfoPostFix":   "",
	        "sSearch":        "Buscar:",
	        "sUrl":           "",
	        "sInfoThousands":  ",",
	        "sLoadingRecords": "Cargando...",
	        "oPaginate": {
	            "sFirst":    "Primero",
	            "sLast":    "Último",
	            "sNext":    "Siguiente",
	            "sPrevious": "Anterior"
	        },
	        "oAria": {
	            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
					}
	    }
	});
	$('#libro').DataTable({
		 "paging": false,
		 "language": {
	        "sProcessing":    "Procesando...",
	        "sLengthMenu":    "Mostrar _MENU_ registros",
	        "sZeroRecords":   "No se encontraron resultados",
	        "sEmptyTable":    "Ningún dato disponible en esta tabla",
	        "sInfo":          "Mostrando registros del _START_ al _END_ de un total de _TOTAL_ registros",
	        "sInfoEmpty":     "Mostrando registros del 0 al 0 de un total de 0 registros",
	        "sInfoFiltered":  "(filtrado de un total de _MAX_ registros)",
	        "sInfoPostFix":   "",
	        "sSearch":        "Buscar:",
	        "sUrl":           "",
	        "sInfoThousands":  ",",
	        "sLoadingRecords": "Cargando...",
	        "oPaginate": {
	            "sFirst":    "Primero",
	            "sLast":    "Último",
	            "sNext":    "Siguiente",
	            "sPrevious": "Anterior"
	        },
	        "oAria": {
	            "sSortAscending":  ": Activar para ordenar la columna de manera ascendente",
	            "sSortDescending": ": Activar para ordenar la columna de manera descendente"
					}
	    }
	});

		dataConfirmModal.setDefaults({
		  title: 'Esta Seguro?',
		  text: 'Realmente desea hacerlo?',
		  commit: 'Si',
		  cancel: 'No'
		});

	$('input[data-role=money]').autoNumeric('init');

		$( "select#select2 #departamento_pais_id" ).select2({
	    placeholder: "Por favor selecciona "
		});
		$( "select#departamento_pais_id" ).select2({
	    placeholder: "Por favor selecciona "
		});
		$( "select#ciudad_departamento_id" ).select2({
	    placeholder: "Por favor selecciona "
		});
});

function printpage() {
	//Get the HTML of div
	var divElements = document.getElementById("tabla_print").innerHTML;
	//Get the HTML of whole page
	var oldPage = document.body.innerHTML;
	//Reset the page's HTML with div's HTML only
	document.body.innerHTML =
	  "<html><head><title></title></head><body>" +
	  divElements + "</body>";
	//Print Page
	window.print();
	//Restore orignal HTML
	document.body.innerHTML = oldPage;
}

//Solucion de error de visualizacion de mensaje de validacion
ClientSideValidations.selectors.validate_inputs += ', .select2-container:visible + :enabled[data-validate]';
ClientSideValidations.selectors.inputs += ', .select2-container:visible + :enabled[data-validate]';
ClientSideValidations.formBuilders['NestedForm::Builder'] = ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'];

// $(document).ready(function() {
// 	$('select#select2').select2({
// 		placeholder: "Por favor selecciona ",
// 		ajax: {
// 			url: "/people.json",
// 			dataType: "json",
// 			results: function(data, page) {
// 				return {
// 					results: $.map(
// 						data,
// 						function(person, i) {
// 							return { id: person.id, text: person.name }
// 						}
// 					)
// 				}
// 			}
// 		}
// 	});
// });
  function testClick(numero_de_caja){
     $("#caja_input").val(numero_de_caja);
     };
