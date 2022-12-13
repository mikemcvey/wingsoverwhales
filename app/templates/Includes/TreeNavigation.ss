<nav class="offcanvas" style="transform: translateX(100%);">
	<a class="desktop" href="$BaseHref" style="background:none;">
		<svg class="header-logo" alt="$SiteConfig.Title"  preserveAspectRatio="xMinYMin meet" >
            <use xlink:href="#logo" ></use>
        </svg>
	</a>
    <ul class="tree">
        <% loop $Menu(1) %>
        <% include TreeMenuItem %>
        <% end_loop %>
    </ul>
</nav>
