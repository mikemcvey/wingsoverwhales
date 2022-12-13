<div class="layer clearfix grid text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight "> 
    <% if $bg_image %>
           <div class="bg-image">
            <% with $bg_image %>
              <img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="lazyload blur-up cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
               <% end_with %>   
          </div>
            <% end_if %>
   	<div class="inner col inner-$inner_wrap col-align-$column_vertical_align $layout_class clearfix">
        <div class="grid">
            <div class="col _inner textwrap col-align-$content_vertical_align">
                <% if $Title && $ShowTitle %><h2 class="element__title center">$Title</h2><% end_if %>
                <% if $Content %><div class="element__content center">$Content</div><% end_if %>
                <% if $FeaturesList %>
                    <% if $Alternate %>
                        <% loop $FeaturesList %>
                            <% include FeaturesListAlternating %>
                        <% end_loop %>
                    <% else %>
                        <% loop $FeaturesList %>
                            <% include FeaturesList %>
                        <% end_loop %>
                    <% end_if %>
                <% end_if %>
            </div>
        </div> 
    </div> 
</div>

