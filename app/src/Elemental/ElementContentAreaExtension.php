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


class ElementContentAreaExtension extends DataExtension
{

    private static $db = [
        'ReverseLayoutOrder' => 'Boolean',
        'BoxedText' => 'Boolean',
        'number_columns' => 'Enum("1,2,3,4","1")',
        'ColumnTwo' => 'HTMLText',
        'ColumnThree' => 'HTMLText',
        'ColumnFour' => 'HTMLText',
        'ContentAfter' => 'HTMLText',
        
       
    ];


    public function updateCMSFields(FieldList $fields)
    {   

        $ReverseLayoutOrderOptions =  CheckboxField::create('ReverseLayoutOrder');
        $number_columnsOptions = $this->owner->dbObject('number_columns')->enumValues();
        
        //$fields->dataFieldByName('Content')->setRows(10);
        
        $number_columnsOptions= new Dropdownfield('number_columns', 'Number of columns', $number_columnsOptions);


        $ColumnFour_input = new HTMLEditorField('ColumnFour');
        $ColumnFour_input->setRows(10);
        $fields->addFieldToTab("Root.Main", $ColumnFour_input, 'BlockOptions');
        //$fields->fieldByName('Root.Main')->insertAfter($ColumnFour_input, 'Content');
       // 
       $ColumnThree_input = new HTMLEditorField('ColumnThree');
       $ColumnThree_input->setRows(10);
       $fields->addFieldToTab("Root.Main", $ColumnThree_input, 'BlockOptions');
       //$fields->fieldByName('Root.Main')->insertAfter($ColumnThree_input, 'Content');


       $ColumnTwo_input = new HTMLEditorField('ColumnTwo');
       $ColumnTwo_input->setRows(10);
       $fields->addFieldToTab("Root.Main", $ColumnTwo_input, 'BlockOptions');
     //  $fields->fieldByName('Root.Main')->insertAfter($ColumnTwo_input, 'Content');

        $ColumnTwo_input->hideUnless("number_columns")->isGreaterThan("1");
        $ColumnThree_input->hideUnless("number_columns")->isGreaterThan("2");
        $ColumnFour_input->hideUnless("number_columns")->isGreaterThan("3");


        $field =  HTMLEditorField::create('ContentAfter')->setRows(5);
        $fields->addFieldToTab("Root.Main", $field);
    }
   
}