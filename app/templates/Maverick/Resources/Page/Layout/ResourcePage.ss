<% if ResourceHeading || ResourceSummary %>
<div class="layer layout-content clearfix no-bg-image  text-default  pad-top-default pad-bot-0 text-on-default bg-pattern-default bg-gradient-default   ">
  <div class="bg-image  background-image"></div>
  <div class="inner inner-narrow   clearfix">
    <div class="grid ">
      <div class="col _inner textwrap col-align-top">
        <% if ResourceHeading %>
        <h3 class="text-center pad-top-100">
            $ResourceHeading
        </h3>
        <% end_if %>
        <% if ResourceSummary %>
        <p class="text-center">
            $ResourceSummary
        </p>
        <% end_if %>
      </div>
    </div>
  </div>
</div>
<% end_if %>

<script type="text/javascript">
    window.Filters = $Setting.RAW
</script>
<div class="inner inner-default grid clearfix">
    <div class="col">
        <div id="listing-page-resources"></div>
    </div>
</div>
$ElementalArea