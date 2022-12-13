<?php 

namespace Maverick\ElementContent;
use Page;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\Forms\HTMLEditor\HtmlEditorConfig;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DB;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\Forms\ToggleCompositeField;
use Kinglozzer\MultiSelectField\Forms\MultiSelectField;


class ElementContentExtension extends DataExtension
{

    private static $db = [
        'Title' => 'Varchar',
        'ContentLayoutType' => 'Enum("Default,Side-by-Side,Text-above-Image,Split-Content-Images","Default")',
        
    ];

    private static $has_one = [
        'FeaturedImage' => Image::class,
        'SplitImage1' => Image::class,
        'SplitImage2' => Image::class,
    ];
   

    private static $inline_editable = false;

    private static $owns = [
        'FeaturedImage',
    ];
     
  

    public function getCMSFields()
    {
        $fields = FieldList::create();

       

        return $fields;
    }
    
    public function updateCMSFields(FieldList $fields)
    {   

        
        

    $fields->removeByName(array('ContentLayoutType'));
       $LayoutType_input =  Dropdownfield::create('ContentLayoutType', 'Content Layout Variation', $this->owner->dbObject('ContentLayoutType')->enumValues());
       $fields->addFieldToTab('Root.Main', $LayoutType_input,'HTML');


        $FeaturedImage_input = UploadField::create('FeaturedImage');
        $fields->addFieldToTab('Root.Main', $FeaturedImage_input,'HTML');
        $FeaturedImage_input->displayIf("ContentLayoutType")->isEqualTo("Side-by-Side");
        $FeaturedImage_input->getValidator()->setAllowedExtensions(['png','gif','jpeg','jpg']);


        $SplitImage1_input = UploadField::create('SplitImage1');
        $fields->addFieldToTab('Root.Main', $SplitImage1_input,'HTML');
        $SplitImage1_input->displayIf("ContentLayoutType")->isEqualTo("Split-Content-Images");
        $SplitImage1_input->getValidator()->setAllowedExtensions(['png','gif','jpeg','jpg']);


        $SplitImage2_input = UploadField::create('SplitImage2');
        $fields->addFieldToTab('Root.Main', $SplitImage2_input,'HTML');
        $SplitImage2_input->displayIf("ContentLayoutType")->isEqualTo("Split-Content-Images");
        $SplitImage2_input->getValidator()->setAllowedExtensions(['png','gif','jpeg','jpg']);



    }
   
}