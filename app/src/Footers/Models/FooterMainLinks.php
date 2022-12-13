<?php

namespace Maverick\Footers\Models;

use Maverick\Utils\FormUtils;
use SilverStripe\ORM\DataObject;
use Maverick\Footers\Models\Footer;
use Sheadawson\Linkable\Models\Link;
use Sheadawson\Linkable\Forms\LinkField;
use SilverStripe\AssetAdmin\Forms\UploadField;

/**
 * Defines the Footers
 *
 * @category Footers
 * 
 * @author   Jed Diaz
 * @since    30 June 2022
 */
class FooterMainLinks extends DataObject 
{

    private static $table_name = 'FooterMainLinks';

    private static $db = [
	      'Sort' => 'Int'
    ];

    private static $belongs_many_many = [
        'Footers' => Footer::class,
    ];

    private static $has_one = array(
        'Link' => Link::class,
    );

    private static $many_many = [
        "ChildLinks" => Link::class,
    ];

    private static $summary_fields = array(
        'Link.Title' => 'Title'
    );

    private static $many_many_extraFields = array(
        'ChildLinks' => array('Sort' => 'Int')
    );

    private static $default_sort = 'Sort';

    public function getCMSFields()
    {
      $fields = parent::getCMSFields();

      $fields->removeByName(array('Sort', 'Footers'));
      $fields->replaceField('LinkID', LinkField::create('LinkID', 'Link'));

      if ($this->exists())
            $fields->addFieldToTab('Root.ChildLinks', FormUtils::make_grid_field_editor(
                'ChildLinks',
                'Child Links',
                $this->ChildLinks()->sort('Sort'),
                'Sort',
                'RecordEditor'
            ));

      return  $fields;
    }

    public function onAfterWrite()
    {
        $link = $this->Link();
        if (
            !$this->ChildLinks()->count()
            && $link->exists()
            && $link->Type == 'SiteTree'
            && ($pageID = $link->SiteTreeID)
            && ($page = \Page::get()->byID($pageID))
        ) {
            $children = $page->Children();
            if ($children->count()) {
                foreach ($children as $child) {
                    if ($child->ShowInMenus) {
                        $childLink = Link::create(array(
                            'Title' => $child->Title,
                            'Type' => 'SiteTree',
                            'SiteTreeID' => $child->ID
                        ));
                        $childLink->write();
                        $this->ChildLinks()->add($childLink->ID);
                    }
                }
            }
        }
        parent::onAfterWrite();
    }

}