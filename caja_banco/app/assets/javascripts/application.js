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
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require bootstrap-sprockets
// require turbolinks
//= require rails.validations
//= require rails.validations.simple_form
//= require dataTables/jquery.dataTables
//= require dataTables/bootstrap/3/jquery.dataTables.bootstrap
//= require_tree .

$(document).ready(function() {
	$("#gbtn1 , #btn1").click(function(){
		$('#form-toggle').fadeToggle();
		if($('#gbtn1').hasClass('glyphicon glyphicon-plus')){
			$('#gbtn1').removeClass('glyphicon glyphicon-plus');
			$('#gbtn1').addClass('glyphicon glyphicon-chevron-up');
		}else{
			$('#gbtn1').removeClass('glyphicon glyphicon-chevron-up');
			$('#gbtn1').addClass('glyphicon glyphicon-plus');
		}
	});
	$('#table').DataTable({
	  // ajax: ...,
	  // autoWidth: false,
	  // pagingType: 'full_numbers',
	  // processing: true,
	  // serverSide: true,

	  // Optional, if you want full pagination controls.
	  // Check dataTables documentation to learn more about available options.
	  // http://datatables.net/reference/option/pagingType
	});
});

$(document).ready(function() {
	ClientSideValidations.formBuilders['SimpleForm::FormBuilder'] = {
	  add: function(element, settings, message) {
	    if (element.data('valid') !== false) {
	      var wrapper = element.closest(settings.wrapper_tag);
	      wrapper.parent().addClass(settings.wrapper_error_class);
	      var errorElement = $('<' + settings.error_tag + ' class="' + settings.error_class + '">' + message + '</' + settings.error_tag + '>');
	      wrapper.append(errorElement);
	    } else {
	      element.parent().find(settings.error_tag + '.' + settings.error_class).text(message);
	    }
	  },
	  remove: function(element, settings) {
	    var wrapper = element.closest(settings.wrapper_tag + '.' + settings.wrapper_error_class);
	    wrapper.removeClass(settings.wrapper_error_class);
	    var errorElement = wrapper.find(settings.error_tag + '.' + settings.error_class);
	    errorElement.remove();
	  }
	};
});