<article class="2 tile col feature<% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <% if $Image %>
      
           <div class="bg-image">
              <picture>
                <source media="(min-width: 1025px)"
                    srcset="$SiteConfig.CdnUrl$Image.FocusFill(617,475).URL"
                    sizes="50vw">
                <source media="(min-width: 561px)"
                  srcset="$SiteConfig.CdnUrl$Image.FocusFill(502,386).URL"
                  sizes="50vw">
                <source media="(max-width: 560px)"
                    srcset="$SiteConfig.CdnUrl$Image.FocusFill(365,182).URL"
                    sizes="50vw">
                <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                  style="object-position: $PercentageX% $PercentageY%"
                  loading="lazy"
                  alt="$Title" />
              </picture>
            <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
          </div>
            <% end_if %>
		<div class="tile-copy">
             <% if $Title && $ShowTitle %><div class='feature__title'><h3>$Title</h3></div><% end_if %>
              <% if $Content %>
            <div class='feature__content typography'>$Content</div>
             <% end_if %>
              <% if  $ElementLink.Template == "button" || $ElementLink.Template == "button ghost" %>
                 $ElementLink
              <% end_if %>
        </div>
        <% if $ElementLink %>
        	<a href="$ElementLink.LinkURL" <% if $ElementLink.OpenInNewWindow %>target="_blank"<% end_if %> class="link-overlay" title="Go to $Title"></a>
        <% end_if %>
	</article>




