
    <div class="bg-image  background-image">
        <% if $bg_image %>
        <% with $bg_image %>
            <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">   
        <% end_with %>   
        <% end_if %>
    </div>
    <% if $Content ||   $HTML || $ColumnTwo || $ColumnThree || $ColumnFour  %>
    <div class="inner  element-content inner-$inner_wrap  $layout_class clearfix">
        <div class="grid <% if $ReverseLayoutOrder %>grid-reverse<%end_if %>">
            <div class="col _inner textwrap col-align-$content_vertical_align">
                <% if $ShowTitle %>
                    <h2>$Title</h2>
                <% end_if %>
                $Content
                $HTML
            </div>
            <% if $number_columns >= 2  %>
            <div class="col _inner imgwrap col-align-$content_vertical_align">
                $ColumnTwo
            </div>
            <% end_if %>
            <% if $number_columns >= 3 %>
            <div class="col _inner textwrap col-align-$content_vertical_align">
                    $ColumnThree
            </div>
            <% end_if %>
            <% if $number_columns >= 4 %>
            <div class="col _inner imgwrap col-align-$content_vertical_align">
                $ColumnFour
            </div>
            <% end_if %>
        </div>
    </div>
    <% end_if %>
   
