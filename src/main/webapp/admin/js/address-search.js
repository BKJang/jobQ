/**
 *  @2017-07-22
 *  @주소검색
 */

function AddressSearch(){
	 if(!this instanceof AddressSearch)
		 return new AddressSearch();
	 
	 this.popupView = null;
}
 
AddressSearch.prototype.showPopup = function(){
	  var popupView = window.open("/sample/admin/common/address/popup.jobq","pop","width=320,height=250, scrollbars=yes, resizable=yes");
}

AddressSearch.prototype.insertAddressToInput = function(addressInfo){
	$('#road-address').val(addressInfo.roadAddress);
	$('#detail-address').val(addressInfo.detailAddress);
	$('#zip-code').val(addressInfo.zipCode);
}


