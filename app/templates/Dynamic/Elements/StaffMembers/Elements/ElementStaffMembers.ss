<div class="staff-layout layout-$Layout  clearfix <% if $bg_image %> has-bg-image <% else %> no-bg-image <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
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
        <% if $Layout == "Carousel" %> 
        <div class="col col-align-bottom text-right">
            <p>
            <div class="staff swiper-navigation">
                <div class="swiper-prev"></div>
                <div class="swiper-next"></div>
            </div>
            </p>
        </div>
        <% end_if %> 
    </div>
    <div class="inner inner-$inner_wrap grid  $layout_class clearfix">
        <div class="col">
            <div id="staff-{$ID}" class="swiper staff pad-bot-20">
                <ul class="staff list-unstyled <% if $Layout == "Carousel" %> swiper-wrapper <% else %> grid grid-no-gutter <% end_if %>">
                    <% if $StaffMembers %>
                    <% loop $StaffMembers %>
                    <li class="swiper-slide col col-6 anim match">
                            <div class="staff_member grid">
                                <div class="staff_photo col nop">
                                <% if $FeaturedImage %>
                                <% with $FeaturedImage %>
                                        <img src="$Fill(480,360).Link"
                                        class="cover"
                                        style="object-position: $PercentageX% $PercentageY%"
                                        alt="Meet $Title" />
                                 <% end_with %>   
                                 <% end_if %>
                                 <p class="social-links">
                                    <% if $LinkinProfile %>
                                   <a href="$LinkinProfile" title="Connect on LinkedIn"><i class="icon-linkedin"></i><span class="sr-only">Connect on LinkedIn</span></a>
                                   <% end_if %>
                                    <% if $EmailAddress %>
                                   <a href="mailto:$EmailAddress" title="Connect by Email"><i class="icon-email"></i><span class="sr-only">Connect by Email</span></a>
                                    <% end_if %>
                                    <% if $PhoneNumber %>
                                   <a href="tel:$PhoneNumber" title="Connect by Phone"><i class="icon-phone"></i><span class="sr-only">Connect by Phone</span></a>
                                   <% end_if %>
                               </p>
                                </div>
                                <div class="staff_content col">
                                      <% if $Title %><h4>$Title</h4><% end_if %>
                                    <% if $JobRole %><p><strong>$JobRole</strong><% end_if %>
                                     <% if $Teaser %><div><span class="staff_descrip">$Teaser</span></div><% end_if %>
                                     <br/>
                                  <p><a title="Find out more about $Title" class="headline" href="$Link">Find out more</a></p>
                                   
                                </div>
                            </div>
                        </li>
                    <% end_loop %>
                     <% end_if %>
                </ul>
            </div>
           <% if $ContentAfter %><div class="content-after">$ContentAfter</div><% end_if %>
        </div>
    </div>
</div>

<% if $Layout == "Carousel" %> 
<!-- Initialize Swiper -->
<script>
window.addEventListener("swiperLoaded", function(evt) {
    console.log('staff swiper');
    var swiper = new Swiper("#staff-{$ID}", {
        slidesPerView: "auto",
        spaceBetween: 30,
        freeMode: true,

        pagination: {
            el: "#$Anchor .swiper-pagination",
            clickable: true,
        },
        navigation: {
            nextEl: "#$Anchor .swiper-next",
            prevEl: "#$Anchor .swiper-prev",
        },
    }); 
});
</script>
<% end_if %>