
<%-- loop $Images %>
	$ScaleWidth(150)
<% end_loop --%>
 <% if $Images %>
                    <% if $GalleryLayoutType == 'Scroller' %>
                     <div id="gallery-{$ID}" class="swiper swiper-gallery  gallery-shortcode $GalleryLayoutType  $GalleryClass overflow">
                        <ul class="gallery  swiper-wrapper overflow">
                            <% loop $Images %>
                            <li  class="swiper-slide item anim" data-thumb="$Fill(300,200).URL" data-src="$URL" data-sub-html="$Content">
                             $Fill(1920,1400)
                               <%--  <img src="$Fill(800,960).URL" alt="$Title" > --%>
                            </li>
                            <% end_loop %>
                        </ul>
                        </div>
                        <script>
                        window.addEventListener("swiperLoaded", function(evt) {
                            var swiper = new Swiper("#gallery-{$ID}", {
                                 slidesPerView: "auto",
                                spaceBetween: 20,
                                freeMode: true,
                            
                            }); 
                        });
                        </script>
                    <% else_if $GalleryLayoutType == 'Carousel' %>
                        <div id="gallery-{$ID}" class="swiper  swiper-gallery  gallery-shortcode $GalleryLayoutType $GalleryClass overflow">
                        <ul class="gallery  swiper-wrapper overflow">
                            <% loop $Images %>
                            <li class="swiper-slide item anim" data-thumb="$Fill(300,200).URL" data-src="$URL" data-sub-html="$Content">
                                $Fill(1570,743)
                            </li> 
                            <% end_loop %>
                        </ul>
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
                            var swiper = new Swiper("#gallery-{$ID}", {
                                spaceBetween: 30,
                                freeMode: true,
                                
                                navigation: {
                                    nextEl: ".gallery-{$ID} .swiper-next",
                                    prevEl: ".gallery-{$ID} .swiper-prev",
                                },
                                <%-- on: {
                                   
                                    slideChange: function(swiper){
                                        var index = swiper.activeIndex + 1;
                                        document.getElementById("SwipeCounter").innerHTML=index;
                                    }
                                    
                                } --%>
                            }); 
                        });
                    </script>
                    <% else %>
                        <ul id="gallery-{$ID}" class="gallery gallery-shortcode $GalleryLayoutType $GalleryClass  clearfix">
                            <% loop $Images %>
                            <li data-thumb="$Fill(300,200).URL" data-src="$URL" data-sub-html="$Content" class="item">
                                <picture>
                                    <source media="(min-width: 1920px)"
                                    srcset="$SiteConfig.CdnUrl$ScaleWidth(2048).Link"
                                    sizes="100vw">
                                    <source media="(min-width: 900px)"
                                    srcset="$SiteConfig.CdnUrl$ScaleWidth(1280).Link"
                                    sizes="100vw">
                                    <source media="(max-width: 600px)"
                                    srcset="$SiteConfig.CdnUrl$ScaleWidth(900).Link"
                                    sizes="100vw">
                                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                                        data-src="$ScaleWidth(1920).Link"
                                    class="block-hero-header b-lazy cover"
                                    style="object-position: $PercentageX% $PercentageY%"
                                    alt="<% if $Top.Title %>$Top.Title.ATT<% else %><% end_if %>" />
                                </picture>
                            </li>
                            <% end_loop %>
                        </ul>
                    <% end_if %>
                <% end_if %>
                <script>
                window.addEventListener("lightgalleryLoaded", function(evt) {
                    console.log("Fire Gallery");
                    //var galleryContainer = document.getElementById("expgallery-lightgallery-{$ID}");
                    $('#gallery-{$ID}').lightGallery({selector: '.item'});
                    
                });
                </script>
                <% if $GalleryLayoutType = 'Isotope' %>

                    <script>
                        console.log("Fire Isotope");

                        window.addEventListener("isotopeLoaded", function(evt) {
                            var container;
                            container = $('#gallery-{$ID}');
                            container.isotope();
                        });
                    </script>
                <% end_if %>