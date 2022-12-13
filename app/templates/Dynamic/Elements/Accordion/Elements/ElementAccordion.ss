
<div class="accordian-element layer text-on-left text-$text_width pad-top-$pad_top pad-bot-$pad_bot vheight-$vheight  $ExtraClass  bg-pattern-$BackgroundPattern <% if $BackgroundPattern != "default" %>bgpattern<% end_if %> text-on-$BackgroundColor <% if $Style %> $StyleVariant<% end_if %>">
    <% include ElementContentArea %>

   <div class="inner element-content inner-$inner_wrap grid clearfix">
       <div class="col">
            <% if $Panels %>
                <div id="accordion-{$ID}" class="accordion" role="tablist">
                    <% loop $Panels %>
                        <div>
                          <h4 class="title js-toggle" data-container="toggle-{$ID}" data-burger="burger-{$ID}">
                          <div class="hamburger hamburger--collapse" id="burger-{$ID}">
                              <div class="hamburger-box" >
                                  <div class="hamburger-inner"></div>
                              </div>
                          </div> $Title</h4>
                          <div  class="toggle-container" id="toggle-{$ID}">
                              <% if $Image %>
                                  <img src="$Image.URL" class="img-responsive" alt="$Title.ATT">
                              <% end_if %>
                              $Content
                              <% if $ElementLink %>$ElementLink<% end_if %>
                          </div>
                        </div>
                    <% end_loop %>
                </div>
            <% end_if %>
       </div>
   </div>
   <% include ElementContentAfter %>
</div>

<script>
    var linkToggle = document.querySelectorAll('.js-toggle');

for(i = 0; i < linkToggle.length; i++){

  linkToggle[i].addEventListener('click', function(event){

    event.preventDefault();


    var burger = document.getElementById(this.dataset.burger);
    var container = document.getElementById(this.dataset.container);

    if (!container.classList.contains('active')) {
      

        this.classList.add('active');
        burger.classList.add('is-active');

      container.classList.add('active');
      container.style.height = 'auto';

      var height = container.clientHeight + 'px';

      container.style.height = '0px';

      setTimeout(function () {
        container.style.height = height;
      }, 0);
      
    } else {
      
      container.style.height = '0px';
      this.classList.remove('active');
        burger.classList.remove('is-active');
      container.addEventListener('transitionend', function () {
        container.classList.remove('active');
        
      }, {
        once: true
      });
      
    }
    
  });

}
</script>