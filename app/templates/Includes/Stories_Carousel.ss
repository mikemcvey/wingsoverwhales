<article class="swiper-slide <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <% if $FeaturedImage %>
           <div class="bg-image">
            <% with $FeaturedImage %>
              <picture>
                <source media="(min-width: 1025px)"
                  srcset="$SiteConfig.CdnUrl$ScaleWidth(1920).Link"
                  sizes="50vw">
                <source media="(min-width: 561px)"
                  srcset="$SiteConfig.CdnUrl$ScaleWidth(800).Link"
                  sizes="50vw">
                <source media="(max-width: 560px)"
                  srcset="$SiteConfig.CdnUrl$ScaleWidth(500).Link"
                  sizes="50vw">
                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                  class="block-slider cover lazyload blur-up"
                  style="object-position: $PercentageX% $PercentageY%"
                  loading="lazy"
                  alt="<% if $Title %>$Title.ATT<% else %><% end_if %>" />
              </picture>
              <% end_with %>
            <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
          </div>
        <% end_if %>
		    <div class="tile-copy">
          <h3><strong>$Title</strong></h3>
          <% if $Teaser %>
          <p class="meta" class='feature__content typography'>$Teaser</p>
          <% end_if %>
        </div>
        <a href="$Link" class="link-overlay" title="Go to $Title"></a>
	</article>



  


