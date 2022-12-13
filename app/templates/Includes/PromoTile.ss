 <article class="page-listing promotile boxborder abs anim <% if $Image == 'false' %>no-bg-image <% end_if %> <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
    <div class="bg-image">
        
        
       
            <% if $Image %>
                    <% with $Image %>
                <picture>
                    <img src="$SiteConfig.CdnUrl$ScaleWidth(1240).Link" 
                        class="cover lazyload blur-up"
                        style="object-position: $PercentageX% $PercentageY%"
                        loading="lazy"
                        alt="<% if $Title %>$Title.ATT<% end_if %>" />
                </picture>
                  <% end_with %>
                <% end_if %>
   
             
           
    </div>
    <div class="tile-copy">
       <% if $Top.SVGIcon %>
            <div class="SVGIcon">
                <img src="$Top.SVGIcon.URL" alt="$Top.SVGIcon.Title" class="contain" />
            </div>
          <% end_if %>
        <% if $Title  %><h4>$Title</h4><% end_if %>
        <% if $Content %>
        <div class='smaller'>$Content</div>
        <% end_if %>
        <% if $ElementLink.Template =="button" || $ElementLink.Template =="buttonghost" %>
        $ElementLink
        <% end_if %>
    </div>
      <% if $ElementLink.Template !="button" && $ElementLink.Template !="buttonghost" %> 
        <a href="$ElementLink.LinkURL" class="link-overlay" title="Go to $Title"><span class="sr-only">$ElementLink.Title</span></a>
        <% end_if %>
</article>