<% if $SiteConfig.PopupActive %>
	<% if $SiteConfig.PopupOnlyOnHomepage && $URLSegment != 'home' %>
	<% else %>
		<div class="popupModal" data-id="newsletter" style="">
		<div class="popUpClose abs"></div>
 		<div class="popup-inner">
 			<div class="popup-content-wrapper clearfix">
 				<a href="#" class="close button-x popUpClose"><svg width="14px" height="14px" viewBox="0 0 14 14" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
 						<g id="Material-Design-Stickersheet" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
 							<g id="components" transform="translate(-2194.000000, -216.000000)" fill="#FFFFFF">
 								<g id="buttons" transform="translate(2065.000000, 98.000000)">
 									<g id="fabs-light" transform="translate(0.000000, 41.000000)">
 										<g id="fab" transform="translate(108.000000, 56.000000)">
 											<g id="Material/Icons-white/add" transform="translate(16.000000, 16.000000)">
 												<polygon id="Shape" points="19 11 13 11 13 5 11 5 11 11 5 11 5 13 11 13 11 19 13 19 13 13 19 13"></polygon>
 											</g>
 										</g>
 									</g>
 								</g>
 							</g>
 						</g>
 					</svg></a>
 				<div class="popup-column grid grid-nogutter">
 					<div class="popup-content col col-align-middle clearfix">
 						<div class="modal-title">
 							<div class="popup-well">
 								<div class="popup-wrapper">
									<% if $SiteConfig.PopupLinkURL %><a href="$SiteConfig.PopupLinkURL"><% end_if %>
									$SiteConfig.PopupImage.ScaleWidth(900)
									<% if $SiteConfig.PopupLinkURL %></a><% end_if %>
								</div>
 								<div class="popup-content" style="padding:.5em .5em 0;">
									$SiteConfig.PopupMessage
 									<%-- <p style="text-align: center;"><strong>**Summer special - normally $995pp now $775pp min of 2** </strong></p>
 									<p style="text-align: center;"><a id="popup-btn" class="button green" href="$SiteConfig.PopupLinkURL">Find out More</a></p> --%>
 								</div>
 							</div>

 						</div>
 					</div>
 				</div>
				<p style="text-align: center; color:#fff;" class="small"><input id="accept-check"  style="display: inline;" type="checkbox" /> Don't show again</p>
 			</div>
 		</div>
 	</div>
	<% end_if %>
<% end_if %>
 	<script>
 		function createCookiePopup(name, value, days) {
 			var expires = "";
 			// var minutes = 30;
 			if (days) {
 				var date = new Date();
 				// date.setTime(date.getTime() + (minutes * 60 * 1000));
 				date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
 				expires = "; expires=" + date.toUTCString();
 			}
 			document.cookie = name + "=" + value + expires + "; path=/";
 		}

 		function readCookiePopup(name) {
 			var nameEQ = name + "=";
 			var ca = document.cookie.split(';');
 			for (var i = 0; i < ca.length; i++) {
 				var c = ca[i];
 				while (c.charAt(0) == ' ') c = c.substring(1, c.length);
 				if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
 			}
 			return null;
 		}

 		function eraseCookiePopup(name) {
 			createCookie(name, "", -1);
 		}

 		jQuery(document).ready(function($) {
 			//console.log('fire modal');
 			setTimeout(function() {
 				// console.log('setTimeout closed_{$SiteConfig.PopupCookieName}_modal');
 				if (readCookiePopup('closed_{$SiteConfig.PopupCookieName}_modal') == null) {
					//console.log('modal blocked');
					if (readCookiePopup('pause_{$SiteConfig.PopupCookieName}_modal') == null) {
 					//console.log('now modal');
 					$('.popupModal').fadeIn();
 					$('html').addClass('popup-open-covid');
					}
 				}

 			}, 1000);


 			$('#popup-btn, .popUpClose').click(function(event) {
 				event.preventDefault();

 				console.log($('#accept-check').is(':checked'));
 				if ($('#accept-check').is(':checked')) {
 					createCookiePopup("closed_{$SiteConfig.PopupCookieName}_modal", "true", 365, "/", "");
 				} else {
					createCookiePopup("pause_{$SiteConfig.PopupCookieName}_modal", "true", <% if $SiteConfig.PopupCookieLength %>{$SiteConfig.PopupCookieLength}<% else %>.5<% end_if %>, "/", "");
 				}
 				$('.popupModal').fadeOut();
 				$('html').removeClass('popup-open-covid');
 			});

 		});
 	</script>
 <?php } ?>