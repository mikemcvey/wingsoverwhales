<%--  gallery --%>

<% if $Title && $ShowTitle %><h2 class="element__title">$Title</h2><% end_if %>
  <section class="gallery-$GalleryLayoutType layer clearfix <% if $bg_image %> has-bg-image bggradient <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> <% if $BackgroundPattern != "default" %>bgpattern<% end_if %>  <% if $BoxedText %>boxedtext<% end_if %> $ColorTheme <% if $Style %> $StyleVariant<% end_if %>"> 
        <% include ElementContentArea %>
        <div class="inner inner-$inner_wrap  $layout_class clearfix">
            <div class="grid">
                <div class="col _inner col-align-$content_vertical_align overflow">
                <% if $Images %>
                    <% if $GalleryLayoutType == 'Scroller' %>
                     <div id="gallery-{$ID}" class="swiper swiper-gallery  gallery-{$ID} overflow">
                        <ul class="gallery list-unstyled swiper-wrapper overflow">
                            <% loop $Images %>
                            <li  class="swiper-slide item anim">
                                <img src="$Image.Fill(800,960).URL" alt="$Image.Title" >
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
                        <div id="gallery-{$ID}" class="swiper swiper-gallery  gallery-{$ID} overflow">
                        <ul class="gallery list-unstyled swiper-wrapper overflow">
                            <% loop $Images %>
                            <li  class="swiper-slide item anim" data-sub-html="$Content">
                                <img src="$Image.Fill(1865,930).URL" alt="$Image.Title" >
                            </li> 
                            <% end_loop %>
                        </ul>
                        <div class="swiper-counter">
                            <span id="SwipeCounter">1</span>/ $Images.Count
                        </div>
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
                                on: {
                                    slideChange: function(swiper){
                                        var index = swiper.activeIndex + 1;
                                        document.getElementById("SwipeCounter").innerHTML=index;
                                    }
                                }
                            }); 
                        });
                    </script>
                    

                    <% else %>
                        <ul id="gallery-{$ID}" class="gallery list-unstyled four-column gallery-{$ID}"><% loop $Images %><li data-thumb="$Image.Fill(300,200).URL" data-src="$Image.URL" data-sub-html="$Content">
                                <img src="$Image.Fill(576,576).URL" alt="$Image.Title" >
                            </li><% end_loop %></ul>
                      
                    <% end_if %>
                <% end_if %>
                </div>
            </div>
        </div>
</section>

   


