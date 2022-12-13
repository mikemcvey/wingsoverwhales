<% if $Results %>
    <p class="center"><strong>Showing $Results.PageLength results ($Results.getTotalItems total)</strong></p>
<% loop $Results %>
 <article class="product-listing <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
    <div class="grid">
        <div class="col-4 col-md col" >
            <div class="bg-image">
                <% if $productimage !="none" %>
                    <img  src="$productimage" data-src="$ScaleWidth(1920).Link" class="cover lazyload blur-up" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                <% end_if %>
                 <% if $category  %><p class="meta">$category</p><% end_if %>
                <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
            <a href="$Link" class="link-overlay" title="Go to $Title"></a>
            </div>
        </div>
     <div class="col-6 col-md col">
        <div class="tile-copy">
            <% if $Title  %><h4><strong>$Title</strong></h4><% end_if %>
            <% if $city  %><p class="meta">$city</p><% end_if %>
            <% if $introtext %>
            <div class='feature__content typography'>$introtext</div>
            <% end_if %>
        </div>
    </div>
    <div class="col-2 col-md col">
        Qualmark...
    </div>
</article>
<% end_loop %>
<% else %>
    <h4 class="center"><strong>Sorry no results matched your search.</strong></h4>
<% end_if %>
