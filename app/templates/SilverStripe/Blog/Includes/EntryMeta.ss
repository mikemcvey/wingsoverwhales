<p class="post-meta">
    <a href="$MonthlyArchiveLink">$PublishDate.Month $PublishDate.Format('d, y')</a> 
    <% if $Categories.exists %>
        <% loop $Categories %>
            Posted in <a href="$Link" title="$Title">$Title</a><% if not Last %><% else %><% end_if %>
        <% end_loop %>
    <% end_if %>

    <% if $Tags.exists %>
        <%t SilverStripe\\Blog\\Model\\Blog.Tagged "Tagged" %>
        <% loop $Tags %>
            <a href="$Link" title="$Title">$Title</a><% if not Last %>, <% else %>;<% end_if %>
        <% end_loop %>
    <% end_if %>
</p>
