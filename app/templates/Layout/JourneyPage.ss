<% include Breadcrumbs %>
$ElementalArea

<%--  if isSection(search) %>
<div class="search">$SearchForm</div>
<% else %>
<% end_if  --%>

<% if $UserDefinedContent %>

<div class=" Default  " id="e517">
	<div class="layer clearfix  text-default   pad-top-0 pad-bot-0 vheight-default txt-color-default bg-color-default bg-pattern-default     Default "> 
		<div class="bg-image">
		</div>
		<div class="inner inner-default   clearfix">
			<div class="grid">
				<div class="col _inner textwrap col-align-top">
					$UserDefinedContent
				</div>
			</div>
		</div>
	</div>
</div>

<% end_if %>
<% if $Content && $Content != '$UserDefinedForm' %>
	<div class="layer grid single_column pad-top-default pad-bot-default">
		<div class="inner col inner-1170 clearfix">
			$Content
		</div>
	</div>
<% end_if %>
<% if $Form %>
<div class="blog-entry text-center inner inner-narrow pad-bot-60 ">
	$Form
</div>
<% end_if %>
<% if $HideSubpageFooter  %>
<% else %>

<%-- cached 'SubPages', $List('SilverStripe\CMS\Model\SiteTree').max('LastEdited'), $List('SilverStripe\CMS\Model\SiteTree').count() --%>
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
<%-- end_cached --%>
<% end_if %>


