<li id='tree-$ID' class="$LinkingMode">
<a href="$Link" aria-label="Go to the $Title.XML page">$MenuTitle</a>
<% if $Children %>
    <ul>
    <% loop $Children %>
        <% if $ClassName == "-ExperiencePage" || $ClassName == "StaffPage"  %>
        <% else %>
            <% include TreeMenuItem %>
        <% end_if %>
    <% end_loop %>
    </ul>
<% end_if %>
</li>