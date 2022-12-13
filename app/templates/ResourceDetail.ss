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
                  <h3>$Listing.Title</h3>
                  <div class="listing-page__summary">
                    $Listing.Description

                     <% if $Listing.Files %>
                        <div class="product-files p-section">
                            <ul style="list-style-type:none;padding:0;">
                                <% loop $Listing.Files %>
                                    <li class="list-item">
                                        <a href="$URL" target="_blank" class="button col"><i class="fa fa-file-o "></i>
                                            Download $Title.{$FileFormat}</a>
                                    </li>
                                <% end_loop %>
                            </ul>
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
