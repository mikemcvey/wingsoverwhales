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
	<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
	<link rel="manifest" href="/site.webmanifest">
	<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#f05a28">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
	<%-- // mobile meta (hooray!) --%>
	<meta name="HandheldFriendly" content="True">
	<meta name="MobileOptimized" content="320">
	<link rel="stylesheet" href="https://use.typekit.net/shz0oqd.css">
	<% include Preconnect %>
	<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
	<% require themedCSS('library/css/mobile_menu-min') %>
	<% require themedCSS('library/vendor/venobox/venobox-min') %>
	<% require themedCSS('library/css/drawers-min') %>
	<% require themedCSS('library/css/typography-min') %>
	<% require themedCSS('library/css/hamburgers-min') %>
	<% require themedCSS('library/webfonts/fonts-min') %>
	<% require themedCSS('library/css/icons-min') %>
	<% require themedCSS('library/css/aos-min') %>
	<% require themedCSS('library/css/owfont-regular-min') %>
	<% if $BaseHref == 'http://localhost:8888/bop/' || $BaseHref == 'https://bop-dev.maverickdigital.nz/' %>
		<% require themedCSS('library/css/app') %>
	<% else %>
		<% require themedCSS('library/css/app-min') %>
	<% end_if %>
	<% require themedCSS('/library/css/lightslider-min') %>
	<% require themedCSS('/library/css/lightgallery-min') %>
	<% require themedCSS('/library/css/bugme.min') %>
	<% require themedCSS('/dist/index') %>
	
<%-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.css"> --%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/css/swiper.min.css">
<link rel="stylesheet" href="https://www.unpkg.com/daterangepicker@3.1.0/daterangepicker.css">
<!-- Google Tag Manager -->
<script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
})(window,document,'script','dataLayer','GTM-WN29GXM');</script>
<!-- End Google Tag Manager -->
</head>

<body class="$ClassName.ShortName $URLSegment is-loaded product" <% if $i18nScriptDirection %>dir="$i18nScriptDirection"<% end_if %> itemscope itemtype="http://schema.org/WebPage">

<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-KKXW4D9"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->

