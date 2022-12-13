<% if $Results %>
    <p class="center"><strong>Showing $Results.PageLength results ($Results.getTotalItems total)</strong></p>
<% loop $Results %>
 <article class="product-listing <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
    <div class="grid">
        <div class="col-4 col-md col" >
            <div class="bg-image">
                <%-- if $productimage !="none" %>
                    <img  src="$productimage" data-src="$ScaleWidth(1920).Link" class="cover lazyload blur-up" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                <% end_if --%>
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
            <div class='feature__content typography'><p>$introtext</p>
            <p>
            <% end_if %>
            <% if $website_link_ispublic && website_link %>
                <a href="$website_link" target="_blank" class="button">Visit Website</a>
            <% end_if %>
            <% if $booking_link  %>
                <a href="$booking_link" target="_blank" class="button">Book now</a>
            <% end_if %>
            <% if $longitude && $latitude %>
            <a class="venobox" data-vbtype="iframe" href="https://maps.google.com/maps?width=100%&height=600&hl=en&coord=-38.002345075,177.283673246&q=+(I%20feel%20Free)&ie=UTF8&t=&z=14&iwloc=B&output=embed" ><img class="map-icon" src="{$BaseHref}library/images/icons/icon-map.svg" /></a>
            <% end_if %>
            </p></div>
        </div>
    </div>
    <div class="col-2 col-md col">
        Qualmark...
    </div>
</article>
<% end_loop %>


<!-- BEGIN PAGINATION -->
<% if $Results.PageLength > 1 %>
<div class="center">
    <ul class="pagination">
        <% loop $Results.PaginationSummary %>
            <% if $Link %>
                <li <% if $CurrentBool %>class="active"<% end_if %>><a href="$Link">$PageNum</a></li>
            <% else %>
                <li class="inactive">...</li>
            <% end_if %>
        <% end_loop %>
    </ul>
</div>
<% end_if %>
<% else %>
    <h4 class="center"><strong>Sorry no results matched your search.</strong></h4>
<% end_if %>
