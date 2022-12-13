<?php 

namespace Maverick\ElementContent;

use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\DropdownField;

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\TextareaField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;

//Dynamic\Elements\Promos\Elements
use UncleCheese\DisplayLogic\Wrapper;

class ElementPromosExtension extends DataExtension
{

    private static $db = [
      //  'LayoutType' => 'Enum("Grid,Carousel","Grid")',
       // 'ColorTheme' => 'Enum("Default,theme-1,theme-2,theme-3,theme-4","Default")',
       // 'number_columns' => 'Enum("1,2,3,4","1")',
      //'Content' => 'HTMLText',
       // 'ColumnThree' => 'HTMLText',
       // 'ColumnFour' => 'HTMLText'
    ];
    private static $has_one = [
        //'FeaturedImage' => Image::class
     ];
     

     private static $inline_editable = false;
 
     private static $owns = [
        // 'FeaturedImage',
     ];
 

    public function updateCMSFields(FieldList $fields)
    {   
       
      $fields->removeByName(array(
         'number_columns'
     ));

     return $fields;

    }
    
}