<!-- Push Wrapper -->
<div class="mp-pusher" id="mp-pusher" >
<% cached 'NavTop', $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count() %>
<!-- mp-menu -->
<nav id="mp-menu" class="mp-menu noprint">
	<div class="mp-level">
		<div class="text-center logo">
		<a class="desktop" href="$BaseHref">
			<svg xmlns="http://www.w3.org/2000/svg"  alt="$SiteConfig.Title - $SiteConfig.Tagline" width="283" height="147" viewBox="0 0 283.5 147.4"><path  d="M290.5-0.4h-12.9c0.1 1.6 0.1 3.2 0.1 4.9 0 75-61 136-136 136S5.8 79.5 5.8 4.5c0-1.6 0-3.2 0.1-4.9H-7" fill="#f7f7ed" id="logo_bg" /><path d="M62.4 63.5h16.1c7.7 0 14.1-5.3 14.1-12.5 0-6-5.3-9.1-8.7-10.6 3-1.6 7.5-5.3 7.5-10.3 0-6.8-6.3-12.1-13.9-12.1H62.4c-0.7 0-1.2 0.6-1.2 1.2v43C61.2 63 61.7 63.5 62.4 63.5M71.3 27.5h5.1c2.5 0 4.5 1.8 4.5 4.4 0 2.6-2.1 4.7-4.5 4.7h-5.1V27.5zM71.3 45h5.3c2.5 0 5.3 1.9 5.3 4.5 0 2.7-2.1 4.7-4.7 4.7h-5.9V45z" fill="#F05A28"/><path d="M123 63.5h7.1c1.3 0 2-0.8 2.3-1.6l2.3-5.2h17.6l2.3 5.1c0.6 1.2 1.1 1.6 2.3 1.6h7.2c1 0 1.5-0.8 1.1-1.7l-20.3-43.7c-0.2-0.4-0.6-0.7-1.1-0.7h-0.6c-0.5 0-0.9 0.3-1.1 0.7L121.9 61.9C121.5 62.7 122 63.5 123 63.5M143.6 37.3h0.1l4.9 10.7h-9.9L143.6 37.3z" fill="#F05A28"/><path d="M201.7 41.7v20.6c0 0.6 0.5 1.2 1.2 1.2h7.7c0.6 0 1.2-0.6 1.2-1.2V41.6l14.5-21.6c0.5-0.8 0-1.9-1-1.9h-8.4c-0.6 0-0.8 0.3-1 0.6L206.9 32l-9-13.3c-0.2-0.3-0.5-0.6-1-0.6h-8.4c-1 0-1.6 1-1 1.9L201.7 41.7z" fill="#F05A28"/><path d="M88 78.1c-3.8-2.8-9-2-11.8 1.8 -2.8 3.8-2 9 1.8 11.7s9 2 11.8-1.7C92.5 86.1 91.8 80.8 88 78.1M86.7 87.6c-1.5 2-4.5 2.5-6.5 1 -2-1.5-2.5-4.5-1-6.5 1.5-2.1 4.5-2.5 6.5-1C87.8 82.6 88.3 85.6 86.7 87.6" fill="#F05A28"/><path d="M91.3 99.8l2.5 1.2c0.2 0.1 0.5 0 0.6-0.2l2.5-5.1 4.8 2.3c0.2 0.1 0.5 0 0.6-0.2l1.1-2.3c0.1-0.2 0-0.5-0.2-0.6l-4.8-2.3 1.5-3 5.8 2.8c0.2 0.1 0.5 0 0.6-0.2l1.1-2.3c0.1-0.2 0-0.5-0.2-0.6l-8.7-4.3c-0.2-0.1-0.5 0-0.6 0.2l-6.8 13.9C91 99.4 91 99.7 91.3 99.8" fill="#F05A28"/><path d="M114.9 109.1l2.7 0.6c0.2 0.1 0.5-0.1 0.5-0.3l1.2-5.4 2.4 0.5c2.8 0.6 5.6-1.2 6.2-4 0.6-2.8-1.2-5.6-4-6.2l-5.5-1.2c-0.3-0.1-0.5 0.1-0.5 0.3l-3.3 15.1C114.5 108.8 114.6 109.1 114.9 109.1M120.8 97.2l2.2 0.5c1 0.2 1.6 1.1 1.4 2.1 -0.2 1-1.2 1.6-2.2 1.4l-2.2-0.5L120.8 97.2z" fill="#F05A28"/><path d="M135.6 96l-2.8-0.2c-0.3 0-0.5 0.2-0.5 0.4l-1 15.4c0 0.2 0.2 0.5 0.4 0.5l8.8 0.6c0.3 0 0.5-0.2 0.5-0.4l0.2-2.5c0-0.2-0.2-0.5-0.4-0.5l-5.6-0.4 0.8-12.5C136 96.2 135.8 96 135.6 96" fill="#F05A28"/><path d="M155.9 98.4l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-9.6 0.8c-0.3 0-0.4 0.2-0.4 0.5l1.3 15.4c0 0.2 0.2 0.4 0.5 0.4l9.6-0.8c0.3 0 0.4-0.2 0.4-0.5l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-6.5 0.5 -0.3-3.1 5.3-0.4c0.2 0 0.4-0.2 0.4-0.5l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-5.3 0.4 -0.2-2.9 6.5-0.5C155.8 98.8 156 98.6 155.9 98.4" fill="#F05A28"/><path d="M172.2 100.4l0 0 -11.4-6.2 -0.6 0.2c-0.2 0.1-0.4 0.3-0.3 0.5l4.2 15.2c0.1 0.2 0.3 0.4 0.5 0.3l2.7-0.7c0.2-0.1 0.4-0.3 0.3-0.5l-2.3-8.4 0 0 11.4 6.5c0.1 0 0.3 0.1 0.3 0l0.4-0.1c0.2-0.1 0.4-0.3 0.3-0.5l-4.2-15.2c-0.1-0.2-0.3-0.4-0.5-0.3l-2.7 0.7c-0.2 0.1-0.4 0.3-0.3 0.5L172.2 100.4z" fill="#F05A28"/><path d="M177.5 92.5c0.1 0.2 0.4 0.3 0.6 0.2l3-1.4 5.4 11.3c0.1 0.2 0.4 0.3 0.6 0.2l2.5-1.2c0.2-0.1 0.3-0.4 0.2-0.6l-5.4-11.3 3-1.4c0.2-0.1 0.3-0.4 0.2-0.6l-1.1-2.3c-0.1-0.2-0.4-0.3-0.6-0.2l-9.4 4.5c-0.2 0.1-0.3 0.4-0.2 0.6L177.5 92.5z" fill="#F05A28"/><path d="M191.2 82.1l-2.5 1.7c-0.3 0.2-0.2 0.6 0.1 0.8l8.7 3.5 4.2 6.1c0.1 0.2 0.4 0.3 0.6 0.1l2.3-1.6c0.2-0.1 0.2-0.4 0.1-0.6l-4.2-6.1 -0.1-9.4c0-0.4-0.4-0.6-0.7-0.3l-2.5 1.7c-0.2 0.1-0.2 0.3-0.2 0.4l0.1 5.8 -5.4-2.1C191.5 82 191.3 82 191.2 82.1" fill="#F05A28"/><path d="M283.4 0h-12.2c0.1 1.5 0.1 3.1 0.1 4.6 0 71.4-58.1 129.5-129.5 129.5s-129.5-58.1-129.5-129.5c0-1.5 0-3.1 0.1-4.6H0.1C0 1.5 0 3.1 0 4.6c0 78.2 63.6 141.7 141.7 141.7 78.2 0 141.7-63.6 141.7-141.7C283.5 3.1 283.4 1.5 283.4 0" fill="#F05A28"/></svg>				
		</a>
		<br>
	</div>
		<ul>
			<% loop $Menu(1) %>
				<li <% if $Children %>class="icon icon-arrow-left"<% end_if %>>
					<a href="$Link" title="Go to the $Title page" class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
						$MenuTitle
					</a>
						<% if $Children %>
						<div class="mp-level">
						<div class="text-center logo">
						<a class="desktop" href="$BaseHref">
							<svg xmlns="http://www.w3.org/2000/svg"   width="283" height="147" viewBox="0 0 283.5 147.4"><path  d="M290.5-0.4h-12.9c0.1 1.6 0.1 3.2 0.1 4.9 0 75-61 136-136 136S5.8 79.5 5.8 4.5c0-1.6 0-3.2 0.1-4.9H-7" fill="#f7f7ed"  /><path d="M62.4 63.5h16.1c7.7 0 14.1-5.3 14.1-12.5 0-6-5.3-9.1-8.7-10.6 3-1.6 7.5-5.3 7.5-10.3 0-6.8-6.3-12.1-13.9-12.1H62.4c-0.7 0-1.2 0.6-1.2 1.2v43C61.2 63 61.7 63.5 62.4 63.5M71.3 27.5h5.1c2.5 0 4.5 1.8 4.5 4.4 0 2.6-2.1 4.7-4.5 4.7h-5.1V27.5zM71.3 45h5.3c2.5 0 5.3 1.9 5.3 4.5 0 2.7-2.1 4.7-4.7 4.7h-5.9V45z" fill="#F05A28"/><path d="M123 63.5h7.1c1.3 0 2-0.8 2.3-1.6l2.3-5.2h17.6l2.3 5.1c0.6 1.2 1.1 1.6 2.3 1.6h7.2c1 0 1.5-0.8 1.1-1.7l-20.3-43.7c-0.2-0.4-0.6-0.7-1.1-0.7h-0.6c-0.5 0-0.9 0.3-1.1 0.7L121.9 61.9C121.5 62.7 122 63.5 123 63.5M143.6 37.3h0.1l4.9 10.7h-9.9L143.6 37.3z" fill="#F05A28"/><path d="M201.7 41.7v20.6c0 0.6 0.5 1.2 1.2 1.2h7.7c0.6 0 1.2-0.6 1.2-1.2V41.6l14.5-21.6c0.5-0.8 0-1.9-1-1.9h-8.4c-0.6 0-0.8 0.3-1 0.6L206.9 32l-9-13.3c-0.2-0.3-0.5-0.6-1-0.6h-8.4c-1 0-1.6 1-1 1.9L201.7 41.7z" fill="#F05A28"/><path d="M88 78.1c-3.8-2.8-9-2-11.8 1.8 -2.8 3.8-2 9 1.8 11.7s9 2 11.8-1.7C92.5 86.1 91.8 80.8 88 78.1M86.7 87.6c-1.5 2-4.5 2.5-6.5 1 -2-1.5-2.5-4.5-1-6.5 1.5-2.1 4.5-2.5 6.5-1C87.8 82.6 88.3 85.6 86.7 87.6" fill="#F05A28"/><path d="M91.3 99.8l2.5 1.2c0.2 0.1 0.5 0 0.6-0.2l2.5-5.1 4.8 2.3c0.2 0.1 0.5 0 0.6-0.2l1.1-2.3c0.1-0.2 0-0.5-0.2-0.6l-4.8-2.3 1.5-3 5.8 2.8c0.2 0.1 0.5 0 0.6-0.2l1.1-2.3c0.1-0.2 0-0.5-0.2-0.6l-8.7-4.3c-0.2-0.1-0.5 0-0.6 0.2l-6.8 13.9C91 99.4 91 99.7 91.3 99.8" fill="#F05A28"/><path d="M114.9 109.1l2.7 0.6c0.2 0.1 0.5-0.1 0.5-0.3l1.2-5.4 2.4 0.5c2.8 0.6 5.6-1.2 6.2-4 0.6-2.8-1.2-5.6-4-6.2l-5.5-1.2c-0.3-0.1-0.5 0.1-0.5 0.3l-3.3 15.1C114.5 108.8 114.6 109.1 114.9 109.1M120.8 97.2l2.2 0.5c1 0.2 1.6 1.1 1.4 2.1 -0.2 1-1.2 1.6-2.2 1.4l-2.2-0.5L120.8 97.2z" fill="#F05A28"/><path d="M135.6 96l-2.8-0.2c-0.3 0-0.5 0.2-0.5 0.4l-1 15.4c0 0.2 0.2 0.5 0.4 0.5l8.8 0.6c0.3 0 0.5-0.2 0.5-0.4l0.2-2.5c0-0.2-0.2-0.5-0.4-0.5l-5.6-0.4 0.8-12.5C136 96.2 135.8 96 135.6 96" fill="#F05A28"/><path d="M155.9 98.4l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-9.6 0.8c-0.3 0-0.4 0.2-0.4 0.5l1.3 15.4c0 0.2 0.2 0.4 0.5 0.4l9.6-0.8c0.3 0 0.4-0.2 0.4-0.5l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-6.5 0.5 -0.3-3.1 5.3-0.4c0.2 0 0.4-0.2 0.4-0.5l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-5.3 0.4 -0.2-2.9 6.5-0.5C155.8 98.8 156 98.6 155.9 98.4" fill="#F05A28"/><path d="M172.2 100.4l0 0 -11.4-6.2 -0.6 0.2c-0.2 0.1-0.4 0.3-0.3 0.5l4.2 15.2c0.1 0.2 0.3 0.4 0.5 0.3l2.7-0.7c0.2-0.1 0.4-0.3 0.3-0.5l-2.3-8.4 0 0 11.4 6.5c0.1 0 0.3 0.1 0.3 0l0.4-0.1c0.2-0.1 0.4-0.3 0.3-0.5l-4.2-15.2c-0.1-0.2-0.3-0.4-0.5-0.3l-2.7 0.7c-0.2 0.1-0.4 0.3-0.3 0.5L172.2 100.4z" fill="#F05A28"/><path d="M177.5 92.5c0.1 0.2 0.4 0.3 0.6 0.2l3-1.4 5.4 11.3c0.1 0.2 0.4 0.3 0.6 0.2l2.5-1.2c0.2-0.1 0.3-0.4 0.2-0.6l-5.4-11.3 3-1.4c0.2-0.1 0.3-0.4 0.2-0.6l-1.1-2.3c-0.1-0.2-0.4-0.3-0.6-0.2l-9.4 4.5c-0.2 0.1-0.3 0.4-0.2 0.6L177.5 92.5z" fill="#F05A28"/><path d="M191.2 82.1l-2.5 1.7c-0.3 0.2-0.2 0.6 0.1 0.8l8.7 3.5 4.2 6.1c0.1 0.2 0.4 0.3 0.6 0.1l2.3-1.6c0.2-0.1 0.2-0.4 0.1-0.6l-4.2-6.1 -0.1-9.4c0-0.4-0.4-0.6-0.7-0.3l-2.5 1.7c-0.2 0.1-0.2 0.3-0.2 0.4l0.1 5.8 -5.4-2.1C191.5 82 191.3 82 191.2 82.1" fill="#F05A28"/><path d="M283.4 0h-12.2c0.1 1.5 0.1 3.1 0.1 4.6 0 71.4-58.1 129.5-129.5 129.5s-129.5-58.1-129.5-129.5c0-1.5 0-3.1 0.1-4.6H0.1C0 1.5 0 3.1 0 4.6c0 78.2 63.6 141.7 141.7 141.7 78.2 0 141.7-63.6 141.7-141.7C283.5 3.1 283.4 1.5 283.4 0" fill="#F05A28"/></svg>				
						</a>
						<br>
						</div>
							<a class="mp-back" href="$BaseHref">back</a>
							<ul class="secondary">
							<li>
								<a href="$Link" title="Go to the $Title page" class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
									$MenuTitle
								</a></li>
								<% loop $Children %>
									<li class="<% if $Children %>icon icon-arrow-left<% end_if %> <% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
										<a href="$Link">$MenuTitle</a>
										<% if $Children %>
										<div class="mp-level">
										<div class="text-center logo">
										<a class="desktop" href="$BaseHref">
											<svg xmlns="http://www.w3.org/2000/svg"   width="283" height="147" viewBox="0 0 283.5 147.4"><path  d="M290.5-0.4h-12.9c0.1 1.6 0.1 3.2 0.1 4.9 0 75-61 136-136 136S5.8 79.5 5.8 4.5c0-1.6 0-3.2 0.1-4.9H-7" fill="#f7f7ed"  /><path d="M62.4 63.5h16.1c7.7 0 14.1-5.3 14.1-12.5 0-6-5.3-9.1-8.7-10.6 3-1.6 7.5-5.3 7.5-10.3 0-6.8-6.3-12.1-13.9-12.1H62.4c-0.7 0-1.2 0.6-1.2 1.2v43C61.2 63 61.7 63.5 62.4 63.5M71.3 27.5h5.1c2.5 0 4.5 1.8 4.5 4.4 0 2.6-2.1 4.7-4.5 4.7h-5.1V27.5zM71.3 45h5.3c2.5 0 5.3 1.9 5.3 4.5 0 2.7-2.1 4.7-4.7 4.7h-5.9V45z" fill="#F05A28"/><path d="M123 63.5h7.1c1.3 0 2-0.8 2.3-1.6l2.3-5.2h17.6l2.3 5.1c0.6 1.2 1.1 1.6 2.3 1.6h7.2c1 0 1.5-0.8 1.1-1.7l-20.3-43.7c-0.2-0.4-0.6-0.7-1.1-0.7h-0.6c-0.5 0-0.9 0.3-1.1 0.7L121.9 61.9C121.5 62.7 122 63.5 123 63.5M143.6 37.3h0.1l4.9 10.7h-9.9L143.6 37.3z" fill="#F05A28"/><path d="M201.7 41.7v20.6c0 0.6 0.5 1.2 1.2 1.2h7.7c0.6 0 1.2-0.6 1.2-1.2V41.6l14.5-21.6c0.5-0.8 0-1.9-1-1.9h-8.4c-0.6 0-0.8 0.3-1 0.6L206.9 32l-9-13.3c-0.2-0.3-0.5-0.6-1-0.6h-8.4c-1 0-1.6 1-1 1.9L201.7 41.7z" fill="#F05A28"/><path d="M88 78.1c-3.8-2.8-9-2-11.8 1.8 -2.8 3.8-2 9 1.8 11.7s9 2 11.8-1.7C92.5 86.1 91.8 80.8 88 78.1M86.7 87.6c-1.5 2-4.5 2.5-6.5 1 -2-1.5-2.5-4.5-1-6.5 1.5-2.1 4.5-2.5 6.5-1C87.8 82.6 88.3 85.6 86.7 87.6" fill="#F05A28"/><path d="M91.3 99.8l2.5 1.2c0.2 0.1 0.5 0 0.6-0.2l2.5-5.1 4.8 2.3c0.2 0.1 0.5 0 0.6-0.2l1.1-2.3c0.1-0.2 0-0.5-0.2-0.6l-4.8-2.3 1.5-3 5.8 2.8c0.2 0.1 0.5 0 0.6-0.2l1.1-2.3c0.1-0.2 0-0.5-0.2-0.6l-8.7-4.3c-0.2-0.1-0.5 0-0.6 0.2l-6.8 13.9C91 99.4 91 99.7 91.3 99.8" fill="#F05A28"/><path d="M114.9 109.1l2.7 0.6c0.2 0.1 0.5-0.1 0.5-0.3l1.2-5.4 2.4 0.5c2.8 0.6 5.6-1.2 6.2-4 0.6-2.8-1.2-5.6-4-6.2l-5.5-1.2c-0.3-0.1-0.5 0.1-0.5 0.3l-3.3 15.1C114.5 108.8 114.6 109.1 114.9 109.1M120.8 97.2l2.2 0.5c1 0.2 1.6 1.1 1.4 2.1 -0.2 1-1.2 1.6-2.2 1.4l-2.2-0.5L120.8 97.2z" fill="#F05A28"/><path d="M135.6 96l-2.8-0.2c-0.3 0-0.5 0.2-0.5 0.4l-1 15.4c0 0.2 0.2 0.5 0.4 0.5l8.8 0.6c0.3 0 0.5-0.2 0.5-0.4l0.2-2.5c0-0.2-0.2-0.5-0.4-0.5l-5.6-0.4 0.8-12.5C136 96.2 135.8 96 135.6 96" fill="#F05A28"/><path d="M155.9 98.4l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-9.6 0.8c-0.3 0-0.4 0.2-0.4 0.5l1.3 15.4c0 0.2 0.2 0.4 0.5 0.4l9.6-0.8c0.3 0 0.4-0.2 0.4-0.5l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-6.5 0.5 -0.3-3.1 5.3-0.4c0.2 0 0.4-0.2 0.4-0.5l-0.2-2.5c0-0.2-0.2-0.4-0.5-0.4l-5.3 0.4 -0.2-2.9 6.5-0.5C155.8 98.8 156 98.6 155.9 98.4" fill="#F05A28"/><path d="M172.2 100.4l0 0 -11.4-6.2 -0.6 0.2c-0.2 0.1-0.4 0.3-0.3 0.5l4.2 15.2c0.1 0.2 0.3 0.4 0.5 0.3l2.7-0.7c0.2-0.1 0.4-0.3 0.3-0.5l-2.3-8.4 0 0 11.4 6.5c0.1 0 0.3 0.1 0.3 0l0.4-0.1c0.2-0.1 0.4-0.3 0.3-0.5l-4.2-15.2c-0.1-0.2-0.3-0.4-0.5-0.3l-2.7 0.7c-0.2 0.1-0.4 0.3-0.3 0.5L172.2 100.4z" fill="#F05A28"/><path d="M177.5 92.5c0.1 0.2 0.4 0.3 0.6 0.2l3-1.4 5.4 11.3c0.1 0.2 0.4 0.3 0.6 0.2l2.5-1.2c0.2-0.1 0.3-0.4 0.2-0.6l-5.4-11.3 3-1.4c0.2-0.1 0.3-0.4 0.2-0.6l-1.1-2.3c-0.1-0.2-0.4-0.3-0.6-0.2l-9.4 4.5c-0.2 0.1-0.3 0.4-0.2 0.6L177.5 92.5z" fill="#F05A28"/><path d="M191.2 82.1l-2.5 1.7c-0.3 0.2-0.2 0.6 0.1 0.8l8.7 3.5 4.2 6.1c0.1 0.2 0.4 0.3 0.6 0.1l2.3-1.6c0.2-0.1 0.2-0.4 0.1-0.6l-4.2-6.1 -0.1-9.4c0-0.4-0.4-0.6-0.7-0.3l-2.5 1.7c-0.2 0.1-0.2 0.3-0.2 0.4l0.1 5.8 -5.4-2.1C191.5 82 191.3 82 191.2 82.1" fill="#F05A28"/><path d="M283.4 0h-12.2c0.1 1.5 0.1 3.1 0.1 4.6 0 71.4-58.1 129.5-129.5 129.5s-129.5-58.1-129.5-129.5c0-1.5 0-3.1 0.1-4.6H0.1C0 1.5 0 3.1 0 4.6c0 78.2 63.6 141.7 141.7 141.7 78.2 0 141.7-63.6 141.7-141.7C283.5 3.1 283.4 1.5 283.4 0" fill="#F05A28"/></svg>				
										</a>
										<br>
										</div>
											<a class="mp-back" href="$BaseHref">back</a>
											<ul class="secondary">
											<li>
								<a href="$Link" title="Go to the $Title page" class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
									$MenuTitle
								</a></li>
												<% loop $Children %>
													<li class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>"><a href="$Link">$MenuTitle</a></li>
												<% end_loop %>
											</ul>
										</div>
										<% end_if %>
									</li>
								<% end_loop %>
							</ul>
						</div>
						<% end_if %>
				</li>
			<% end_loop %>
		</ul>
	</div>
