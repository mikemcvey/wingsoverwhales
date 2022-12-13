<pre>Banner Block</pre>
<div class="layer clearfix banner-block intro grid text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight "> 
    <% if $File %>
           <div class="bg-image">
            <% with $File %>
              <img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="lazyload blur-up cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
               <% end_with %>   
          </div>
            <% end_if %>
   	<div class="inner col inner-$inner_wrap col-align-$column_vertical_align $layout_class clearfix">
        <div class="grid">
            <div class="col _inner intro-copy textwrap col-align-$content_vertical_align">
                 <% if $ShowTitle %>
                <h2>$Title</h2>
                <% end_if %>
                $Content
                 <%-- Add a CallToActionLink if available --%>
                <% if $CallToActionLink.Page.Link %>
                    <div class="call-to-action">
                    <% with $CallToActionLink %>
                        <a href="{$Page.Link}" class="button"
                            <% if $TargetBlank %>target="_blank"<% end_if %>
                            <% if $Description %>title="{$Description.ATT}"<% end_if %>>
                            {$Text.XML}
                        </a>
                    <% end_with %>
                    </div>
                <% end_if %>
            </div>

        </div> 
    </div> 
</div>