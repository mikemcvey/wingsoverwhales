
<% if $LayoutType == 'Staggered' %> 
 <div class="layer clearfix promos-staggered staggered text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
    <% include ElementContentArea %>
    <div class="inner inner-$inner_wrap grid clearfix">
        <div class="col overflow">
            <div class="staggered-wrapper ">
                <div class="grid list-unstyled clearfix">
                    <% if $PromoList %>
                        <% loop $PromoList %>
                        <div class="col">
                        
                        <% include PromoTile %>

                        </div>
                        <% end_loop %>
                    <% end_if %>
                </div>
            </div>
        </div>
    </div>
    <% include ElementContentAfter %>
</div>
<% else_if $LayoutType == 'Features' %> 

 <div class="layer clearfix promos-features features text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
    <% include ElementContentArea %>
    <div class="inner inner-$inner_wrap grid clearfix">

        <div class="col overflow">
            <div class="features-wrapper ">
                <div class="grid list-unstyled grid-center clearfix">
                    <% if $PromoList %>
                        <% loop $PromoList %>
                        <div class="col">
                             <% include PageArticle %>
                        </div>
                        <% end_loop %>
                    <% end_if %>
                </div>
            </div>
        </div>
    </div>
    <% include ElementContentAfter %>
</div>
<% else_if $LayoutType == 'Side-by-Side' %>
        <%-- 
        side-by-side  
        --%>
        <div class="layer promos-side-by-side side-by-side clearfix  text-$text_width $ExtraClass   bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
            <div class="bg-image background-image">
            </div>
            <div class="inner inner-$inner_wrap grid clearfix">
                <div class="col col-align-$content_vertical_align txtwrap">
                    <div class=" pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight"> 
                     $Content
                    <% include ElementContentAfter %>
                    </div>
                </div>
                <div class="col imgwrap boxborderleft  grid grid-nogutter grid-2col">
                    <div class="bg-image background-image">
                        <% if $bg_image %>
                            <% with $bg_image %>
                                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                             <% end_with %>   
                        <% end_if %>
                    </div>
                    <% if $PromoList %>
                    <% loop $PromoList %>
                    <div class="col">
                       <% include PageArticle %>
                    </div>
                    <% end_loop %>
                    <% end_if %>
                </div>
            </div>
        </div>
        <% else_if $LayoutType == 'Carousel'  %>
        <div class="Carousel promos-carousel layer text-on-left text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>">
             <% include ElementContentArea %>
            <div class="inner element-content inner-$inner_wrap  clearfix">
                
                    <div id="swiper-$Anchor" class="split-carousel-wrapper ">
                        <ul  id="swiper-ul-$Anchor" class="list-unstyled services carousel split-carousel swiper-wrapper">
                            <% if $PromoList %>
                                <% loop $PromoList %>
                                <li class="swiper-slide">
                                    <% if $Top.TileLayout == 'Card' %>
                                        <% include PromoCard %>
                                    <% else %>
                                        <% include PromoTile %>
                                    <% end_if %>

                                </li>
                                <% end_loop %>
                            <% end_if %>
                        </ul>           
                        <% if $PromoList.Count >= 2 %><div class="swiper-pagination"></div><% end_if %>

                    </div>
               
            </div>
            <% include ElementContentAfter %>
        </div>

        <!-- Initialize Swiper -->
        <script>
            window.addEventListener("swiperLoaded", function(evt) {
/*
                var swiper = new Swiper("#swiper-$Anchor", {
                    <% if $PageListJs %>

                    $PageListJs.RAW

                    <% else %>
                    

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
                }); */

            function updateClasses({ element, slides, activeIndex }) {
              
              var elems = document.querySelectorAll(".swiper-slide-prev-prev");

                [].forEach.call(elems, function(el) {
                    el.classList.remove("swiper-slide-prev-prev");
                });
              
            console.log(activeIndex);
            console.log(activeIndex + 2);
            var g = document.getElementById('swiper-ul-$Anchor');
           
           for (var i = 0, len = g.children.length; i < len; i++){
                if(i < (activeIndex-3)){
                    g.children[i].classList.add("swiper-slide-past-past");
                    g.children[i].classList.remove("swiper-slide-past");
                    g.children[i].classList.remove("swiper-slide-prev-prev");
                    g.children[i].classList.remove("swiper-slide-myprev");
                }else if(i < (activeIndex-2)){
                    g.children[i].classList.add("swiper-slide-past");
                    g.children[i].classList.remove("swiper-slide-past-past");
                    g.children[i].classList.remove("swiper-slide-prev-prev");
                    g.children[i].classList.remove("swiper-slide-myprev");
                      
                }else if(i == (activeIndex-2)){
                    g.children[i].classList.add("swiper-slide-prev-prev");
                    g.children[i].classList.remove("swiper-slide-past-past");
                    g.children[i].classList.remove("swiper-slide-past");
                    g.children[i].classList.remove("swiper-slide-myprev");
                }else if(i == (activeIndex-1)){
                    g.children[i].classList.add("swiper-slide-myprev");
                     g.children[i].classList.remove("swiper-slide-past-past");
                    g.children[i].classList.remove("swiper-slide-past");
                    g.children[i].classList.remove("swiper-slide-prev-prev");
                }else{
                    g.children[i].classList.remove("swiper-slide-past-past");
                    g.children[i].classList.remove("swiper-slide-past");
                    g.children[i].classList.remove("swiper-slide-prev-prev");
                    g.children[i].classList.remove("swiper-slide-myprev");
                    
                }
                
                    
            }

           // slides.eq(activeIndex - 1).classList.add("swiper-slide-prev-prev");
/*
                element
                .find(".swiper-slide-next-next")
                .removeClass("swiper-slide-next-next");
                slides.eq(activeIndex).next().next().addClass("swiper-slide-next-next"); */
            }

            var swiper = new Swiper("#swiper-$Anchor", {
                slidesPerView: 1,
                speed: 1000,
                spaceBetween: 0,

                centeredSlides: false,

                navigation: {
                        nextEl: "#$Anchor .swiper-next",
                        prevEl: "#$Anchor .swiper-prev",
                    },
                grabCursor: true,
                //effect: "fade",
                /* pagination: {
                    el: "#swiper-{$Anchor} .swiper-pagination",
                    clickable: true,
                  }, */
                  navigation: {
                    nextEl: '#swiper-{$Anchor} .swiper-button-next',
                    prevEl: '#swiper-{$Anchor} .swiper-button-prev',
                },
        /*
                effect: "creative",
                
                creativeEffect: {
                prev: {
                    translate: [-100, 0, -400],
                    origin: "left center"
                },
                next: {
                    origin: "right center",
                    translate: ["calc(100% + 32px)", 0, 0]
                    // translate: ["100%", 0, 0]
                }
                },
        */
                on: {
                init() {
                   // updateClasses(this);
                },
                slideChange() {
                    updateClasses(this);
                }
                }
            });
                



            }, false);
        
        </script>