</nav>
<% end_cached %>
	
				<div id="PageContainer">
			 
				
					<div class="background-overlay3" style="background-color: rgba(0, 0, 0, 0);"></div>
					<div class="wrap">
						<% if inSection(search) %>
						<% else %>

						<div class="search top_bar clearfix">$SearchForm</div>
					
						<% end_if %>
							<%-- <pre>Page.ss</pre> --%>
							<% cached 'header' %>
								<% include Header %>
							<% end_cached %>
							<div class="main-content">
							
							<% if $GlobalBanner %>
								<div id="intro" class="layer clearfix banner-block intro default  grid text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight "> 
									<div class="hero-slider swiper-container">
										<ul class="swiper-wrapper hero-slider">
											<li class=" swiper-slide">
												<div class="bg-image">
													<img  src="$GlobalBanner" data-src="$GlobalBanner" class="b-lazy  cover">
												</div>
												<div class="intro-copy">
													<h1 class="h2 event-detail-title">$GlobalTitle</h2>
												</div>   
											</li>
										</ul>
									</div>
								</div>
							<% end_if %>
	
							<div class="layout_wrap clearfix">
								<div class="page_layout"  role="main">
								
										$Layout
								

								</div>
							</div>
						</div>
						<% if URLSegment = 'home' %>
						<% else %>
						<% include PageNav %>
						<% end_if %>
						<% include Footer %>
						<% cached 'NavPanels', $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count() %>
							<% include NavPanels %>
						<% end_cached %>
					</div>
				</div>
		
	</div><!-- /pusher -->

