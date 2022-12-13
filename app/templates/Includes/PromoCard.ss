 <article class="blog-article promocard <% if $Image %><% else %>no-bg-image <% end_if %> <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
        <div class="card">
            <div class="bg-image <% if $Top.ImageIsALogo %>logo<% end_if %>">
                <% if $Top.SVGIcon %>
                <div class="SVGIcon">
                    <img src="$Top.SVGIcon.URL" alt="$Top.SVGIcon.Title"  />
                </div>
                <% end_if %>
                <% if $Image %>
                <% with $Image %>
                    
                    $FillMax(1440,820)
                    
            
                    <% end_with %>
                <% end_if %>
                </div>
        </div>
    <div class="tile-copy">
        <div class="tile-inner">
            <% if $Title  %><h4 class="nop">$Title</h4><% end_if %>
            <% if $Content %>
            <div class='smaller'>$Content</div>
            <% end_if %>
            <% if $ElementLink.Template =="button" || $ElementLink.Template =="buttonghost" %>
            <p>$ElementLink</p>
            <% end_if %>
        </div>
    <div class="swiper-nav-wrap" style="display:none;"><div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div></div>
    </div>
      <% if $ElementLink.Template !="button" && $ElementLink.Template !="buttonghost" %> 
        <a <% if $ElementLink.OpenInNewWindow %>target="_blank"<% end_if %> href="$ElementLink.LinkURL" class="link-overlay" title="Go to $Title"><span class="sr-only">$ElementLink.Title</span></a>
        <% end_if %>
</article>