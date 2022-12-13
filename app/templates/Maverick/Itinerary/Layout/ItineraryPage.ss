<div class="inner inner-default   clearfix">
	<div class="grid">
		<div class="col _inner textwrap col-align-top">
			$Introduction.RAW
		</div>
	</div>
</div>
<pre>ItineraryPage.ss</pre>
<div class="inner inner-default clearfix pad-top-40">
	<div class="grid">
		<% if $NumDays || $Distance %>
		<div class="col col-md">
			<h4 class="widgettitle">Time</h4>
			<% if $NumDays %><p class="lead" style="margin-bottom:0;">$NumDays Day<% if $NumDays > 1 %>s<% end_if %></p><% end_if %>
			<% if $Distance %><p style="margin-top:0;">$Distance km</p><% end_if %>
		</div>
		<% end_if %>
		<% if $Highlights %>
		<div class="col col-md">
			<h4 class="widgettitle">Highlights</h4>
			$Highlights
		</div>
		<% end_if %>
		<% if $Proximity %>
		<div class="col col-md">
			<h4 class="widgettitle">Proximity</h4>
			$Proximity
		</div>
		<% end_if %>
		<% if $ActivateAirNz %>
		<div class="col col-md">
			<iframe style='border:none;margin: 0 auto;display: block;' width='300' height='250' src='https://www.airnewzealand.co.nz/airnz-fare-finder-tourism-bayofplenty'></iframe>
		</div>
		<% end_if %>
		<% if $Extra_Header %>
		<div class="col col-md">
			$Extra_Header
		</div>
		<% end_if %>
	</div> 
</div>

<% loop $ItineraryDays %>

