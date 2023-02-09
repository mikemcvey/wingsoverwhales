<%-- cached $Anchor, $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count() --%>
<div class="elemental $ClassName.ShortName el-layer-$Sort  <% if $StyleVariant %> $StyleVariant<% end_if %> $Layout $LayoutType  $LayoutTypes <% if $ExtraClass %> $ExtraClass<% end_if %>" id="$Anchor">
	<% if $CurrentMember %>
	<a class="edit_link edit-section" target="_blank" data-edit-section="$CMSEditLink" href="$CMSEditLink"> Edit $ClassName.ShortName <%-- $ClassName.ShortName block --%> </a>
<% end_if %>
	<% if $Element.AnchorTag %>
	<div id="$Element.AnchorTag">
	<% if $CurrentMember %> 
<div class="hiddxen edit-section" data-edit-section="$CMSEditLink"></div> 
<% end_if %>
	$Element
	</div>
	<% else %>
	$Element
	<% end_if %>
</div>
<%-- end_cached --%>
