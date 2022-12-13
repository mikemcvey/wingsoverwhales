
<% if $Banners %>
	<div class="hero-slider">
		<ul class="slides">
			<% loop $Banners %>
			<li class="clearfix grid ">
			 <div class="bg-color abs"></div>
			 <% if $SlideTxt %>
			
				<div class="intro-copy inner inner-narrow col col-align-bottom">
			  $SlideTxt
			<% with Top %>
				<% if $ArchiveYear %>
					<%t SilverStripe\\Blog\\Model\\Blog.Archive 'Archive' %>:
					<% if $ArchiveDay %>
						<h2>$ArchiveDate.Nice</h2>
					<% else_if $ArchiveMonth %>
						<h2>$ArchiveDate.format('MMMM, y')</h2>
					<% else %>
						<h2>$ArchiveDate.format('y')</h2>
					<% end_if %>
				<% else_if $CurrentTag %>
					<h2>$CurrentTag.Title</h2>
				<% else_if $CurrentCategory %>
					<h2>$CurrentCategory.Title</h2>
				<% end_if %>
			<% end_with %>
				
			</div>
			<% end_if %>
		
			 <% if $HeroImage %>
           <div class="bg-image">
            <% with $HeroImage %>
				<picture>
					<source media="(min-width: 1920px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(2048).Link" sizes="100vw">
					<source media="(min-width:1280px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(1920).Link" sizes="100vw">
					<source media="(min-width:900px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(1280).Link" sizes="100vw">
					<source media="(min-width: 600px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(900).Link" sizes="100vw">
					<source media="(max-width: 599px)" srcset="$SiteConfig.CdnUrl$Fill(500,900).Link" sizes="100vw">
					<img src="$SiteConfig.CdnUrl$ScaleMaxWidth(900).Link"
						data-src="$ScaleWidth(1920).Link" class="block-hero-header b-lazy cover"
						style="object-position: $PercentageX% $PercentageY%"
						alt="<% if $Top.Title %>$Top.Title.ATT<% else %><% end_if %>" />
				</picture>
			<% end_with %>   
          </div>
            <% end_if %> 
			 <% if $VideoLinkSmall || $VideoLinkMedium || $VideoLinkLarge %>
			 <div class="videocontainer">
              <video data-object-fit="cover" loop muted autoplay playsinline id="homepage_video">
			  </video>
				<% if $VideoLinkSmall || $VideoLinkMedium || $VideoLinkLarge %>
				<script>
					var vids = ['$VideoLinkSmall.RAW','$VideoLinkMedium.RAW', '$VideoLinkLarge.RAW'];
				</script>
				<% end_if %>
			  </div>  
			  <% end_if %>
			
			

			</li>
			<% end_loop %>



		</ul>
	</div>
<% else_if $ClassName.ShortName == "BlogPost" %>

	<div class="hero-slider">
		<ul class="slides">
			<li class="clearfix grid ">
			 <div class="bg-color abs"></div>
			<div class="bg-image">
		<% with $FeaturedImage %>
			<picture>
				<source media="(min-width: 1920px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(2048).Link" sizes="100vw">
				<source media="(min-width:1280px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(1920).Link" sizes="100vw">
				<source media="(min-width:900px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(1280).Link" sizes="100vw">
				<source media="(min-width: 600px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(900).Link" sizes="100vw">
				<source media="(max-width: 599px)" srcset="$SiteConfig.CdnUrl$Fill(500,900).Link" sizes="100vw">
				<img src="$SiteConfig.CdnUrl$ScaleMaxWidth(900).Link"
					data-src="$ScaleWidth(1920).Link" class="block-hero-header b-lazy cover"
					style="object-position: $PercentageX% $PercentageY%"
					alt="<% if $Top.Title %>$Top.Title.ATT<% else %><% end_if %>" />
			</picture>
					<% end_with %>   
	  </div>
			<div class="intro-copy inner grid col col-align-middle ">
			
				
		
				<% if $ArchiveYear %>
						<%t SilverStripe\\Blog\\Model\\Blog.Archive 'Archive' %>:
						<% if $ArchiveDay %>
							<h2>$ArchiveDate.Nice</h2>
						<% else_if $ArchiveMonth %>
							<h2>$ArchiveDate.format('MMMM, y')</h2>
						<% else %>
							<h2>$ArchiveDate.format('y')</h2>
						<% end_if %>
					<% else_if $CurrentTag %>
						<h2>$CurrentTag.Title</h2>
					<% else_if $CurrentCategory %>
						<h2>$CurrentCategory.Title</h2>
					<% end_if %>
			</div>
		</li>
	</ul>