<% cached 'NavDrawers', $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count() %>
 <div class="back-to-top-wrap noprint"><a class="back-to-top" href="{$BaseURL}"><svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" viewBox="0 0 438.5 438.5"><path fill="#f7f7ed" d="M409.1 109.2c-19.6-33.6-46.2-60.2-79.8-79.8C295.7 9.8 259.1 0 219.3 0c-39.8 0-76.5 9.8-110.1 29.4 -33.6 19.6-60.2 46.2-79.8 79.8C9.8 142.8 0 179.5 0 219.3c0 39.8 9.8 76.5 29.4 110.1 19.6 33.6 46.2 60.2 79.8 79.8 33.6 19.6 70.3 29.4 110.1 29.4s76.5-9.8 110.1-29.4c33.6-19.6 60.2-46.2 79.8-79.8 19.6-33.6 29.4-70.3 29.4-110.1C438.5 179.5 428.7 142.8 409.1 109.2zM361.4 231.8l-26 26c-3.6 3.6-7.9 5.4-12.8 5.4 -4.9 0-9.2-1.8-12.8-5.4l-54-54v143.3c0 4.9-1.8 9.2-5.4 12.8 -3.6 3.6-7.9 5.4-12.8 5.4h-36.5c-4.9 0-9.2-1.8-12.8-5.4 -3.6-3.6-5.4-7.9-5.4-12.8v-143.3l-54 54c-3.4 3.4-7.7 5.1-12.8 5.1 -5.1 0-9.4-1.7-12.8-5.1l-26-26c-3.4-3.4-5.1-7.7-5.1-12.9 0-5.1 1.7-9.4 5.1-12.8l103.4-103.4 26-26c3.4-3.4 7.7-5.1 12.8-5.1 5.1 0 9.4 1.7 12.8 5.1l26 26 103.4 103.4c3.4 3.4 5.1 7.7 5.1 12.8C366.6 224.1 364.9 228.4 361.4 231.8z"/></svg></a></div> 

 <div class="isite-wrap noprint">
 	<a class="isite-tab" href="{$BaseURL}places/helpful-information/visitor-information-centres/">
	 	<img src="{$BaseURL}library/images/icons/isite-icon.png" alt="iSite Visitor Information Centres" />
		<div class="isite-wrap__text">Can we<br/>help you?</div>
	</a>
