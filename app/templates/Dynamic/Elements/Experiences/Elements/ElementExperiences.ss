<div class="experience-layout layout-$Layout  clearfix <% if $bg_image %> has-bg-image <% else %> no-bg-image <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$Backgroundrange bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
    <div class="bg-image  background-image" style="pointer-events:none;">
        <% if $bg_image %>
        <% with $bg_image %>
            <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
        <% end_with %>   
        <% end_if %>
    </div>
    
 <% if $Layout == "Filtered" %> 
    <div class="inner inner-1170 grid  $layout_class clearfix" style="position:relative; z-index:30;">
        <div class="col _inner textwrap col-align-$content_vertical_align"> $Content 
           
            <div id="options">
                <div class="dropdown">
                <h4 class="dropbtn">Experience Types</h4>
                <div class="dropdown-content">
                    <div class="option-set" data-group="type">
                    <label for="type-all">
                        <input type="checkbox" value="" id="type-all" class="all" checked />All</label>
                    <label for="type-whale-flights">
                        <input type="checkbox" class="other" value=".type-whale-flights" id="type-whale-flights" />Whale Flights </label>
                    <label for="type-scenic-flights">
                        <input type="checkbox" class="other" value=".type-scenic-flights" id="type-scenic-flights" />Scenic Flight </label>
                    <label for="type-adventure">
                        <input type="checkbox" class="other" value=".type-adventure" id="type-adventure" />Adventure </label>
                    <label for="type-food-wine-gin">
                        <input type="checkbox" class="other" value=".type-food-wine-gin" id="type-food-wine-gin" />Food, Wine & Gin </label>
                    </div>
                </div>
                </div>
                <div class="dropdown">
                <h4 class="dropbtn">Duration</h4>
                <div class="dropdown-content">
                    <div class="option-set" data-group="duration">
                    <label for="expduration-all">
                        <input type="checkbox" value="" id="expduration-all" class="all" checked />All</label>
                    <label for="expduration1">
                        <input type="checkbox" value=".duration-up-to-1hour" class="other" id="expduration1" />Up to 1 hour </label>
                    <label for="expduration2">
                        <input type="checkbox" value=".duration-up-to-3hours" class="other" id="expduration2" />Up to 3 hours </label>
                    <label for="expduration3">
                        <input type="checkbox" value=".duration-up-to-6hours" class="other" id="expduration3" />Up to 6 hours </label>
                    <label for="expduration4">
                        <input type="checkbox" value=".duration-all-day" class="other" id="expduration4" />All day</label>
                    </div>
                </div>
                </div>
                <div class="dropdown">
                <h4 class="dropbtn">Price Range</h4>
                <div class="dropdown-content">
                    <div class="option-set" data-group="range">
                    <label for="range-all">
                        <input type="checkbox" value="" id="range-all" class="all" checked />All</label>
                    <label for="range-low">
                        <input type="checkbox" value=".price-up-to-500" class="other" id="range-low" />up to NZD $500</label>
                    <label for="range-med">
                        <input type="checkbox" value=".price-500-to-1000" class="other" id="range-med" />NZD $500 - NZD $1,000</label>
                    <label for="range-high">
                        <input type="checkbox" value=".price-1000-up" class="other" id="range-high" />NZD $1,000 and up</label>
                    </div>
                </div>
            </div>
           
          </div>
        </div>
     
      </div>
    <% else %> 
   
    <%-- <p id="filter-display"></p><div id="container"></div> 
        --%>
        <div class="inner inner-1170 grid  $layout_class clearfix" style="position:relative; z-index:30;">
          <div class="col _inner textwrap col-align-$content_vertical_align"> $Content 
      </div>
    </div>
     <% end_if  %>
    <div class="inner inner-$inner_wrap  $layout_class clearfix">

            <div id="experience-{$ID}" class="swiper staff pad-bot-20">
                <ul id="expcontainer" data-id="experience-{$ID}-list" class="experience <% if $Layout == "Carousel" %> swiper-wrapper <% end_if %>">
                    <% if $ExperiencePages %>
                    <% loop $ExperiencePages %>
                     
                    <li class="<% if $Top.Layout == 'Carousel' %>swiper-slide <% end_if %> $Layout item type-{$Parent.URLSegment} $allExperienceTags  <% if $Pos > 8 %> hidden <% end_if %>">
                            <article class="experience grid ">
                                <div class="card">
                                    <a href="$Link" class="link-overlay">
                                <% if $FeaturedImage %>
                                <% with $FeaturedImage %>
                                        <img src="$Fill(480,360).Link"
                                        class="abs cover anim"
                                        style="object-position: $PercentageX% $PercentageY%"
                                        alt="Meet $Title" />
                                 <% end_with %>   
                                 <% end_if %>
                                </a>
                                </div>
                                <div class="experience_content"> 
                                    <div class="match">
                                        <p class="category-meta">$Parent.Title</p>
                                        <% if $Title %><h4>$Title</h4><% end_if %>
                                        <% if $Teaser %><p><span class="experience_descrip line-clamp three">$Teaser</span></p><% end_if %>
                                    </div>
                                    <p class="price">
                                        <span>from</span>
                                        $ExpCurrencyCode $ExpFromPrice </p>
                                    <div class="match2">
                                     <hr/>
                                     $ExperienceInfo
                                    </div>
                                     <p style="padding-top:1em;">
                                     <% if $ExpDirectBookingLink %><a id="button-booking" class="button booking_but button-booking rezdy rezdy-modal" href="$ExpDirectBookingLink">Book Now</a> <% else %> $add_booking_button_func(null, null, null, null) <% end_if %>  <a title="Find out more about $Title" class="button alt" href="$Link">View More</a>
                                    </p>

                                </div>
                            </article>
                        </li>
                    <% end_loop %>
                     <% end_if %>
                </ul>
                <div class="swiper-pagination"></div>
                  <!-- If we need navigation buttons -->

                <div class="swiper-navigation">
                  <div class="swiper-prev"></div>
                  <div class="swiper-next"></div>
              </div>
            </div>
            <% if $ExperiencePages.Count > 8 %>
            <p class="text-center"><a href="javascript:void(0);" onclick="return false;" class="button" id="more_but">See More Experiences </a></p>
          <% end_if %>
           <% if $ContentAfter %><div class="content-after">$ContentAfter</div><% end_if %>
        </div>
  
