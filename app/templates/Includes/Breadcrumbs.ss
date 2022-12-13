<%-- if $Level(2) --%>
<% if $URLSegment != "home" %>
	<div id="breadcrumbs" class="noprint">
	   	$Breadcrumbs
            <% if $CurrentMember %>
     <a href="$CMSEditLink"> *edit</a>
<% end_if %>
	</div>
<% end_if %>
<% if $Pages %>
    <% loop $Pages %>
        <% if $Last %>$Title.XML<% else %><a href="$Link">$MenuTitle.XML</a> &raquo;<% end_if %>
    <% end_loop %>
<% end_if %>
<%-- end_if --%>



