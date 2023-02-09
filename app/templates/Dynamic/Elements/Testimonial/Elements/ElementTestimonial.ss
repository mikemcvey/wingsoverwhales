

<div class="testimonial-layout layout-$Layout  clearfix <% if $bg_image %> has-bg-image <% else %> no-bg-image <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
    <div class="bg-image  background-image">
        <% if $bg_image %>
        <% with $bg_image %>
            <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
        <% end_with %>   
        <% end_if %>
    </div>
    <div class="inner inner-$inner_wrap grid  $layout_class clearfix">
        <div class="col _inner textwrap col-align-$content_vertical_align">
            $Content

        </div>
       
    </div>
    <div class="inner inner-$inner_wrap grid  $layout_class clearfix">
        <div class="col emptyCol"></div>
        <div class="col testimonialCol">
            <div id="testimonial-{$ID}" class="swiper testimonial pad-bot-20">
                <ul class="testimonials swiper-wrapper list-unstyled <% if $Layout == "Carousel" %> swiper-wrapper <% else %> grid grid-no-gutter <% end_if %>">
                    <% if $ElementTestimonials %>
                    <% loop $ElementTestimonials %>
                    <li class="swiper-slide anim">
                            <div class="icon_circle">
                                <div class="value">
                                    <div class="valign">
                                    <% if $Content %><div class="blockquote">$Content</div><% end_if %>
                                    $myStarRating($StarRating)
                                    <% if $Title %><p class="author"><strong>$Title</strong><% end_if %>
                                    <% if $Location %><br/>$Location<% end_if %></p>
                                    <%-- <a title="Find out more about $Title" class="headline" href="$Link"><em>Find out more</em></a> --%>
                                    </div>
                                </div>
                            </div>
                        </li>
                    <% end_loop %>
                     <% end_if %>
                </ul>
                  <!-- If we need pagination -->
                <div class="swiper-pagination"></div>
            </div>
           <% if $ContentAfter %><div class="content-after">$ContentAfter</div><% end_if %>
        </div>
    </div>
</div>

<% if $Layout == "Carousel" %> 
<!-- Initialize Swiper -->
<script>
window.addEventListener("swiperLoaded", function(evt) {
    console.log('staff testimonial');
    var swiper = new Swiper("#testimonial-{$ID}", {
        slidesPerView: "1",
        spaceBetween: 30,
        freeMode: false,
        /*autoplay: {
        delay: 2000,
        pauseOnMouseEnter: true,
        disableOnInteraction: false
        },*/
        pagination: {
            el: "#testimonial-{$ID} .swiper-pagination",
            clickable: true,
          },
    }); 
});
</script>
<% end_if %>