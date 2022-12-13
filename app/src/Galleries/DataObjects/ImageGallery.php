<?php
namespace Maverick\Gallery;
use  Maverick\Gallery\GalleryTag;
use  Maverick\Gallery\ImageGalleryImage;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\GridField\GridFieldSortableRows;
use Bummzack\SortableFile\Forms\SortableUploadField;
use SilverStripe\TagField\TagField;


class ImageGallery extends DataObject
{

    private static $table_name = 'ImageGallery';
    
    private static $db = [
        'Title' => 'Varchar(200)',
        'SortOrder' => 'Int'
    ];
  
    private static $many_many = array(
   
     'GalleryTags' => GalleryTag::class,
        'Images' => [
            'through' => ImageGalleryImage::class,
            'from' => 'ImageGallery',
            'to' => 'Image',
        ]

    );
    private static $owns = [
        'Images'
    ];
    private static $cascade_deletes = [
        'Images'
    ];

    private static $default_sort = 'SortOrder';


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
 
        $fields->removeByName(array(
            'SortOrder'
        ));
       
       
        $field = TagField::create(
            'GalleryTags',
            'Gallery Tags',
            GalleryTag::get(),
            $this->GalleryTags()
        )->setShouldLazyLoad(true)->setCanCreate(true);

        $fields->addFieldToTab(
            'Root.Main',
            $field,
            'Teaser'
        );
        $fields->addFieldToTab('Root.Main', SortableUploadField::create(
            'Images', 'Gallery Images'
        ), 'Teaser');
 
        return $fields;
    }
 
    public function getEditForm($id = null, $fields = null)
    {
        $form = parent::getEditForm($id, $fields);
        


        return $form;
    }
    public function getImages(){
        return $this->Images();
    }


   
}
