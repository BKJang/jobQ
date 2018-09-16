function JobqRegEx(){
	if(!this instanceof JobqRegEx)
		return new JobqRegEx();
}

JobqRegEx.prototype.memberSearchRegex = function(select, value){
	if(select == '이메일')
		return this.regexEmail(value);
	else if(select == '휴대폰')
		return this.regexPhoneNumber(value);
	else if(select == '아이디')
		return this.regexId(value);
};

JobqRegEx.prototype.isEmailRegex = function(email){
	var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
	
	if(email.length == 0)
		return false;
	
	if(!regExp.test(email))
		return false;	
	
	return true;
};

JobqRegEx.prototype.isPhoneNumberRegex = function(phoneNumber){
	var regExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	
	if(phoneNumber.length == 0)
		return false;

	if(!regExp.test(phoneNumber))
		return false;	
	
	return true;
};

JobqRegEx.prototype.isIdRegex = function(id){
	var regExp = /^[a-z]+[a-z0-9]{2,19}$/g;
	
	if(id.length == 0)
		return false;
	
	if(!regExp.test(id))
		return false;
		
	return true;
};

JobqRegEx.prototype.isNameRegex = function(name){
	var regExp = /^[가-힣]{2,4}$/;
	
	if(name.length == 0)
		return false;
	
	console.log(regExp.test(name));
	if(!regExp.test(name))
		return false;
	
	return true;
}

