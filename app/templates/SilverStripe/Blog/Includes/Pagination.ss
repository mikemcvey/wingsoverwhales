<%-- NOTE: Before including this, you will need to wrap the include in a with block  --%>

<% if $MoreThanOnePage %>
	<div class="text-center pad-bot-default">
	<ul class="pagination">
		<% if $NotFirstPage %>
			<li><a class="prev" href="{$PrevLink}">&larr;</a></li>
		<% end_if %>

		<% loop $PaginationSummary(4) %>
			<% if $CurrentBool %>
			<li><a class="active" href="$Link">$PageNum</a></li>
			<% else %>
				<% if $Link %>
				<li><a href="$Link">$PageNum</a></li>
				<% else %>
				<li><a href="#">...</a></li>
				<% end_if %>
			<% end_if %>
		<% end_loop %>

		<% if $NotLastPage %>
		<li><a class="next" href="{$NextLink}">&rarr;</a></li>
		<% end_if %>
	</ul>
</div>
<% end_if %>
