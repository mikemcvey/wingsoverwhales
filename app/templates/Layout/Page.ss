

$ElementalArea

<% if $ID != 1  && $NextPage ||  $PreviousPage %>
<section class="layer grid content  pad-top-default pad-bot-default"> 
	<div class="single inner inner-1170 col  clearfix ">
		<div class="navigation grid">
			<div class="col">
				<% if $PreviousPage %> 
				<span class="older-posts"><a href="$PreviousPage.Link"><i class="icon-left-arrow"></i> <% if $PreviousPage.Parent.Title %> $PreviousPage.Parent.Title <% else %> Previous<% end_if %></a></span>
				<h4 class="cliptext"><a href="$PreviousPage.Link"><strong>$PreviousPage.Title</strong></a><h4>
				<% end_if %>
			</div>
			<div class="col">
				<% if $NextPage %>
				<span class="older-posts"><a href="$NextPage.Link"> <% if $NextPage.Parent.Title %>$NextPage.Parent.Title <% else %> NextPage <% end_if %> <i class="icon-right-arrow"></i></a></span>
				<h4 class="cliptext"><a href="$NextPage.Link"><strong>$NextPage.Title</strong></a><h4>
				<% end_if %>
			</div>
		</div>		
	</div>
</section>
<% end_if %>
<% if $HideSubpageFooter  %>
<% else %>

<%-- cached 'SubPages', $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count() %>
<% if $allchildren %>
<div class="inner inner-1170 pad-top-60 pad-bot-60 grid clearfix text-on-default">
	<div class="col overflow">
	<h2 class="nopbot">Find Out More</h2>
	<p class="larger headline">Also in this section</p>
		<div class="listing-wrapper ">
		
			<div class="grid list-unstyled grid-center clearfix">
		 <% if $ClassName == 'SilverStripe\CMS\Model\VirtualPage' %>
				<% loop $ChildrenOf($CopyContentFromID) %>
					<% include SilverStripe\\Blog\\PostSummary %>
				<% end_loop %>
		 <% else %>

				<% loop $allchildren %>
					<% include SilverStripe\\Blog\\PostSummary %>
				<% end_loop %>
		 <% end_if %>
			</div>
		</div>
	</div>
</div>
<% end_if %>
<% end_cached --%>
<% end_if %>