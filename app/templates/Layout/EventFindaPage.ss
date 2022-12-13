
<% loop $Results %>
	 <% include EventFinda %>
<% end_loop %>
	$ElementalArea
	$Content
	$Form
<% if $allChildren %>
<div class="blog-entry inner inner-wide ">
		<div class="features">
			<h4>Sub Pages - DEV ONLY</h4>
			<div class="grid blog grid-center">
			<% loop $allChildren %>
				<% include SilverStripe\\Blog\\PostSummary %>
			<% end_loop %>
			</div>
		</div>
	</div>
</div>
<% end_if %>
