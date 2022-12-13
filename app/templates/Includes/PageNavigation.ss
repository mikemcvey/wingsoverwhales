<!-- Push Wrapper -->
<div class="mp-pusher" id="mp-pusher">
<!-- mp-menu -->s
<nav id="mp-menu" class="mp-menu noprint">
	<div class="mp-level">
		<ul>
			<% loop $Menu(1) %>
				<li <% if $Children %>class="icon icon-arrow-left"<% end_if %>>
					<a href="$Link" title="Go to the $Title page" class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
						$MenuTitle
					</a>
						<% if $Children %>
						<div class="mp-level">
							<a class="mp-back" href="#">back</a>
							<ul class="secondary">
							<li>
								<a href="$Link" title="Go to the $Title page" class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
									$MenuTitle
								</a></li>
								<% loop $Children %>
									<li class="<% if $Children %>icon icon-arrow-left<% end_if %> <% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
										<a href="$Link">$MenuTitle</a>
										<% if $Children %>
										<div class="mp-level">
											<a class="mp-back" href="#">back</a>
											<ul class="secondary">
											<li>
								<a href="$Link" title="Go to the $Title page" class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>">
									$MenuTitle
								</a></li>
												<% loop $Children %>
													<li class="<% if $isCurrent %>current<% else_if $isSection %>section<% end_if %>"><a href="$Link">$MenuTitle</a></li>
												<% end_loop %>
											</ul>
										</div>
										<% end_if %>
									</li>
								<% end_loop %>
							</ul>
						</div>
						<% end_if %>
				</li>
			<% end_loop %>
		</ul>
	</div>
</nav>				
