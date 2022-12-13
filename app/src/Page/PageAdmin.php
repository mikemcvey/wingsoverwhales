<?php

namespace Maverick\PageAdmin;

use SilverStripe\Admin\ModelAdmin;

use Page;
/**
 * Class PromosAdmin
 * @package Dynamic\Elements\Promos\Admin
 */
class PageAdmin extends ModelAdmin
{
    /**
     * @var array
     */
    private static $managed_models = [
        Page::class,
    ];

    /**
     * @var string
     */
    private static $url_segment = 'page-export';

    /**
     * @var string
     */
    private static $menu_title = 'Page Exports';
}
