$(document).ready(function(){$(".navbar-toggle").on('click',function(){$(this).toggleClass('open');$('.main-menu').slideToggle();});$(".top-carousel").owlCarousel({loop:true,margin:15,items:4,autoplay:true,nav:true,dots:false,responsive:{0:{items:1},600:{items:2},1000:{items:3},1200:{items:4}}});$(".owl-carousel .owl-nav .owl-prev").empty()
$(".owl-carousel .owl-nav .owl-next").empty()
$('select').styler({selectSmartPositioning:false});$('.bxslider').bxSlider({pagerCustom:'#bx-pager'});$('.item-tab-list li a ').on('click',function(e){e.preventDefault();var item=$(this).closest('.item-tab-list li'),contentItem=$('.item-tab-content__list'),itemPosition=item.index();contentItem.eq(itemPosition).add(item).addClass('active').siblings().removeClass('active');});$('.item-models .radio label').on('click',function(){$(this).parent().parent().find('label').removeClass('active');$(this).addClass('active');});jQuery("input#minCost").change(function(){var value1=jQuery("input#minCost").val();var value2=jQuery("input#maxCost").val();if(parseInt(value1)>parseInt(value2)){value1=value2;jQuery("input#minCost").val(value1);}
jQuery("#slider").slider("values",0,value1);});jQuery("input#maxCost").change(function(){var value1=jQuery("input#minCost").val();var value2=jQuery("input#maxCost").val();if(value2>10000){value2=10000;jQuery("input#maxCost").val(10000)}
if(parseInt(value1)>parseInt(value2)){value2=value1;jQuery("input#maxCost").val(value2);}
jQuery("#slider").slider("values",1,value2);});jQuery('#slider input').keypress(function(event){var key,keyChar;if(!event)var event=window.event;if(event.keyCode)key=event.keyCode;else if(event.which)key=event.which;if(key==null||key==0||key==8||key==13||key==9||key==46||key==37||key==39)return true;keyChar=String.fromCharCode(key);if(!/\d/.test(keyChar))return false;});});