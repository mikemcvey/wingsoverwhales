<div class="grid pad-bot-100">
  <div class="inner col ">
    
    <% if CurrentMember %>
    <% uncached %>

     <p><a class="button" href="/{$Link}logout">Log out</a></p>
     <h2><strong>Operator Dashboard</strong></h2>
      <h4><strong>Listings</strong></h4>
  
<% if $SiteAdmin %>
<p>
<span class="badge badge-info--inverted">You are logged in as the Administrator</span>
</p>
<% end_if %>
      <% if $Products  %>
        <table class="dashboard-table">
          <tr>
            <th>Listing Name</th>
            <%-- <th>Status</th> --%>
            <th>Last Modified</th>
            <th>&nbsp;</th>
          </tr>
          <% loop $Products %>
            <tr>
              <td>$label</td>
               <%-- <td>$ReviewStatus</td> --%>
              <td>$LastEdited.Nice</td>
              <td><a class="button small" href="{$Top.Link}edit/$ID">Edit</a><%-- <a class="button small blue" href="{$Top.Link}preview/$ID" target="_blank">Preview</a> --%></td>
            </tr>
          <% end_loop %>
        </table>
      
      <% else %>
        <p>No products.</p>
      <% end_if %>      
     <% end_uncached %>
    <% else %>
    <h3 class="text-center" >TOURISM OPERATOR<span>&nbsp;</span><strong>LOGIN</strong></h3>
<p class="text-center"><span>Welcome to Tourism Bay of Plenty's operator portal. In this area you can update your company and product listing details. Don't have a listing on bayofplentynz.com?&nbsp;<a href="list-your-business">Click here</a>.&nbsp;</span></p>
      <%-- <a href="/Security/login?BackURL=/operator-admin">Login</a> --%>
      <% uncached %>
      $OperatorLoginForm
       <% end_uncached %>
    <% end_if %>
  </div>
</div>