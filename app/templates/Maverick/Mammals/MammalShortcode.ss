<div id="whales" class="swiper whale-shortcode  overflow">
    <div class="whales  swiper-wrapper overflow">
        <% loop $Mammals %>
            <div class="whale_card swiper-slide item">
                <div class="image_card">
                <% if $FeaturedImage %>
                <% with $FeaturedImage %>
                    $Fill(480,300)
                 <% end_with %>   
                 <% end_if %>
                </div>
                <div class="whale_content">
                    <h4 ><strong>$Title</strong></h4>
                    <div class="smaller">
                        $Content
                    </div>
                </div>
            </div>
        <% end_loop %>
        </div>
    <div class="swiper-pagination"></div>
</div>
<script>
window.addEventListener("swiperLoaded", function(evt) {
    console.log('Whale swiper');
    var swiper = new Swiper("#whales", {
        slidesPerView: "auto",
        spaceBetween: 0,
        freeMode: true,

        pagination: {
            el: "#whales .swiper-pagination",
            clickable: true,
        },
       
    }); 
});
</script> 