<div class="layer layout-content element-content clearfix number-columns-1  bg-pattern-horzontal-1  no-bg-image  text-default  pad-top-default pad-bot-default vheight-default text-on-default bg-pattern-default bg-gradient-default   "> 
    <div class="inner  element-content inner-narrow   clearfix">
        <div class="grid ">
            <div class="col _inner textwrap col-align-top te">
			<p class="category-meta nopb">$Parent.Title</p>
			<h2 class="post-title"><strong>$Title</strong></h2>
			<% include SilverStripe\\Blog\\EntryMeta %>
		<p class="lead">$FullTeaser</p>

	</div>
			</div>	
		</div>	
	</div>	
</div>

$ElementalArea

<section class="layer grid content  pad-top-default pad-bot-default"> 
	<div class="single inner inner-1170 col  clearfix ">
		<div class="navigation grid">
			<div class="col">
				<% if $PreviousPost %>
				<span class="older-posts"><a href="$PreviousPost.Link"><i class="icon-left-arrow"></i> PREVIOUS BLOG </a></span>
				<h4 class="cliptext"><a href="$PreviousPost.Link"><strong>$PreviousPost.Title</strong></a><h4>
				<% end_if %>
			</div>
			<div class="col">
				<% if $NextPost %>
				<span class="older-posts"><a href="$NextPost.Link">NEXT BLOG<i class="icon-right-arrow"></i></a></span>
				<h4 class="cliptext"><a href="$NextPost.Link"><strong>$NextPost.Title</strong></a><h4>
				<% end_if %>
			</div>
		</div>		
	</div>
</section>

