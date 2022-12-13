<?php

namespace Dynamic\Elements\StaffMembers\Elements;
use Page;
use StaffPage;
use Maverick\Staff\StaffTag;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\Forms\HTMLEditor\HtmlEditorConfig;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Versioned\GridFieldArchiveAction;
use Symbiote\GridFieldExtensions\GridFieldAddExistingSearchButton;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldAddNewButton;
use SilverStripe\Forms\DropdownField;
use Kinglozzer\MultiSelectField\Forms\MultiSelectField;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\TagField\StringTagField;
use SilverStripe\TagField\TagField;
use UncleCheese\DisplayLogic\Forms\Wrapper;





/**
 * Class ElementStaffMembers
 * @package Dynamic\Elements\StaffMembers\Elements
 *
 * @property string $Content
 *
 * @method \SilverStripe\ORM\ManyManyList Page()
 */
class ElementStaffMembers extends BaseElement
{
    /**
     * @var string
     */
    private static $icon = 'font-icon-block-banner';

    /**
     * @return string
     */
    private static $singular_name = 'StaffMembers Element';

    /**
     * @return string
     */
    private static $plural_name = 'StaffMembers Elements';

    /**
     * @var string
     */
    private static $table_name = 'ElementStaffMembers';

    /**
     * @var array
     */
    private static $styles = array();

    /**
     * @var array
     */
    private static $db = [
        'Layout'=> 'Enum("Carousel,Grid","Grid")',
        'StaffListSource' => 'Enum("Tag,Individuals","Tag")',
        'Content' => DBHTMLText::class,
        'ContentAfter' => 'HTMLText',
    ];


    private static $many_many = array(
		'StaffTags' =>  StaffTag::class,
        'StaffPages' => StaffPage::class,

        
	);
    private static $many_many_extraFields = array(
        'StaffPages' => array(
            'SortOrder' => 'Int',
        ),
    );

    private static $inline_editable = false;


    /**
     * @return FieldList
     */
  
    public function getCMSFields()
    {
        
        $this->beforeUpdateCMSFields(function (FieldList $fields) {
          
              
               
            if ($this->ID) {
                $fields->removeByName('Content');
                $fields->addFieldToTab("Root.Main", new HTMLEditorField('Content'),'BlockStyles');
                
                $fields->removeByName('StaffListSource');
                $LayoutTypeOptions = $this->owner->dbObject('StaffListSource')->enumValues();
                $fields->addFieldToTab('Root.Main', new Dropdownfield('StaffListSource', 'Staff Member Source', $LayoutTypeOptions));
        
                $fields->removeByName('StaffTags');
                $ListingField = Wrapper::create(TagField::create(
                    'StaffTags',
                    'Staff Groups (by Tag)',
                    StaffTag::get(),
                    $this->StaffTags())->setShouldLazyLoad(true)->setCanCreate(true) 
                )->displayIf("StaffListSource")->isEqualTo("Tag")->end();


                $fields->addFieldsToTab('Root.Main',  $ListingField);

                /*
                $field = TagField::create(
                'StaffTags',
                'Staff Groups',
                StaffTag::get(),
                $this->StaffTags())->setShouldLazyLoad(true)->setCanCreate(true) 
                ->displayIf("StaffListSource")->isEqualTo("Tag")->end();*/




                $fields->removeByName('StaffPages');
                $pageListField = MultiSelectField::create('StaffPages', 'Show these staff members', $this, 'SortOrder')
                ->displayIf("StaffListSource")->isEqualTo("Individuals")->end();
                $fields->addFieldToTab('Root.Main', $pageListField, 'FeaturedImage');
                
               /*$fields->addFieldToTab(
                    'Root.Main',
                    $field, 'FeaturedImage'
                        ); */
                $fields->removeByName('ContentAfter');
                $fields->addFieldToTab("Root.Main", new HTMLEditorField('ContentAfter'),'BlockStyles');
                
            }
//
        });
        return parent::getCMSFields();
    }

    /**
     * @return mixed
     */
    
    /**
     * @return DBHTMLText
     */
    public function getSummary(){
        
    }
    
    public function getStaffMembers()
    {

    if($this->StaffListSource == "Tag" && $this->StaffTags()->column('ID')){
        return StaffPage::get()->filter('StaffTags.ID', $this->StaffTags()->column('ID'));
       }
       return  $this->StaffPages()->sort('SortOrder');
    }

    /**
     * @return array
     */
    protected function provideBlockSchema()
    {
        $blockSchema = parent::provideBlockSchema();
      //  $blockSchema['content'] = $this->getSummary();
        return $blockSchema;
    }

    /**
     * @return string
     */
    public function getType()
    {
        return _t(__CLASS__.'.BlockType', 'StaffMembers');
    }
}
