
 <%-- cached $CacheID, $CacheLength --%>           
    <% if $Results %>
        <% loop $Results %>
        <div class='eventfinda_tile grid'>
              <%-- 
              'dateStart' => $dateStart.Nice()
              'dateEnd' => $dateEnd.Nice()
              "is_free"=> $is_free ,
              "is_featured"=> $is_featured ,
              "category" => $category->name, --%>
                <% if $image %>
                <div class="col nop col-md" >
                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="$image" class="b-lazy" />
                    <a target="_blank" class="venobox"  class="link-overlay" href="$image" title="Find out more about $title"></a>
                    </div>
                <% end_if %>
                <div class="col col-md"><h3><strong><a class="venobox" data-vbtype="iframe"  href="$link" title="Find out more about $title">$title</a></strong></h3>
                <p>
                <% if $date %>
                    <strong> $date</strong> 
                <% end_if %>
                </p>
                <div class="description"><p>$desc</p></div>
            </div>
            </div>
        <% end_loop %>
    <% end_if %>
<%-- end_cached --%>

