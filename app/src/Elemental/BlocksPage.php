<?php

use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Dev\Debug;
use SilverStripe\Dev\Backtrace;

class BlocksPage extends Page
{
    private static $table_name = 'BlocksPage';

    private static $description = 'A modular page composed of content blocks';
    private static $icon_class = 'font-icon-p-alt';

    function MyCustomValue() {

        return "Hi, this is my site";
    
    
    }
    


    
}
