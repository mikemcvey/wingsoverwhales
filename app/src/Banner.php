<?php
namespace {
    use SilverStripe\ORM\DataObject;
    use SilverStripe\Forms\FieldList;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\AssetAdmin\Forms\UploadField;
    use SilverStripe\Assets\Image;
    use SilverStripe\Versioned\Versioned;


    class Banner extends DataObject {
      private static $table_name = 'Banner';
     
      private static $db = [
        'SortID'=>'Int',
        'SlideTxt'=>'HTMLText',
        'VideoLinks' => 'HTMLText',
        'VideoLinkSmall' => 'Text',
        'VideoLinkMedium' => 'Text',
        'VideoLinkLarge' => 'Text',
      ];
      
      private static $has_one = array (
        'Page' => Page::class,
        'HeroImage' => Image::class,
      );
      private static $owns = [
        'HeroImage'
      ];

      
      private static $default_sort='SortID';
      
    // this function creates the thumbnail for the summary fields to use
      public function ImageThumbnail() { 

        return $this->HeroImage()->CMSThumbnail();
      }
      // Summary fields
      private static $summary_fields = array(
        'ImageThumbnail' => "image",
        'SlideTxt.Summary'=>'SlideTxt'
      );
    

      public function getCMSFields() {
        $fields = parent::getCMSFields();
        $fields = FieldList::create(
            $uploader = UploadField::create('HeroImage'),
            HTMLEditorField::create('SlideTxt'),
            //TextareaField::create('VideoLinks')->setRows(5),
            TextField::create('VideoLinkSmall', 'Video URL Small')->setDescription('Maximum viewport width of 640 / MP4 Format.'),
            TextField::create('VideoLinkMedium', 'Video URL Medium')->setDescription('Maximum viewport width of 960 / MP4 Format.'),
            TextField::create('VideoLinkLarge', 'Video URL Large')->setDescription('Minimum viewport width of 961 / MP4 Format.'),
        );

        $uploader->setFolderName('Uploads');
        $uploader->getValidator()->setAllowedExtensions(['png','gif','jpeg','jpg']);
        
        return $fields;
      }
      
      public function getThumbnail() { 
        return $this->HeroImage()->CMSThumbnail();
      }
    
    }

}