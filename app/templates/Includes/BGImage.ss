<picture>
    <source media="(min-width: 1920px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(2048).Link" sizes="100vw">
    <source media="(min-width:1280px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(1920).Link" sizes="100vw">
    <source media="(min-width:900px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(1280).Link" sizes="100vw">
    <source media="(min-width: 600px)" srcset="$SiteConfig.CdnUrl$ScaleMaxWidth(900).Link" sizes="100vw">
    <source media="(max-width: 599px)" srcset="$SiteConfig.CdnUrl$FocusFill(500,900).Link" sizes="100vw">
    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw=="
        data-src="$ScaleWidth(1920).Link" class="block-hero-header b-lazy cover"
        style="object-position: $PercentageX% $PercentageY%"
        alt="<% if $Top.Title %>$Top.Title.ATT<% else %><% end_if %>" />
</picture>