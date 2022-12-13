<p><strong>Hi<% if $Member.FirstName%> $Member.FirstName<% end_if %>,</strong></p>

<p>This is an automated email from Tourism Bay of Plenty.</p>
 
 
<p>Your account has been activated on bayofplentynz.com.<br/>
Please follow this link to <a href="$resetPassWordLink">set your password</a> (link expires in 24hrs) and manage your product listing/s.<br/>
If the supplied reset link has expired please use the <i>lost password</i> link on the <a href="$Link">Operator Login page</a>.</p>
 
 <p>Your product listing(s) are:<br/>
 <ol>
 <% loop $Products %>
    <li>$ProductName</li>
<% end_loop %>
</ol>
</p>
 <p>
 <br/>
Thanks from the team at <a href="https://www.bayofplentynz.com/">www.bayofplentynz.com</a>.
</p>
<p>
<img src='https://www.bayofplentynz.com/library/images/design/email_footer.png' width='600' height='100' alt="Tourism Bay of Plenty" />
</p>