<% if $NavigationCategories %>
	<script>
	var navigation = [];
	<% loop $NavigationCategories %>
		var navigationChildren = [];
		<% if $MainLinks %>
			<% loop $MainLinks %>
				navigationChildren.push({
					title: '$Link.Title',
					link: '$Link.LinkUrl'
				});
			<% end_loop %>
		<% end_if %>
		navigation.push({
			title: '$Title',
			children: navigationChildren,
		});
	<% end_loop %>
	window.navigationWidget = navigation;
	</script>
<% end_if %>