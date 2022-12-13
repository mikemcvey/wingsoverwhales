<?php 

namespace Maverick\ElementForm;
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


class ElementFormExtension extends DataExtension
{

    private static $db = [
        'Title' => 'Varchar',
        'ContentLayoutType' => 'Enum("Default,Side-by-Side","Default")',
        'ColorTheme' => 'Enum("Default,blue,green","Default")',
        'ReverseLayoutOrder' => 'Boolean',
        'BoxedText' => 'Boolean',
        'number_columns' => 'Enum("1,2,3,4","1")',
        'Content' => 'HTMLText',
        'ColumnTwo' => 'HTMLText',
        'ColumnThree' => 'HTMLText',
        'ColumnFour' => 'HTMLText',
        
       
    ];

    private static $has_one = [
        'FeaturedImage' => Image::class,
    ];
    private static $many_many = array(
        'PageLists' => Page::class,
    );
    private static $many_many_extraFields = [
        'PageLists' => [
            'Sort' => 'Int',
        ]
    ];

    private static $inline_editable = false;

    private static $owns = [
        'FeaturedImage',
    ];
     
  

    public function getCMSFields()
    {
        $fields = FieldList::create();

        $staffField = MultiSelectField::create('PageLists', 'Page Lists', $this, 'Sort');
        $fields->addFieldToTab('Root.Main', $staffField);

        return $fields;
    }
    
    public function updateCMSFields(FieldList $fields)
    {   

        
        
      
     
        $fields->removeByName(array('PageLists','ColumnTwo','ColumnThree','ColumnFour','number_columns', 'ReverseLayoutOrder', 'BoxedText'));

        $ReverseLayoutOrderOptions =  CheckboxField::create('ReverseLayoutOrder');
        $BoxedTextOptions =  CheckboxField::create('BoxedText');

        $number_columnsOptions = $this->owner->dbObject('number_columns')->enumValues();

        $number_columnsOptions= new Dropdownfield('number_columns', 'Number of columns', $number_columnsOptions);
        $fields->removeByName(array('ContentLayoutType'));
        $LayoutType_input =  Dropdownfield::create('ContentLayoutType', 'Content Layout Variation', $this->owner->dbObject('ContentLayoutType')->enumValues());

        $fields->removeByName(array('ColorTheme'));
      //  $ColorTheme_input =  Dropdownfield::create('ColorTheme', 'Color Theme', $this->owner->dbObject('ColorTheme')->enumValues());

        $fields->addFieldToTab( 'Root.Main',FieldGroup::create('Layout Options', $LayoutType_input,$number_columnsOptions,$ReverseLayoutOrderOptions,$BoxedTextOptions), 'HTML');

        $FeaturedImage_input = UploadField::create('FeaturedImage');
        $fields->addFieldToTab('Root.Main', $FeaturedImage_input,'HTML');
        $FeaturedImage_input->displayIf("LayoutType")->isEqualTo("Side-by-Side");

        $FeaturedImage_input->getValidator()->setAllowedExtensions(['png','gif','jpeg','jpg']);

    
          
            

        
        //$fields->removeByName('PageLists');
        //$pageListField = MultiSelectField::create('PageLists', 'Show these pages', $this, 'SortOrder');

        #$fields->addFieldToTab('Root.Main', $pageListField);
        #$pageListField->hideUnless("LayoutType")->isEqualTo("Page-Listing");

        $ColumnTwo_input = new HTMLEditorField('ColumnTwo');
        $fields->addFieldToTab("Root.Main", $ColumnTwo_input,'BlockStyles');
        $ColumnThree_input = new HTMLEditorField('ColumnThree');
        $fields->addFieldToTab("Root.Main", $ColumnThree_input,'BlockStyles');
        $ColumnFour_input = new HTMLEditorField('ColumnFour');
        $fields->addFieldToTab("Root.Main", $ColumnFour_input,'BlockStyles');

       // 
        $ColumnTwo_input->hideUnless("number_columns")->isGreaterThan("1");
        $ColumnThree_input->hideUnless("number_columns")->isGreaterThan("2");
        $ColumnFour_input->hideUnless("number_columns")->isGreaterThan("3");

    }
   
}