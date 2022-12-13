<article class="tile col col-4 feature<% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
      <%-- if $productimage %>
      <div class="bg-image">
          <img  src="$productimage"  class="cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
          <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
      </div>
          <% end_if --%>
      <div class="tile-copy">
          <% if $category  %><p class="meta">$category</p><% end_if %>
          <% if $Title  %><h3><strong>$Title</strong></h3><% end_if %>
          <% if $Teaser %>
          <div class='feature__content typography'>$Teaser</div>
          <% end_if %>
      </div>
      <a href="$Link" class="link-overlay" title="Read more about $Title"></a> 
  </article>
  





