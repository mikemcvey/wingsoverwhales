<% with DisplayObject %>
<div class="event-container">
  <div class="event-container__item event-container__header">
    <h1 class="h2">
      $Title
    </h1>
    <p class="lead text-center">$Description <a href="$Url" target="_blank" class="event-container__button">Read More</a></p>
  </div>
  <div class="event-container__item event-container__content-2">
    <% if $Hero %>
      <ul class="lightSlider lsGrab lSSlide">
        <li width="1400" height="1050" data-thumb="$Hero" data-src="$Hero" data-sub-html="$Name" class="lslide active" style="width: 739.528px; margin-right: 0px;">
          <img src="$Hero" data-src="$Hero" class="b-lazy cover aos-init aos-animate  data-aos="fade-up" data-aos-anchor-placement="top-bottom" data-aos-delay="800"" style="object-position: $PercentageX% $PercentageY%" alt="$Name">
        </li>
      </ul>
    <% end_if %>
  </div>
  <div class="event-container__item event-container__content-3">
    <% if $Address %>
        <p><strong>Where:</strong> <span class="event-container__text">$Address</span></p>      
    <% end_if %>
    <% if $DateStart %><strong>When:</strong> <span class="event-container__text">$DateStart.Format("dd MMMM Y hh:mm a") - $DateEnd.Format("dd MMMM Y hh:mm a")</span><br/> <% end_if %>
  </div>
</div>
<% end_with %>

$ElementalArea
$Content
$Form