<div class="ss-occerrencefield-holder js-occurrence-dates-holder" id="$ID">
    <div class="ss-occerrencefield template-download js-occurrence-dates" data-name="$Name">
        <div class="ss-occerrencefield-wrapper">
            <div class="ss-occerrencefield-headers">
                Start Date<span class="required">*</span>
            </div>
            <div class="ss-occerrencefield-headers time">
                Start Time
            </div>
            <div class="ss-occerrencefield-headers">
                End Date<span class="required">*</span>
            </div>
            <div class="ss-occerrencefield-headers time">
                End Time
            </div>
            <div class="ss-occerrencefield-headers">
            </div>
        </div>

        <% if $Items %>
            <% loop $Items %>
                <div class="ss-occerrencefield-wrapper js-occurrence-row" data-id="$ID" data-name="$Up.Name">
                    <div class="ss-occerrencefield-item">
                        $StartDateField($Up.Name, $Status).SmallFieldHolder
                    </div>
                    <div class="ss-occerrencefield-item time">
                        $StartTimeField($Up.Name, $Status).SmallFieldHolder
                    </div>
                    <div class="ss-occerrencefield-item">
                        $EndDateField($Up.Name, $Status).SmallFieldHolder
                    </div>
                    <div class="ss-occerrencefield-item time">
                        $EndTimeField($Up.Name, $Status).SmallFieldHolder
                    </div>
                    <div class="ss-occerrencefield-item buttons">
                        <% if $Up.IsMultipleOccurrencesAllowed %>
                            <button class="btn btn-primary font-icon-plus ss-occerrencefield-add ss-occerrence-button js-occurrence-add add">Add another date</button>
                            <button class="btn btn-danger font-icon-trash ss-occerrencefield-remove ss-occerrence-button js-occurrence-remove delete js-can-delete">Remove</button>
                        <% end_if %>
                    </div>
                </div>
            <% end_loop %>
        <% else %>
            <div class="ss-occerrencefield-wrapper js-occurrence-row" data-name="$Name">
                <div class="ss-occerrencefield-item">
                    $StartDateField.SmallFieldHolder
                </div>
                <div class="ss-occerrencefield-item time">
                    $StartTimeField.SmallFieldHolder
                </div>
                <div class="ss-occerrencefield-item">
                    $EndDateField.SmallFieldHolder
                </div>
                <div class="ss-occerrencefield-item time">
                    $EndTimeField.SmallFieldHolder
                </div>
                <div class="ss-occerrencefield-item buttons">
                    <button class="btn btn-primary font-icon-plus ss-occerrencefield-add ss-occerrence-button js-occurrence-add add">Add another date</button>
                    <button class="btn btn-danger font-icon-trash ss-occerrencefield-remove ss-occerrence-button js-occurrence-remove delete">Remove</button>
                </div>
            </div>
        <% end_if %>

        <% if $ItemsToBeDeleted %>
            <% loop $ItemsToBeDeleted %>
                $Me
            <% end_loop %>
        <% end_if %>

    </div>

    <% if $IsMultipleOccurrencesAllowed %>
        <div class="ss-occerrencefield-buttons">
            <button class="btn btn-primary font-icon-plus ss-occerrencefield-next-day ss-occerrence-button js-occurrence-next-day add">Next Day</button>
            <button class="btn btn-primary font-icon-plus ss-occerrencefield-next-week ss-occerrence-button js-occurrence-next-week add">Next Week</button>
            <button class="btn btn-primary font-icon-plus ss-occerrencefield-next-month ss-occerrence-button js-occurrence-next-month add">Next Month</button>
        </div>
    <% end_if %>
</div>