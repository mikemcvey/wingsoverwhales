


<pre>Layout Page.ss</pre>
				$ElementalArea
				$Content
				$EventFindaSearchForm

                 <% include EventFinda %>

<% if $allChildren %>
	<pre>All Child pages</pre>
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
