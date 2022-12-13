<?php

namespace Maverick\Footers\Admin;

use SilverStripe\Admin\ModelAdmin;
use Maverick\Footers\Models\Footer;

/**
 * Footer Admin
 *
 * @category Footers
 *
 * @author Jed Diaz
 */
class FooterAdmin extends ModelAdmin
{
    /**
     * @var array
     */
    private static $managed_models = [
      Footer::class,
    ];

    private static $menu_icon_class = 'font-icon-link';

    /**
     * @var string
     */
    private static $url_segment = 'footers';

    /**
     * @var string
     */
    private static $menu_title = 'Footers';

    private static $default_listing_tab_class = 'Footer';

    private static $allowed_actions = [];

}
