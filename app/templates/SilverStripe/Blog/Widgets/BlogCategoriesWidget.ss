<% if $Categories %>
	<ul class="categories">
		<% loop $Categories %>
			<li>
				<a href="$Link" title="$Title">
					<span class="text">$Title</span>
				</a>
			</li>
		<% end_loop %>
	</ul>
<% end_if %>