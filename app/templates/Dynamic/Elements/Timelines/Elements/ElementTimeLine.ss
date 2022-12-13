<div class="timeline-layout layout-$Layout  clearfix <% if $bg_image %> has-bg-image <% else %> no-bg-image <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
    <div class="bg-image  background-image">
        <% if $bg_image %>
        <% with $bg_image %>
            <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
        <% end_with %>   
        <% end_if %>
    </div>
    <div class="inner inner-$inner_wrap grid  $layout_class clearfix">
        <div class="col _inner textwrap col-align-$content_vertical_align">
            $Content
        </div>
    </div>
    <div class="inner inner-$inner_wrap grid  $layout_class clearfix">
        <div class="col">
            <div id="timeline-{$ID}">
                <ul class="timeline list-unstyled">
                    <% if $TimelineEntries %>
                    <% loop $TimelineEntries %>
                    <li>
                        <span class="marker">Feb<br/>2015</span>
                        <div class="flag flag-$EvenOdd border">
                            <div class="desc"><p class="uppercase"><strong>$title</strong></p>$Content</div>
                        </div>
                        <% if $HeroImage %>
                        <div class="flag flag-<% if $EvenOdd == 'even' %>odd<% else %>even<% end_if %> ">
                            <div class="desc image_holder">
                                <div class="bg-image">
                                    <% with $HeroImage %>
                                        <img src="$ScaleWidth(900).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                                    <% end_with %>   
                                </div>
                            </div>
                        </div>
                        <% end_if %>
                    </li>
                    <% end_loop %>
                     <% end_if %>

                </ul>
            </div>
         
        </div>

    </div>
</div>