</div> 
<% end_cached %>

<% require themedJavascript('library/js/jquery-ui.min.js') %>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.js"></script>
<%-- <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.0/js/swiper.min.js"></script> --%>
<%-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_jBkxn42jF3qCoKrHTtSPYzWQQou3ycw"></script> --%>
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAa5P5Bk43mI8ffmK7R-WmIAdb36f09QFg"></script>
	<script src="https://www.unpkg.com/daterangepicker@3.1.0/moment.min.js"></script>
	<script src="https://www.unpkg.com/daterangepicker@3.1.0/daterangepicker.js"></script>
	<% require themedJavascript('library/vendor/venobox/venobox.min.js') %>
	<% require themedJavascript('library/js/drawers.js') %>
	<% require themedJavascript('/library/js/lightslider.min.js') %>
	<% require themedJavascript('/library/js/lightgallery-all.min.js') %>
	<% require themedJavascript('/library/js/modernizr-custom.js') %>
	<% require themedJavascript('/library/js/classie.js') %>
	<% require themedJavascript('/library/js/mlpushmenu.js') %>
	<% require themedJavascript('/library/js/imgix.min.js') %>
	<% require themedJavascript('library/js/map.js') %>
	<% require themedJavascript('library/js/jquery.cookie.js') %>
	<% require themedJavascript('library/js/jquery.bugme.js') %>
  	<% require themedJavascript('library/js/ready.min.js') %>  
<% if $URLSegment == 'locals' %>
<script type="text/javascript" src="//downloads.mailchimp.com/js/signup-forms/popup/unique-methods/embed.js" data-dojo-config="usePlainJson: true, isDebug: false"></script><script type="text/javascript">window.dojoRequire(["mojo/signup-forms/Loader"], function(L) { L.start({"baseUrl":"mc.us16.list-manage.com","uuid":"d110d9e80fc97bf6f2ff9b4e5","lid":"1d33d61474","uniqueMethods":true}) })</script>
<% else %>
	<% if $URLSegment == 'home' %>
	<script type="text/javascript" src="//downloads.mailchimp.com/js/signup-forms/popup/unique-methods/embed.js" data-dojo-config="usePlainJson: true, isDebug: false"></script><script type="text/javascript">window.dojoRequire(["mojo/signup-forms/Loader"], function(L) { L.start({"baseUrl":"mc.us16.list-manage.com","uuid":"d110d9e80fc97bf6f2ff9b4e5","lid":"a7d0871ff8","uniqueMethods":true}) })</script>
	<% end_if %>
<% end_if %>
<% require themedJavascript('dist/index.js') %>	
</body>
</html>
