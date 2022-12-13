
<%-- <pre>Display Product Layout</pre>	--%>	
				$ElementalArea
				$Content
				$Form 
<%--   test imgix integration...
                <img ix-src="http://tnz-rackspace.imgix.net/p-F4D6F272-9836-9E1E-D7F34962BA8A5F6C-4404077.jpg?fit=crop&amp;crop=faces"
     sizes="(min-width: 768px) 540px, 100vw"
     alt="A woman drinking a cup of coffee at Sightglass">
--%>
<% with DisplayObject %>

<div id="breadcrumbs" class="noprint">
     <a href="javascript:history.back();">&larr; Back</a>
	</div>

<%-- if isAPI %>
 is TNZ API product
<% else %>
is website product
<% end_if --%>
<div class="layer clearfix grid grid-nogutter  text-default  pad-bot-default vheight-default bgpattern Default "> 
	<div class="inner col grid inner-default   clearfix">
		<div class="col _inner textwrap col-align-top">
			<p class="lead text-center">$Teaser</p>
           <div class="product_top_bar grid flex">
                <div class="col col-4 col-sm col-grow-2">
                 <% if booking_link || website_link && $website_link_ispublic && $website_link != 'false' || website && $website != 'false' ||  $booking_email   %>
                <%-- if $booking_link $website_link_ispublic && $website_link != 'false') || ($website && $website != 'false') || $booking_email %>
