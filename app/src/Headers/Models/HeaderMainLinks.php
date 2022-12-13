<?php

namespace Maverick\Headers\Models;

use Maverick\Utils\FormUtils;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use Sheadawson\Linkable\Models\Link;
use SilverStripe\Forms\ReadonlyField;
use Sheadawson\Linkable\Forms\LinkField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use Maverick\Headers\Models\HeaderSecondaryLinks;

/**
 * Defines the Headers
 *
 * @category Headers
 * 
 * @author   Jed Diaz
 * @since    30 June 2022
 */
class HeaderMainLinks extends DataObject 
{

    private static $table_name = 'HeaderMainLinks';

    private static $db = [
	      'Sort' => 'Int'
    ];

    private static $belongs_many_many = [
        'Headers' => Header::class,
    ];

    private static $has_one = array(
        'Link' => Link::class,
        'Image' => Image::class,
    );

    private static $owns = [
        "Image",
    ];

    private static $many_many = [
        "SecondaryLinks" => HeaderSecondaryLinks::class,
    ];

	  private static $summary_fields = array(
        'Link.Title' => 'Title'
    );

    private static $default_sort = 'Sort';

    public function getCMSFields()
    {

      $fields = parent::getCMSFields();

      $fields->removeByName(array('Sort', 'Headers'));
      $fields->replaceField('LinkID', LinkField::create('LinkID', 'Link'));
      $fields->addFieldToTab(
        'Root.Main',
        UploadField::create('Image')
      );

      if ($this->exists())
          $fields->addFieldToTab('Root.SecondaryLinks', FormUtils::make_grid_field_editor(
              'SecondaryLinks',
              'Secondary Links',
              $this->SecondaryLinks()->sort('Sort'),
              'Sort',
              'RecordEditor'
          ));

      return  $fields;
      
    }

    public function onAfterWrite()
    {
        // $link = $this->Link();
        // if (
        //     !$this->SecondaryLinks()->count()
        //     && $link->exists()
        //     && $link->Type == 'SiteTree'
        //     && ($pageID = $link->SiteTreeID)
        //     && ($page = \Page::get()->byID($pageID))
        // ) {
        //     $children = $page->Children();
        //     if ($children->count()) {
        //         foreach ($children as $child) {
        //             if ($child->ShowInMenus) {
        //                 $childLink = Link::create(array(
        //                     'Title' => $child->Title,
        //                     'Type' => 'SiteTree',
        //                     'SiteTreeID' => $child->ID
        //                 ));
        //                 $childLink->write();
        //                 $this->SecondaryLinks()->add($childLink->ID);
        //             }
        //         }
        //     }
        // }
        parent::onAfterWrite();
    }

}