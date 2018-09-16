/**
 * 2017-08-01 ver 0.1
 */

(function($) {
	var jobqRegex = new JobqRegEx();
	var dataSet = {};
	var formData = new FormData();
	var inputs = [];
	
	var	textInputs = {
		$values : $('input[data-jobq-text]').toArray(),
		convertDataToFormData : function() {
				$.each(this.$values, function(index, element) {
					if ($(element).val() != '')
						dataSet[$(element).attr('data-jobq-text')] = $(element).val().trim();
				});
				
			}
	};
	
	var checkboxInputs = {
		$values : $('input[data-jobq-checkbox]').toArray(),
		convertDataToFormData : function() {
			var length = 0;
			var skills = '';
			var areas = '';
			var states = '';
			
			$.each(this.$values, function(index, element) {
				if($(element).is(":checked") && $(element).attr('data-jobq-checkbox') == 'skill'){
					skills += $(element).val() + ',';
					dataSet[$(element).attr('data-jobq-checkbox')] = skills;
				}else if($(element).is(":checked") && $(element).attr('data-jobq-checkbox') == 'area'){
					areas += $(element).val() + ',';
					dataSet[$(element).attr('data-jobq-checkbox')] = areas;
				}else if($(element).is(":checked")){
					states += $(element).val() + ',';
					length++;
					dataSet[$(element).attr('data-jobq-checkbox')] = states;
				}
			});
			
		}
	};
		
	var selectInputs = {
			$values : $('select[data-jobq-select]').toArray(),
			convertDataToFormData : function() {
				$.each(this.$values, function(index, element) {
					if ($(element).find('option').is(':selected')
							&& $(element).find('option:selected').val() != '선택하세요.') {
						dataSet[$(element).attr('data-jobq-select')] = $(element).find('option:selected').val();
					}
				});

			}
	};
	
	var dateInputs = {
			$values : $('input[data-jobq-date]').toArray(),
			convertDataToFormData : function() {
				$.each(this.$values, function(index, element) {
					if ($(element).val() != '')
						dataSet[$(element).attr('data-jobq-date')] = $(element).val();
				});
			}	
	};
	
	inputs = [textInputs, checkboxInputs, selectInputs, dateInputs];
	var getInputs = function() {
		dataSet = {};	// 초기화
		
		$.each(inputs, function(index, element){ 
			if(element.$values.length != 0)
				element.convertDataToFormData(); 
			});
	};
	
	/*function validateDateInputs() {
	var isEmptyDateInputs = (inputs.dateInputs[0].value == '' && inputs.dateInputs[1].value != '')
	|| (inputs.dateInputs[0].value != '' && inputs.dateInputs[1].value == '');
	if (isEmptyDateInputs)
		return false;
	
	return true;
	}*/
	
	if (typeof ($.jobqForm) != 'undefined' && typeof ($.jobqForm) != 'object')
		throw new Error('다른 곳에서 이미 $.jobqForm가 사용중 입니다.');
	else
		$.jobqForm = {};

	if (typeof ($.jobqForm.submit) != 'undefined')
		throw new Error('다른 곳에서 이미 $.jobqForm.submit가 사용중 입니다.');

	
	$.jobqForm.bindInputedValues = function() {
		getInputs();	
		
		return dataSet;
	}

})(jQuery);