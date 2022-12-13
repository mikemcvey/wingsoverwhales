<?php

namespace Dynamic\Elements\PageLists\Elements;
use Page;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\FieldList;

use SilverStripe\Forms\GridField\GridFieldAddExistingAutocompleter;
use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBHTMLText;

use UncleCheese\DisplayLogic\Wrapper;

use SilverStripe\Versioned\GridFieldArchiveAction;
use Symbiote\GridFieldExtensions\GridFieldAddExistingSearchButton;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use SilverStripe\Forms\GridField\GridFieldAddNewButton;
use Kinglozzer\MultiSelectField\Forms\MultiSelectField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\TreeDropdownField;
use SilverStripe\Forms\TextAreaField;
use SilverStripe\CMS\Model\SiteTree;


/**
 * Class ElementPageLists
 * @package Dynamic\Elements\PageLists\Elements
 *
 * @property string $Content
 *
 * @method \SilverStripe\ORM\ManyManyList Page()
 */
class ElementPageLists extends BaseElement
{
    /**
     * @var string
     */
    private static $icon = 'font-icon-block-banner';

    /**
     * @return string
     */
    private static $singular_name = 'PageLists Element';

    /**
     * @return string
     */
    private static $plural_name = 'PageLists Elements';

    /**
     * @var string
     */
    private static $table_name = 'ElementPageLists';

    /**
     * @var array
     */
    private static $styles = array();

    /**
     * @var array
     */
    private static $db = [
        'Content' => DBHTMLText::class,
        'LayoutTypes' => 'Enum("Grid,Side-by-Side,Carousel,Features,Staggered","Grid")',
        'TileLayout' => 'Enum("Default,Card","Default")',
        'PageListSource' => 'Enum("Custom,ParentPage","Custom")',
        'PageListParent' => 'Varchar',
    ];

    /**
     * @var array
     */
    private static $many_many = array(
        'PageLists' => Page::class,
    );
    

    /**
     * @var array
     */
    private static $many_many_extraFields = array(
        'PageLists' => array(
            'SortOrder' => 'Int',
        ),
    );

    /**
     * @var array
     */
    private static $owns = [
       // 'Promos',
    ];

    /**
     * Set to false to prevent an in-line edit form from showing in an elemental area. Instead the element will be
     * clickable and a GridFieldDetailForm will be used.
     *
     * @config
     * @var bool
     */
    private static $inline_editable = false;

    /**
     * @param bool $includerelations
     * @return array
     */
    public function fieldLabels($includerelations = true)
    {
        $labels = parent::fieldLabels($includerelations);

        $labels['PageLists'] = _t(__CLASS__ . '.PageListsLabel', 'PageLists');

        return $labels;
    }

    /**
     * @return FieldList
     */
      public function getCMSFields()
    {
        $this->beforeUpdateCMSFields(function (FieldList $fields) {
 
           if ($this->ID) {
               

        $fields->removeByName('LayoutTypes');
        $LayoutTypeOptions = $this->owner->dbObject('LayoutTypes')->enumValues();
        $fields->addFieldToTab('Root.Main', new Dropdownfield('LayoutTypes', 'Layout Types', $LayoutTypeOptions));

        $fields->removeByName('TileLayout');
        $LayoutType_input =  Dropdownfield::create('TileLayout', 'Tile Layout', $this->owner->dbObject('TileLayout')->enumValues());
         $LayoutType_input->displayIf("LayoutTypes")
            ->isEqualTo("Grid")
                ->orIf("LayoutTypes")->isEqualTo("Carousel")->end();
        
        $fields->addFieldToTab('Root.Main', $LayoutType_input);

      

        $fields->removeByName('PageListSource');
        $LayoutTypeOptions = $this->owner->dbObject('PageListSource')->enumValues();
        $fields->addFieldToTab('Root.Main', new Dropdownfield('PageListSource', 'Page Source', $LayoutTypeOptions));

        $fields->removeByName('PageLists');
        $pageListField = MultiSelectField::create('PageLists', 'Show these pages', $this, 'SortOrder')
        ->displayIf("PageListSource")->isEqualTo("Custom")->end();
       $fields->addFieldToTab('Root.Main', $pageListField);
   
      $fields->removeByName('PageListParent');   
      $field = DropdownField::create('PageListParent', 'Show children of this page', SiteTree::get()->map()->toArray())
        ->setEmptyString('(Select one)')->displayIf("PageListSource")->isEqualTo("ParentPage")->end();

        $fields->addFieldToTab('Root.Main', $field);
     
       // $PageListParent->hideIf("PageListSource")->isEqualTo("Custom");

            } 

        });
        return parent::getCMSFields();
    }

    /**
     * @return mixed
     */
    public function getPageLists()
    {

        if($this->PageListSource == "Custom" ){
            return $this->PageLists()->sort('SortOrder');
        }else{
           // return $this->PageLists()->sort('SortOrder');
            return SiteTree::get()->filter('ParentID',$this->PageListParent);
        }
        
    }
    public function getMyPageLists()
    {
   
        if($this->PageListSource == "Custom" ){
            return $this->PageLists()->sort('SortOrder');
        }else{
           // return $this->PageLists()->sort('SortOrder');
            return SiteTree::get()->filter('ParentID',$this->PageListParent);
        }
        
    }

    public function getParentPage()
    {
        
       // return "my-PageListParent"; 
        return SiteTree::get()->filter('ParentID',$this->PageListParent)->first()->URLSegment;

        
        
    }

    /**
     * @return DBHTMLText
     */
    public function getSummary()
    {
        if ($this->PageLists()->count() == 1) {
            $label = ' page';
        } else {
            $label = ' pages';
        }
        return DBField::create_field('HTMLText', $this->PageLists()->count() . $label)->Summary(20);
    }

    /**
     * @return array
     */
    protected function provideBlockSchema()
    {
        $blockSchema = parent::provideBlockSchema();
        $blockSchema['content'] = $this->getSummary();
        return $blockSchema;
    }

    /**
     * @return string
     */
    public function getType()
    {
        return _t(__CLASS__.'.BlockType', 'PageLists');
    }
}
