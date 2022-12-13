<?php


use Maverick\Staff\StaffTag;
//use Maverick\Staff\ElementStaffMembers;

use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Dev\Debug;
use SilverStripe\Dev\Backtrace;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\TagField\TagField;
use SilverStripe\ORM\DataObject;
use SilverStripe\Blog\Model\BlogTag;



use Dynamic\Elements\StaffMembers\Elements\ElementStaffMembers;


class StaffPage extends Page
{
    private static $table_name = 'Staff';

    private static $description = 'Staff members';
    private static $icon_class = 'font-icon-p-alt';


    private static $db = array(
        'FirstName' => 'Text',
        'Surname' => 'Text',
        'JobRole' => 'Text',
        'EmailAddress' => 'Text',
        'PhoneNumber' => 'Text',
        'LinkinProfile' => 'Text',
        'StaffContent' =>   'HTMLText'
    );
    private static $many_many = array(
		'StaffTags' => StaffTag::class
      
	);
    private static $belongs_many_many = array(
        'ElementStaffMembers'=> ElementStaffMembers::class
    );
    private static $defaults = array( 
        'ShowInMenus' => false 
     );
    
public function getCMSFields()
{
    $fields = parent::getCMSFields();

   
    $fields->addFieldToTab(
        'Root.Main',
        TextField::create('FirstName'), 'FeaturedImage'
    );
    $fields->addFieldToTab(
        'Root.Main',
        TextField::create('Surname'), 'FeaturedImage'
    );
   
    $fields->removeByName('StaffTags');
    $field = TagField::create(
        'StaffTags',
        'Member Groups',
        StaffTag::get(),
        $this->StaffTags())->setShouldLazyLoad(true)->setCanCreate(true);
        
        $fields->addFieldToTab(
            'Root.Main',
            $field, 'FeaturedImage'
                );
    $fields->addFieldToTab(
        'Root.Main',
        TextField::create('JobRole'), 'FeaturedImage'
    );
    
    $fields->addFieldToTab(
        'Root.Main',
        TextField::create('EmailAddress'), 'FeaturedImage'
    );
    $fields->addFieldToTab(
        'Root.Main',
        TextField::create('PhoneNumber'), 'FeaturedImage'
    );
    $fields->addFieldToTab(
        'Root.Main',
        TextField::create('LinkinProfile'), 'FeaturedImage'
    );
    
    $heading = HtmlEditorField::create('StaffContent', 'Staff Content');
    $heading->setRows(10);
    $fields->insertAfter($heading, 'Teaser');
  

        
    //new CheckboxSetField( $name = "topics", $title = "I am interested in the following topics", $source = array( "1" => "Technology", "2" => "Gardening", "3" => "Cooking", "4" => "Sports" ), $value = "1" );
   
    return $fields;
}


   
}