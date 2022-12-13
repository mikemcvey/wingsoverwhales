<?php 

namespace Maverick\BaseObject;

use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\Assets\File;

class BaseObjectExtension extends DataExtension
{
    private static $db = [
        'ImageIsALogo' => 'Boolean',
        
    ];
    private static $has_one = [
        'SVGIcon' =>  File::class
    ];
    private static $owns = [
        'SVGIcon'
    ];
    
    public function updateCMSFields(FieldList $fields)
    {
       
        $fields->removeByName('ImageIsALogo');
        $fields->addFieldToTab('Root.Main', new CheckboxField('ImageIsALogo','Image is a Logo'), 'Content');

        $fields->removeByName('SVGIcon');
        $uploader = UploadField::create('SVGIcon');
        $uploader->setFolderName('Uploads/Elements/Promos');
        $uploader->getValidator()->setAllowedExtensions(['png','gif','jpeg','jpg','svg']);
        $fields->addFieldToTab('Root.Main', $uploader, 'Content'); 

       // }
                
        return $fields;
    }
}
