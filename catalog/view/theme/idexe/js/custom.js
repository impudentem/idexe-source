$(document).ready(function() {

    $(".navbar-toggle").on('click', function(){
        $(this).toggleClass('open');
        $('.main-menu').slideToggle();
    });

    /*  new collection carousel */

    $(".top-carousel").owlCarousel({
        loop:true,
        margin: 15,
        items: 4,
        autoplay: true,
        nav : true,
        dots: false,
        responsive:{
            0:{
                items:1
            },
            600:{
                items:2
            },
            1000:{
                items:3
            },
            1200:{
                items:4
            }
        }
    });

    $(".owl-carousel .owl-nav .owl-prev").empty()
    $(".owl-carousel .owl-nav .owl-next").empty()


    /*  formstyler  */
    // jQuery.ajaxSetup({complete: function(){$("select").styler();console.log("ajaxSetup"); }});
    $('select').not('[name=\'zone_id\'], [name=\'country_id\']').styler();
    $('select[name=\'zone_id\'], select[name=\'country_id\']').styler({
      selectSearch: true
    });
    $('select[name=\'zone_id\'], select[name=\'country_id\']').change(function() {
    	// var value = $(this).val();
    	// $(this).find('option').each(function() {
    	// 	if ( $(this).val() == value ) $(this).prop('disabled', true);
    	// });
    	// $('select[name=\'zone_id\']').styler({
      //   selectSearch: true
      // });
      setTimeout(function() {
        $('select[name=\'zone_id\']').trigger('refresh');
      }, 100)
    });

    // $('select').styler({
    //     selectSmartPositioning: false
    // });

    /* bx slider gallery */

    $('.bxslider').bxSlider({
        pagerCustom: '#bx-pager'
    });

    /* item tabs initialization */

    $('.item-tab-list li a ').on('click', function(e) {
        e.preventDefault();

        var item = $(this).closest('.item-tab-list li'),
            contentItem = $('.item-tab-content__list'),
            itemPosition = item.index();

        contentItem.eq(itemPosition)
            .add(item)
            .addClass('active')
            .siblings()
            .removeClass('active');
    });


    $('.item-models .radio label').on('click',function(){
        $(this).parent().parent().find('label').removeClass('active');
        $(this).addClass('active');
    });


    /* слайдер цен */

    /*
    jQuery("#slider").slider({
        min: 0,
        max: 10000,
        values: [0,10000],
        range: true,
        stop: function(event, ui) {
            jQuery("input#minCost").val(jQuery("#slider").slider("values",0));
            jQuery("input#maxCost").val(jQuery("#slider").slider("values",1));

        },
        slide: function(event, ui){
            jQuery("input#minCost").val(jQuery("#slider").slider("values",0));
            jQuery("input#maxCost").val(jQuery("#slider").slider("values",1));
        }
    });
    */

    jQuery("input#minCost").change(function(){

        var value1=jQuery("input#minCost").val();
        var value2=jQuery("input#maxCost").val();

        if(parseInt(value1) > parseInt(value2)){
            value1 = value2;
            jQuery("input#minCost").val(value1);
        }
        jQuery("#slider").slider("values",0,value1);
    });


    jQuery("input#maxCost").change(function(){

        var value1=jQuery("input#minCost").val();
        var value2=jQuery("input#maxCost").val();

        if (value2 > 10000) { value2 = 10000; jQuery("input#maxCost").val(10000)}

        if(parseInt(value1) > parseInt(value2)){
            value2 = value1;
            jQuery("input#maxCost").val(value2);
        }
        jQuery("#slider").slider("values",1,value2);
    });



// фильтрация ввода в поля

    jQuery('#slider input').keypress(function(event){
        var key, keyChar;
        if(!event) var event = window.event;

        if (event.keyCode) key = event.keyCode;
        else if(event.which) key = event.which;

        if(key==null || key==0 || key==8 || key==13 || key==9 || key==46 || key==37 || key==39 ) return true;
        keyChar=String.fromCharCode(key);

        if(!/\d/.test(keyChar))	return false;

    });


});
