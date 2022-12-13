<%-- <div class="layer layout-content element-content clearfix number-columns-1   no-bg-image  text-default  pad-top-default pad-bot-default vheight-default text-on-black bg-pattern-default bg-gradient-default   "> 
    <div class="inner  element-content inner-narrow   clearfix">
        <div class="grid ">
            <div class="col _inner textwrap col-align-top te">
            <h2 class="nopbot"><strong>$Title</strong></h2>
            <% if $JobRole %><p class="headline larger">$JobRole</p><% end_if %>   
		
	</div>
			</div>	
		</div>	
	</div>	
</div>
	--%>
<div class="staff-content staff-layout">
    <div class="layer clearfix  no-bg-image  text-default  pad-top-80 pad-bot-default vheight-default text-on-default bg-pattern-default bg-gradient-default   "> 
        <div class="bg-image  background-image">  
        </div>
            <div class="inner inner-1170   clearfix">
            <div class="grid">
                <div class="col _inner textwrap col-align-top">
<ul class="staff  list-unstyled list-inline <% if $Layout == "Carousel" %> swiper-wrapper <% else %> grid grid-no-gutter <% end_if %>">

                    <li class="<% if $Layout == "Carousel" %> swiper-slide <% else %> col col-12 <% end_if %> anim">
                            <div class="staff_member grid">
                                <div class="staff_photo col nop">
                                <% if $FeaturedImage %>
                                <% with $FeaturedImage %>
                                        <img src="$ScaleMaxWidth(900).Link"
                                        class="_cover"
                                        style="object-position: $PercentageX% $PercentageY%"
                                        alt="Meet $Title" />
                                 <% end_with %>   
                                 <% end_if %>
                                </div>
                                <div class="staff_content col">
        
                                    <h2 class="nopbot"><strong>$Title</strong></h2>
									<% if $JobRole %><p class="lead"><strong>$JobRole</strong></p><% end_if %>   
                                     <% if $StaffContent %><p class="blue">$StaffContent</p><% end_if %>                            
                                    <p class="social-links">
                                         <% if $LinkinProfile %>
                                        <a href="$LinkinProfile" title="Connect on LinkedIn"><i class="icon-linkedin"></i><span class="sr-only">Connect on LinkedIn</span></a>
                                        <% end_if %>
                                         <% if $EmailAddress %>
                                        <a href="mailto:$EmailAddress" title="Connect by Email"><i class="icon-email"></i><span class="sr-only">Connect by Email</span></a>
                                         <% end_if %>
                                         <% if $PhoneNumber %>
                                        <a href="tel:$PhoneNumber" title="Connect by Phone"><i class="icon-phone"></i><span class="sr-only">Connect by Phone</span></a>
                                        <% end_if %>
                                         </p>

                                   
								

                                </div>
                            </div>
                        </li>
					
                
                </ul>
			
                </div>
            </div>
        </div>
    </div>
</div>
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
<div class="inner inner-full-width grid clearfix">
	<div class="col overflow">
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
<%-- end_cached --%>
<% end_if %>


