<pre>API ProductsSearchResults.ss</pre>
<% if $Results %>
    <p class="center"><strong>Showing $Results.PageLength results ($Results.getTotalItems total)</strong></p>
<div  class="grid grid-nogutter grid-center results day-product-carousel">
    <% loop $Results %>
       <% include ProductArticle %>
<%-- 
    <article class="tile col-3  <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> <% if $productArticleImageURL == 'false' %> no-image <% end_if %>">
            <div class="bg-image">
                <% if $productArticleImageURL != "false" %>
                    <img  src="$productArticleImageURL" class="cover" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                <% end_if %>
                <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
            </div>
            <div class="tile-copy abs">
                <p class="meta"><% if $ProductRegion  %>$ProductRegion<% end_if %><% if $ProdType  %>/$ProdType<% end_if %>
                </p>
                <% if $Title  %><h4><strong>$Title</strong></h4><% end_if %>
            </div>
        <a href="$Link" class="link-overlay" title="Go to $Title"></a>

    </article>
    --%>
    <% end_loop %>
</div>

<!-- BEGIN PAGINATION -->
<% if $Results.PageLength > 1 %>
<div class="center  pad-bot-100">
<ul class="pagination ajax"><% loop $Results.PaginationSummary %><% if $Link %><li <% if $CurrentBool %>class="active"<% end_if %>><a href="$Link">$PageNum</a></li><% else %><li class="inactive">...</li><% end_if %><% end_loop %></ul>
</div>
<% end_if %>
<% else %>
<div class="inner pad-bot-100">
    <h4 class="center"><strong>Sorry no results matched your search.</strong></h4>
</div>
<% end_if %>
