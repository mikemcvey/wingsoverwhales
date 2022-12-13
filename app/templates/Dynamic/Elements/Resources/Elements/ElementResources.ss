<div class="news-layout overflow layout-$Layout  clearfix <% if $bg_image %> has-bg-image <% else %> no-bg-image <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
    <div class="bg-image  background-image">
        <% if $bg_image %>
        <% with $bg_image %>
            <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
        <% end_with %>   
        <% end_if %>
    </div>
    <div class="inner inner-$inner_wrap grid  $layout_class clearfix overflow">
        <div class="col overflow">
            <div id="news-{$ID}">
                <!-- news carousel layout -->
				<div class="layer text-on-left text-35 pad-top-default pad-bot-default overflow">
					<div class="bg-image background-image">
					</div>
					<div class="inner inner-full-width grid clearfix">
						<div class="col">
							  $Content
						</div>
						<div class="col col-align-bottom text-right">
							<p>
							<div class=" swiper-navigation">
								<div class="swiper-prev"></div>
								<div class="swiper-next"></div>
							</div>
							</p>
						</div>
					</div>

					<div class="inner inner-full-width grid clearfix overflow">
						<div class="col overflow">
							<div id="newsCarousel1" class="news-carousel-wrapper overflow">
								<ul id="fakeResources" class="list-unstyled services carousel overflow news-carousel swiper-wrapper">
									<script>
										var content = '';
										for (var step = 0; step < 15; step++) {
											content += '<li class="swiper-slide "><article class="blog-article "><div class="card">' +
												'<div class="bg-image">' +
												'<img src="/dummy/image-placeholder-1.jpg" class="cover" loading="lazy" alt="$Title" />' +
												'</div>' +

												'</div>' +
												'<div class="tile-copy">' +
												'<h4 class="line-clamp two">Blog listing lorem ipsum, or lipsum as it is sometimes known or lipsum as it is sometimes known</h4>' +
												'<ul class="list-unstyled post-meta tag-icon clearfix"><li><a href="#" >News</a></li> / <li><a href="#" class="blue">2021</a></ul>' +
												'<div class="smaller">' +
												'<p class="line-clamp four">Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. </p>' +
												'</div>' +
												'</div>' +
												'<a href="$URL" class="link-overlay" title="Go to $Title"></a>' +
												'</article></li>';


										}

										var elem = document.querySelector('#fakeResources');
										// Set HTML content
										elem.innerHTML = content;
									</script>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<!-- Initialize Swiper -->
				<script>
                    window.addEventListener("swiperLoaded", function(evt) {
						var swiper = new Swiper("#newsCarousel1", {
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
						}); 
					}); 
				</script>
            </div>
         
        </div>

    </div>
</div>

