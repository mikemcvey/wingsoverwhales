
            <% if $FaqQuestions %>
                <div id="accordion-{$Top.ID}" class="accordion accordian-element" role="tablist">
                    <% loop $FaqQuestions %>
                        <div class="question">
                          <h4 class="title js-toggle" data-container="toggle-{$ID}" data-burger="burger-{$ID}">
                          <div class="hamburger hamburger--collapse" id="burger-{$ID}">
                              
                          </div> $Title</h4>
                          <div  class="toggle-container" id="toggle-{$ID}">
                              $Answer
                          </div>
                        </div>
                    <% end_loop %>
                </div>
            <% end_if %>
  

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