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

// $.fn.dataTableExt.afnFiltering.push(
//     function( oSettings, aData, iDataIndex ) {
//         var iFini = document.getElementById('min').value;
//         var iFfin = document.getElementById('max').value;
//         var iStartDateCol = 0;
//         var iEndDateCol = 0;

//         iFini=iFini.substring(6,10) + iFini.substring(3,5)+ iFini.substring(0,2);
//         iFfin=iFfin.substring(6,10) + iFfin.substring(3,5)+ iFfin.substring(0,2);

//         var datofini=aData[iStartDateCol].substring(6,10) + aData[iStartDateCol].substring(3,5)+ aData[iStartDateCol].substring(0,2);
//         var datoffin=aData[iEndDateCol].substring(6,10) + aData[iEndDateCol].substring(3,5)+ aData[iEndDateCol].substring(0,2);

//         if ( iFini === "" && iFfin === "" )
//         {
//             return true;
//         }
//         else if ( iFini <= datofini && iFfin === "")
//         {
//             return true;
//         }
//         else if ( iFfin >= datoffin && iFini === "")
//         {
//             return true;
//         }
//         else if (iFini <= datofini && iFfin >= datoffin)
//         {
//             return true;
//         }
//         return false;
//     }
// );
$(document).ready(function() {
// 	$('.datepicker').datetimepicker({
// 		locale:'es'
// 	});
// $('.datepicker_format').datetimepicker({
//   locale:'es',
//   format: 'YYYY-MM-DD'
// });
	window.setTimeout(function(){
		$('#alerta').fadeOut(500);
	},5000);

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

	var table1 = $('#libro').DataTable({
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

// $('#min').keyup( function() { table1.draw(); } );
// $('#max').keyup( function() { table1.draw(); } );

	dataConfirmModal.setDefaults({
	  title: 'Esta Seguro?',
	  text: 'Realmente desea hacerlo?',
	  commit: 'Si',
	  cancel: 'No'
	});

	$('input[data-role=money]').autoNumeric('init');

	$( ".auto-select" ).select2({
    placeholder: "Por favor selecciona "
	});
	$( "select#departamento_pais_id" ).select2({
    placeholder: "Por favor selecciona "
	});
	$( "select#ciudad_departamento_id" ).select2({
    placeholder: "Por favor selecciona "
	});

});
function getCaja(numero_de_caja, caja_id){
	document.getElementById("caja_input").innerHTML = numero_de_caja;
	$("#idCaja").val(caja_id);
};

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
};

function date_time(id){
        date = new Date;
        year = date.getFullYear();
        month = date.getMonth()+1;
        day = date.getDate();


        h = date.getHours();
        if(h<10){
          h = "0"+h;
        }

        m = date.getMinutes();
        if(m<10){
          m = "0"+m;
        }

        s = date.getSeconds();
        if(s<10){
          s = "0"+s;
        }

        result = ''+day+'-'+month+'-'+year+' '+h+':'+m+':'+s;

        var x = document.getElementById(id);
        x.value=result;

        setTimeout('date_time("'+id+'");','1000');

        return true;
};

function radioButton_movimientos() {
  $('input[type="radio"]').click(function() {
      if ($(this).attr('value') == '1') {+
       	$('[id*=cheque_propio]').fadeOut('fast');
       	 	$('[id*=monto_efectivo]').fadeIn('fast');
          $('[id*=cheque_entrante]').fadeIn('slow');
       } else if ($(this).attr('value') == '2') {
       			$('[id*=cheque_entrante]').fadeOut('fast');
       			$('[id*=monto_efectivo]').fadeOut('fast');
            $('[id*=cheque_propio]').fadeIn('slow');
       }
  });
};
$(document).ready(function() {
	movimiento_de_caja_detalle_cheque_entrante_id_0
	$("[id*=#movimiento_de_caja_detalle_cheque_entrante_id_]").on('change', function(){
          if($.trim($(this).val())){
            $('#monto-efectivo_0').attr("disabled", "disabled");
        }else{$('#monto-efectivo_0').removeAttr('disabled');}
    });

$("#monto-efectivo_0").on("keyup blur", function(){
          if($.trim($(this).val())){
            $('#movimiento_de_caja_detalle_cheque_entrante_id_0').attr("disabled", "disabled");
        }else{$('#movimiento_de_caja_detalle_cheque_entrante_id_0').removeAttr('disabled');}
    });
});


//Solucion de error de visualizacion de mensaje de validacion
ClientSideValidations.selectors.validate_inputs += ', .select2-container:visible + :enabled[data-validate]';
ClientSideValidations.selectors.inputs += ', .select2-container:visible + :enabled[data-validate]';
ClientSideValidations.formBuilders['NestedForm::Builder'] = ClientSideValidations.formBuilders['ActionView::Helpers::FormBuilder'];