
<div class="col ">
    <article class="product-listing abs">
        <div class="bg-image">
            <% if $FeaturedImage %>
					<%--
					$Image.Width // returns width of image
					$Image.Height // returns height of image
					$Image.Orientation // returns Orientation
					$Image.Filename // returns filename
					$Image.URL // returns filename

					$ScaleWidth(400).CropHeight(400).Link
					$Image.ScaleWidth(400).CropHeight(400).Link  --%>
            	<% with $FeaturedImage %>
              		<img  src="$Fill(800,800).Link" data-src="$Fill(500,600).Link" class="b-lazy"  alt="<% if $Top.Title %>$Top.Title.ATT<% else %><% end_if %>">
               	<% end_with %>   
           	<% end_if %>
        </div>
        <div class="tile-copy">
		<% if $Categories.exists %>
				<p class="blog__category meta">
				<% loop $Categories %>
					$Title<% if not Last %><% else %><% end_if %>
				<% end_loop %>
				</p>
			<% end_if %>
				 <% if $Tags.exists %>
				<p class="blog__category meta">
					<% loop $Tags %>
						$Title<% if not Last %>, <% else %>;<% end_if %>
					<% end_loop %>
					</p>
				<% end_if %>
				
            <h3 class="subpage nopb"><% if $MenuTitle %>$MenuTitle<% else %>$Title<% end_if %></h3>
				<% if $ClassName == "ExperiencePage" %>
				<p class="category-meta nopb">$Parent.Title</p>
			   <% end_if %>
            <div class="smaller">
			  	<% if $Summary %><p class="line-clamp">$Summary</p><% end_if %>
            </div>
        </div>
		<% if $Link %>
        <a href="$Link" class="link-overlay" title="Go to $Title"></a>
        <% end_if %>
    </article>
</div>