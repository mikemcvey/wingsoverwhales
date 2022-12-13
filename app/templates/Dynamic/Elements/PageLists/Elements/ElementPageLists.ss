
<% if $LayoutTypes == 'Staggered' %> 
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
			<div class="grid list-unstyled clearfix">
		        <% if $MyPageLists %>
                    <% loop $MyPageLists %>
                    <div class="col">
                       <% include PageArticle %>
                    </div>
                    <% end_loop %>
                <% end_if %>
			</div>
		</div>
	</div>
</div>
<% else_if $LayoutTypes == 'Features' %> 
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
                <div class="grid list-unstyled grid-center clearfix">
                    <% if $MyPageLists %>
                        <% loop $MyPageLists %>
                        <div class="col">
                        <% include PageArticle %>
                        </div>
                        <% end_loop %>
                    <% end_if %>
                </div>
            </div>
        </div>
    </div>
</div>
<% else_if $LayoutTypes == 'Side-by-Side' %>
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
                    <% if $MyPageLists %>
                    <% loop $MyPageLists %>
                    <div class="col">
                       <% include PageArticle %>
                    </div>
                    <% end_loop %>
                    <% end_if %>
                </div>
            </div>
        </div>
<% else_if $LayoutTypes == 'Carousel'  %>

				<div class="Carousel layer text-on-left text-35 pad-top-default pad-bot-default  <% if $Style %> $StyleVariant<% end_if %> $ExtraClass">
					<div class="bg-image background-image">
					</div>
                <div class="inner inner-$inner_wrap grid clearfix">
						<div class="col txtwrap">
							$Content
						</div>
						<div class="col col-align-bottom text-right">
							<% if $MyPageLists.Count > 3 %><p>
							<div class=" swiper-navigation">
								<div class="swiper-prev"></div>
								<div class="swiper-next"></div>
							</div>
							</p><% end_if %>
						</div>
					</div>

                <div class="inner inner-$inner_wrap grid clearfix">
						<div class="col overflow">
                            <% if $Top.TileLayout == 'Card' %>
                            <div id="productCarousel-$Anchor" class="news-carousel-wrapper $MyPageLists.First.ClassName-carousel-wrapper ">
								<ul class="list-unstyled services carousel news-carousel swiper-wrapper ">
                                      <% if $MyPageLists %>
                                        <% loop $MyPageLists %>
                                        <li class="swiper-slide anim">
                                            <% if $Top.TileLayout == 'Card' %>
                                                <% include PageCard %>
                                            <% else_if $ClassName == 'StoryPage' %>
                                                <% include BlogArticle %>
                                            <% else %>
                                                <% include PageArticle %>
                                            <% end_if %>
                                        </li>
                                        <% end_loop %>
                                        <% end_if %>
								</ul>
							</div>
                            <% else %>
							<div id="productCarousel-$Anchor" class="product-carousel-wrapper $MyPageLists.First.ClassName-carousel-wrapper ">
								<ul class="list-unstyled services carousel product-carousel swiper-wrapper">
                                      <% if $MyPageLists %>
                                        <% loop $MyPageLists %>
                                        <li class="swiper-slide anim">
                                       
                                            <% if $Top.TileLayout == 'Card' %>
                                                <% include PromoCard %>
                                            <% else_if $ClassName == 'StoryPage' %>
                                                <% include BlogArticle %>
                                            <% else %>
                                                <% include PageArticle %>
                                            <% end_if %>
                                        </li>
                                        <% end_loop %>
                                        <% end_if %>
								</ul>
							</div>
                            <% end_if %>
						</div>
					</div>
				</div>

				<!-- Initialize Swiper -->
				<script>
                    window.addEventListener("swiperLoaded", function(evt) {

                        var swiper = new Swiper("#productCarousel-$Anchor", {
                            <% if $PageListJs %>

                            $PageListJs.RAW

                            <% else %>
                            grid: {
                                rows: 1,
                                fill: "column"
                            },

                            slidesPerView: "auto",
                            spaceBetween: 0,
                            freeMode: true,
                            pagination: {
                                el: "#$Anchor .swiper-pagination",
                                clickable: true,
                            },
                            navigation: {
                                nextEl: "#$Anchor .swiper-next",
                                prevEl: "#$Anchor .swiper-prev",
                            },
                             <% end_if %>
                        }); 

                    }, false);
                
				</script>
<% else %>
<div class="layer listing-grid  clearfix  text-$text_width   vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 

            <div class="bg-image background-image">
            <% if $bg_image %>
            <% with $bg_image %>
                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
            <% end_with %>   
            <% end_if %>
            </div>
            <% if $Content %>
            <div class="inner inner-$inner_wrap grid clearfix">
                <div class="col txtwrap">
                        $Content
                </div>
            </div>
        <% end_if %>
            <div class="inner inner-$inner_wrap clearfix">
                    <div class="listing-wrapper ">
                        <div class="grid list-unstyled grid-not-center clearfix">
                            <% if $MyPageLists %>
                                <% loop $MyPageLists %>
                                <div class="col">
                                <% include PageArticle %>
                                </div>
                                <% end_loop %>
                            <% end_if %>
                        </div>
                    </div>
               
            </div>
        </div>
<% end_if %>
