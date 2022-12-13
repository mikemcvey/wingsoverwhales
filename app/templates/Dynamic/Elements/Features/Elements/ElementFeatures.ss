<div class=" text-$text_width txt-color-$TextColor bg-color-$BackgroundColor bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %>  <% if $BoxedText %>boxedtext<% end_if %> vheight-$vheight  $ColorTheme  <% if $Style %> $StyleVariant<% end_if %>"> 
<%-- <pre>ElementFeatures.ss  $LayoutType</pre> --%>
<div class="feature">
<% if $Title && $ShowTitle %><h2 class="element__title">$Title</h2><% end_if %>
<% if $Content %><div class="element__content">$Content</div><% end_if %>
<% if $FeaturesList %>
    <% if $LayoutType == 'Touchpoints' %>
    <div class="discover inner-1170">
        <% loop $FeaturesList %>
            <% include FeaturesListAlternating %>
        <% end_loop %>
        </div>
    <% else_if $LayoutType == 'Carousel'  %>

    <div class="content features-carousel slidesPerView-$slidesPerView centeredSlides-$centeredSlides inner-1170">
    <%-- <pre>$centeredSlides $slidesPerView</pre> --%>
        <div class="articles big-$FeaturesList.Count clearfix tight ">
            <div class="swiper-container-$Anchor">
                 <div class="swiper-wrapper">
            <% loop $FeaturesList %>
                <% include FeaturesListCarousel %>
            <% end_loop %>
                </div>
                 <!-- Add Arrows -->
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
                     <div class="swiper-pagination"></div>
            </div>
        </div>
    </div>

    <!-- Initialize Swiper -->
  <script>
  $(document).ready(function() {
     var swiper = new Swiper('.swiper-container-$Anchor', {
        slidesPerView: '$slidesPerView',
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
    <div class=" articles big-$FeaturesList.Count clearfix tight ">
        <% loop $FeaturesList %>
            <% include FeaturesList %>
        <% end_loop %>
    </div>
</div>
    <% end_if %>
<% end_if %>
<% if $content_after %><div class="element__content">$content_after</div><% end_if %>
</div>
</div>