$booking_link || $website_link_ispublic && $website_link != 'false' || $website && $website != 'false' || $booking_email  --%>
                    <h4>Contact Us</h4>
                <% end_if %>
                 
                    <% if booking_link %><a href="$booking_link" target="_blank" class="button">Book Now</a><% end_if %>
                    <% if website_link_ispublic && website_link != 'false' %><a href="$website_link" target="_blank" class="button">Visit our website</a><% end_if %>
                    <% if $website && $website != 'false' %><a href="$website" target="_blank" class="button">Visit our website</a><% end_if %> 
                    <% if $booking_email %><a href="{$BaseURL}"  $obfuscate_email($booking_email) class="button contactme"><i class="icon-email"></i>Contact Us</a><% end_if %>
                    $MyProductSocialIcons 
                </div>
                <div class="col  col-sm col-shrink-4">
                    $ProductPrice
                </div>
                 <div class="col col-lg col-grow-2">
                    <div class="grid grid-nogutter">
                        
                   <% if $getQualmark  %>
                        <div class="col col-align-middle ">
                            $getQualmark 
                        </div>
                    <% end_if %>
                  <% cached $TripAdvisorDataCacheID, $TripAdvisorDataCache %>
                    <% if  $TripAdvisorData %>
                        <div class="col col-align-middle">
                            $TripAdvisorData
                        </div>
                    <% end_if %>
                 <% end_cached %>
                 </div>
               
                </div>
            </div> 
           
            <div class="blog-entry product grid  inner text-wider inner-full-width pad-top-20 pad-bot-100">
                <% if $isApi %>
                $productGallery
                <% end_if %>
                <div class="col textwrap">
                 <% if $isApi %>
                 <% else %>
                $productGallery
                <% end_if %>
                    <% if $listing_description %><p>$listing_description</p><% end_if %>
                    <% if $description %>$description<% end_if %>
                    <% if website_link_ispublic && website_link != 'false' %><a href="$website_link" target="_blank" class="button">Visit our website</a><% end_if %>
                    <% if $website && $website != 'false' %><a href="$website" target="_blank" class="button">Visit our website</a><% end_if %> 
                    <% if booking_link %><p><a href="$booking_link" target="_blank" class="button">Book Now</a></p><% end_if %>
                    $listingMap
                </div>
                <div class="col imgwrap blog-sidebar">
                <% if $productLogoURL != 'false' %>
                    <img src="$productLogoURL" alt="$Title - logo"/>
                    <% end_if %>
                <% if $LogoImage.URL != '' %>
                    <img src="$LogoImage.URL" alt="$Title - logo"/>
                    <% end_if %>
                <% if $operational_hours || $hours || $operating_months %>
                <h4><strong>OPENING TIMES</strong></h4>
                     <% end_if %>
                    <% if $operational_hours || $hours %>
                        <p><strong>Business Hours:</strong><br/> 
                        $operational_hours $hours</p>      
                    <% end_if %>
                    <% if $operating_months %>
                        <p><strong>Months of Operation:</strong></br>
                        $operating_months</p>      
                    <% end_if %>
       
                <% if isAPI %>
                <% else %>
                    <h4><strong>CONTACT DETAILS</strong></h4>
                        <p>
                            <% if $contactfirstname %><strong>Contact:</strong> $contactfirstname<br/> <% end_if %>
                            <% if $phone %><strong>Phone:</strong> $phone<br/> <% end_if %>
                            <% if $email %> <strong>Email:</strong> $email<br/> <% end_if %>
                            <% if $buildingname %> <strong>Building:</strong> $buildingname<br/> <% end_if %>
                            <% if $address1 %><strong>Address:</strong> $address1<br/> <% end_if %>
                            <% if $address2 %>$address2<br/> <% end_if %>
                            <% if $city %><strong>City:</strong> $city<br/> <% end_if %>

                        </p>    
                <% end_if %>
                    <% if $proximity_to_town || $proximity_to_airport || $proximity_to_coach || $parking || $weather_considerations || $amenities    %>
                        <h4><strong>FACILITIES AND FEATURES</strong></h4>
                        
                        <% if $proximity_to_town %>
                            <p><strong>Proximity to town:</strong><br/> 
                            $proximity_to_town</p>      
                        <% end_if %>
                        <% if $proximity_to_airport %>
                            <p><strong>Proximity to airport:</strong><br/> 
                            $proximity_to_airport</p>      
                        <% end_if %>
                        <% if $proximity_to_coach %>
                            <p><strong>Proximity to bus:</strong><br/> 
                            $proximity_to_coach</p>      
                        <% end_if %>
                        <% if $parking %>
                            <p><strong>Parking:</strong><br/> 
                            $parking</p>      
                        <% end_if %>
                        <% if $weather_considerations %>
                            <p><strong>Weather Considerations:</strong><br/> 
                            $weather_considerations</p>      
                        <% end_if %>
                        <% if $amenities %>
                            <p><strong>Amenities:</strong><br/> 
                            $get_amenities</p>      
                        <% end_if %>
                    <% end_if %>
                    <%-- if $pricing_has_highlow  --%>
                   
                     <% if $pricing_has_highlow || $rooms || $max_capacity || $minimum_age || $activity_duration || $other_charges || $conditions || $cancellation_policy  %>
                     <h4><strong>PRICING AND CONDITIONS</strong></h4>
                        <% if $pricing_has_highlow %>
                        <table class="content-section__table"> 
                            <thead>
                                    <tr><th></th>
                                    <th>High season</th>
                                    <th>Low season</th>
                                </tr></thead>
                            <tbody>
                                <tr>
                                    <td></td>
                                    <td>($high_period_start.ShortMonth() - $high_period_end.ShortMonth())</td>
                                    <td>($low_period_start.ShortMonth() - $low_period_end.ShortMonth())</td>
                                </tr>
                                <% if $adult_rate_high_period_low_price %>
                                <tr>
                                    <td>Adult</td>
                                    <td>${$adult_rate_high_period_low_price} - ${$adult_rate_high_period_high_price}</td>
                                    <td>${$adult_rate_low_period_low_price} - ${$adult_rate_low_period_high_price}</td>
                                </tr>
                                <% end_if %>
                                <% if $child_rate_high_period_low_price %>
                                <tr>
                                    <td>Child</td>
                                    <td>${$child_rate_high_period_low_price} - ${$child_rate_high_period_high_price}</td>
                                    <td>${$child_rate_low_period_low_price} - ${$child_rate_low_period_high_price}</td>
                                </tr>
                                <% end_if %>
                        </tbody>
                    </table>
                    <% else %>
                        <table class="content-section__table"> 
        
                            <tbody>
                                 <thead>
                                    <tr>
                                    <th>Pricing</th>
                                    <th></th>
                                </tr></thead>
                                <% if $adult_rate_high_period_low_price %>
                                <tr>
                                    <td>Adult</td>
                                    <td>${$adult_rate_high_period_low_price} <% if $adult_rate_high_period_low_price && $adult_rate_high_period_low_price != $adult_rate_high_period_high_price  %> - ${$adult_rate_high_period_high_price}<% end_if %></td>
                                </tr>
                                <% end_if %>
                                <% if $child_rate_high_period_low_price %>
                                <tr>
                                    <td>Child</td>
                                    <td>${$child_rate_high_period_low_price} <% if $child_rate_high_period_low_price && $child_rate_high_period_low_price != $child_rate_high_period_high_price  %> - ${$child_rate_high_period_high_price}<% end_if %></td>
                                </tr>
                                <% end_if %>

                                 <% if $adultprice %>
                                <tr>
                                    <td>Adult</td>
                                    <td>$adultprice</td>
                                </tr>
                                <% end_if %>
                                <% if $childprice %>
                                <tr>
                                    <td>Child</td>
                                    <td>$childprice</td>
                                </tr>
                                <% end_if %>
                                <% if $familyprice%>
                                <tr>
                                    <td>Family</td>
                                    <td>$familyprice</td>
                                </tr>
                                <% end_if %>
                            </tbody>
                        </table>
                  <% end_if %>

               <%-- 

