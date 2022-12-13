<article class="card page_touchpoint <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <% if $Image %>
      
           <div class="bg-image">
<%--
$Image.Width // returns width of image
$Image.Height // returns height of image
$Image.Orientation // returns Orientation
$Image.Filename // returns filename
$Image.URL // returns filename

$ScaleWidth(400).CropHeight(400).Link
$Image.ScaleWidth(400).CropHeight(400).Link  --%>
            <% with $Image %>

              <img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="lazyload blur-up cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
               <% end_with %>   
            <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
          </div>
            <% end_if %>
		<div class="tile-copy grid">
         <div class="col col-align-middle">
             <% if $Title %><div class='feature__title'><h3>$Title</h3></div><% end_if %>
              <% if  $ElementLink.Template == "button" || $ElementLink.Template == "buttonghost" %>
                 $ElementLink
              <% end_if %>
            </div>
        </div>
        <% if $ElementLink %>
        <a href="$ElementLink.URL" class="link-overlay" title="Go to $ElementLink.Title"></a>
        <% end_if %>
	</article>




