<?php 

namespace Maverick\SiteConfig;
use  SilverStripe\SiteConfig\SiteConfig;
use Maverick\Utils\FormUtils;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\ORM\DataObject;

use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Assets\Image;
use SilverStripe\Assets\File;
use SilverStripe\AssetAdmin\Forms\UploadField;


use Maverick\Footer\Models\FooterLinkGroup;

use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

class Affiliates extends DataObject {
    private static $table_name = 'Affiliates';

    private static $db = [
        'Link' => 'Text',
        'Sort' => 'Int'
    
    ];
    private static $has_one = [
      'Image' => Image::class,
      'SiteConfig' => SiteConfig::class,
    ];
    private static $default_sort = 'Sort';

    private static $summary_fields = array(
        'ImageThumbnail' => "Image",
        'Link'=>'Link'
      );
    


    
    

    public function getCMSFields() {
      $fields = new FieldList();
      $fields->push(new TextField('Link', 'Image Link'));
      $fields->push($brochure = new UploadField('Image', 'Upload an image'));
      $brochure->setFolderName('Affiliates');
      $brochure->getValidator()->setAllowedExtensions(['png','jpg','svg']);
      return $fields;
    }
    public function ImageThumbnail() { 
        return $this->Image()->Fit(150,150);//CMSThumbnail();
      }
    public function getThumbnail() { 
        return $this->Image()->CMSThumbnail();
      }
}