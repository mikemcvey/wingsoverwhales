 <article class="blog-article <% if $FeaturedImage == 'false' %>no-bg-image <% end_if %> <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <div class="card">
            <div class="bg-image">
                <% if $FeaturedImage %>
                <% with $FeaturedImage %>
                     <picture>
                    <img src="$SiteConfig.CdnUrl$ScaleWidth(1240).Link" 
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
        </div>
    <div class="tile-copy">
        <h4 class="line-clamp two">$Title</h4>
        <%-- if $Teaser --%>
        <div class='smaller'><p class="_line-clamp four">$Teaser <a href="$Link"  title="Go to $Title">See more</a></p></div>
        <%-- end_if --%>
    </div>
    <a href="$Link" class="link-overlay" title="Go to $Title"></a>
</article>