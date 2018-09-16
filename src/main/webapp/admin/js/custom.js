/* Navigation */

$(document).ready(function(){
  $(window).resize(function(){
    if($(window).width() >= 765){
      $(".sidebar .sidebar-inner").slideDown(350);
    }
    else{
      $(".sidebar .sidebar-inner").slideUp(350); 
    }
  });

});

$(document).ready(function(){
  $(".has_submenu > a").click(function(e){
	
    e.preventDefault();
    var menu_li = $(this).parent("li");
    var menu_ul = $(this).next("ul");

    if(menu_li.hasClass("open")){
      menu_ul.slideUp(350);
      menu_li.removeClass("open")
    }
    else{
      $(".navi > li > ul").slideUp(350);
      $(".navi > li").removeClass("open");
      menu_ul.slideDown(350);
      menu_li.addClass("open");
    }
  });

});

$(document).ready(function(){
  $(".sidebar-dropdown a").on('click',function(e){
      e.preventDefault();

      if(!$(this).hasClass("dropy")) {
        // hide any open menus and remove all other classes
        $(".sidebar .sidebar-inner").slideUp(350);
        $(".sidebar-dropdown a").removeClass("dropy");
        
        // open our new menu and add the dropy class
        $(".sidebar .sidebar-inner").slideDown(350);
        $(this).addClass("dropy");
      }
      
      else if($(this).hasClass("dropy")) {
        $(this).removeClass("dropy");
        $(".sidebar .sidebar-inner").slideUp(350);
      }
  });

});

/* Widget close */

$('.wclose').click(function(e){
  e.preventDefault();
  var $wbox = $(this).parent().parent().parent();
  $wbox.hide(100);
});

/* Widget minimize */

$('.wminimize').click(function(e){
	e.preventDefault();
	var $wcontent = $(this).parent().parent().next('.widget-content');
	if($wcontent.is(':visible')) 
	{
	  $(this).children('i').removeClass('fa fa-chevron-up');
	  $(this).children('i').addClass('fa fa-chevron-down');
	}
	else 
	{
	  $(this).children('i').removeClass('fa fa-chevron-down');
	  $(this).children('i').addClass('fa fa-chevron-up');
	}            
	$wcontent.toggle(500);
}); 

/* Progressbar animation */

setTimeout(function(){
	$('.progress-animated .progress-bar').each(function() {
		var me = $(this);
		var perc = me.attr("data-percentage");

		var current_perc = 0;

		var progress = setInterval(function() {
			if (current_perc>=perc) {
				clearInterval(progress);
			} else {
				current_perc +=1;
				me.css('width', (current_perc)+'%');
			}

			me.text((current_perc)+'%');

		}, 600);

	});

},600);

/* Scroll to Top */


$(".totop").hide();

$(function(){
	$(window).scroll(function(){
	  if ($(this).scrollTop() > 240)
	  {
		$('.totop').fadeIn();
	  } 
	  else
	  {
		$('.totop').fadeOut();
	  }
	});

	$('.totop a').click(function (e) {
	  e.preventDefault();
	  $('body,html').animate({scrollTop: 0}, 500);
	});
});

/* Sidebar calendar */

$(document).ready(function() {
	$( "#todaydate" ).datepicker();
});

/* Modal fix */

$('.modal').appendTo($('body'));

/* Notification box */

$('.slide-box-head').click(function() {
    var $slidebtn=$(this);						
    var $slidebox=$(this).parent().parent();	// body
    
    if($slidebox.css('right')=="-252px"){
      $slidebox.animate({
        right:0
      },500);
      
      $slidebtn.children("i").removeClass().addClass("fa fa-chevron-right");
    }
    else{
      $slidebox.animate({
        right:-252
      },500);
      
      $slidebtn.children("i").removeClass().addClass("fa fa-chevron-left");
    }
}); 

$('.sclose').click(function(e){
  e.preventDefault();
  
  var $wbox = $(this).parent().parent().parent();
  $wbox.hide('3000');
  
  $('#jobq-nav').find('li:first-child').children('a').show('3000');

  $.cookie('isClose', 'true', {path : '/sample/admin'});
});

$('#slidebox-show-btn').on('click', function(e){
	e.preventDefault();
	
	$(this).hide('3000');
	
	$('body').animate({right:0},500);
	$('.slide-box-head').children("i").removeClass().addClass("fa fa-chevron-right");
	$('.slide-box').show('3000');
	
	$.cookie('isClose', 'false', {path : '/sample/admin'});
});

// slide-box에 대한 자바스크립트 이벤트
$('.sminimize').click(function(e){
	e.preventDefault();
	var $wcontent = $(this).parent().parent().next('.slide-content');
	
	if($wcontent.is(':visible')) 
	{
		$(this).children('i').removeClass('fa fa-chevron-down');
		$(this).children('i').addClass('fa fa-chevron-up');
		
		$.cookie('slideBoxState', 'down', {path : '/sample/admin'});
	}else 
	{
		$(this).children('i').removeClass('fa fa-chevron-up');
		$(this).children('i').addClass('fa fa-chevron-down');
		
		$.cookie('slideBoxState', 'up', {path : '/sample/admin'});
	}            
	
	$wcontent.toggle(0);
});

$(".slidebox-tab-menus").on('click', function(){
	// console.dir($slideboxTabMenus);	// 이 값은 배열이다.
	// console.dir($(this));			// 이 값은 그 배열중에서 click된 놈이다.
	var $slideboxTabMenus = $(".slidebox-tab-menus");
	
	$slideboxTabMenus.removeClass('active');
	$(this).addClass('active');
	
	$('.tab-pane').removeClass('active');
	$('#' + $(this).children().attr('data-toggle')).addClass('active');
	
	$.cookie('selectedTabMenu', $slideboxTabMenus.index(this), {path : '/sample/admin'});
});
  