<div class="layer element-features   <% if $LayoutType != 'Touchpoints' %>features  <% end_if %> clearfix grid grid-nogutter text-$text_width   vheight-$vheight  $ColorTheme pad-top-$pad_top pad-bot-$pad_bot "> 
  <div class="inner col  textwrap col-align-$content_vertical_align inner-$inner_wrap  $layout_class clearfix">
    <% if $Title && $ShowTitle %><h2 class="element__title">$Title</h2><% end_if %>
    <% if $Content %><div class="element__content">$Content</div><% end_if %>
    <div id="filter-products"></div>
    <% if $ColumnTwo %><div class="element__content_after">$ColumnTwo</div><% end_if %>
  </div>
</div>