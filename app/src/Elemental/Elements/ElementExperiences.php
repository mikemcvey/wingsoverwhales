<?php

namespace Dynamic\Elements\Experiences\Elements;

use Page;
use ExperiencePage;
use Maverick\Experiences\ExperienceTag;
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
 * Class ElementExperiences
 * @package Dynamic\Elements\Experiences\Elements
 *
 * @property string $Content
 *
 * @method \SilverStripe\ORM\ManyManyList Page()
 */
class ElementExperiences extends BaseElement
{
    /**
     * @var string
     */
    private static $icon = 'font-icon-block-banner';

    /**
     * @return string
     */
    private static $singular_name = 'Experiences Element';

    /**
     * @return string
     */
    private static $plural_name = 'Experiences Elements';

    /**
     * @var string
     */
    private static $table_name = 'ElementExperiences';

    /**
     * @var array
     */
    private static $styles = array();

    /**
     * @var array
     */
    private static $db = [
        'Layout' => 'Enum("Carousel,Grid,Filtered","Grid")',
        'ExperienceListSource' => 'Enum("Individual,Tag,ShowAll","Individual")',
        'Content' => DBHTMLText::class,
        'ContentAfter' => 'HTMLText',
    ];


    private static $many_many = array(
        'ExperienceTags' =>  ExperienceTag::class,
        'ExperiencePages' => ExperiencePage::class,


    );
    private static $many_many_extraFields = array(
        'ExperiencePages' => array(
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

                $fields->removeByName('Layout');
                $LayoutTypeOptions = $this->owner->dbObject('Layout')->enumValues();
                $fields->addFieldToTab('Root.Main', new Dropdownfield('Layout', 'Layout', $LayoutTypeOptions));

                $fields->removeByName('Content');
                $fields->addFieldToTab("Root.Main", new HTMLEditorField('Content'), 'BlockStyles');

                $fields->removeByName('ExperienceListSource');
                $LayoutTypeOptions = $this->owner->dbObject('ExperienceListSource')->enumValues();
                $fields->addFieldToTab('Root.Main', new Dropdownfield('ExperienceListSource', 'Experience Source', $LayoutTypeOptions));

                $fields->removeByName('ExperienceTags');
                $ListingField = Wrapper::create(
                    TagField::create(
                        'ExperienceTags',
                        'Experience Groups (by Tag)',
                        ExperienceTag::get(),
                        $this->ExperienceTags()
                    )->setShouldLazyLoad(true)->setCanCreate(true)
                )->displayIf("ExperienceListSource")->isEqualTo("Tag")->end();


                $fields->addFieldsToTab('Root.Main',  $ListingField);

                /*
                $field = TagField::create(
                'ExperienceTags',
                'Experience Groups',
                ExperienceTag::get(),
                $this->ExperienceTags())->setShouldLazyLoad(true)->setCanCreate(true) 
                ->displayIf("ExperienceListSource")->isEqualTo("Tag")->end();*/




                $fields->removeByName('ExperiencePages');
                $pageListField = MultiSelectField::create('ExperiencePages', 'Show these experiences', $this, 'SortOrder')
                    ->displayIf("ExperienceListSource")->isEqualTo("Individual")->end();
                $fields->addFieldToTab('Root.Main', $pageListField, 'FeaturedImage');

                /*$fields->addFieldToTab(
                    'Root.Main',
                    $field, 'FeaturedImage'
                        ); */
                $fields->removeByName('ContentAfter');
                $fields->addFieldToTab("Root.Main", new HTMLEditorField('ContentAfter'), 'BlockStyles');
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
    public function getSummary()
    {
    }

    public function getExperiences()
    {

        if ($this->ExperienceListSource == "Tag" && $this->ExperienceTags()->column('ID')) {
            return ExperiencePage::get()->filter('ExperienceTags.ID', $this->ExperienceTags()->column('ID'))->sort('SortOrder');
        }
        return  $this->ExperiencePages()->sort('SortOrder');
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
        return _t(__CLASS__ . '.BlockType', 'Experiences');
    }
   
   
}
