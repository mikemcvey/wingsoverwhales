
				$ElementalArea
				$Content
				$Form


<div id="attraction-map">
<ul class="attraction-nav">
 	<li><a id="hide_attractions" class="icon-map active" href="#">Itinerary Map</a></li>
 	<li><a id="show_attractions" class="icon-flag" href="#">Feature Highlights</a></li>
</ul>
<div class="map-wrapper">
<ul class="zoom">
 	<li id="zoom_plus">+</li>
 	<li id="zoom_minus">−</li>
</ul>
<div id="map-canvas"></div>
</div>
</div>
<%-- 



<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyB_jBkxn42jF3qCoKrHTtSPYzWQQou3ycw"></script>
<script>


console.log("setup map");	
	(function($) {
	 console.log("setup map");

   
	var dayPoints = [];
	var customPoints = [];
	<% loop $ItineraryDays %>
		<% if $Longtitude && $Latitude %>
		dayPoints.push({desc:"$Highlights", lng: "$Longtitude",locationtype: "other",loctitle: "$DayNum",lt: "$Latitude",website: "jkhkhv"});
		<% end_if %>
		<% loop Products %>
			console.log('$introtext $longitude && $latitude');
			<% if $longitude && $latitude %>
		
			customPoints.push({desc:"introtext", lt: "$longitude", locationtype: "$category",loctitle: "$company",lng: "$latitude",website: "$website"});
			<% end_if %>
		<% end_loop %> 
	<% end_loop %> 
				
			console.log(dayPoints);

				console.log(customPoints);

				var map;
				var showToggle = document.getElementById("show_attractions");
				var hideToggle = document.getElementById("hide_attractions");

					

				function initialize() {
					var styles = [ {
						elementType: "all",
						"stylers": [
							{
								"visibility": "simplified"
							},
							{
								"hue": "#f7f7ed"
							}
						]
					} ];
				var args = {
						zoom		: 19,
						center		: new google.maps.LatLng(0, 0),
						mapTypeId	: google.maps.MapTypeId.ROADMAP,
						styles : [
					{
						"featureType": "administrative.country",
						"elementType": "geometry",
						"stylers": [
							{
								"visibility": "simplified"
							},
							{
								"hue": "#f7f7ed"
							}
						]
					}
				]
						}; 
					var styledMap = new google.maps.StyledMapType(args, {
						name: "Styled Map"
					});
					var latlng = new google.maps.LatLng(-37.6358747,176.180028);
					var mapOptions = {
						zoom: 15,
						scrollwheel: false,
						center: latlng,
						mapTypeId: google.maps.MapTypeId.ROADMAP,
						disableDefaultUI: true
					};
					map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);
					var bounds = new google.maps.LatLngBounds();

					map.mapTypes.set("map_style", styledMap);
					map.setMapTypeId("map_style");

					
				
					var positions = [];
					var icons = [];
					var markers = [];
					
				
					for (var i = 0; i < customPoints.length; i++) {
				
						positions[i] = new google.maps.LatLng(parseFloat(customPoints[i].lng), parseFloat(customPoints[i].lt));

						console.log(customPoints[i]);
					
						icons[i] = new google.maps.MarkerImage("{$BaseHref}library/images/map/other-pin.png", null, null, null, new google.maps.Size(30, 30));
					
						markers[i] = new google.maps.Marker({
							position: positions[i],
							map: map,
							clickable: true,
							visible: false,
							icon: icons[i],
							html: "<div class='info-window'><h4>" + customPoints[i].loctitle + "</h4>" + (customPoints[i].desc !== null ? '<div class="address">' + customPoints[i].desc + "</span>" : "") + (customPoints[i].website !== null ? '<a class="website button" href="' + customPoints[i].website + '" target="_blank">View Website</a>' : "") + "</div>"
						});
						bounds.extend(markers[i].position);
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

var day_positions = [];
					var day_icons = [];
					var day_markers = [];
					for (var i = 0; i < dayPoints.length; i++) {
						console.log(dayPoints[i].lng + dayPoints[i].lt);
						day_positions[i] = new google.maps.LatLng(parseFloat(dayPoints[i].lng), parseFloat(dayPoints[i].lt));
						console.log(dayPoints[i]);
					
						day_icons[i] = new google.maps.MarkerImage("{$BaseHref}library/images/map/map-pin.png", null, null, null, new google.maps.Size(30, 45));
					
						day_markers[i] = new google.maps.Marker({
							position: day_positions[i],
							map: map,
							clickable: true,
							visible: true,
							icon: day_icons[i],
							html: "<div class='info-window'><h4>Day " + dayPoints[i].loctitle + "</h4>" + (dayPoints[i].desc !== null ? '<div class="address">' + dayPoints[i].desc + "</span>" : "") + (dayPoints[i].website !== null ? '<a class="website button" href="' + dayPoints[i].website + '" target="_blank">View Website</a>' : "") + "</div>",
							label: {color: '#FFF', fontSize: '20px', fontWeight: '900', fontFamily: "brandon-grotesque, sans-serif",
							text: dayPoints[i].loctitle }
						
						});
						bounds.extend(day_markers[i].position);

					}
					for (i = 0; i < day_markers.length; i++) {
						google.maps.event.addListener(day_markers[i], "click", function() {
							infowindow.setContent(this.html);
							infowindow.open(map, this);
						});
					}
					

					map.fitBounds(bounds);
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


</script>
-- %>