<% else_if $LayoutType == 'Carousel'  %>
				<div class="Carousel promos-carousel layer text-on-left text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>">
                     <% include ElementContentArea %>
					<div class="inner element-content inner-$inner_wrap grid clearfix">
						<div class="col overflow">
							<div id="swiper-$Anchor" class="<% if $Top.TileLayout == 'Card' %>news<% else %>product<% end_if %>-carousel-wrapper ">
								<ul  id="swiper-ul-$Anchor" class="list-unstyled services carousel <% if $Top.TileLayout == 'Card' %>news<% else %>product<% end_if %>-carousel swiper-wrapper">
                                    <% if $PromoList %>
                                        <% loop $PromoList %>
                                        <li class="swiper-slide">
                                            <% if $Top.TileLayout == 'Card' %>
                                                <% include PromoCard %>
                                            <% else %>
                                                <% include PromoTile %>
                                            <% end_if %>
                                        </li>
                                        <% end_loop %>
                                    <% end_if %>
								</ul>
							</div>
						</div>
					</div>
                    <% include ElementContentAfter %>
				</div>

				<!-- Initialize Swiper -->
				<script>
                    window.addEventListener("swiperLoaded", function(evt) {
/*
                        var swiper = new Swiper("#swiper-$Anchor", {
                            <% if $PageListJs %>

                            $PageListJs.RAW

                            <% else %>
                            

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
                        }); */

                    function updateClasses({ element, slides, activeIndex }) {
                      
                      var elems = document.querySelectorAll(".swiper-slide-prev-prev");

                        [].forEach.call(elems, function(el) {
                            el.classList.remove("swiper-slide-prev-prev");
                        });
                      
                    console.log(activeIndex);
                    console.log(activeIndex + 2);
                    var g = document.getElementById('swiper-ul-$Anchor');
                   
                   for (var i = 0, len = g.children.length; i < len; i++){
                        if(i < (activeIndex-3)){
                            g.children[i].classList.add("swiper-slide-past-past");
                            g.children[i].classList.remove("swiper-slide-past");
                            g.children[i].classList.remove("swiper-slide-prev-prev");
                            g.children[i].classList.remove("swiper-slide-myprev");
                        }else if(i < (activeIndex-2)){
                            g.children[i].classList.add("swiper-slide-past");
                            g.children[i].classList.remove("swiper-slide-past-past");
                            g.children[i].classList.remove("swiper-slide-prev-prev");
                            g.children[i].classList.remove("swiper-slide-myprev");
                              
                        }else if(i == (activeIndex-2)){
                            g.children[i].classList.add("swiper-slide-prev-prev");
                            g.children[i].classList.remove("swiper-slide-past-past");
                            g.children[i].classList.remove("swiper-slide-past");
                            g.children[i].classList.remove("swiper-slide-myprev");
                        }else if(i == (activeIndex-1)){
                            g.children[i].classList.add("swiper-slide-myprev");
                             g.children[i].classList.remove("swiper-slide-past-past");
                            g.children[i].classList.remove("swiper-slide-past");
                            g.children[i].classList.remove("swiper-slide-prev-prev");
                        }else{
                            g.children[i].classList.remove("swiper-slide-past-past");
                            g.children[i].classList.remove("swiper-slide-past");
                            g.children[i].classList.remove("swiper-slide-prev-prev");
                            g.children[i].classList.remove("swiper-slide-myprev");
                            
                        }
                        
                            
                    }

                   // slides.eq(activeIndex - 1).classList.add("swiper-slide-prev-prev");
/*
                        element
                        .find(".swiper-slide-next-next")
                        .removeClass("swiper-slide-next-next");
                        slides.eq(activeIndex).next().next().addClass("swiper-slide-next-next"); */
                    }

                    var swiper = new Swiper("#swiper-$Anchor", {
                        slidesPerView: "auto",
                        speed: 1000,
                        spaceBetween: 0,

                        centeredSlides: false,

                        navigation: {
                                nextEl: "#$Anchor .swiper-next",
                                prevEl: "#$Anchor .swiper-prev",
                            },
                        grabCursor: true,
                /*
                        effect: "creative",
                        
                        creativeEffect: {
                        prev: {
                            translate: [-100, 0, -400],
                            origin: "left center"
                        },
                        next: {
                            origin: "right center",
                            translate: ["calc(100% + 32px)", 0, 0]
                            // translate: ["100%", 0, 0]
                        }
                        },
                */
                        on: {
                        init() {
                           // updateClasses(this);
                        },
                        slideChange() {
                            updateClasses(this);
                        }
                        }
                    });
                        



                    }, false);
                
				</script>
<% else %> 
    <div class="layer clearfix promos-grid tile-$Top.TileLayout text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>"> 
        <% include ElementContentArea %>
        <div class="inner inner-$inner_wrap grid clearfix">
            <div class="col overflow">
                <div class="listing-wrapper ">
                    <div class="grid list-unstyled grid-center clearfix">
                        <% if $PromoList %>
                            <% loop $PromoList %>
                            <div class="col <% if $Top.TileLayout == 'Card' %> promo-card <% end_if %>">
                                    <% if $Top.TileLayout == 'Card' %>
                                        <% include PromoCard %>
                                    <% else %>
                                        <% include PromoTile %>
                                    <% end_if %>
                            </div>
                            <% end_loop %>
                        <% end_if %>
                    </div>
                </div>
            </div>
        </div>
        <% include ElementContentAfter %>
    </div>
<% end_if %>