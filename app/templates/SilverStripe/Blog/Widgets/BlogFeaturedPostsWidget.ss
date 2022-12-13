<% if $Posts %>
	<ul class="recent-posts">
		<% loop $Posts %>
			<li>
			<article class="tile <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <% if $FeaturedImage %>
        <div class="bg-image">
<%--
$Image.Width // returns width of image
$Image.Height // returns height of image
$Image.Orientation // returns Orientation
$Image.Filename // returns filename
$Image.URL // returns filename

$ScaleWidth(400).CropHeight(400).Link
$Image.ScaleWidth(400).CropHeight(400).Link  --%>
            <% with $FeaturedImage %>
              <img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="lazyload blur-up cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
               <% end_with %>   
			
            <%-- if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if --%>
          </div>
            <% end_if %>
		<div class="tile-copy">
			<div class='blog__widget__title'><h4><% if $MenuTitle %>$MenuTitle<% else %>$Title<% end_if %></h4></div>
        </div>
        <% if $Link %>
			<a href="$Link" class="link-overlay" title="Read more about Title"></a>
			<% end_if %>
	</article>
			</li>
		<% end_loop %>
	</ul>
<% end_if %>
