<pre>ElementItinerary.ss ---  $LayoutType</pre>
<div class="feature">
    <% if $Title && $ShowTitle || $Content %>
    <div class="layer product_listing clearfix <% if $bg_image %> has-bg-image <% end_if %>  text-$text_width   vheight-$vheight bgpattern $ColorTheme "> 
        <div class="inner grid  $layout_class clearfix">
            <div class="col col-6 col-lg _inner col-align-$content_vertical_align">       
                <% if $Title && $ShowTitle %><h2 class="element__title">$Title</h2><% end_if %>
                 <% if $Content %><div class="element__content">$Content</div><% end_if %>
            </div>
            <% if $text_width == "half" %>
            <div class="col col-6">
            </div>
            <% end_if %>
        </div>
    </div>
    <% end_if %>
<% if $FeaturesList %>

    <% if $LayoutType == 'Touchpoints' %>
    <div class="discover inner-1170">
        <% loop $FeaturesList %>
            <% include FeaturesListAlternating %>
        <% end_loop %>
        </div>
    <% else_if $LayoutType == 'Carousel'  %>
   
    <% if $slidesPerView == "thumbnails" %>
    <div class="day-product-carousel inner  pad-top-40 pad-bot-40">
        <div class="articles clearfix tight "> 
    <% else %>
    <div class="content features-carousel slidesPerView-$slidesPerView centeredSlides-$centeredSlides inner-1170">
        <%-- <div class="content features-carousel slidesPerView-$slidesPerView centeredSlides-$centeredSlides inner-1170"> --%>
        <div class="articles big-$FeaturesList.Count clearfix tight ">
      <% end_if %>
            <pre>$centeredSlides $slidesPerView</pre>
            <div class="swiper-container swiper-container-$Anchor">
                 <div class="swiper-wrapper">
            <% loop $FeaturesList %>
                 <% include ItineraryListCarousel %>
            <% end_loop %>

                </div>
                 <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
    <% if $content_after &&  $slidesPerView == "thumbnails" %>
    <div class="swiper-information">$content_after</div>
    <% end_if %>
            </div>
        </div>
    </div>

    <!-- Initialize Swiper -->
  <script>
  $(document).ready(function() {
     var swiper = new Swiper('.swiper-container-$Anchor', {
        slidesPerView:  <% if $slidesPerView == "thumbnails" %>'auto'<% else %>'$slidesPerView'<% end_if %>,
        <% if $centeredSlides == 1 %> centeredSlides: true,<% end_if %>
         spaceBetween: 10,
        pagination: {
        el: '.swiper-pagination',
        clickable: true,
      },
       navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
      },
    });
    
});
  </script>


    <% else  %>
    <%-- grid --%>

<div class="content features inner-1170">
    <%-- <div class=" articles big-$FeaturesList.Count clearfix tight "> --%>
    <div class="grid blog grid-center">
        <% loop $FeaturesList %>
            <% include FeaturesList %>
        <% end_loop %>
    </div>
</div>
    <% end_if %>
<% end_if %>
<% if $content_after &&  $slidesPerView != "thumbnails" %><div class="element__content">$content_after</div><% end_if %>
</div>





