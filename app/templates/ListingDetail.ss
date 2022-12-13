<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
	<% base_tag %>
		<%-- <title><% if $MetaTitle %>$MetaTitle<% else %>$Title<% end_if %> &raquo; $SiteConfig.Title</title> --%>
	<% if DisplayObject %>
		<% with DisplayObject %>
	<%-- 	<title>{$ProductName} / {$ProdType} / {$ProductRegion} &raquo; $SiteConfig.Title</title>  --%>
		$GenerateMetaTags.RAW
		<% end_with %>
	<% else %>
		$GenerateMetaTags.RAW
	<% end_if %>

	<%-- // force Internet Explorer to use the latest rendering engine available  --%>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<%-- // mobile meta (hooray!) --%>
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">

	<%-- favicons --%>
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
	<link rel="manifest" crossorigin="use-credentials" href="/site.webmanifest">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#00b6b7">
	<meta name="msapplication-TileColor" content="#243445">
	<meta name="theme-color" content="#243445">
	<%-- end favicons --%>
	
	<%-- not configured -- include Preconnect --%>
	<!-- css for dev -->
	<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />

<!-- Google Tag Manager -->

<!-- End Google Tag Manager -->
</head>

<body class="$ClassName.ShortName depth-$PageLevel section-$Level(1).URLSegment  $ClassXtra  $URLSegment $AdminStyle " 
 <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %> itemscope itemtype="http://schema.org/WebPage">
<!-- Google Tag Manager (noscript) -->

