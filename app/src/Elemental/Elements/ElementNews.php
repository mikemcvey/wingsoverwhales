<?php

namespace Dynamic\Elements\News\Elements;
use Page;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\Forms\HTMLEditor\HtmlEditorConfig;
use SilverStripe\Forms\HTMLEditor\HTMLEditorFild;


/**
 * Class ElementNews
 * @package Dynamic\Elements\News\Elements
 *
 * @property string $Content
 *
 * @method \SilverStripe\ORM\ManyManyList Page()
 */
class ElementNews extends BaseElement
{
    /**
     * @var string
     */
    private static $icon = 'font-icon-block-banner';

    /**
     * @return string
     */
    private static $singular_name = 'News Element';

    /**
     * @return string
     */
    private static $plural_name = 'News Elements';

    /**
     * @var string
     */
    private static $table_name = 'ElementNews';

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
        'ContentAfter' => 'HTMLText',
    ];


    private static $many_many = array(
		
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
        return _t(__CLASS__.'.BlockType', 'News');
    }
}
