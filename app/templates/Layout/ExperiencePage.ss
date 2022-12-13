
<div class="layer layout-content element-content clearfix number-columns-1  bg-pattern-horzontal-1  no-bg-image  text-default  pad-top-default pad-bot-default vheight-default text-on-black bg-pattern-default bg-gradient-default   "> 
    <div class="inner  element-content inner-narrow   clearfix">
        <div class="grid ">
            <div class="col _inner textwrap col-align-top te">
			
			<p class="category-meta">$Parent.Title</p>
			<h2 class="post-title"><strong>$Title</strong></h2>
		
		<p class="lead">$FullTeaser</p>
		$ExperienceInfo  
	</div>
			</div>	
		</div>	
	</div>	
</div>
	

    <div class="layer expside-by-side bg-pattern-horzontal-1  clearfix  text-$text_width   vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
		<div class="bg-image background-image">
		</div>
		<div class="inner inner-$inner_wrap grid grid-nogutter  grid-reverse clearfix">
			<div class="col col-align-$content_vertical_align txtwrap">
				<div class="expcontent pad-top-default pad-bot-default">
					
					<div class="expteaser">
						
					<%-- <h2><strong>$Title</strong></h2>
					<h3><strong>$Byline</strong></h3> --%>
					$Content
					</div>
					<% if $ExpFeatures %>
					<div class="expfeatures">
					<h3 class="blue"><strong>Highlights</strong></h3>
					$ExpFeatures</div>
					<% end_if %>
						
					<% if $ExpFromPrice %>
					
					<p class="price">
					<span>from</span>
					$ExpCurrencyCode $ExpFromPrice <% if $ExpDirectBookingLink %><a id="button-booking" class="button booking_but rezdy rezdy-modal" href="$ExpDirectBookingLink">Book Now</a> <% else %> <a class="button booking_but" href="/contact-us">Enquire Now</a> <% end_if %> </p>
					
					<% else %>
					<p><br/><a href="/contact-us" class="button">Contact Us</a></p>
					<% end_if %>
				</div>
				<div class="pad-top-default">
					<div class="expgallery">
					<%-- $add_gallery_func(array,null,null,null) --%>
					<div id="expgallery-{$ID}" class="swiper  swiper-gallery  gallery-shortcode $GalleryLayoutType $GalleryClass _overflow">
                        <ul  id="expgallery-lightgallery-{$ID}" class="gallery  swiper-wrapper overflow">
                            <% loop $Images %>
								
							<li <% if $First %>style="display:none;" <% end_if %> data-thumb="$Fill(300,200).URL" data-src="$URL" class="swiper-slide item anim slide-{$Pos}" data-sub-html="$Content">
                                $Fill(750,500) <%-- <span class="insta-media-type"><svg class="fa-clone " aria-hidden="true" aria-label="Clone" data-fa-proƒcessed="" data-prefix="far" data-icon="clone" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
									  			<path fill="#ffffff" d="M464 0H144c-26.51 0-48 21.49-48 48v48H48c-26.51 0-48 21.49-48 48v320c0 26.51 21.49 48 48 48h320c26.51 0 48-21.49 48-48v-48h48c26.51 0 48-21.49 48-48V48c0-26.51-21.49-48-48-48zM362 464H54a6 6 0 0 1-6-6V150a6 6 0 0 1 6-6h42v224c0 26.51 21.49 48 48 48h224v42a6 6 0 0 1-6 6zm96-96H150a6 6 0 0 1-6-6V54a6 6 0 0 1 6-6h308a6 6 0 0 1 6 6v308a6 6 0 0 1-6 6z"></path>
								  		</svg>
								  </span> --%>
                            </li> 
								
                            <% end_loop %>
							
                        </ul>
					<div class="gal_button"><a class="button blue" href="javascript:void(1);" id="view_gallery"><svg style="max-width: 0.6em;" class="fa-clone " aria-hidden="true" aria-label="Clone" data-fa-proƒcessed="" data-prefix="far" data-icon="clone" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
					<path fill="#ffffff" d="M464 0H144c-26.51 0-48 21.49-48 48v48H48c-26.51 0-48 21.49-48 48v320c0 26.51 21.49 48 48 48h320c26.51 0 48-21.49 48-48v-48h48c26.51 0 48-21.49 48-48V48c0-26.51-21.49-48-48-48zM362 464H54a6 6 0 0 1-6-6V150a6 6 0 0 1 6-6h42v224c0 26.51 21.49 48 48 48h224v42a6 6 0 0 1-6 6zm96-96H150a6 6 0 0 1-6-6V54a6 6 0 0 1 6-6h308a6 6 0 0 1 6 6v308a6 6 0 0 1-6 6z"></path>
			</svg> View Gallery</a></div>
                        <%-- 
                        <div class="swiper-counter">
                            <span id="SwipeCounter">1</span>/ $Images.Count
                        </div> --%>
                          <div class="swiper-navigation">
                                <div class="swiper-prev"></div>
                                <div class="swiper-next"></div>
                            </div>
                        </div>
                        
           
                    <script>
                        window.addEventListener("swiperLoaded", function(evt) {
                            var swiper = new Swiper("#expgallery-{$ID}", {
                                spaceBetween: 0,
                                freeMode: false,
								slidesPerView: "3",
                                navigation: {
                                    nextEl: ".expgallery-{$ID} .swiper-next",
                                    prevEl: ".expgallery-{$ID} .swiper-prev",
                                },
								autoplay: {
									delay: 2000,
								  },
                                <%-- on: {
                                   
                                    slideChange: function(swiper){
                                        var index = swiper.activeIndex + 1;
                                        document.getElementById("SwipeCounter").innerHTML=index;
                                    }
                                    
                                } --%>
                            }); 
							
                        });


						window.addEventListener("lightgalleryLoaded", function(evt) {
							console.log("lightgalleryLoaded");
							//var galleryContainer = document.getElementById("expgallery-lightgallery-{$ID}");
						 $('#expgallery-lightgallery-{$ID}').lightGallery();

							//$('.view_gallery').lightGallery();
							
								$( "#view_gallery" ).click(function() {
									$('#expgallery-lightgallery-{$ID} .slide-1').click();
								});
                        });
                    </script>	
				</div>
				</div>
			</div>
			<div class="col imgwrap boxborderleft">
				<div class="bg-image background-image">
					<% if $Images %>
						<% with $Images.First %>
							<img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
						 <% end_with %>   
					<% end_if %>
				</div>
			</div>
		</div>
	</div>
	

