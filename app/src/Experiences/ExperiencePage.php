<?php

use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Dev\Debug;
use SilverStripe\Dev\Backtrace;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\CheckboxSetField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\TagField\TagField;
use SilverStripe\ORM\DataObject;
use SilverStripe\Blog\Model\BlogTag;

use Maverick\Experiences\ExperienceTag;
use Dynamic\Elements\Experiences\Elements\ElementExperiences;
use Maverick\Experiences\GalleryImage;
use Bummzack\SortableFile\Forms\SortableUploadField;
class ExperiencePage extends Page
{
    private static $table_name = 'Experiences';

    private static $description = 'Experiences members';
    private static $icon_class = 'font-icon-p-alt';


    private static $db = array(
        
        'ExpFromPrice' => 'Varchar',
         'SpecialOffer' => 'Boolean',
        'SpecialOfferPrice' => 'Varchar',
        'ExpCurrencyCode' => 'Varchar',
        'ExpDuration' => 'Varchar',
        'ExpSeason' => 'Varchar',
        'ExpLevel' => 'Varchar',
        'ExpHelicoperModel' => 'Varchar',
        'ExpDirectBookingLink' => 'Varchar',
        'ExpBookingLinkText' => 'Varchar',
        'ExpFeatures' => 'HTMLText'

    );
    private static $many_many = array(
        'ExperienceTags' => ExperienceTag::class,
        'Images' => [
            'through' => GalleryImage::class,
            'from' => 'ExperiencePage',
            'to' => 'Image',
        ]

    );
    private static $casting = [
        'ExperienceInfo' => 'HTMLText',
        
    ];
    private static $belongs_many_many = array(
        'ElementExperiences' => ElementExperiences::class
    );
    private static $owns = [
        'Images'
    ];
    private static $cascade_deletes = [
        'Images'
    ];

    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
       
        $field = TagField::create(
            'ExperienceTags',
            'Experience Groups',
            ExperienceTag::get(),
            $this->ExperienceTags()
        )->setShouldLazyLoad(true)->setCanCreate(true);

        $fields->addFieldToTab(
            'Root.Main',
            $field,
            'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpFromPrice'), 'ElementalArea'
        );
         $fields->addFieldToTab(
            'Root.Main',CheckboxField::create('SpecialOffer'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('SpecialOfferPrice'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpCurrencyCode'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpDuration'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpSeason'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpLevel'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpHelicopterModel'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpDirectBookingLink'), 'ElementalArea'
        );
        $fields->addFieldToTab(
            'Root.Main',TextField::create('ExpBookingLinkText'), 'ElementalArea'
        );
        $field = HtmlEditorField::create('ExpFeatures', 'Features');
        $field->setRows(10);
        $fields->addFieldToTab(
            'Root.Main',$field, 'ElementalArea'
        );
     
            $fields->addFieldToTab('Root.Main', SortableUploadField::create(
                'Images', 'Gallery Images'
            ), 'Teaser');
       
   
        
            $fields->addFieldToTab(
            'Root.Main',
            HTMLEditorField::create('Content'),'ElementalArea'
        );
         
             
       // $fields->insertAfter($field, 'ElementalArea');

        return $fields;
    }
    public function getImages(){
        return $this->Images();
    }
    public function getExperienceInfo(){
        //$return = '';
        ob_start(); 
        if($this->ExpDuration){ ?>
            <li><strong>Allow <?php echo $this->ExpDuration; ?></strong></li>
            <?php }
       /* if($this->ExpDuration){ ?>
        <li>Duration: <strong><?php echo $this->ExpDuration; ?></strong></li>
        <?php }
        if($this->ExpLevel){ ?>
            <li>Level: <strong><?php echo $this->ExpLevel; ?></strong></li>
            <?php }
        if($this->ExpSeason){ ?>
            <li>Season: <strong><?php echo $this->ExpSeason; ?></strong></li>
            <?php }
        if($this->ExpHelicopterModel){ ?>
            <li>Duration: <strong><?php echo $this->ExpHelicopterModel; ?></strong></li>
            <?php } */
        
    $return = ob_get_clean();
    if($return != ''){
        $return = "<ul class='flightinfo'>".$return."</ul>";
    }
    return $return;
    }
    public function allExperienceTags(){
        $allTags = '';
        foreach($this->ExperienceTags() as $tag){
            $allTags .=  ' '.$tag->Title;
        }
      
        return  $allTags;
        //return implode($this->ExperienceTags(), ' ');
    }
 
    public function addStarRating($rating){
         return ShortcodeParser::get_active()->parse('[star_rating rating="'.$rating.'"]');
     }

    
}
