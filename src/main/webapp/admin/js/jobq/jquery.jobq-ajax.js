/**
 * 2017.07.31 - ver 0.1 jobqAjax 
 */

(function($){
	var tempOptions = {};
	
	var defaultOptions = {
		type:'get',
		async:true,
		contentType:'application/x-www-form-urlencoded',
		beforeSend:function(){
			
		},
		success:function(result){
			alert(result);
		},error:function(xhr, status){
			alert(xhr + ", " + status);
		}	
	};
	
	var jsonOptions = {
		type:'post',
		async:true,
		contentType:'application/json',
		beforeSend:function(){
			
		},
		success:function(result){
			alert(result);
		},error:function(xhr, status){
			alert(xhr + ", " + status);
		}
	};
	
	var urlList = {};
	var dataList = {};
	var successHandler = {};
	
	if(typeof($.jobqAjax) != 'undefined' && typeof($.jobqAjax) != 'object')
		throw new Error('이미 $.jobqAjax라는 이름이 다른 곳에서 사용중입니다.');
	else
		$.jobqAjax = {};
	
	if(typeof($.jobqAjax.setOptions) != 'undefined')
		throw new Error('이미 $.jobqAjax.setOptions라는 이름이 다른 곳에서 사용중입니다.');
	else if(typeof($.jobqAjax.send) != 'undefined')
		throw new Error('이미 $.jobqAjax.send라는 이름이 다른 곳에서 사용중입니다.');
	else if(typeof($.jobqAjax.setUrls) != 'undefined')
		throw new Error('이미 $.jobqAjax.setUrls라는 이름이 다른 곳에서 사용중입니다.');
	else if(typeof($.jobqAjax.setDataSet) != 'undefined')
		throw new Error('이미 $.jobqAjax.setDataSet라는 이름이 다른 곳에서 사용중입니다.');
	else if(typeof($.jobqAjax.isJsonOptions) != 'undefined')
		throw new Error('이미 $.jobqAjax.isJsonOptions라는 이름이 다른 곳에서 사용중입니다.');
	
	$.jobqAjax.setOptions = function(options, urls, dataSet){
		if(arguments.length == 1)
			$.extend(tempOptions, options);
		else if(arguments.length == 2){
			$.extend(tempOptions, options);
			$.extend(urlList, urls);	
		}else if(arguments.length == 3){
			$.extend(tempOptions, options);
			$.extend(urlList, urls);
			$.extend(dataList, dataSet);
		}
		
		return this;
	};
	
	$.jobqAjax.setHttpMethod = function(method){
		tempOptions.headers = {
			"Content-Type" : "application/json",
			"X-HTTP-Method-Override" : method
		}
	}
	
	$.jobqAjax.isJsonOptions = function(isJson){
		if(isJson == true)
			$.extend(tempOptions, jsonOptions);
		else if(isJson == false)
			$.extend(tempOptions, defaultOptions);
		
		return this;
	};
	
	$.jobqAjax.setUrls = function(urls){
		$.extend(urlList, urls);

		return this;
	};
	
	$.jobqAjax.setDataSet = function(mappingUrl, dataSet){
		dataList[mappingUrl] = dataSet;
		
		return this;
	};
	
	$.jobqAjax.send = function(url, dataSet){
		if(arguments.length == 0)
			throw new Error('url을 입력해야 합니다.');
		else if(arguments.length == 1){
			tempOptions.url = urlList[url];
			tempOptions.data = dataList[url];
		}
		
		console.dir(tempOptions);
		// $.ajax(tempOptions);
	};
	
})(jQuery);