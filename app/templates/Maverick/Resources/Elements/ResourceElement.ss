<!-- Resources Element -->
<div class="layer layout-content clearfix    no-bg-image  text-narrow  pad-top-default pad-bot-default vheight-default text-on-default bg-pattern-default bg-gradient-default   ">
  <div class="bg-image  background-image"></div>
  <div class="inner inner-default   clearfix">
    <div class="grid ">
      <div class="col _inner textwrap col-align-middle">
        <% if $Title && $ShowTitle %><h3>$Title</h3><% end_if %>
        <p><% if $Teaser %> $Teaser <% else %> $Resource.Summary <% end_if %></p>
        <p>
				<% if $Resource.Files %>
						<% loop $Resource.Files %>
							<a href="$URL" target="_blank" class="button ss-broken">
									Download PDF</a>
						<% end_loop %>
				<% end_if %>
				<% if $HardCopyLink %>
					<a class="button ss-broken" href="$HardCopyLink.LinkURL">$HardCopyLink.Title</a>
				<% end_if %>
        </p>
      </div>
      <div class="col _inner imgwrap col-align-middle">
        <p>
				<% if $MainImage %>
						<% with $MainImage %>
								<img src="$Fit(1200, 1200).URL" class="center ss-htmleditorfield-file image" 
									style="object-position: $PercentageX% $PercentageY%" 
									alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
							<% end_with %>   
				<% end_if %>
        </p>
      </div>
    </div>
  </div>
</div>