<?php

namespace Maverick\Headers\Admin;

use SilverStripe\Admin\ModelAdmin;
use Maverick\Headers\Models\Header;

/**
 * Header Admin
 *
 * @category Headers
 *
 * @author Jed Diaz
 */
class HeaderAdmin extends ModelAdmin
{
    /**
     * @var array
     */
    private static $managed_models = [
      Header::class,
    ];

    private static $menu_icon_class = 'font-icon-link';

    /**
     * @var string
     */
    private static $url_segment = 'headers';

    /**
     * @var string
     */
    private static $menu_title = 'Headers';

    private static $default_listing_tab_class = 'Header';

    private static $allowed_actions = [];

}
