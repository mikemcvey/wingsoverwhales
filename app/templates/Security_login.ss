<!DOCTYPE html>
<html lang="$ContentLocale">
    <head>
        <meta name="viewport" content="width=device-width,initial-scale=1.0" />
        <meta name="color-scheme" content="light" />
        <% if $SiteConfig.Title %>
            <title>$SiteConfig.Title: <%t SilverStripe\LoginForms.LOGIN "Log in" %></title>
            $Metatags(false).RAW
        <% else %>
            $Metatags.RAW
        <% end_if %>

       	<%-- favicons --%>
            <link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
            <link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
            <link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
            <link rel="manifest" crossorigin="use-credentials" href="/site.webmanifest">
            <link rel="mask-icon" href="/safari-pinned-tab.svg" color="#ed2f3c">
            <meta name="msapplication-TileColor" content="#1c0f33">
            <meta name="theme-color" content="#1c0f33">
        <%-- end favicons --%>


        <% require css("silverstripe/admin: client/dist/styles/bundle.css") %>
        <% require css("silverstripe/login-forms: client/dist/styles/bundle.css") %>
        <% require javascript("silverstripe/login-forms: client/dist/js/bundle.js") %>
    </head>
    <body class="LoginApp" >
        <% include AppHeader %>
        <main class="login-form">
            <% if $Message %>
                <p class="login-form__message
                    <% if $MessageType && not $AlertType %>login-form__message--$MessageType<% end_if %>
                    <% if $AlertType %>login-form__message--$AlertType<% end_if %>"
                >
                    $Message
                </p>
            <% end_if %>

            <% if $Content && $Content != $Message %>
                <div class="login-form__content">$Content</div>
            <% end_if %>

            $Form
        </main>
    </body>
</html>