<div id="itin_{$Pos}"  class="itinerary_day  <% if $Last %> last<% end_if %><% if $First %> first<% end_if %>">
	<% if $HeroImage %>
	<div class="itinerary_day_image">
	<a class="abs skip-section" href="#itin_{$Pos}"></a>

		<div class="bg-image">
			<% with $HeroImage %>
			<img  src="$ScaleWidth(192).Link" data-src="$ScaleWidth(1920).Link" class="b-lazy cover" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
			<% end_with %>
		</div>
		<% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
	</div>
	<% end_if %>

	<div  id="itin_$Pos" class="itinerary_day_copy inner inner-1170 grid text-wider pad-top-60 pad-bot-40">
		<div class="col textwrap">
			<% if $Title %>
				<div class='itinerary_day_title'>
					<h3><% if $DayNum && $DayNum != 0 %><span>$DayNum:</span><% end_if %> $Title</h3> 
				</div>
			<% end_if %>
			<% if $DayTxt %>
			<div class='itinerary_day_content typography'>$DayTxt</div>
			<% end_if %>
		</div>
		<div class="col imgwrap">
			<% if $Highlights %>
				<h4 class="widgettitle">Highlights</h4>
				$Highlights
			<% end_if %>
			<% if $Proximity || Proximity_Bus || Proximity_Rail %>
				<h4 class="widgettitle">Proximity</h4>
			<% end_if %>
			<div class="prox_wrap">
			<% if $Proximity %><p><svg xmlns="http://www.w3.org/2000/svg" width="39" height="39" viewBox="0 0 39.1 39.1"><path d="M38.8 14.3c-0.2-0.2-0.5-0.4-0.8-0.4h-3.8c-0.9-2.5-2.2-4.9-3.5-5.8 -4.8-3.2-17.5-3.2-22.4 0 -1.4 0.9-2.6 3.3-3.5 5.8H1c-0.3 0-0.6 0.1-0.8 0.4 -0.2 0.2-0.3 0.5-0.2 0.8l0.6 2.7c0.1 0.5 0.5 0.8 1 0.8h1.1c-1.1 1.3-1.6 2.8-1.6 4.4 0 2 0.7 3.7 2.1 5 0 0 0 0 0 0v3.8c0 0.8 0.7 1.5 1.5 1.5h3.5c0.8 0 1.5-0.7 1.5-1.5v-1.5h19.6v1.5c0 0.8 0.7 1.5 1.5 1.5h3.5c0.8 0 1.5-0.7 1.5-1.5v-3.7c1.4-1.3 2.1-3.1 2.1-4.9 0-1.6-0.5-3.3-1.7-4.6h1.2c0.5 0 0.9-0.3 1-0.8l0.6-2.7C39.1 14.8 39 14.5 38.8 14.3zM10 10.6c3.8-2.5 15.2-2.5 19.1 0 0.7 0.5 1.7 2.5 2.6 4.9H7.4C8.3 13 9.3 11.1 10 10.6zM5.5 23.4c0-1.6 1.3-2.9 3-2.9 1.6 0 3 1.3 3 3s-1.3 3-3 3C6.8 26.4 5.5 25 5.5 23.4zM30.6 26.4c-1.6 0-3-1.3-3-3s1.3-2.9 3-2.9c1.6 0 3 1.3 3 3S32.3 26.4 30.6 26.4z"></path></svg>$Proximity</p><% end_if %>
			<% if $Proximity_Bus %><p><svg xmlns="http://www.w3.org/2000/svg" width="39" height="39" viewBox="0 0 401.3 401.3"><path d="M374.9 79.6h-15.1V52.7C359.8 23.6 336.2 0 307.1 0H94.2C65.1 0 41.5 23.6 41.5 52.7v26.8H26.4c-6.1 0-11 4.9-11 11v60.8c0 6.1 4.9 11 11 11h15.1v131.1c-5.9 5.3-9.6 12.9-9.6 21.4v20.3c0 15.9 12.9 28.8 28.8 28.8h3.6v28.9c0 4.7 3.8 8.5 8.5 8.5h38.9c4.7 0 8.5-3.8 8.5-8.5v-28.9h161.1v28.9c0 4.7 3.8 8.5 8.5 8.5h38.9c4.7 0 8.5-3.8 8.5-8.5v-28.9h3.6c15.9 0 28.8-12.9 28.8-28.8v-20.3c0-8.5-3.7-16.2-9.6-21.4V162.3h15.1c6.1 0 11-4.9 11-11V90.5C385.9 84.5 380.9 79.6 374.9 79.6zM327.2 83.9v129.7H215V83.9H327.2zM144.7 27.5h111.8c7.8 0 14.1 6.3 14.1 14.1 0 7.8-6.3 14.1-14.1 14.1H144.7c-7.8 0-14.1-6.3-14.1-14.1C130.7 33.8 137 27.5 144.7 27.5zM74.1 83.9h112.2v129.7H74.1V83.9zM124.3 271.5c0 7.6-6.2 13.9-13.9 13.9H87.6c-7.6 0-13.8-6.2-13.8-13.9v-15.4c0-7.6 6.2-13.9 13.8-13.9h22.9c7.6 0 13.9 6.2 13.9 13.9V271.5zM277 271.5v-15.4c0-7.6 6.2-13.9 13.9-13.9h22.9c7.6 0 13.8 6.2 13.8 13.9v15.4c0 7.6-6.2 13.9-13.8 13.9h-22.9C283.2 285.3 277 279.1 277 271.5z"/></svg> $Proximity_Bus</p><% end_if %>
			<% if $Proximity_Rail %><p><svg xmlns="http://www.w3.org/2000/svg" width="39" height="39" viewBox="0 0 39.1 39.1"><path d="M38.8 14.3c-0.2-0.2-0.5-0.4-0.8-0.4h-3.8c-0.9-2.5-2.2-4.9-3.5-5.8 -4.8-3.2-17.5-3.2-22.4 0 -1.4 0.9-2.6 3.3-3.5 5.8H1c-0.3 0-0.6 0.1-0.8 0.4 -0.2 0.2-0.3 0.5-0.2 0.8l0.6 2.7c0.1 0.5 0.5 0.8 1 0.8h1.1c-1.1 1.3-1.6 2.8-1.6 4.4 0 2 0.7 3.7 2.1 5 0 0 0 0 0 0v3.8c0 0.8 0.7 1.5 1.5 1.5h3.5c0.8 0 1.5-0.7 1.5-1.5v-1.5h19.6v1.5c0 0.8 0.7 1.5 1.5 1.5h3.5c0.8 0 1.5-0.7 1.5-1.5v-3.7c1.4-1.3 2.1-3.1 2.1-4.9 0-1.6-0.5-3.3-1.7-4.6h1.2c0.5 0 0.9-0.3 1-0.8l0.6-2.7C39.1 14.8 39 14.5 38.8 14.3zM10 10.6c3.8-2.5 15.2-2.5 19.1 0 0.7 0.5 1.7 2.5 2.6 4.9H7.4C8.3 13 9.3 11.1 10 10.6zM5.5 23.4c0-1.6 1.3-2.9 3-2.9 1.6 0 3 1.3 3 3s-1.3 3-3 3C6.8 26.4 5.5 25 5.5 23.4zM30.6 26.4c-1.6 0-3-1.3-3-3s1.3-2.9 3-2.9c1.6 0 3 1.3 3 3S32.3 26.4 30.6 26.4z"/></svg> $Proximity_Rail</p><% end_if %>
			</div>
			<% if $Latitude %>
			<div class="itinerary-day-map">
				<div class="itinerary_stop_map" data-zoom="13">
					<div class="map_day"></div>
					<div class="marker" data-lat="$Latitude" data-lng="$Longtitude">
						<div class="title"><b>$Title</b></div>
						<div class="address"><a href="#itin_$Pos">Read More</a></div>
					</div>
				</div>
			</div>
			<% end_if %>
		</div>
		
			<% if ApiProduct %>
			<div class="product_listing">
				<div class="day-product-carousel pad-top-40 pad-bot-40">
					<div class="articles clearfix tight ">
						<div class="swiper-container swiper-container-$Pos">
							<div class="swiper-wrapper">
								<% loop ApiProduct %>
									<% include ApiProductListCarousel %>
								<% end_loop %>
							</div>
							<!-- Add Arrows -->
							<div class="swiper-grid">
								<div class="swiper-pagination"></div>
								<div class="swiper-button-prev"></div>
								<div class="swiper-button-next"></div>
							</div>
							<%-- <div class="swiper-pagination"></div> --%>
						</div>
					</div>
				</div>
			</div>

				<!-- Initialize Swiper -->
				<script>
				$(document).ready(function() {
					var swiper = new Swiper('.swiper-container-$Pos', {
						//slidesPerView: 'auto',
						slidesPerView: '7',
						spaceBetween: 10,
						 freeMode: true,
						 loop: false,
						pagination: {
						el: '.swiper-pagination',
						clickable: true,
					},
					navigation: {
						nextEl: '.swiper-button-next',
						prevEl: '.swiper-button-prev',
					},
					});
					
				});
				</script>

				<% end_if %>
				</div>
		</div>