</div>

<% else_if $FeaturedImage %>
	<div class="hero-slider">
			<ul class="slides">
				<li class="clearfix grid ">
				 <div class="bg-color abs"></div>
           <div class="bg-image">
			
            <% with $FeaturedImage %>
				<picture>
					<source media="(min-width: 1920px)"
					srcset="$SiteConfig.CdnUrl$ScaleWidth(2048).Link"
					sizes="100vw">
					<source media="(min-width: 900px)"
					srcset="$SiteConfig.CdnUrl$ScaleWidth(1280).Link"
					sizes="100vw">
					<source media="(max-width: 600px)"
					srcset="$SiteConfig.CdnUrl$Fill(585,1020).Link"
					sizes="100vw">
					<img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
										data-src="$ScaleWidth(1920).Link"
					class="block-hero-header b-lazy cover"
					style="object-position: $PercentageX% $PercentageY%"
					alt="<% if $Top.Title %>$Top.Title.ATT<% else %><% end_if %>" />
				</picture>
						<% end_with %>   
          </div>
				<div class="intro-copy inner grid col col-align-middle ">
					<% if $ClassName.ShortName == "ExperiencePage" %>
						<% else %>
					<%-- <h1><strong>$Title</strong></h1>
					<% if $Byline %><p class="headline larger">$Byline</p><% end_if %> --%>
				<% end_if %>
				</div>
			</li>
		</ul>
	</div>
<% else_if $DisplayObject %>
	<% with $DisplayObject %>
		<div class="hero-slider">
			<ul class="slides">
				<li class="clearfix grid ">
			 	<div class="bg-color abs"></div>
					<div class="bg-image">
						<% if $productBannerImageURL != "false" %>
							
							$productBannerImageURL.RAW

						<% else_if $galleryImage %>
							<% with $galleryImage %>
								<picture>
									<source media="(min-width: 1025px)"
										srcset="$SiteConfig.CdnUrl$ScaleWidth(1920).Link"
										sizes="50vw">
									<source media="(min-width: 561px)"
										srcset="$SiteConfig.CdnUrl$ScaleWidth(800).Link"
										sizes="50vw">
									<source media="(max-width: 560px)"
										srcset="$SiteConfig.CdnUrl$ScaleWidth(500).Link"
										sizes="50vw">
									<img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
										data-src="$SiteConfig.CdnUrl$ScaleWidth(1920).Link"
										class="block-hero-header b-lazy cover"
										style="object-position: $PercentageX% $PercentageY%"
										alt="<% if $Title %>$Title.ATT<% else %><% end_if %>" />
								</picture>
							<% end_with %>
						<% end_if %>
					</div>
					<div class="intro-copy inner grid col col-align-middle ">
					<h1><strong>$Title</strong></h1>
						<% if $Byline %><p class="headline larger">$Byline</p><% end_if %>
					</div>   
				</li>
			</ul>
		</div>
	<% end_with %>
<% else %>
	<div class="hero-slider">
		<ul class="slides">
			<li class="clearfix grid ">
			 <div class="bg-color abs"></div>

			<div class="bg-image">$AddImage(16,'cover','')</div>

				<div class="intro-copy inner grid col col-align-middle ">
						<h1>
						<% if $ArchiveYear %>
					<%t SilverStripe\\Blog\\Model\\Blog.Archive 'Archive' %>:
					<% if $ArchiveDay %>
						$ArchiveDate.Nice
					<% else_if $ArchiveMonth %>
						$ArchiveDate.format('MMMM, y')
					<% else %>
						$ArchiveDate.format('y')
					<% end_if %>
					<% else_if $CurrentTag %>
					$CurrentTag.Title
					<% else_if $CurrentCategory %>
						$CurrentCategory.Title
					<% else %>
						
						
					<strong>$Title</strong>
					<% end_if %></h1>
					<% if $Byline %><p class="headline larger">$Byline</p>
					
					<% end_if %>
				</div>
			</li>
		</ul>
	</div>

<% end_if %>
