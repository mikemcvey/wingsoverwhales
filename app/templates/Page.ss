<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
	<% base_tag %>
	<%-- <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title> --%>

	<%-- // force Internet Explorer to use the latest rendering engine available  --%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<%-- // mobile meta (hooray!) --%>
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">

	$GenerateMetaTags.RAW

	<%-- favicons --%>
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
	<link rel="manifest" crossorigin="use-credentials" href="/site.webmanifest">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#1b3971">
	<meta name="msapplication-TileColor" content="#1b3971">
	<meta name="theme-color" content="#1b3971">
	<%-- end favicons --%>
	<%-- Preconnect --%>
	<link rel="dns-prefetch" href="//unpkg.com">
	<link rel="dns-prefetch" href="//use.typekit.net/">
  	<link rel="stylesheet" href="https://use.typekit.net/low2kzo.css">
	<link rel="stylesheet" href="dist/common.css?f=12" />
	
	<script id="jQuery" src="https://unpkg.com/jquery@3.6.0/dist/jquery.min.js"></script>
 <%-- was jquery@3.6.0  jquery@2.2.4 --%>
  <link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" media="print" onload="this.media='all'" />
	<link rel="stylesheet" href="https://unpkg.com/aos@3.0.0-beta.6/dist/aos.css" media="print" onload="this.media='all'" />

	 <link rel="stylesheet" href="library/js/lightgallery/css/lightgallery.css" media="print" onload="this.media='all'" />
	<%-- <link rel="stylesheet" href="library/js/lightgallery/css/lg-thumbnail.css" media="print" onload="this.media='all'" /> 
    <link type="text/css" rel="stylesheet" href="library/js/lightgallery/css/lightgallery-bundle.css" media="print" onload="this.media='all'" />--%>

</head>
<body class="$ClassName.ShortName depth-$PageLevel section-$Level(1).URLSegment  $ClassXtra  $URLSegment $AdminStyle" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %> itemscope itemtype="http://schema.org/WebPage">

	<%-- include PageNavigation --%>
		<div id="PageContainer">
			<div class="background-overlay abs" style="background-color: rgba(0, 0, 0, 1);"></div>
			<div class="wrap">
				<!-- intro -->
				<section id="intro" class="layer overflow">
						<% include Header Top=$Top %>
						<% include Banner %>
				</section>
				<!-- end intro -->
				<!-- begin main -->
				
				<div id="main" class="layout_wrap" role="main">  
						$Layout 
						<%--
						<% if $ClassName == "SilverStripe\Blog\Model\Blog" || $ClassName == "SilverStripe\Blog\Model\BlogPost"  %> 
						<% else_if $PageLevel == 1 && $allchildren %>
							<div class="inner inner-1170 number-columns-1 pad-top-60 pad-bot-60 grid clearfix text-on-default text-center">
								<div class="col overflow">
								<h3><strong>Find Out More</strong></h3>
									<div class="textwrap listing-wrapper ">
									
										<div class="grid list-unstyled grid-center clearfix">
									 <% if $ClassName == 'SilverStripe\CMS\Model\VirtualPage' %>
											<% loop $ChildrenOf($CopyContentFromID) %>
												<% include SilverStripe\\Blog\\PostSummary %>
											<% end_loop %>
									 <% else %>
										
											<% loop $allchildren %>
												
												<% if $ClassName == 'StaffPage' %>
												<% else %>
												<% include SilverStripe\\Blog\\PostSummary %>
												<% end_if %>
											<% end_loop %>
									 <% end_if %>
										</div>
									</div>
								</div>
							</div>
							<% else_if $PageLevel == 2 && $Parent.allchildren %>
								<div class="inner inner-1170 number-columns-1 pad-top-60 pad-bot-60 grid clearfix text-on-default">
									<div class="col overflow">
									<h3><strong>Find Out More</strong></h3>
										<div class="textwrap listing-wrapper ">
										
											<div class="grid list-unstyled grid-center clearfix">
											
										 <% if $ClassName == 'SilverStripe\CMS\Model\VirtualPage' %>
												<% loop $ChildrenOf($CopyContentFromID) %>
													<% include SilverStripe\\Blog\\PostSummary %>
												<% end_loop %>
										 <% else %>
											
												<% loop $Parent.allchildren %>
													<% if $Top.ID == $ID %>

													<% else_if $ClassName == 'StaffPage' %>
													<% else %>
													<% include SilverStripe\\Blog\\PostSummary %>
													<% end_if %>
												<% end_loop %>
										 <% end_if %>

										 <% with $Parent %>
											<% include SilverStripe\\Blog\\PostSummary %>
										 <% end_with %> %>
											</div>
										</div>
									</div>
								</div>
								
							<% end_if %>
							--%>
				</div>
				
				<!-- end main -->

			<% include Footer %>
			<%-- cached 'NavPanels', $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count() %>
				<% include NavPanels %>
			<% end_cached --%>
				
			</div>
		</div>
		<% include TreeNavigation %>
	 <div class="back-to-top-wrap noprint"><a class="back-to-top" href="{$BaseURL}"></a></div> 

	<%-- <script defer async type="text/javascript" src="https://ecozipadventures.rezdy.com/pluginJs?script=modal"></script> --%>

