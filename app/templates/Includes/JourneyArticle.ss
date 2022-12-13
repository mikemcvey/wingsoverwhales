 <article class="journey-$ID page-listing abs anim <% if $FeaturedImage == 'false' %>no-bg-image <% end_if %> <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
  
        <div class="bg-image">
            <% if $FeaturedImage %>
            <% with $FeaturedImage %>
                <picture>
                    <source media="(min-width: 1025px)"
                        srcset="$SiteConfig.CdnUrl$ScaleWidth(2048).Link"
                        sizes="100vw">
                    <source media="(min-width: 561px)"
                        srcset="$SiteConfig.CdnUrl$ScaleWidth(1280).Link"
                        sizes="100vw">
                    <source media="(max-width: 560px)"
                        srcset="$SiteConfig.CdnUrl$ScaleWidth(700).Link"
                        sizes="100vw">
                    <img src="$SiteConfig.CdnUrl$ScaleWidth(2048).Link" 
                        class="cover lazyload blur-up"
                        style="object-position: $PercentageX% $PercentageY%"
                        loading="lazy"
                        alt="<% if $Title %>$Title.ATT<% end_if %>" />
                </picture>
                <% end_with %>
            <% else %>
                <img src="/dummy/image-placeholder-1.jpg" class="cover" loading="lazy"
                    alt="$Title" />
            <% end_if %>
              
        </div>
    <div class="tile-copy">
      
            <div class="title">
             <% if $JourneyIcon %>
                <div class="journey-icon">
                    <img src="$JourneyIcon.ScaleWidth(600).Link" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>" />
                </div>
                <% end_if %>
                <% if $Title  %><h4>$Title</h4><% end_if %>
            </div>
           
               
           
        <% if $Byline  %><p class="uppercase" ><strong>$Byline</strong></p><% end_if %>
        <% if $Teaser %>
        <p class='small teaser'>$Teaser</p>
        <% end_if %>
         <p class="small nopb"><a href="$Link" class="button" title="Discover more about $Title">Discover More</a></p>
    </div>
    <a href="$Link" class="link-overlay" title="Discover more about $Title"><span class="sr-only">Discover More</span></a>
</article>