$high_period_end
$low_period_start
$low_period_end
$child_rate_age
$child_rate_high_period_low_price
$child_rate_high_period_high_price
$child_rate_low_period_low_price
$child_rate_low_period_high_price
$adult_rate_high_period_low_price
$adult_rate_high_period_high_price
$adult_rate_low_period_low_price
$adult_rate_low_period_high_price
$minimum_age
                <h4><strong>PRICING AND CONDITIONS</strong></h4>
                    "pricing_has_highlow" => 'Boolean', 0
                    "high_period_start" => 'Datetime', 2015-12-01 00:00:00
                    "high_period_end" => 'Datetime', 2015-12-01 00:00:00
                    "low_period_start" => 'Datetime', 2015-05-01 00:00:00
                    "low_period_end" => 'Datetime', 2015-12-01 00:00:00
                    "child_rate_age" => 'Varchar',
                    "child_rate_high_period_low_price" => 'Varchar',
                    "child_rate_high_period_high_price" => 'Varchar',
                    "child_rate_low_period_low_price" => 'Varchar',
                    "child_rate_low_period_high_price" => 'Varchar',
                    "adult_rate_high_period_low_price" => 'Varchar', 155
                    "adult_rate_high_period_high_price" => 'Varchar', 175
                    "adult_rate_low_period_low_price" => 'Varchar',
                    "adult_rate_low_period_high_price" => 'Varchar',
                    "minimum_age" => 'Int', 0
                   
                    "activity_duration" => 'Varchar',
 --%>



                <% if $rooms %>
                    <p><strong>Rooms:</strong><br/> 
                    $rooms</p>      
                <% end_if %>
                <% if $max_capacity || $maxoccupancy %>
                    <p><strong>Max Capacity:</strong><br/> 
                    $max_capacity </p>      
                <% end_if %>
                <% if $minimum_age %>
                    <p><strong>Minimum Age:</strong><br/> 
                    $minimum_age</p>      
                <% end_if %>
                <% if $activity_duration %>
                    <p><strong>Activity Duration:</strong><br/> 
                    $activity_duration</p>      
                <% end_if %>

                <% if $other_charges %>
                    <p><strong>Other Charges:</strong><br/> 
                    $other_charges</p>      
                <% end_if %>
                <% if $conditions %>
                    <p><strong>Conditions:</strong><br/> 
                    $conditions</p>      
                <% end_if %>
                <% if $cancellation_policy %>
                    <p><strong>Cancellation Policy:</strong><br/> 
                    $cancellation_policy</p>      
                <% end_if %>
 <% end_if %>
                </div>
            </div>
            

           <%--
