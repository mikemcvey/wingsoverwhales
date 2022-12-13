<?php

namespace Maverick\Styling;



use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\NumericField;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Forms\CheckboxField;

use SilverStripe\Forms\CompositeField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\View\ArrayData;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;

use UncleCheese\DisplayLogic\Wrapper;


class ElementFeatures_Extension extends DataExtension
{
    
    private static $db = array(
        'LayoutType' => 'Enum("Grid,Grid-Center,Carousel,Side-by-Side,Features,Staggered","Grid")',
        'TileLayout' => 'Enum("Default,Card","Default")',
     //   'content_after' => 'HTMLText',
        //'slidesPerView'=>'Enum("auto,thumbnails,1,2,3,4,5,6,7,8,9,10,11,12","thumbnails")',
        //'centeredSlides'=> 'Boolean',
    );

    private static $has_one = [
       // 'Image' => Image::class,
    ];
    
    private static $inline_editable = false;



    public function updateCMSFields(FieldList $fields)
    {
        //echo $this->owner.' '.$this->owner->dbObject('LayoutType').'   _type<br/>';
        
        
            $fields->removeByName('TileLayout');
            $fields->removeByName('number_columns');
            

        if($this->owner == 'Dynamic\Elements\Features\Elements\ElementFeatures' || 'Dynamic\Elements\Promos\Elements\ElementPromos'
        || 'Maverick\Products\ElementApiProducts' || 'Dynamic\Elements\Gallery\Elements\ElementPhotoGallery'){
          //  echo "HERE";
                
        
         // $groupTypeOptions = $this->owner->dbObject('LayoutType')->enumValues();

         $LayoutType_input =  Dropdownfield::create('LayoutType', 'Layout Variation', $this->owner->dbObject('LayoutType')->enumValues());
         $fields->addFieldToTab('Root.Main', $LayoutType_input,'Content');

         if($this->owner == 'Dynamic\Elements\Promos\Elements\ElementPromos'){
            $fields->removeByName('TileLayout');
            $LayoutType_input =  Dropdownfield::create('TileLayout', 'Tile Layout', $this->owner->dbObject('TileLayout')->enumValues());
            $LayoutType_input->displayIf("LayoutType")->isEqualTo("Grid")
                ->orIf("LayoutType")->isEqualTo("Grid-Center")
                    ->orIf("LayoutType")->isEqualTo("Carousel")->end();
            
            $fields->addFieldToTab('Root.Main', $LayoutType_input,'Content');

        }
    
  
            $fields->removeByName('AlternateGroup');
            return $fields;

        }else{
            $fields->removeByName(array(
                'LayoutType','AlternateGroup'
            ));
            return $fields;
        }

    /*
       $groupTypeOptions = $this->owner->dbObject('GroupType')->enumValues();
       $fields->addFieldToTab('Root.Main', new Dropdownfield('GroupType', 'Group Type', $groupTypeOptions));
      

        $PaddingTypeOptions = $this->owner->dbObject('PaddingType')->enumValues();
        $fields->addFieldToTab('Root.Settings', new Dropdownfield('PaddingType', 'Padding Type', $PaddingTypeOptions));
        
        $fields->addFieldToTab('Root.Main', new Numericfield('NumberOfBlocks', 'Number of Blocks'));
       // $fields->addFieldToTab('Root.Background', UploadField::create('Image'));
    */
    
        
    }
   

}

