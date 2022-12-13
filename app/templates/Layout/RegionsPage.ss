
				$ElementalArea
				$Content
				$Form
                
<% if Products-eat-drink %> 
 $Products-eat-drink
<% end_if %>
<% if GetProducts %>
    <div class="day-product-carousel layer grid inner-1170 pad-top-40 pad-bot-40">
            <div class="articles col clearfix tight ">
                <div class="swiper-container swiper-container-$GetProducts.Count">
                    <div class="swiper-wrapper">
            <% loop GetProducts %>
            <article class="swiper-slide product_listing <% if $Last %> last<% end_if %><% if $First %> first<% end_if %> link-$ElementLink.Template">
            <% if $Image %> 
            <div class="bg-image">
                <% with $Image %>
                <img  src="$ScaleWidth(1920).Link" data-src="$ScaleWidth(1920).Link" class="cover lazyload blur-up" style="object-position: $PercentageX% $PercentageY%" alt="<% if $Title %>$Title.ATT<% else %><% end_if %>">
                <% end_with %>   
                <% if $ourpick %> <div class="abs ourpick"><i class="icon icon-star"></i> Our Pick</div><% end_if %>
            </div>
                <% end_if %>
            <div class="tile-copy">
                <% if $category  %><p class="meta">$category</p><% end_if %>
                <% if $Title  %><h3><strong>$Title</strong></h3><% end_if %>
                <% if $Teaser %>
                <div class='feature__content typography'>$Teaser</div>
                <% end_if %>
            </div>
            
                <a href="$URL" class="link-overlay" title="Go to $Title"></a>
        
        </article>
            <% end_loop %>
                    </div>
                    <!-- Add Arrows -->
                    <div class="swiper-pagination"></div>
                    <div class="swiper-button-next"></div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-information">View all Mount Maunganui Experiences</div>
                </div>
            </div>
        </div>

        <!-- Initialize Swiper -->
    <script>
    $(document).ready(function() {
        var swiper = new Swiper('.swiper-container-$Products.Count', {
            slidesPerView: 'auto',
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
<%-- 
<!-- BEGIN CONTENT WRAPPER -->
<div class="content">
    <div class="container">
        <div class="row">

            <!-- BEGIN MAIN CONTENT -->
            <div class="main col-sm-8">
                <div class="grid-style1 clearfix">
                  <% loop $Regions %>
                      <div class="item col-md-12"><!-- Set width to 4 columns for grid view mode only -->
                          <div class="image image-large">
                              <a href="$Link">
                                  <span class="btn btn-default"><i class="fa fa-file-o"></i> Read More</span>
                              </a>
                            $Photo.Fit(720,255)
                          </div>
                          <div class="info-blog">
                              <h3>
                                  <a href="$Link">$Title</a>
                              </h3>
                              <p>$Description.FirstParagraph</p>
                          </div>
                      </div>
                  <% end_loop %>
                </div>
                <!-- BEGIN PAGINATION -->
                <div class="pagination">
                    <ul id="previous">
                        <li><a href="#"><i class="fa fa-chevron-left"></i></a></li>
                    </ul>
                    <ul>
                        <li class="active"><a href="#">1</a></li>
                        <li><a href="#">2</a></li>
                        <li><a href="#">3</a></li>
                        <li><a href="#">4</a></li>
                    </ul>
                    <ul id="next">
                        <li><a href="#"><i class="fa fa-chevron-right"></i></a></li>
                    </ul>
                </div>
                <!-- END PAGINATION -->

            </div>
            <!-- END MAIN CONTENT -->


            <!-- BEGIN SIDEBAR -->
            <div class="sidebar gray col-sm-4">


                <!-- BEGIN LATEST NEWS -->
                <h2 class="section-title">Popular articles</h2>
                <ul class="latest-news">
                    <li class="col-md-12">
                        <div class="image">
                            <a href="blog-detail.html"></a>
                            <img src="http://placehold.it/100x100" alt="" />
                        </div>

                        <ul class="top-info">
                            <li><i class="fa fa-calendar"></i> 30 July 2014</li>
                        </ul>

                        <h4><a href="#">It's all about the Northeast</a></h4>
                    </li>
                    <li class="col-md-12">
                        <div class="image">
                            <a href="blog-detail.html"></a>
                            <img src="http://placehold.it/100x100" alt="" />
                        </div>

                        <ul class="top-info">
                            <li><i class="fa fa-calendar"></i> 20 July 2014</li>
                        </ul>

                        <h4><a href="#">Southwest: Best ever</a></h4>
                    </li>
                    <li class="col-md-12">
                        <div class="image">
                            <a href="blog-detail.html"></a>
                            <img src="http://placehold.it/100x100" alt="" />
                        </div>

                        <ul class="top-info">
                            <li><i class="fa fa-calendar"></i> 10 July 2014</li>
                        </ul>

                        <h4><a href="#">I went to the Northwest and stole from and old lady</a></h4>
                    </li>

                </ul>
                <!-- END LATEST NEWS -->

            </div>
            <!-- END SIDEBAR -->

        </div>
    </div>
</div>
<!-- END CONTENT WRAPPER -->
--%>
