<header id="header" class="anim header clearfix layer overflow">
	<div class="inner grid grid-nogutter clearfix">
		<div class="logo col col-fixed col-align-middle">
				<a class="desktop" href="$BaseHref">
				<svg class="header-logo" alt="$SiteConfig.Title"  preserveAspectRatio="xMinYMin meet" >
					<use class="header-svg" xlink:href="#logo" ></use>
				</svg>
				</a>
		</div>

		<nav class="nav_wrap col col-align-middle">
	
   
			<ul class="menu top_nav">
			<%-- loop $MenuSet('Main').MenuItems --%>
			<% loop Menu(1) %>
				<li id="menu-$ID" class="desktop " >
				<a href="$Link" <% if  $ID = '11' %>class="button" <% end_if %>>$Title
				 </a>
				<% if $Children %>
				<ul class="menu_wrap">
				
						<li id='menu-$ID'>
							<article class="abs card  ">
								<div class="tile-copy">
									<h4><a href="$Link">$Title</a></h4>
								</div>
								<div class="bg-image background-image anim" style="background-image:url($FeaturedImage.Fill(600,600).URL)">
									   <picture>
										<img src="$FeaturedImage.ScaleWidth(1200).Link" 
											class="cover lazyload blur-up"
											style="object-position: $FeaturedImage.PercentageX% $FeaturedImage.PercentageY%"
											loading="lazy"
											alt="<% if $Title %>$Title.ATT<% end_if %>" />
									</picture>
								</div>
								<a href="$Link" class="link-overlay">&nbsp;</a>
							</article>
						</li>
						
				<% loop $Children %>
					<li id='menu-$ID'>
				<%-- if  $Parent.ID = '6' --%>
						<article class="abs card  ">
							<div class="tile-copy">
								<h4><a href="$Link">$Title</a></h4>
							</div>
							<div class="bg-image background-image anim" style="background-image:url($FeaturedImage.Fill(600,600).URL)">
								   <picture>
									<img src="$FeaturedImage.ScaleWidth(1200).Link" 
										class="cover lazyload blur-up"
										style="object-position: $FeaturedImage.PercentageX% $FeaturedImage.PercentageY%"
										loading="lazy"
										alt="<% if $Title %>$Title.ATT<% end_if %>" />
								</picture>
							</div>
							<a href="$Link" class="link-overlay">&nbsp;</a>
						</article>
				</li>
				<% end_loop %>
				
				</ul>
				<% end_if %>
				</li>
			<% end_loop %>
				<%-- <li style="padding-right:0;">
					$BookingButton
				</li> --%>
			
				<li class="mobile_nav">
					<div class="hamburger hamburger--vortex triggerOffCanvas">
						<div class="hamburger-box">
							<div class="hamburger-inner"></div>
						</div>
					</div>
				</li>
				
			</ul>
		</nav>

	</div>
</header>
<%-- end header --%>