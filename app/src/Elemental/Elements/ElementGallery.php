<?php

namespace Dynamic\Elements\Gallery\Elements;
use DNADesign\Elemental\Models\BaseElement;


use SilverStripe\ORM\FieldType\DBField;
use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\ArrayList;

use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\DropdownField;

use SilverStripe\Assets\Image; 
use  Dynamic\Elements\Gallery\Elements\ElementGallery\ElementGalleryImage;

use SilverStripe\View\ArrayData;
use SilverStripe\Control\Director;
use Bummzack\SortableFile\Forms\SortableUploadField;





class ElementGallery extends BaseElement
{
    /**
     * @var string
     */
    private static $icon = 'font-icon-p-gallery';

    /**
     * @return string
     */
    private static $singular_name = 'Gallery Element';

    /**
     * @return string
     */
    private static $plural_name = 'Gallery Elements';

    /**
     * @var string
     */
    private static $table_name = 'ElementGallery';

    /**
     * @var array
     */
    private static $styles = array();

    /**
     * @var array
     */
    private static $db = [
        'Content' => DBHTMLText::class,
        'LayoutTypes' => 'Enum("Grid,Carousel","Grid")',
        
       
    ];

    /*
    
     */
    private static $many_many = array(
        'Images' => [
            'through' => ElementGalleryImage::class,
            'from' => 'ElementGallery',
            'to' => 'Image',
        ]

    );

    private static $owns = [
         'Images',
    ];
    private static $inline_editable = false;

    public function getCMSFields()
    {
        $this->beforeUpdateCMSFields(function (FieldList $fields) {
            $fields->dataFieldByName('Content')
                ->setRows(10);
            if ($this->ID) {


                $fields->removeByName('LayoutTypes');
                $LayoutTypeOptions = $this->owner->dbObject('LayoutTypes')->enumValues();
                $fields->addFieldToTab('Root.Main', new Dropdownfield('LayoutTypes', 'Layout Types', $LayoutTypeOptions));

                

                $fields->addFieldToTab('Root.Main', SortableUploadField::create(
                    'Images', 'Gallery Images'
                ));

            }
        });
        return parent::getCMSFields();
    }

    public function getImages(){
        return $this->Images();
    }

    public function getSummary(){
            return DBField::create_field('HTMLText', $this->Images()->count() ." Images")->Summary(20);
        
    }

    public function getGalleryClass(){
        $numImages = $this->Images()->Count();
        if($numImages%4==0){
          $class="four-column";
        }else if($numImages%3==0){
          $class="three-column";
        }else if($numImages%2==0){
          $class="two-column";
        }else{
          $class="three-column";
        }
        return $class;
    }
    protected function provideBlockSchema()
    {
        $blockSchema = parent::provideBlockSchema();
        $blockSchema['content'] = $this->getSummary();
        return $blockSchema;
    }
    public function getType()
    {
        return _t(__CLASS__ . '.BlockType', 'Gallery');
    }
}
