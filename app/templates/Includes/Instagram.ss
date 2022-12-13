<!-- INSTAGRAM -->
<section class=" instagram-section">
<h4><a class="blue" href="$SiteConfig.Instagram">Follow Us</a></h4>
        <ul id="gallery-instagram" class="gallery gallery-shortcode  clearfix">
          <% loop $Instagram %>
          <li>
            <a href="$permalink" class="link-overlay"
              target="_blank">
              <span class="insta-media-type">
              
             <% if $media_type = "IMAGE" %>
              <% else_if $media_type = "VIDE0" %>
                <svg class="fa-play " aria-hidden="true" aria-label="Clone" data-fa-proƒcessed="" data-prefix="far" data-icon="clone" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 -256 1792 1792" >
                  <g transform="matrix(1,0,0,-1,227.79661,1308.2034)" id="g3003">
                    <path fill="#ffffff" d="M 1384,609 56,-129 Q 33,-142 16.5,-132 0,-122 0,-96 v 1472 q 0,26 16.5,36 16.5,10 39.5,-3 L 1384,671 q 23,-13 23,-31 0,-18 -23,-31 z" id="path3005" inkscape:connector-curvature="0" style="fill:currentColor"/>
                  </g>            </svg>
                <% else_if $media_type = "CAROUSEL_ALBUM" %>
                  <svg class="fa-clone " aria-hidden="true" aria-label="Clone" data-fa-proƒcessed="" data-prefix="far" data-icon="clone" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
	                <path fill="#ffffff" d="M464 0H144c-26.51 0-48 21.49-48 48v48H48c-26.51 0-48 21.49-48 48v320c0 26.51 21.49 48 48 48h320c26.51 0 48-21.49 48-48v-48h48c26.51 0 48-21.49 48-48V48c0-26.51-21.49-48-48-48zM362 464H54a6 6 0 0 1-6-6V150a6 6 0 0 1 6-6h42v224c0 26.51 21.49 48 48 48h224v42a6 6 0 0 1-6 6zm96-96H150a6 6 0 0 1-6-6V54a6 6 0 0 1 6-6h308a6 6 0 0 1 6 6v308a6 6 0 0 1-6 6z"></path>
	            </svg>

                  <% end_if %>
                </span>  
                <span class="insta-social-icon">
                  <svg alt="Instagram Logo"  preserveAspectRatio="xMinYMin meet" >
                  <use xlink:href="#instagram-logo" ></use>
                </svg>
        </span>
              
                  
              <img src="data:image/gif;base64,R0lGODlhAQABAAAAACwAAAAAAQABAAA=" data-src="{$thumbnail}" lazy class="cover instagram" alt="Instagram - Post $Pos of $Count @{$username} " />

            </a> 
          </li>
          <% end_loop %>
      </ul>
</section>
<script>
  jQuery(window).on("load", function () {
    jQuery("img.instagram").each(function (index, element) {
      var element = jQuery(element);
      var imageUrl = element.attr("data-src");

      //Do your checks here to change the image-url to a smaller one when required

      element.attr("src", imageUrl);
   });   
});
</script>