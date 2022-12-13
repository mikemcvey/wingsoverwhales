$Content
$ElementalArea
<div class="blog-posts inner inner-1170 ">
	<% if $PaginatedList.Exists %>
	<div class="news-grid-wrapper pad-top-default pad-bot-default">
		
		<article>
		<div class="grid blog grid-center grid-nogutter">
		<% loop $PaginatedList %>
			<div class="col col-4">
            <% include BlogArticle %>
			</div>
		<% end_loop %>
		</div>
	</div>
	<% else %>
		<p>There are no posts</p>
	<% end_if %>
<% with $PaginatedList %>
	<% include SilverStripe\\Blog\\Pagination %>
<% end_with %>
</div>

<%-- include SilverStripe\\Blog\\BlogSideBar --%>
