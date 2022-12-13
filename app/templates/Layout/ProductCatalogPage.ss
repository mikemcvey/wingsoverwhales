
<pre>Product Catalog Page</pre>		
				$ElementalArea
				$Content
				$Form
<div class="day-product-carousel">
    <% loop $Products %>
        <article class="isotope-item product_listing <% if $Last %> last<% end_if %><% if $First %> first<% end_if %>">
           
            <%-- if $productimage != "none" %>
            <div class="bg-image">
                <img  src="$productimage"  class="cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
            </div>
                <% end_if --%>
            <div class="tile-copy">
                <% if $category  %><p class="meta">$category</p><% end_if %>
                <% if $Title  %><h3><strong>$Title</strong></h3><% end_if %>
                <% if $Teaser %>
                <div class='feature__content typography'>$Teaser</div>
                <% end_if %>
            </div>
           <a href="$Link" class="link-overlay" title="Go to $Title"></a> 
        </article>
    <% end_loop %>
</div>
<% with DisplayObject %>

<div class="layer clearfix grid grid-nogutter  text-default   pad-top-default pad-bot-default vheight-default Default "> 
	<div class="inner col grid inner-default   clearfix">
		<div class="col _inner textwrap col-align-top">
			<p class="text-center">$introtext</strong></p>
	category: $category <br/>
    ["productimage"]=> <img src="{$BaseHref}Operator-Images/$productid/$productimage" /> <br/>
    ["regionid"]=> $regionid<br/>
 
    ["companyid"]=> $companyid<br/>
 
    ["company"]=>$company<br/>
   
    ["introtext"]=> $introtext    <br/>
	["description"]=> $description<br/>
    ["contactfirstname"]=> $contactfirstname<br/>
    ["email"]=> $email<br/>
    ["address1"]=> $address1<br/>
    ["city"]=> $city<br/>
    ["phone"]=> $phone<br/>
    ["hours"]=> $hours<br/>
   
    ["website"]=> $website<br/>
    ["latitude"]=> $latitude<br/>
    ["longitude"]=> $longitude<br/>
    ["tripadvisorid"]=> $tripadvisorid<br/>
    ["zomatoid"]=> $zomatoid<br/>
    ["qualmarkendorsed"]=> $qualmarkendorsed<br/>
    ["visible"]=> $visible<br/>
    ["herocategoryid"]=> $herocategoryid<br/>
    ["categoryid"]=> $categoryid<br/>
    ["MenuImageID"]=> $MenuImageID<br/>

       
		</div>
	</div>
</div>
$companyid 
$Description
<% end_with %>
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