<!-- End Google Tag Manager (noscript) -->

				<div id="PageContainer">
					<div class="background-overlay3" style="background-color: rgba(0, 0, 0, 0);"></div>
					<div class="wrap">
						<% if inSection(search) %>
						<% else %>

						<div class="search top_bar clearfix">
							$_SearchForm 
						</div>
					
						<% end_if %>
							<%-- <pre>Page.ss</pre> --%>
			<!-- intro -->
			<section id="intro" class="layer overflow">
					<% include Header Top=$Top %>
			</section>
			<!-- end intro -->

			<!-- begin main -->
			<div id="main" class="layout_wrap listing-page" role="main">
         <div class="layer layout-content clearfix no-bg-image text-default pad-top-200 pad-bot-default vheight-default text-on-default bg-pattern-default bg-gradient-default">
            <div class="inner inner-default clearfix">
              <div class="grid">
                <div class="col _inner textwrap col-align-top">
                  <h3>$Listing.Name</h3>
                  <div class="listing-page__summary">
                    $Listing.Summary
                  </div>
                  <% if $Listing.Website || $Listing.BookingURL %>
                  <div class="listing-page__btn-group  pad-top-40">
                    <% if $Listing.Website %>
                      <a class="button col" target="_blank" href="$Listing.BookingURL">Book Now</a> 
                    <% end_if %>
                    <% if $Listing.BookingURL %>
                      <a class="button blue col" target="_blank" href="$Listing.Website">Visit Website</a> 
                    <% end_if %>
                  </div>
                  <% end_if %>
                </div>
              </div>
              <div class="grid pad-top-40 pad-bot-40">
                <div class="col _inner textwrap col-align-top pad-top-200">
                  <script type="text/javascript">
                      window.GalleyID = $Listing.ID
                  </script>
                  <div class="listing-page__loader-wrapper">
                    <svg class="listing-page__loader" version="1.1" id="L2" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                      viewBox="0 0 100 100" enable-background="new 0 0 100 100" xml:space="preserve">
                      <circle fill="none" stroke="#000" stroke-width="4" stroke-miterlimit="10" cx="50" cy="50" r="48"/>
                      <line fill="none" stroke-linecap="round" stroke="#000" stroke-width="4" stroke-miterlimit="10" x1="50" y1="50" x2="85" y2="50.5">
                        <animateTransform 
                            attributeName="transform" 
                            dur="2s"
                            type="rotate"
                            from="0 50 50"
                            to="360 50 50"
                            repeatCount="indefinite" />
                      </line>
                      <line fill="none" stroke-linecap="round" stroke="#000" stroke-width="4" stroke-miterlimit="10" x1="50" y1="50" x2="49.5" y2="74">
                        <animateTransform 
                            attributeName="transform" 
                            dur="15s"
                            type="rotate"
                            from="0 50 50"
                            to="360 50 50"
                            repeatCount="indefinite" />
                      </line>
                    </svg>
                  </div>
                   <div id="inline-gallery-container" class="inline-gallery-container">
                    &nbsp;
                   </div>

                </div>
              </div>
              <div class="grid pad-bot-60">
                <div class="col _inner textwrap col-align-top pad-top-200 listing-page__grid">
                  <div class="listing-page__grid--left">
                    $Listing.Description

                    <script type="text/javascript">
                      window.mapCoordinates = {
                        long: $Listing.Longitude,
                        lat: $Listing.Latitude,
                        zoom: $Listing.Zoom
                      };
                    </script>
                    <div id="map"></div>
                    <div class="pad-top-20">
                      <a href="https://maps.google.com?saddr=Current+Location&amp;daddr=$Listing.Latitude,$Listing.Longitude" 
                        class="button col" target="_blank">
                          Get Directions
                      </a>
                    </div>

                    <div class="pad-top-40 pad-bot-20">
                      <h5 class="listing-page__section-title"><strong>Amenities &amp; Facilities</strong></h5>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sagittis, orci sit amet condimentum aliquam, turpis risus dignissim risus, a vulputate
                        lorem odio in ante. Nunc pellentesque enim dolor,
                    </div>

                    <div class="pad-top-20 pad-bot-20">
                      <h5 class="listing-page__section-title"><strong>Additional Information</strong></h5>
                        Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque sagittis, orci sit amet condimentum aliquam, turpis risus dignissim risus, a vulputate
                        lorem odio in ante. Nunc pellentesque enim dolor,
                    </div>
                  
                  </div>
                  <div class="listing-page__grid--right">
                    <div class="listing-page__image">
                    <% if $Listing.LogoImage %>
                        <% with $Listing.LogoImage %>
                            <img src="$Fit(340, 340).URL" class="listing-page__logo" 
                              style="object-position: $PercentageX% $PercentageY%" 
                              alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                          <% end_with %>   
                    <% end_if %>
                    </div>
                    <% if $Listing.Website || $Listing.BookingURL %>
                    <div class="listing-page__btn-group pad-top-20 pad-bot-20">
                      <% if $Listing.Website %>
                      <a class="button col" target="_blank" href="$Listing.BookingURL">Book Now</a> 
                      <% end_if %>
                      <% if $Listing.BookingURL %>
                      <a class="button blue col" target="_blank" href="$Listing.Website">Visit Website</a>
                      <% end_if %>
                    </div>
                    <% end_if %>

                    <div class="listing-page__price pad-top-20 pad-bot-20">
                      <% if $Listing.MinPrice > 0 || $Listing.MaxPrice > 0 %>
                          <% if $Listing.ListingType.Title=Accommodation %>
                              <h5 class="listing-page__section-title"><strong>Per Night</strong></h5>
                          <% else %>
                              <h5 class="listing-page__section-title"><strong>Prices</strong></h5>
                          <% end_if %>
                          
                          <% if $Listing.MinPrice < $Listing.MaxPrice %>
                              From $$Listing.MinPrice  &ndash; $$Listing.MaxPrice
                          <% else %>
                              From $Listing.$MinPrice
                          <% end_if %>

                          <p class="pad-top-20 pad-bot-20"><% if $Listing.MinAge %>Minimum Age: $Listing.MinAge<% end_if %></p>
                      <% end_if %>
                      <hr />
                    </div>

                    <div class="listing-page__contact pad-top-20 pad-bot-20">
                      <% if $Listing.MinPrice > 0 || $Listing.MaxPrice > 0 %>
                          <h5 class="listing-page__section-title"><strong>Contact</strong></h5>
                          <ul class="listing-page__contact-item">
                            <% if $Listing.Phone %>
                                <li>
                                  <a href="tel:$Listing.Phone">
                                    <span class="listing-page__icon">
                                      <svg viewBox="0 0 500 500">
                                        <path d="M128,21q40,75,53,91.5q10,15.5-2,27.5c-10,13-38,32-45,40c-10,9-12,15-3,32q54,105,158,156c18,10,20,5,32-5c8-8,20-27,35-41c10-11,20-12,32-3q14,11,88,51c9,5,11,8,9,27q-7,40-22,51q-67,53-133,29c-180-55-286-195-315-336q-4-62,36-105q10-13,30-17c35-11,42-6,47,2z" />
                                      </svg>
                                    </span> $Listing.Phone
                                  </a>
                                </li>
                            <% end_if %>
                            <% if $Listing.Email %>
                                <li>
                                  <a href="mailto:$Listing.Email">
                                    <span class="listing-page__icon">
                                      <svg viewBox="0 -55 500 500">
                                        <path fill="none" stroke-width="30" d="M15,50 A35,35 0 0 1 50,15 L450,15 A35,35 0 0 1 485,50 L485,340 A35,35 0 0 1 450,375 L50,375 A35,35 0 0 1 15,340 Z C15,70 23,101 63,137 L208,252 C235,272 265,272 292,252 L437,137 C477,101 485,70 485,50" />
                                      </svg>
                                    </span> $Listing.Email
                                  </a>
                                </li>
                            <% end_if %>
                          </ul>
                      <% end_if %>
                      <hr />
                    </div>

                    <div class="listing-page__location pad-top-20 pad-bot-20">
                      <h5 class="listing-page__section-title"><strong>Location</strong></h5>
                      <p><% if $Listing.Street %>$Listing.Street<br/><% end_if %>
                        $Listing.Suburb<% if  Suburb %><% if $Listing.City || $Listing.PostCode %>,<% end_if %><% end_if %> $Listing.City $Listing.PostCode<br/>
                        <% if $Listing.State %>$Listing.State<br/><% end_if %>
                        $Listing.CountryName</p>
                     <hr />
                    </div>

                    <% if $Listing.hasOpeningHours %>
                      <div class="listing-page__opening-times pad-top-20 pad-bot-20">
                        <h5 class="listing-page__section-title"><strong>Opening Times</strong></h5>
                        <% if $Listing.IsClosedEveryday %>
                            <p>Closed.</p>
                        <% else_if $Listing.isOpen %>
                            <p>Open now</p>
                        <% else_if $Listing.nextOpens.DOW %>
                            <p>Closed. Reopens $Listing.nextOpens.DOW $Listing.nextOpens.From</p>
                        <% end_if %>
                        <table class="listing-page__open-hours">
                            <% loop $Listing.OpeningHours %>
                                <tr>
                                    <td>$DOW</td>
                                    <% if $Open %>
                                        <td class="listing-page__open-hours-open">$From &ndash; $To</td>
                                    <% else %>
                                        <td class="listing-page__open-hours-closed">Closed</td>
                                    <% end_if %>
                                </tr>
                            <% end_loop %>
                        </table>
                      </div>
                    <% else_if $Listing.TwentyFourSeven %>
                      <div class="listing-page__opening-times pad-top-20 pad-bot-20">
                        <h5 class="listing-page__section-title"><strong>Opening Times</strong></h5>
                        <p>Open 24 hours, 7 days a week</p>
                      </div>
                    <% end_if %>
                    
                    <% if $Listing.QualmarkRating %>
                      <div class="listing-page__ratings pad-top-20 pad-bot-20">
                        <% if $Listing.QualmarkAwardCovidSafe %>
                          <img class="listing-page__covid-clean" 
                            title="$Listing.Title" 
                            alt="$Listing.Title" 
                            src="/library/images/qualmark/covid-clean-logo.png" 
                          />
                        <% end_if %>
                        <img class="listing-page__qualmark" 
                          title="$Listing.Title" 
                          alt="$Listing.Title" 
                          src="/library/images/qualmark/$getQualmark($Listing.QualmarkRating, $Listing.QualmarkGrade)" 
                        />
                      </div>
                  <% end_if %>

                  </div>
                </div>
              </div>
            </div>
         </div>
			</div>
			<!-- end main -->
					<% include Footer %>
					</div>
				</div>
		
	</div><!-- /pusher -->
	 <div class="back-to-top-wrap noprint"><a class="back-to-top" href="{$BaseURL}"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 438.5 438.5"><path fill="#f7f7ed" d="M409.1 109.2c-19.6-33.6-46.2-60.2-79.8-79.8C295.7 9.8 259.1 0 219.3 0c-39.8 0-76.5 9.8-110.1 29.4 -33.6 19.6-60.2 46.2-79.8 79.8C9.8 142.8 0 179.5 0 219.3c0 39.8 9.8 76.5 29.4 110.1 19.6 33.6 46.2 60.2 79.8 79.8 33.6 19.6 70.3 29.4 110.1 29.4s76.5-9.8 110.1-29.4c33.6-19.6 60.2-46.2 79.8-79.8 19.6-33.6 29.4-70.3 29.4-110.1C438.5 179.5 428.7 142.8 409.1 109.2zM361.4 231.8l-26 26c-3.6 3.6-7.9 5.4-12.8 5.4 -4.9 0-9.2-1.8-12.8-5.4l-54-54v143.3c0 4.9-1.8 9.2-5.4 12.8 -3.6 3.6-7.9 5.4-12.8 5.4h-36.5c-4.9 0-9.2-1.8-12.8-5.4 -3.6-3.6-5.4-7.9-5.4-12.8v-143.3l-54 54c-3.4 3.4-7.7 5.1-12.8 5.1 -5.1 0-9.4-1.7-12.8-5.1l-26-26c-3.4-3.4-5.1-7.7-5.1-12.9 0-5.1 1.7-9.4 5.1-12.8l103.4-103.4 26-26c3.4-3.4 7.7-5.1 12.8-5.1 5.1 0 9.4 1.7 12.8 5.1l26 26 103.4 103.4c3.4 3.4 5.1 7.7 5.1 12.8C366.6 224.1 364.9 228.4 361.4 231.8z"/></svg></a></div> 
<!-- js for dev -->
</body>
</html>