$ElementalArea


<section class="layer grid content  pad-top-default pad-bot-default"> 
	<div class="single inner inner-1170 col  clearfix ">
		<div class="navigation grid">
			<div class="col">
				<% if $PreviousPage %> 
				<span class="older-posts"><a href="$PreviousPage.Link"><i class="icon-left-arrow"></i> $PreviousPage.Parent.Title</a></span>
				<h4 class="cliptext"><a href="$PreviousPage.Link"><strong>$PreviousPage.Title</strong></a><h4>
				<% end_if %>
			</div>
			<div class="col">
				<% if $NextPage %>
				<span class="older-posts"><a href="$NextPage.Link"> $NextPage.Parent.Title <i class="icon-right-arrow"></i></a></span>
				<h4 class="cliptext"><a href="$NextPage.Link"><strong>$NextPage.Title</strong></a><h4>
				<% end_if %>
			</div>
		</div>		
	</div>
</section>
<%--  
<section class="inner inner-1170 number-columns-1 pad-top-60 pad-bot-60 clearfix text-on-default">

		<h3 style="text-align:center"><strong>You may also like</strong></h3>

				<% with $Parent %>
			
					<% if $Children %>
						<div class="listing-wrapper ">
		
							<div class="grid list-unstyled textwrap grid-center clearfix">
						<% loop $Children %>
						
							<% if $isCurrent %>
								<% else %>
									<% include SilverStripe\\Blog\\PostSummary %>
						<% end_if %>
						<% end_loop %>
					</div>
					</div>
					<% end_if %>
				
			<% end_with %>

		
</section> --%>

