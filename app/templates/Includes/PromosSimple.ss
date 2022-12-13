<div class="row">
    <% loop $PromoList %>
       <article class="1 tile col feature<% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
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
               <picture>
                <source media="(min-width: 1025px)"
                    srcset="$SiteConfig.CdnUrl$ScaleWidth(617,475).Link"
                    sizes="50vw">
                <source media="(min-width: 561px)"
                  srcset="$SiteConfig.CdnUrl$ScaleWidth(502,386).Link"
                  sizes="50vw">
                <source media="(max-width: 560px)"
                    srcset="$SiteConfig.CdnUrl$ScaleWidth(365,182).Link"
                    sizes="50vw">
                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                  style="object-position: $PercentageX% $PercentageY%"
                  loading="lazyload blur-up"
                  data-src="$SiteConfig.CdnUrl$ScaleWidth(617).Link"
                  alt="<% if $Title %>$Title.ATT<% else %><% end_if %>" />
              </picture> 
            <% end_with %>   
            <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
          </div>
            <% end_if %>
		<div class="tile-copy">
             <% if $Title && $ShowTitle %><div class='feature__title'><h3>$Title</h3></div><% end_if %>
              <% if $Content %>
            <div class='feature__content typography'>$Content</div>
             <% end_if %>
             
              <% if  $ElementLink.Template == "button" || $ElementLink.Template == "buttonghost" %>
                 $ElementLink

              <% end_if %>

             
        </div>
        <% if $ElementLink %>
        <a href="$ElementLink.URL" class="link-overlay" title="Go to $ElementLink.Title"></a>
        <% end_if %>
	</article>

    <% end_loop %>
</div>
