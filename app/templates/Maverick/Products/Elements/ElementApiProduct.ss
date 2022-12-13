<% if $LayoutType == 'Staggered' %> 
 <div class="layer clearfix staggered text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bgpattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
            <div class="bg-image background-image">
            <% if $bg_image %>
            <% with $bg_image %>
                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
            <% end_with %>   
            <% end_if %>
            </div>
                <div class="inner inner-$inner_wrap grid clearfix">
                    <div class="col txtwrap">
                         $Content
                    </div>
                </div>
            <div class="inner inner-$inner_wrap grid clearfix">
      
	<div class="col overflow">
		<div class="staggered-wrapper ">
			<div id="fakeStaggeredProducts" class="grid list-unstyled clearfix">
                    <% if $Listings %>
                        <% loop $Listings %>
                        <div class="col">
                        <% include ProductArticle %>   
                        </div>
                        <% end_loop %>
                    <% end_if %>
			</div>
		</div>
	</div>
</div>
<% else_if $LayoutType == 'Features' %> 
 <div class="layer clearfix features text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bgpattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
            <div class="bg-image background-image">
            <% if $bg_image %>
            <% with $bg_image %>
                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
            <% end_with %>   
            <% end_if %>
            </div>
                <div class="inner inner-$inner_wrap grid clearfix">
                    <div class="col txtwrap">
                         $Content
                    </div>
                </div>
            <div class="inner inner-$inner_wrap grid clearfix">
      
	<div class="col overflow">
		<div class="features-wrapper ">
			<div id="fakeStaggeredProducts" class="grid list-unstyled grid-center clearfix">
                <% if $Listings %>
                    <% loop $Listings %>
                    <div class="col">
                    <% include ProductArticle %>   
                    </div>
                    <% end_loop %>
                <% end_if %>
			</div>
		</div>
	</div>
</div>
<% else_if $LayoutType == 'Side-by-Side' %>
        <%-- 
        side-by-side  
        --%>
        <div class="layer side-by-side clearfix  text-$text_width $ExtraClass   bgpattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
            <div class="bg-image background-image">
            </div>
            <div class="inner inner-$inner_wrap grid clearfix">
                <div class="col col-align-$content_vertical_align txtwrap">
                    <div class=" pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight"> 
                     $Content
                    </div>
                </div>
                <div class="col imgwrap boxborderleft  nop grid grid-nogutter grid-2col">
                    <div class="bg-image background-image">
                        <% if $bg_image %>
                            <% with $bg_image %>
                                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                             <% end_with %>   
                        <% end_if %>
                    </div>
                    <% if $Listings %>
                        <% loop $Listings %>
                        <div class="col">
                        <% include ProductArticle %>   
                        </div>
                        <% end_loop %>
                    <% end_if %>
                </div>
            </div>
        </div>
<% else_if $LayoutType == 'Carousel'  %>
<!-- product carousel layout -->
				<div class="layer text-on-left text-35 pad-top-default pad-bot-default  <% if $Style %> $StyleVariant<% end_if %> $ExtraClass">
					<div class="bg-image background-image">
					</div>
					<div class="inner inner-default grid clearfix">
						<div class="col">
							$Content
						</div>
						<div class="col col-align-bottom text-right">
							<% if $Listings %><p>
							<div class=" swiper-navigation">
								<div class="swiper-prev"></div>
								<div class="swiper-next"></div>
							</div>
							</p><% end_if %>
						</div>
					</div>

					<div class="inner inner-default grid clearfix">
						<div class="col overflow">
							<div id="productCarousel1" class="product-carousel-wrapper ">
								<ul id="fakeProducts2"
									class="list-unstyled row-2 services carousel product-carousel swiper-wrapper">
                                    <% if $Listings %>
                                        <% loop $Listings %>
                                        <li class="swiper-slide boxborder">
                                        <% include ProductArticle %>   
                                        </li>
                                        <% end_loop %>
                                    <% end_if %>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Initialize Swiper -->
				<script>
                    window.addEventListener("swiperLoaded", function(evt) {

                        var swiper = new Swiper("#productCarousel1", {
                            <% if $PageListJs %>

                            $PageListJs.RAW

                            <% else %>
                            grid: {
                                rows: 2,
                                fill: "column"
                            },

                            slidesPerView: "auto",
                            spaceBetween: 0,
                            freeMode: true,
                            pagination: {
                                el: ".swiper-pagination",
                                clickable: true,
                            },
                            navigation: {
                                nextEl: ".swiper-next",
                                prevEl: ".swiper-prev",
                            },
                             <% end_if %>
                        }); 

                    }, false);
                
				</script>
<% else %>
        <div class="layer clearfix  text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bgpattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
            <div class="bg-image background-image">
            <% if $bg_image %>
            <% with $bg_image %>
                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
            <% end_with %>   
            <% end_if %>
            </div>
                <div class="inner inner-$inner_wrap grid clearfix">
                    <div class="col txtwrap">
                         $Content
                    </div>
                </div>
            <div class="inner inner-$inner_wrap grid clearfix">
      
	<div class="col overflow">
		<div class="listing-wrapper ">
			<div id="fakeApiProducts" class="grid list-unstyled grid-center clearfix">
            	 <% if $Listings %>
                    <% loop $Listings %>
                    <div class="col">
                    <% include ProductArticle %>   
                    </div>
                    <% end_loop %>
                <% end_if %>

			</div>
		</div>
	</div>
</div>
<% end_if %>
