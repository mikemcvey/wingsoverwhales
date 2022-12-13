<?php

namespace Maverick\Blog;

use  Maverick\Blog\BlogPostGalleryImage;
use Bummzack\SortableFile\Forms\SortableUploadField;
use SilverStripe\Blog\Model\BlogPost;
use Maverick\Listings\Models\Tag;
use SilverStripe\Forms\FieldList;
use SilverStripe\ORM\DataExtension;
use SilverStripe\TagField\TagField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class BlogPostExtension extends DataExtension
{

  private static $db = [];

  private static $many_many = array(

    'Images' => [
      'through' => BlogPostGalleryImage::class,
      'from' => 'BlogPost',
      'to' => 'Image',
    ]

  );

  private static $owns = [
    'Images'
  ];
  private static $cascade_deletes = [
    'Images'
  ];


  public function updateCMSFields(FieldList $fields)
  {
    $fields->addFieldToTab(
      'Root.Main',
      HTMLEditorField::create('Content'),
      'ElementalArea'
    );
    $fields->insertAfter(SortableUploadField::create('Images', 'Gallery Images'), 'FeaturedImage');
    return $fields;
  }

  public function onAfterWrite()
  {

    parent::onAfterWrite();
  }
}