<pre>


           

<h4>LEGACY PRODUCT FIELDS </h4>

            	nameoflisting: $nameoflisting <br/>
                category: $category <br/>
               <%--  ["productimage"]=> <img src="$productimage" /> <br/> moved to merged -- %>
                ["regionid"]=> $regionid<br/>
            
                ["companyid"]=> $companyid<br/>
            
                <%--  ["company"]=>$company<br/> moved to merged -- %>
            
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

<h4>TNZ API FIELDS </h4>

        'unique_id' => 'Int', $unique_id<br/>
        'od_listing_market_o_id' => 'Int', $od_listing_market_o_id<br/>
        'od_listing_o_id' => 'Int', $od_listing_o_id<br/>
        'market' => 'Varchar', $market<br/>
        'market_label' => 'Varchar', $market_label<br/>
        'ref_id_int' => 'Int', $ref_id_int<br/>
        'od_account_o_id' => 'Int', $od_account_o_id<br/>
        'logo_image_asset_o_id' => 'Int', $logo_image_asset_o_id<br/>
        'profile_image_o_id' => 'Int', $profile_image_o_id<br/>
        'od_businesstype_o_id' => 'Int', $od_businesstype_o_id<br/>
        'business_type' => 'Varchar', $business_type<br/>
        'nameoflisting' => 'Varchar', $nameoflisting<br/>
        'listing_name_key' => 'Varchar', $listing_name_key<br/>
        'listing_summary' => 'Text', $listing_summary<br/>
        'listing_description' => 'Text', $listing_description<br/>
        'lu_country_o_id' => 'Int', $lu_country_o_id<br/>
        'lu_region_o_id' => 'Int', $lu_region_o_id<br/>
        'lu_city_o_id' => 'Int', $lu_city_o_id<br/>
        'countryname' => 'Varchar', $countryname<br/>
        'regionname' => 'Varchar', $regionname<br/>
        'cityname' => 'Varchar', $cityname<br/>
        'stateprovince' => 'Varchar', $stateprovince<br/>
        'city' => 'Varchar', $city<br/>
        'suburb' => 'Varchar', $suburb<br/>
        "street"  => 'Varchar', $street<br/>
        "postcode"  => 'Varchar', $postcode<br/>
        "use_physical_address"  => 'Boolean', $use_physical_address<br/>
        "mailing_lu_country_o_id"  => 'Int', $mailing_lu_country_o_id<br/>
        "mailing_lu_region_o_id"  => 'Int',  $mailing_lu_region_o_id<br/>
        "mailing_lu_city_o_id"  => 'Int',  $mailing_lu_city_o_id<br/>
        "mailing_countryname"  => 'Varchar',  $mailing_countryname<br/>
        "mailing_regionname"  => 'Varchar',  $mailing_regionname<br/>
        "mailing_cityname"  => 'Varchar',  $mailing_cityname<br/>
        "mailing_stateprovince"  => 'Varchar',  $mailing_stateprovince<br/>
        "mailing_city"  => 'Varchar',  $mailing_city<br/>
        "mailing_suburb"  => 'Varchar',  $mailing_suburb<br/>
        "mailing_street"  => 'Varchar',  $mailing_street<br/>
        "mailing_postcode"  => 'Int',  $mailing_postcode<br/>
        "website_link"  => 'Varchar', $website_link<br/>
        "booking_link"  => 'Varchar', $booking_link<br/>
        "booking_email"  => 'Varchar', $booking_email<br/>
        "booking_phone"  => 'Varchar', $booking_phone<br/>

        "email"  => 'Varchar', $email<br/>
        "phone"  => 'Varchar', $phone<br/>
        "mobile"  => 'Varchar',  $mobile<br/>
        "fax"  => 'Varchar', $fax<br/>
        "freephone"  => 'Varchar', $freephone<br/>
        
        "website_link_ispublic"  => 'Boolean', $website_link_ispublic<br/>
        "phone_ispublic"  => 'Boolean', $phone_ispublic<br/>
        "mailing_ispublic"  => 'Boolean', $mailing_ispublic<br/>
        "email_ispublic"  => 'Boolean', $email_ispublic<br/>
        "fax_ispublic"  => 'Boolean', $fax_ispublic<br/>
        "freephone_ispublic"  => 'Boolean', $freephone_ispublic<br/>


        "latitude"  => 'Varchar', $latitude<br/>
        "longitude"  => 'Varchar', $longitude<br/>
        "pricing_has_highlow"  => 'Boolean', $pricing_has_highlow<br/>
        "high_period_start"  => 'Datetime', $high_period_start<br/>
        "high_period_end"  => 'Datetime', $high_period_start<br/>
        "low_period_start"  => 'Datetime', $low_period_start<br/>
        "low_period_end"  => 'Datetime', $low_period_end<br/>
        "child_rate_age"  => 'Varchar', $child_rate_age<br/>
        "child_rate_high_period_low_price"  => 'Varchar', $child_rate_high_period_low_price<br/>
        "child_rate_high_period_high_price"  => 'Varchar', $child_rate_high_period_high_price<br/>
        "child_rate_low_period_low_price"  => 'Varchar', $child_rate_low_period_low_price<br/>
        "child_rate_low_period_high_price"  => 'Varchar', $child_rate_low_period_high_price<br/>
        "adult_rate_high_period_low_price"  => 'Varchar', $adult_rate_high_period_low_price<br/>
        "adult_rate_high_period_high_price"  => 'Varchar', $adult_rate_high_period_high_price<br/>
        "adult_rate_low_period_low_price"  => 'Varchar', $adult_rate_low_period_low_price<br/>
        "adult_rate_low_period_high_price"  => 'Varchar', $adult_rate_low_period_high_price<br/>
        "minimum_age"  => 'Int', $minimum_age<br/>
        "max_capacity"  => 'Varchar', $max_capacity<br/>
        "rooms"  => 'Varchar', $rooms<br/>
        "activity_duration"  => 'Varchar', $activity_duration<br/>
        "operational_hours"  => 'Varchar', $operational_hours<br/>
        "operating_months"  => 'Varchar', $operating_months<br/>
        "proximity_to_town"  => 'Text', $proximity_to_town<br/>
        "proximity_to_airport"  => 'Text', $proximity_to_airport<br/>
        "proximity_to_coach"  => 'Text', $proximity_to_coach<br/>
        "parking"  => 'Text', $parking<br/>
        "weather_considerations"  => 'Text', $weather_considerations<br/>
        "other_charges"  => 'Text', $other_charges<br/>
        "conditions"  => 'Text', $conditions<br/>
        "cancellation_policy"  => 'Text', $cancellation_policy<br/>
        "doc_concession_id"  => 'Varchar', $doc_concession_id<br/>
        "is_kiwi_specialist"  => 'Boolean', $is_kiwi_specialist<br/>
        "is_isite"  => 'Boolean', $is_isite<br/>
        "is_tour"  => 'Boolean', $is_tour<br/>
        "listing_types"  => 'JSONText', $listing_types<br/>
        "qualmark_ratings"  => 'JSONText', $qualmark_ratings<br/>
        "awards"  => 'JSONText', $awards<br/>
        "amenities"  => 'JSONText', $amenities<br/>
        "languages_spoken"  => 'JSONText', $languages_spoken<br/>
        "languages_written"  => 'JSONText', $languages_written<br/>
        "online_profiles"  => 'JSONText', $online_profiles<br/>
        "tags"  => 'JSONText', $tags<br/>
        "logo"  => 'JSONText', $logo<br/>
        "assets"  => 'JSONText', $assets<br/>
        "deals" => 'JSONText', $deals<br/>
        "rownumber" => 'Int' $rownumber<br/>
</pre>
--%>

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
			<div class="grid blog grid-center">
			<% loop $allChildren %>
				<% include SilverStripe\\Blog\\PostSummary %>
			<% end_loop %>
			</div>
		</div>
	</div>
</div>
<% end_if %>
