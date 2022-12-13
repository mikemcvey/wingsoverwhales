<% if $Title && $ShowTitle %><h2 class="element__title">$Title</h2><% end_if %>
  <section class="element_userform layer clearfix <% if $bg_image %> has-bg-image bggradient <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> <% if $BackgroundPattern != "default" %>bgpattern<% end_if %>  <% if $BoxedText %>boxedtext<% end_if %> $ColorTheme <% if $Style %> $StyleVariant<% end_if %>"> 
        <div class="bg-image">
            <% if $bg_image %>
            <% with $bg_image %>
                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
            <% end_with %>   
            <% end_if %>
        </div>
        <div class="inner grid inner-$inner_wrap  $layout_class clearfix">
            <div class="col">
                $Content 
               $Form
            </div>
        </div>
</section>