<% end_loop %> 

<div class="inner inner-default   clearfix">
	<div class="grid">
		<div class="col _inner textwrap col-align-top">
			$PromoSlider
		</div>
	</div>
</div>

<style>
.swiper-pagination {
	opacity: 0;
}
</style>

<div id="attraction-map pad-top-60" class="clearfix">
<%-- <ul class="attraction-nav">
 	<li><a id="hide_attractions" class="icon-map active" href="#">Itinerary Map</a></li>
 	<li><a id="show_attractions" class="icon-flag" href="#">Feature Highlights</a></li>
</ul> --%>
<div class="map-wrapper">
<div id="map-canvas"></div>
</div>
</div>



<%-- 
(function($) {
	console.log("setup map");
	var customPoints = [];
<% loop $ItineraryDays %>
	customPoints.push({desc:"$Mapinfo", lng: "$Longtitude",locationtype: "other",loctitle: "$DayNum",lt: "$Latitude",website: "jkhkhv"});
<% end_loop %> 
			
			
				console.log(customPoints);
				var map;
				var showToggle = document.getElementById("show_attractions");
				var hideToggle = document.getElementById("hide_attractions");
				function initialize() {
					var styles = [ {
						elementType: "all",
						stylers: [ {
							saturation: "-25"
						} ]
					} ];
					var styledMap = new google.maps.StyledMapType(styles, {
						name: "Styled Map"
					});
					var latlng = new google.maps.LatLng(-36.85293, 174.7611319);
					var mapOptions = {
						zoom: 10,
						scrollwheel: false,
						center: latlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP,
						disableDefaultUI: true
					};
					map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
					map.mapTypes.set("map_style", styledMap);
					map.setMapTypeId("map_style");
				
					var genMarker = new google.maps.Marker({
						position: latlng,
						map: map,
						visible: true,
						icon: new google.maps.MarkerImage("{$BaseHref}library/images/map/map-pin.png", null, null, null, new google.maps.Size(30,45))
					});
				
				
					var positions = [];
					var icons = [];
					var markers = [];
				
					for (var i = 0; i < customPoints.length; i++) {
				
						positions[i] = new google.maps.LatLng(parseFloat(customPoints[i].lng), parseFloat(customPoints[i].lt));
						console.log(customPoints[i]);
					
						//icons[i] = new google.maps.MarkerImage("{$BaseHref}library/images/map/" + customPoints[i].locationtype + "-pin.png", null, null, null, new google.maps.Size(30, 30));
					icons[i] =  new google.maps.MarkerImage("{$BaseHref}library/images/map/map-pin.png", null, null, null, new google.maps.Size(30,45));

						markers[i] = new google.maps.Marker({
							position: positions[i],
							map: map,
							clickable: true,
							visible: true,
							icon: icons[i],
							html: "<div class='info-window'><h3>" + customPoints[i].loctitle + "</h3>" + (customPoints[i].desc !== null ? '<div class="address">' + customPoints[i].desc + "</span>" : "") + (customPoints[i].website !== null ? '<a class"website" href="' + customPoints[i].website + '" target="_blank">View Website</a>' : "") + "</div>"
						});
					}
					var infowindow = new google.maps.InfoWindow({
						content: "holding..."
					});
					for (i = 0; i < markers.length; i++) {
						google.maps.event.addListener(markers[i], "click", function() {
							infowindow.setContent(this.html);
							infowindow.open(map, this);
						});
					}
				
					google.maps.event.addDomListener(showToggle, "click", function(event) {
						event.preventDefault();
										

						this.className = "icon-flag active";
						hideToggle.className = "icon-map";
					
						for (i = 0; i < markers.length; i++) {
							console.log("markers: " + markers[i]);
						
							(function (i) {
								setTimeout(function () {
									markers[i].setVisible(true);
									markers[i].setAnimation(google.maps.Animation.DROP);
								}, 10 * i);
							})(i);
						}
						return false;
					});
					google.maps.event.addDomListener(hideToggle, "click", function(event) {
						event.preventDefault();
						this.className = "icon-map active";
						showToggle.className = "icon-flag";
						for (i = 0; i < markers.length; i++) {
							markers[i].setVisible(false);
							markers[i].setVisible(false);
						}
						return false;
					});
				}
				google.maps.event.addDomListener(window, "resize", function() {
					var center = map.getCenter();
					google.maps.event.trigger(map, "resize");
					map.setCenter(center);
				});
				google.maps.event.addDomListener(document.getElementById("zoom_plus"), "click", function() {
					var zoom = map.getZoom();
					map.setZoom(zoom + 1);
					return false;
				});
				google.maps.event.addDomListener(document.getElementById("zoom_minus"), "click", function() {
					var zoom = map.getZoom();
					map.setZoom(zoom - 1);
					return false;
				});
				google.maps.event.addDomListener(window, "load", initialize);
	})(jQuery);

--%>
