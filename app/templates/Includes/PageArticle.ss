 <article class="page-listing boxborder abs anim <% if $FeaturedImage == 'false' %>no-bg-image <% end_if %> <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <div class="bg-image">
            <% if $FeaturedImage %>
            <% with $FeaturedImage %>

          
                <picture>
                    <img src="$SiteConfig.CdnUrl$ScaleWidth(1200).Link" 
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
        <% if $JobRole %><p class="headline jobrole lead white nopb">$JobRole</p><% end_if %>
        <% if $Title  %><h3 class="subpage">$Title</h3><% end_if %>
        <% if $Teaser %>
        <p class='smaller'>$FullTeaser</p>
        <% end_if %>
        <p><a href="$Link" title="Go to $Title" class="button ghost">More Info</a></p>
    </div>
    <a href="$Link" class="link-overlay" title="Go to $Title"></a>
</article>
