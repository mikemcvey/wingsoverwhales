<?php

namespace Maverick\Footer\Models;

use SilverStripe\ORM\DataObject;
use Sheadawson\Linkable\Models\Link;
use Sheadawson\Linkable\Forms\LinkField;

/**
 * Defines Footer Link Group
 *
 * @category Footer
 * 
 * @author Jed Diaz
 */
class FooterLinkGroup extends DataObject
{

    private static $table_name = 'FooterLinkGroup';

    private static $db = array(
        'Sort' => 'Int'
    );

    private static $has_one = array(
        'Link' => Link::class
    );

    private static $summary_fields = array(
        'Link.Title' => 'Title'
    );

    private static $default_sort = 'Sort';

    public function getFooterTitle()
    {
        $link = $this->Link();
        return  $link->Title;
    }

    public function getFooterUrlSegment()
    {
        $link = $this->Link();
        return  $link->LinkURL;
    }

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
        $fields->removeByName(array('Sort'));
        $fields->replaceField('LinkID', LinkField::create('LinkID', 'Link'));

        return $fields;
    }

}