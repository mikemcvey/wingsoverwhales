<% if $ContentLayoutType == 'Side-by-Side' %>
        <%-- 
        side-by-side  
        --%>
    <div class="layer layout-content number-columns-{$number_columns} side-by-side clearfix  text-$text_width   vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
            <div class="bg-image background-image">
            </div>
            <div class="inner inner-$inner_wrap grid  <% if $ReverseLayoutOrder %>grid-reverse<%end_if %> clearfix">
                <div class="col col-align-$content_vertical_align txtwrap pad-top-$pad_top pad-bot-$pad_bot">
                    <div class=" pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight">
                     $HTML
                     <% include ElementContentAfter %>
                    </div>
                </div>
                <div class="col imgwrap boxborderleft">
                    <div class="bg-image background-image">
                        <% if $bg_image %>
                            <% with $bg_image %>
                                <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                             <% end_with %>   
                        <% end_if %>
                    </div>
                </div>
            </div>
            
        </div>
<% else_if $ContentLayoutType == 'Split-Content-Images' %>
        <%-- 
        split 
        --%>
    <div class="layer layout-content split-content-images number-columns-{$number_columns} clearfix  text-$text_width pad-top-$pad_top pad-bot-$pad_bot   vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
            <div class="bg-image background-image">
                <% if $bg_image %>
                    $Page.AddImage($bg_image.ID,' cover ','  ')
                <% end_if %>
            </div>
            <div class="inner inner-$inner_wrap grid  <% if $ReverseLayoutOrder %>grid-reverse<%end_if %> clearfix">
                <div class="col col-align-$content_vertical_align txtwrap ">
                     $HTML
                     $Content
                </div>
                <div class="col"></div>
                  <% if $SplitImage2 %>
                <% with $SplitImage2 %>
                <div class="split-right">
                    <img src="$Fill(580,625).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                </div>
                <% end_with %>   
            <% end_if %>
            </div>
             <div class="inner inner-$inner_wrap grid  <% if $ReverseLayoutOrder %>grid-reverse<%end_if %> clearfix">
                <div class="col imgwrap">
                   
                        <div class="bg-image background-image">
                            <% if $SplitImage1 %>
                                <% with $SplitImage1 %>
                                    <img src="$Fill(580,625).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                                <% end_with %>   
                            <% end_if %>
                        </div>
                   
                </div>
                <div class="col">
                $ColumnTwo
                </div>
            </div>
             <% include ElementContentAfter %>
        </div>
<% else_if $ContentLayoutType == 'Text-above-Image' %>
<div class="text-above-images">
<div class="layer layout-content number-columns-{$number_columns}  clearfix <% if $ReverseLayoutOrder %>grid-reverse<%end_if %>  <% if $bg_image %> has-bg-image <% else %> no-bg-image <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
   
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
    
</div>
<div class="bg-image  background-image">
    <% if $bg_image %>
    <% with $bg_image %>
       <%--  $FillMax(1440,822) --%> 
        <picture>
            <source media="(min-width: 1920px)"
            srcset="$SiteConfig.CdnUrl$ScaleWidth(2048).Link"
            sizes="100vw">
            <source media="(min-width: 900px)"
            srcset="$SiteConfig.CdnUrl$ScaleWidth(1280).Link"
            sizes="100vw">
            <source media="(max-width: 600px)"
            srcset="$SiteConfig.CdnUrl$ScaleWidth(600).Link"
            sizes="100vw">
            <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
                                data-src="$ScaleWidth(1920).Link"
            class="block-hero-header b-lazy cover"
            style="object-position: $PercentageX% $PercentageY%"
            alt="<% if $Top.Title %>$Top.Title.ATT<% else %><% end_if %>" />
        </picture>
        <%-- <img src="$ScaleWidth(2048).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">  --%> 
    <% end_with %>   
    <% end_if %>
</div>
</div>
<% include ElementContentAfter %>
<% else %>
    <div class="layer layout-content clearfix number-columns-{$number_columns} <% if $ReverseLayoutOrder %>grid-reverse<%end_if %>  <% if $bg_image %> has-bg-image <% else %> no-bg-image <% end_if %> text-$text_width  pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight text-on-$BackgroundColor bg-pattern-$BackgroundPattern bg-gradient-$BackgroundGradient  <% if $BoxedText %>boxedtext<% end_if %> <% if $Style %>$StyleVariant<% end_if %>"> 
        <% include ElementContentArea %>
        <% include ElementContentAfter %>
    </div>
<% end_if %>



           