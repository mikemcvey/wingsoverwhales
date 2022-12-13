<?php

namespace Dynamic\Elements\TimeLines\Elements;
use Page;
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
use SilverStripe\Forms\CheckboxSetField;

use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;


use  Maverick\Timeline\TimelineEntry;

/**
 * Class ElementTimeLines
 * @package Dynamic\Elements\TimeLines\Elements
 *
 * @property string $Content
 *
 * @method \SilverStripe\ORM\ManyManyList Page()
 */
class ElementTimeLine extends BaseElement
{
    /**
     * @var string
     */
    private static $icon = 'font-icon-block-banner';

    /**
     * @return string
     */
    private static $singular_name = 'TimeLine Element';

    /**
     * @return string
     */
    private static $plural_name = 'TimeLine Elements';

    /**
     * @var string
     */
    private static $table_name = 'ElementTimeLines';

    /**
     * @var array
     */
    private static $styles = array();

    /**
     * @var array
     */
    private static $db = [
       // 'Layout'=> 'Enum("Carousel,Grid","Grid")',
        'Content' => DBHTMLText::class,
       // 'ContentAfter' => 'HTMLText',
    ];


    private static $many_many = array(
		 'TimelineEntries' =>  TimelineEntry::class
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
                $fields->addFieldToTab('Root.Main', GridField::create(
                    'TimelineEntries',
                    'Timeline Entries',
                    $this->TimelineEntries(),
                    GridFieldConfig_RecordEditor::create()
                    // ->addComponent(new GridFieldButtonRow('before'))
                    ->addComponent(new GridFieldOrderableRows('SortID'))
                    //->addComponents(new GridFieldToolbarHeader())
                        //->addComponent(new GridFieldDeleteAction())
                    ));
                    
                
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
        return _t(__CLASS__.'.BlockType', 'TimeLines');
    }
}