</div>

<% if $ExperiencePages.Count > 8 %>
  <script>
    $( "#more_but" ).click(function() {
      $(this).hide();
      $('#experience-{$ID} .hidden').removeClass("hidden");
      //$('#options').change();
    
      matchEl = document.getElementsByClassName("match");
      if(matchEl.length>=1) {
      new ResponsiveAutoHeight('.match');
      }
      matchEl = document.getElementsByClassName("match2");
      if(matchEl.length>=1) {
      new ResponsiveAutoHeight('.match2');
      }
      $('#options').change();
});

  </script>
<% end_if %> 

<% if $Layout == "Carousel" %> 
<!-- Initialize Swiper -->
<script>
window.addEventListener("swiperLoaded", function(evt) {
    console.log('experience swiper');
    var swiper = new Swiper("#experience-{$ID}", {
        slidesPerView: "auto",
        spaceBetween: 0,
        freeMode: true,
        autoplay: {
            delay: 3000,
            pauseOnMouseEnter: true,
            disableOnInteraction: false
            },
        pagination: {
            el: "#experience-{$ID} .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: "#experience-{$ID} .swiper-next",
            prevEl: "#experience-{$ID} .swiper-prev",
        },
    }); 
});
</script>
<% end_if %>
<% if $Layout == "Filtered" %> 
  
    <script>
        window.addEventListener("isotopeLoaded", function(evt) {
            console.log("isotopeLoaded");
            var script = document.createElement('script');
  
            // load the script file
            script.src = '/library/js/experiences_isotope.js';
            document.body.appendChild(script);
        });
        </script> 

<% end_if %>

