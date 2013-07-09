var $ = jQuery.noConflict();
$(function() {
	
	$("input[type=text]").each(function ()
	{
		// store default value
		var v = this.value;

		$(this).blur(function ()
		{
			// if input is empty, reset value to default 
			if (this.value.length == 0) {
				this.value = v;
				$(this).removeClass("not-empty");
			} else {
				$(this).addClass("not-empty");
			}
		}).focus(function ()
		{
			// when input is focused, clear its contents
			if(this.value == v) {
				this.value = "";
			}	
			$(this).addClass("not-empty");
		}); 
	});
	
	$("a.city-toggle").click(function(e){
		$(this).addClass("hidden");
		var form = $(this).parents("form");
		form.find("input[name=city_secondary]").removeClass("hidden");
		form.find(".remove-city").removeClass("hidden");
		form.parents(".form-box").css("margin-top","65px");
		e.preventDefault();
	});
	
	$(".remove-city").click(function(){
		$(this).addClass("hidden");
		var form = $(this).parents("form");
		form.find("input[name=city_secondary]").addClass("hidden");
		form.find("a.city-toggle").removeClass("hidden");
		form.parents(".form-box").css("margin-top","85px");
		$("#start-sign-up-form-1 input[name='secondary_city']").val("");
		$(".form-box input[name='city_secondary']").removeClass("not-empty").val("secondary city you service...");
	});
	
	
	/*
	$("a#list-services-menu-item, .search-box input[type=submit]").click(function(e) {
		if ($(this).attr("id") != "list-services-menu-item") {
			var company	 		= $(".form-box input[name='company_name']").hasClass("not-empty") 	? $(".form-box input[name='company_name']").val() 		: "";
			var primary_city 	= $(".form-box input[name='city_primary']").hasClass("not-empty") 	? $(".form-box input[name='city_primary']").val() 		: "";
			var secondary_city 	= $(".form-box input[name='city_secondary']").hasClass("not-empty") ? $(".form-box input[name='city_secondary']").val() 	: "";
			
			if(company != "") {
				$("#start-sign-up-form-1 input[name='company_name']").val(company).addClass("not-empty");
			}
			if(primary_city != "") {
				$("#start-sign-up-form-1 input[name='primary_city']").val(primary_city);
			}
			if(secondary_city != "") {
				$("#start-sign-up-form-1 input[name='secondary_city']").val(secondary_city);
			}
		} else {
			$("#start-sign-up-form-1 input[name='company_name']").val("Company name").removeClass("not-empty");
			$("#start-sign-up-form-1 input[name='primary_city']").val("");
			$("#start-sign-up-form-1 input[name='secondary_city']").val("");
		}

		var pageHeight = $(document).height();
		$("#start-service-signup").css("height", pageHeight + "px");
		$("#start-service-signup").removeClass("hidden");
		e.preventDefault();
	});*/
	
	$("#start-service-signup a.close-btn").click(function() {
		$("#start-service-signup").addClass("hidden");
	});
	
	$("a.show-indiv-plans").click(function(e){
		$(this).hide(0);
		var pricingArea = $(this).parents("#home-how-it-works");
		pricingArea.find("a.indiv-price-return").removeClass("hidden").hide(0).fadeIn(600,'linear');
		pricingArea.find(".personal-pricing").removeClass("hidden").hide(0).slideDown(600);
		pricingArea.find(".home-individual").animate({left:305},600);
		pricingArea.find(".home-business").animate({
			opacity: 0,
			left: 550
		}, 600);
		
		$('html, body').delay(100).animate({ 
			easing: "easeOutQuart",
			scrollTop: 1185
		});
		e.preventDefault();
	});
	
	$("a.indiv-price-return").click(function(e){
		$(this).hide(0);
		var pricingArea = $(this).parents("#home-how-it-works");
		pricingArea.find("a.show-indiv-plans").fadeIn(600);
		pricingArea.find(".personal-pricing").slideUp(600);	
		pricingArea.find(".home-individual").animate({left:100},600);
		pricingArea.find(".home-business").animate({
			opacity: 1,
			left: 510
		}, 600);
		e.preventDefault();
	});	
	
	$("a.show-biz-plans").click(function(e){
		$(this).hide(0);
		var pricingArea = $(this).parents("#home-how-it-works");
		pricingArea.find("a.biz-price-return").removeClass("hidden").hide(0).fadeIn(600,'linear');
		pricingArea.find(".business-pricing").removeClass("hidden").hide(0).slideDown(600);
		pricingArea.find(".home-business").animate({left:305},600);
		pricingArea.find(".home-individual").animate({
			opacity: 0,
			left: 60
		}, 600);
		
		$('html, body').delay(100).animate({ 
			easing: "easeOutQuart",
			scrollTop: 1185
		});
		e.preventDefault();
	});
	
	$("a.biz-price-return").click(function(e){
		$(this).hide(0);
		var pricingArea = $(this).parents("#home-how-it-works");
		pricingArea.find("a.show-biz-plans").fadeIn(600);
		pricingArea.find(".business-pricing").slideUp(600);	
		pricingArea.find(".home-business").animate({left:510},600);
		pricingArea.find(".home-individual").animate({
			opacity: 1,
			left: 100
		}, 600);
		e.preventDefault();
	});	
});
