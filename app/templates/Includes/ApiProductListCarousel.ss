<article class="swiper-slide product_listing <% if $productArticleImageURL == "false" %>no-image<% end_if %> <% if $slidesPerView == "thumbnails" %> product_listing <% end_if %><% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
      <div class="bg-image">
        <% if $productArticleImageURL  != "false" %>
          $productArticleImageURL.RAW
          <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
        <% end_if %>
      </div>
		  <div class="tile-copy">
        <% if $ProductCategory  %><p class="meta">$ProductCategory</p><% end_if %>
        <% if $Title  %><h3><strong>$Title</strong></h3><% end_if %>
        <% if $Teaser %>
        <div class='feature__content typography'>$Teaser</div>
        <% end_if %>
      </div> 
     <% if $latitude && $longitude %>
					<div class="marker" data-lat="$latitude" data-lng="$longitude" data-producttype="$Product_Type">
						<div class="title"><b>$Title</b></div>
						<div class="address"><a href="$Link">Read More</a>
              </div>
					</div>
			<% end_if %>
      <a href="$Link" class="link-overlay" title="Read more about $Title"></a> 
	</article>


