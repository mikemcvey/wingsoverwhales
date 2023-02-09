
<div class="layer clearfix text-$text_width pad-top-$pad_top pad-bot-$pad_bot mar-top-$mar_top mar-bot-$mar_bot vheight-$vheight  $ExtraClass  bgpattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
    <div class="bg-image background-image">
        <% if $bg_image %>
        <% with $bg_image %>
            <% include BGImage %>
        <% end_with %>   
        <% end_if %>
    </div>
    <% if $Content %>
    <div class="inner inner-1170 grid clearfix">
        <div class="col txtwrap">
                $Content
        </div>
    </div>
    <% end_if %>
    <div class="inner inner-$inner_wrap grid clearfix">
        <div class="col">
           
            <% if $Images %>
                <% if $LayoutTypes == 'Carousel' %>
                 <div id="gallery-{$Anchor}" class="overflow swiper swiper-gallery  gallery-shortcode $LayoutTypes  $GalleryClass ">
                    <ul class="gallery  swiper-wrapper overflow">
                        <% loop $Images %>
                        <li  class="swiper-slide item anim" data-thumb="$Fill(300,200).URL" data-src="$URL" data-sub-html="$Caption">
                           <picture>
                                <source media="(min-width: 1000px)"
                                srcset="$SiteConfig.CdnUrl$FocusFill(1500,999).Link"
                                sizes="100vw">
                                <source media="(min-width: 600px)"
                                srcset="$SiteConfig.CdnUrl$FocusFill(1000,666).Link"
                                sizes="100vw">
                                <source media="(max-width: 600px)"
                                srcset="$SiteConfig.CdnUrl$FocusFill(600,444).Link"
                                sizes="100vw">
                                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="$ScaleWidth(1920).Link"
    
                                style="object-position: $PercentageX% $PercentageY%"
                                alt="<% if $Title %>$Title.ATT<% else %><% end_if %>" />
                            </picture> 
                           <% if $Caption %> <p class="caption">$Caption</p><% end_if %>
                        </li>
                        <% end_loop %>
                    </ul>
                    
                    </div>
                   
                    <div class="swiper-navigation">
                        <div class="swiper-prev"></div>
                        <div class="swiper-next"></div>
                    </div>
                    <div class="swiper-pagination"></div>
                    <script>
                    window.addEventListener("swiperLoaded", function(evt) {
                        var swiper = new Swiper("#gallery-{$Anchor}", {

                            slidesPerView: '1',
                          
                            /*breakpoints: {
                                640: {
                                  slidesPerView: 2,
                                },
                                768: {
                                  slidesPerView: 3,
                                },
                                1024: {
                                  slidesPerView: 4,

                                }
                            },*/
                            freeMode: true,
                             pagination: {
                                el: "#$Anchor .swiper-pagination",
                                clickable: false,
                                type: "fraction"
                        
                            },
                            navigation: {
                            nextEl: "#$Anchor .swiper-next",
                            prevEl: "#$Anchor .swiper-prev",
                            },
                        
                        }); 
                    }, false);

                    </script>
               
                <% else %>
                    <ul id="gallery-{$ID}" class="gallery gallery-shortcode $LayoutTypes $GalleryClass  clearfix">
                        <% loop $Images %>
                        <li data-thumb="$Fill(300,200).URL" data-src="$URL" data-sub-html="$Caption" class="item">
                             <div class="img_wrap">
                                <picture>
                                    <source media="(min-width: 1920px)"
                                    srcset="$SiteConfig.CdnUrl$Fill(2048,2048).Link"
                                    sizes="100vw">
                                    <source media="(min-width: 900px)"
                                    srcset="$SiteConfig.CdnUrl$Fill(1280,1280).Link"
                                    sizes="100vw">
                                    <source media="(max-width: 600px)"
                                    srcset="$SiteConfig.CdnUrl$Fill(900,900).Link"
                                    sizes="100vw">
                                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                                        data-src="$ScaleWidth(1920).Link"
                                    class="block-hero-header b-lazy cover"
                                    style="object-position: $PercentageX% $PercentageY%"
                                    alt="<% if $Title %>$$Title.ATT<% else %><% end_if %>" />
                                </picture>
                                <% if $Caption %> <p class="caption">$Caption</p><% end_if %>
                             </div>
                        </li>
                        <% end_loop %>
                    </ul>
                <% end_if %>
            <% end_if %>
            <script>
            window.addEventListener("lightgalleryLoaded", function(evt) {
                console.log("Fire Gallery");
                //var galleryContainer = document.getElementById("gallery-{$ID}");
                //lightGallery(galleryContainer,{selector: '.item'});
                jQuery('#gallery-{$ID}').lightGallery({selector: '.item'});
            
            });
            </script>
        </div>
    </div>
    <% if $content_after %>
        <div class="inner inner-$inner_wrap  $layout_class clearfix">
            <div class="col">
                $content_after
            </div>
        </div>
    <% end_if %>
</div>

