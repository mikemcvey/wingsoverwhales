<div id="Content" class="searchResults pad-bot-60">

    <div class="search">$SearchForm</div>

    <% if $Query %>
        <p class="searchQuery">You searched for &quot;{$Query}&quot;</p>
    <% end_if %>

    <% if $Results %>
        <ul id="SearchResults">
            <% loop $Results %>
            <li>
                <h4>
                    <a href="$Link">
                        <% if $MenuTitle %>
                        $MenuTitle
                        <% else %>
                        $Title
                        <% end_if %>
                    </a>
                </h4>
                    <p>$Teaser</p>
                <a class="readMoreLink" href="$Link" title="Read more about &quot;{$Title}&quot;">&rarr; Read more about &quot;{$Title}&quot;...</a>
            </li>
            <% end_loop %>
        </ul>
    <% else %>
        <p>Sorry, your search query did not return any results.</p>
    <% end_if %>

    <!-- BEGIN PAGINATION -->
    <% if $Results.PageLength > 1 %>
        <div class="center  pad-bot-100">
            <ul class="pagination"><% loop $Results.PaginationSummary %><% if $Link %><li <% if $CurrentBool %>class="active"<% end_if %>><a href="$Link">$PageNum</a></li><% else %><li class="inactive">...</li><% end_if %><% end_loop %></ul>
        </div>
    <% end_if %>
</div>