<script>


  console.log('%c Built with love by https://maverickdigital.nz ', 'background: #29e3bf; color: #fff');

  captions = document.getElementsByClassName("captionImage");
  for (var i = 0; i < captions.length; i++) {
    captions[i].setAttribute("style", "");
  }

  
window.addEventListener('load', checkJSLoaded);

function checkJSLoaded() {

	jQuery('a.readmore').on('click', function(event){
		var moretext = "+ Read More";
		var lesstext = "- Show less";
		console.log("read more toggle: " + $(this).hasClass("hidden") + " " + $(this).data("target")+ " " + $(this).attr("data-target"));
		event.preventDefault();
						//console.log($(this).find('.readmore-toggle'))

		if($(this).hasClass("more")) {
			$(this).removeClass("more")
			$($(this).data("target")).removeClass('hidden');
			$(this).html(lesstext);
		}else{
			$(this).addClass("more")
			$($(this).data("target")).addClass('hidden');
			$(this).html(moretext);
		}
		
		
		//event.hide();
	});
  
	if ( window.location !== window.parent.location ) {
		console.log('The page is in an iframe'); 
	  } else {
		console.log('The page is not in an iframe'); 
		var script = document.createElement('script');
		script.src = 'https://ecozipadventures.rezdy.com/pluginJs?script=modal';
		script.defer = true;
		document.body.appendChild(script);
	}
    // SWIPER
			// create the script element
			var script = document.createElement('script');
			script.addEventListener('load', (event) => {
				console.log('swiper.js file has been loaded');
				var evt = new CustomEvent("swiperLoaded", {detail: "Any Object Here"});
				window.dispatchEvent(evt);
			});
			// load the script file
			script.defer = true;
			script.src = 'https://unpkg.com/swiper@8.3.2/swiper-bundle.min.js';
			document.body.appendChild(script);


			// lightgalleryJS
			
			// create the script element
			var lightgallery_script = document.createElement('script');
			lightgallery_script.addEventListener('load', (event) => {
				console.log('lightgalleryJS.js file has been loaded');
				var evt = new CustomEvent("lightgalleryLoaded", {detail: "Any Object Here"});
				window.dispatchEvent(evt);
			});
			// load the script file
			lightgallery_script.defer = true;
			lightgallery_script.src = 'https://cdnjs.cloudflare.com/ajax/libs/lightgallery/1.2.19/js/lightgallery-all.min.js';
			document.body.appendChild(lightgallery_script);
			







    // AOS SCRIPT
    // create the script element
    var aosscript = document.createElement('script');
    aosscript.addEventListener('load', (event) => {
        console.log('aos.js file has been loaded');
        headings = document.querySelectorAll("h1");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-up");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
        }
        headings = document.querySelectorAll("h2");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-up");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
        }
        headings = document.querySelectorAll("p");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-up");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
        }
        headings = document.querySelectorAll(".bg-pattern-orange-box .textwrap p");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-right");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
        }
        headings = document.querySelectorAll(".bg-pattern-pink-box .textwrap p");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-left");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
        }
        headings = document.querySelectorAll("article");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-up");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
        }
        headings = document.querySelectorAll(".background-image img");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-in");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
        }
        headings = document.querySelectorAll("footer .grid .col");
        for (var i = 0; i < headings.length; i++) {
            headings[i].setAttribute('data-aos', "fade-up");
            headings[i].setAttribute('data-aos-anchor-placement', "top-bottom");
            headings[i].setAttribute('data-aos-delay', i + "00");
        }
        AOS.init();
    });
    // load the script file
    aosscript.src = 'https://unpkg.com/aos@3.0.0-beta.6/dist/aos.js';
	aosscript.defer = true;
    document.body.appendChild(aosscript);
}



var script = document.createElement('script');
script.addEventListener('load', (event) => {
	console.log('isotope.js file has been loaded');
	var evt = new CustomEvent("isotopeLoaded", {detail: "Any Object Here"});
	window.dispatchEvent(evt);
});
// load the script file
script.src = 'https://npmcdn.com/isotope-layout@3/dist/isotope.pkgd.js';
script.defer = true;
document.body.appendChild(script);



var matchHeight_script = document.createElement('script');
matchHeight_script.addEventListener('load', (event) => {
	console.log('matchHeightJS');
	matchEl = document.getElementsByClassName("match");
	if(matchEl.length>=1) {
	new ResponsiveAutoHeight('.match');
	}
	matchEl = document.getElementsByClassName("match2");
	if(matchEl.length>=1) {
	new ResponsiveAutoHeight('.match2');
	}
		});
		// load the script file
		matchHeight_script.src = 'https://unpkg.com/responsive-auto-height@0.0.4/js/responsive-auto-height.min.js';
		matchHeight_script.defer = true;
		document.body.appendChild(matchHeight_script);



