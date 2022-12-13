<?php

namespace Dynamic\Elements\Testimonial\Elements;
use Page;

use Maverick\Testimonials\Testimonial;
use Maverick\Testimonials\TestimonialCategory;
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
 * Class ElementTestimonial
 * @package Dynamic\Elements\Testimonial\Elements
 *
 * @property string $Content
 *
 * @method \SilverStripe\ORM\ManyManyList Page()
 */
class ElementTestimonial extends BaseElement
{
    /**
     * @var string
     */
    private static $icon = 'font-icon-block-banner';

    /**
     * @return string
     */
    private static $singular_name = 'Testimonial Element';

    /**
     * @return string
     */
    private static $plural_name = 'Testimonial Elements';

    /**
     * @var string
     */
    private static $table_name = 'ElementTestimonial';

    /**
     * @var array
     */
    private static $styles = array();

    /**
     * @var array
     */
    private static $db = [
        'Layout'=> 'Enum("Carousel,Grid","Carousel")',
        'TestimonialListSource' => 'Enum("Category,Individual","Category")',
        'Content' => DBHTMLText::class,
        'ContentAfter' => 'HTMLText',
    ];


    private static $many_many = array(
		'TestimonialCategory' =>  TestimonialCategory::class,
        'Testimonials' => Testimonial::class,

        
	);
    private static $many_many_extraFields = array(
        'Testimonials' => array(
            'SortOrders' => 'Int',
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
                 /*
                $fields->removeByName('TestimonialListSource');
                $LayoutTypeOptions = $this->owner->dbObject('TestimonialListSource')->enumValues();
                $fields->addFieldToTab('Root.Main', new Dropdownfield('TestimonialListSource', 'Testimonials Source', $LayoutTypeOptions));
       */
                $fields->removeByName('TestimonialCategory');
                $ListingField = Wrapper::create(TagField::create(
                    'TestimonialCategory',
                    'Testimonials (by Category)',
                    TestimonialCategory::get(),
                    $this->TestimonialCategory())->setShouldLazyLoad(true)->setCanCreate(false) 
                )->displayIf("TestimonialListSource")->isEqualTo("Category")->end();


                $fields->addFieldsToTab('Root.Main',  $ListingField);

                /*
                $field = TagField::create(
                'StaffTags',
                'Staff Groups',
                StaffTag::get(),
                $this->StaffTags())->setShouldLazyLoad(true)->setCanCreate(true) 
                ->displayIf("TestimonialListSource")->isEqualTo("Tag")->end();*/




                $fields->removeByName('Testimonials');
         $pageListField = MultiSelectField::create('Testimonials', 'Show these testimonials', $this, 'SortOrders')
                ->displayIf("TestimonialListSource")->isEqualTo("Individual")->end();
                $fields->addFieldToTab('Root.Main', $pageListField, 'BlockOptions');
                
               /*$fields->addFieldToTab(
                    'Root.Main',
                    $field, 'FeaturedImage'
                        ); */
                        $fields->removeByName('Content');
                        $fields->addFieldToTab("Root.Main", new HTMLEditorField('ContentAfter'),'BlockStyles');
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
    
    public function getElementTestimonials()
    {

    if($this->TestimonialListSource == "Category" && $this->TestimonialCategory()->column('ID')){
        return Testimonial::get()->filter('TestimonialCategory.ID', $this->TestimonialCategory()->column('ID'));
       }
       return  $this->Testimonials()->sort('SortOrders');
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
        return _t(__CLASS__.'.BlockType', 'Testimonial');
    }
}
