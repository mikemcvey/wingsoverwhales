 <article class="page-listing boxborder abs anim <% if $MainImage == 'false' %>no-bg-image <% end_if %> <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <div class="bg-image">
            <% if $MainImage %>
            <% with $MainImage %>
                <img src="$Link" 
                        class="cover lazyload blur-up"
                        style="object-position: $PercentageX% $PercentageY%"
                        loading="lazy"
                        alt="<% if $Title %>$Title.ATT<% end_if %>" />
                <% end_with %>
            <% else %>
                <img src="/dummy/image-placeholder-1.jpg" class="cover" loading="lazy"
                    alt="$Title" />
            <% end_if %>
        </div>
   <div class="tile-copy">
        <% if $ProductCategory  %><p class="headline jobrole lead white nopb">$ProductCategory</p><% end_if %>
        <% if $Title  %><h3 class="subpage nopb"><strong>$Title</strong></h3><% end_if %>
        <% if $Teaser %>
            <div class='smaller'>$Teaser</div>
         <% end_if %>
    </div>
    <a href="$Link" class="link-overlay" title="Go to $Title"></a>
</article>