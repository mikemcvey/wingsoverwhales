	<div class="hero-slider">
		<ul class="slides">
			<li class="clearfix grid  grid-nogutter ">
			 <div class="bg-color abs"></div>
			<div class="intro-copy inner col <% if $ClassName.ShortName == 'BlogPost' %> col-align-bottom <% else %>col-align-middle  text-center<% end_if %>">
					<% if $ClassName.ShortName == 'BlogPost' %>
						<ul class="list-unstyled list-inline listing-meta small">
						<% if $Categories.exists %><li class="category"><% loop $Categories %><% if $First %><% else %> / <% end_if %>$Title<% end_loop %></li><% end_if %>
						</ul> 				
					<% end_if %>
					
					<% if $SlideTxt %>
						$SlideTxt
					<% else_if $ID != '447' %>
					<%-- if $Parent %>
					<p><em>$Parent.Title</em></p>
					<% end_if --%> 
					<%-- <h1>$Title</h1> --%>
					<% end_if %>
					<% if $ClassName.ShortName == 'BlogPost' %>
						<ul class="list-unstyled list-inline listing-meta small">
							<li class="no-icon">Posted <strong>  $PublishDate.Format('MMM d, y')</strong></li>
						</ul>				
					<% end_if %>
			<% with Top %>
				<% if $ArchiveYear %>
					<%t SilverStripe\\Blog\\Model\\Blog.Archive 'Archive' %>:
					<% if $ArchiveDay %>
						<h2>$ArchiveDate.Nice</h2>
					<% else_if $ArchiveMonth %>
						<h2>$ArchiveDate.format('MMMM, y')</h2>
					<% else %>
						<h2>$ArchiveDate.format('y')</h2>
					<% end_if %>
				<% else_if $CurrentTag %>
					<h2>$CurrentTag.Title</h2>
				<% else_if $CurrentCategory %>
					<h2>$CurrentCategory.Title</h2>
				<% end_if %>
			<% end_with %>
				</div>  
			
           <div class="bg-image">
			<% if $BannerImage %>
				<% with $BannerImage %>
					<% include BGImage %>
				<% end_with %> 
			<% else_if $FeaturedImage %> 
				<% with $FeaturedImage %>
					<% include BGImage %>
				<% end_with %> 
			<% else  %>
				<% with File(447) %>
					<% include BGImage %>
				<% end_with %>
			<% end_if %> 

          </div>
			 <% if $VideoLinkSmall || $VideoLinkMedium || $VideoLinkLarge %>
			 <div class="videocontainer">
              <video data-object-fit="cover" loop muted autoplay playsinline id="homepage_video"></video>
			
				<script>
					var vids = [
						'$VideoLinkSmall',
						'$VideoLinkMedium',
						'$VideoLinkLarge'
					];
				</script>
			
			  </div>  
			  <% end_if %>
			</li>
		</ul>
	</div>