/* off canvas */
var click=document.querySelectorAll(".triggerOffCanvas");
var menu=document.querySelector("#mySidenav");
var pusher=document.querySelector(".background-overlay");
var mainBody=document.querySelector("body");

for (var i=0; i < click.length; i++) {
  click[i].addEventListener("click", addClass);
}

pusher.addEventListener("click", closeMenu);

function addClass(el) {
  el.target.classList.add('is-active');
mainBody.classList.add('open-menu')
}

function closeMenu(el) {
  if (mainBody.classList.contains('open-menu')) {
    for (var i=0; i < click.length; i++) {
      click[i].classList.remove('is-active')
    }
    
    mainBody.classList.remove('open-menu')
  }
}

var forEach=function(t, o, r) {
  if ("[object Object]"===Object.prototype.toString.call(t)) for (var c in t) Object.prototype.hasOwnProperty.call(t, c) && o.call(r, t[c], c, t);
  else for (var e=0, l=t.length; l > e; e++) o.call(r, t[e], e, t)
}


var hamburgers=document.querySelectorAll("#PageContainer .hamburger");

if (hamburgers.length > 0) {
  forEach(hamburgers, function(hamburger) {
      hamburger.addEventListener("click", function() {
          this.classList.toggle("is-active");
        }
        
        , false);
    });
}
/* video */
	function debounce(a,b,c){var d;return function(){var e=this,f=arguments;clearTimeout(d),d=setTimeout(function(){d=null,c||a.apply(e,f)},b),c&&!d&&a.apply(e,f)}}

	var myEfficientFn = debounce(function() {
		if (jQuery('#homepage_video').length) {
				WidthChange('#homepage_video');
			}
	}, 250);

	window.addEventListener('resize', myEfficientFn);
	window.addEventListener('load', myEfficientFn);
	/*
	jQuery(document).ready(function () {
		console.log("ready");
		if (jQuery('#homepage_video').length) {
			WidthChange('#homepage_video');
		}
	});
	*/

	function WidthChange(el) {
		var lPowerTried = false;
		if (jQuery(window).width() <= 640) {
		
			jQuery(el).html('<source src="' + vids[0] + '" type="video/mp4"></source>' );

		} else if (jQuery(window).width() <= 960) {
			
			jQuery(el).html('<source src="' + vids[1] + '" type="video/mp4"></source>' );
		}else{
			
			jQuery(el).html('<source src="' + vids[2] + '" type="video/mp4"></source>' );

		}
		jQuery(el)[0].load();
		
		var playPromise = jQuery(el)[0].play();
		if (playPromise !== undefined) {
			playPromise.then(function() {
				// Automatic playback started!
				jQuery(el).fadeIn();
				console.log('Automatic playback started!');
			}).catch(function(error) {
				console.log('Auto-play was prevented');
				jQuery(el).hide();
				// Show a UI element to let the user manually start playback.
			});
		}
		
	}



  

  jQuery(document).ready(function ($) {

	//Back to top
	var offset = $(window).height() * 1.5;;
	var duration = 500;
	var toggleShow = false;
	$(window).scroll(function () {
		if ($(this).scrollTop() > 50) {	//	$('header').addClass("fixed");}else{	//	$('header').removeClass("fixed");}
			if ($(this).scrollTop() > offset) {/*setTimeout(function(){		if (readCookie('closed_modal') == null) {			$('.popup').fadeIn();			$('html').addClass('popup-open');		}	}, 5000);*/if (!toggleShow) {
				toggleShow = true; 
				console.log('aos-refresh');
				
				if (typeof AOS !== 'undefined') {
					AOS.refresh();
				}
				$('.mobile-toggle-wrap').stop().fadeIn(duration);
				$('.back-to-top').stop().fadeIn(duration);
			}
			} else {
				if (toggleShow) {
					toggleShow = false; $('.mobile-toggle-wrap').stop().fadeOut('150');
					$('.back-to-top').stop().fadeOut('150');
				}
			}
		}
	});
	$('.back-to-top').click(function (event) {
		event.preventDefault();
		$('html, body').animate({ scrollTop: 0 }, duration);
		return false;
	});
	
	

		// smooth scrolling for anchors
	$('a[href*="#"]:not([href="#"])').click(function () {
		
			var target = $(this.hash);
            console.log("smooth scroll " + target);
			target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
			if (target.length) {
				console.log("smooth scroll " + target);
				$('html,body').animate({
					scrollTop: target.offset().top
				}, 1000);
				return false;
			}
		
	});
	//console.log(location.hash); 
	if (location.hash == '') {
		
			
		  // $("html, body").animate({ scrollTop: 0 }, 600);
	
		
	}else {
		console.log($(location.hash).offset().top);
		var targetOffset = Math.floor($(location.hash).offset().top);
		//scroll			 
		$('html,body').animate({ scrollTop: targetOffset }, 1000, function () {
			jQuery(window).scroll();
		});
	}
	$('html,body').on("scroll mousedown wheel DOMMouseScroll mousewheel keyup touchmove", function () { $('html,body').stop(); });

});

</script>

</body>
</html>
