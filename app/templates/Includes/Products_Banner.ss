<% if $Banners %>
<div id="intro" class="layer clearfix banner-block intro default  grid text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight "> 
	<div class="hero-slider swiper-container">
		<ul class="swiper-wrapper hero-slider">
			<% loop $Banners %>
			 <li class="grid swiper-slide" style="background-image:url($HeroImage.ScaleWidth(2400).URL);" >
			 <% if $HeroImage %>
           <div class="bg-image">
            <% with $HeroImage %>
              <img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="lazyload blur-up cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
               <% end_with %>   
          </div>
            <% end_if %>
				<div class="col col-align-middle intro-copy">
				<h1>$SlideTxt</h1>
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
				
			</li>
			<% end_loop %>
		</ul>
	</div>
</div>
<% else_if $ClassName.ShortName == "BlogPost" %>
	<% with $Parent %>
	<div id="intro" class="layer clearfix banner-block intro default  grid text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight "> 
		<div class="hero-slider swiper-container">
			<ul class="swiper-wrapper hero-slider">
				<% loop $Banners %>
				<li class="grid swiper-slide" style="background-image:url($HeroImage.ScaleWidth(2400).URL);" >
				<% if $HeroImage %>
			<div class="bg-image">
				<% with $HeroImage %>
				<img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="lazyload blur-up cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
				<% end_with %>   
			</div>
				<% end_if %>
					<div class="col col-align-middle intro-copy">
					<h1>$SlideTxt</h1>
			
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
				<% end_loop %>
			</ul>
		</div>
	</div>
	<% end_with %>
<% else_if $FeaturedImage %>
<div id="intro" class="layer clearfix banner-block intro default  grid text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight "> 
	<div class="hero-slider swiper-container">
		<ul class="swiper-wrapper hero-slider">
			 <li class="grid swiper-slide" style="background-image:url($HeroImage.ScaleWidth(2400).URL);" >
           <div class="bg-image">
            <% with $FeaturedImage %>
              <img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="lazyload blur-up cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
               <% end_with %>   
          </div>
				<div class="col col-align-middle intro-copy">
					<h1 class="h2">$Title</h2>
				</div>   
			</li>
	
		</ul>
	</div>
</div>
<% else %>
<div id="intro" class="layer clearfix banner-block intro default  grid text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight no-bg-image "> 
	<div class="hero-slider swiper-container">
		<ul class="swiper-wrapper hero-slider">
			 <li class="grid swiper-slide" style="background-image:url($HeroImage.ScaleWidth(2400).URL);" >
           
				<div class="col col-align-middle intro-copy">
					<h1 class="h2">
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
				$Title
			<% end_if %></h2>
				</div>   
			</li>
	
		</ul>
	</div>
</div>
<% end_if %>

