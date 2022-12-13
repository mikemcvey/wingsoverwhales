<?php

namespace Maverick\Styling;
// clone

use Exception;
use Page;
use SilverStripe\CMS\Model\SiteTree;

use DNADesign\Elemental\Services\ReorderElements;
use GraphQL\Type\Definition\ResolveInfo;
use SilverStripe\Core\Injector\Injector;

use DNADesign\Elemental\Models\ElementalArea;
use DNADesign\Elemental\Models\BaseElement;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FieldGroup;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\TreeDropdownField;

use SilverStripe\ORM\DataExtension;
use SilverStripe\ORM\ArrayList;
use SilverStripe\View\ArrayData;
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Assets\Image;






class MaverickBaseElement extends DataExtension
{

    private static $db = array(
        // 'GroupType' => 'Enum("Standard,NotStandard","Standard")',
        //'LayoutType' => 'Enum("Default,Side-by-Side","Default")',
        // 'PaddingType' => 'Enum("narrow,half,wider,full-width","full-width")',
        //  'TextColor' => 'Enum("default,white,dark,orange,blue,grey","default")',
        'BackgroundColor' => 'Enum("default,black,purple,green,red,blue,pink,orange,grey","default")',
        'BackgroundPattern' => 'Enum("default,vertical-1,horzontal-1,blue-box,green-box","default")',
        'BackgroundGradient' => 'Enum("default,gradient,tint","default")',

        'inner_wrap' => 'Enum("default,narrow,half,wider,full-width","default")',
        'text_width' => 'Enum("default,narrow,half,wider,full-width","default")',
        'pad_bot' => 'Enum("default,0,20,40,60,80,100,120,180,200","default")',
        'pad_top' => 'Enum("default,0,20,40,60,80,100,120,180,200","default")',
        'vheight' => 'Enum("default,25,50,75,100,125,150,175,200","default")',
        'content_vertical_align' => 'Enum("top,middle,bottom","top")',
        'column_vertical_align' => 'Enum("top,middle,bottom","top")',
        //'NumberOfBlocks' => 'Int'

        // 'content_after' => 'HTMLText',
        // 'slidesPerView'=>'Enum("auto,1,2,3","auto")',
        // 'centeredSlides'=> 'Boolean',
    );

    private static $has_one = [
        'bg_image' => Image::class
    ];

    private static $inline_editable = false;
    private static $has_written = false;

    public function SayHi()
    {
        // $this->owner refers to the original instance. In this case a `Member`.
        return "Hi " . $this->owner->Name;
    }

    private static $owns = [
        'bg_image',
    ];


    public function updateCMSFields(FieldList $fields)
    {

        /*
         $available_parents = $this->getElementalAreaDropdownMap();
         if ($available_parents) {
             $ParentIdDropdown = new DropdownField('TempParentID', _t(__CLASS__ . '.AreaDropdownLabel', 'Clone to'), $available_parents, $this->owner->ParentID);
             $fields->addFieldToTab('Root.ExpertSettings', $ParentIdDropdown);
             $fields->addFieldToTab('Root.ExpertSettings', new CheckboxField('CloneAll', 'Clone ALL content blocks on this page'));
         }
         */
        /// should replace above with sitetree dropdown maybe faster... 
        $ParentIdDropdown = new TreeDropdownField('TempParentID', 'Clone to', SiteTree::class);
        $fields->addFieldToTab('Root.ExpertSettings', $ParentIdDropdown);
        $fields->addFieldToTab('Root.ExpertSettings', new CheckboxField('CloneAll', 'Clone ALL content blocks on this page'));


        $inner_wrapOptions = $this->owner->dbObject('inner_wrap')->enumValues();
        $text_widthOptions = $this->owner->dbObject('text_width')->enumValues();
        $pad_topOptions = $this->owner->dbObject('pad_top')->enumValues();
        $pad_botOptions = $this->owner->dbObject('pad_bot')->enumValues();
        $vheightOptions = $this->owner->dbObject('vheight')->enumValues();
        $fields->removeByName(array('inner_wrap', 'text_width', 'pad_top', 'pad_bot', 'vheight', 'content_vertical_align', 'column_vertical_align'));

        $fields->addFieldToTab(
            'Root.Main',
            FieldGroup::create(
                'Block Styles',
                // Dropdownfield::create('LayoutType', 'Layout Variation', $this->owner->dbObject('LayoutType')->enumValues()),
                Dropdownfield::create('inner_wrap', 'Section width', $inner_wrapOptions),
                Dropdownfield::create('text_width', 'Text width', $text_widthOptions),
                Dropdownfield::create('pad_top', 'Padding top', $pad_topOptions),
                Dropdownfield::create('pad_bot', 'Padding bottom', $pad_botOptions),
                Dropdownfield::create('vheight', 'Vertical height', $vheightOptions),
                Dropdownfield::create('content_vertical_align', 'Content vertical alignment (relative to each other)', $this->owner->dbObject('content_vertical_align')->enumValues()),
                Dropdownfield::create('column_vertical_align', 'Column vertical alignment', $this->owner->dbObject('column_vertical_align')->enumValues())
            ),
            'Content'
        );
        
/*
        $fields->addFieldToTab("Root.Main", new ToggleCompositeField('BlockStyles', 'Block Styles', 
        array( 
            FieldGroup::create(
                'Block Styles',
                // Dropdownfield::create('LayoutType', 'Layout Variation', $this->owner->dbObject('LayoutType')->enumValues()),
                Dropdownfield::create('inner_wrap', 'Section width', $inner_wrapOptions),
                Dropdownfield::create('text_width', 'Text width', $text_widthOptions),
                Dropdownfield::create('pad_top', 'Padding top', $pad_topOptions),
                Dropdownfield::create('pad_bot', 'Padding bottom', $pad_botOptions),
                Dropdownfield::create('vheight', 'Vertical height', $vheightOptions),
                Dropdownfield::create('content_vertical_align', 'Content vertical alignment (relative to each other)', $this->owner->dbObject('content_vertical_align')->enumValues()),
                Dropdownfield::create('column_vertical_align', 'Column vertical alignment', $this->owner->dbObject('column_vertical_align')->enumValues())
            )
        ) 
    ), 'Metadata'); */
    

        $fields->removeByName(array('BackgroundColor', 'BackgroundPattern', 'bg_image', 'BackgroundGradient'));
        $fields->removeByName(array('ExtraClass', 'AvailableGlobally'));

        $BackgroundColor_opt = $this->owner->dbObject('BackgroundColor')->enumValues();
        $BackgroundPattern_opt = $this->owner->dbObject('BackgroundPattern')->enumValues();
        $BackgroundGradient_opt = $this->owner->dbObject('BackgroundGradient')->enumValues();
        $fields->addFieldToTab(
            'Root.Main',
            FieldGroup::create(
                'Block Options',
                // Dropdownfield::create('LayoutType', 'Layout Variation', $this->owner->dbObject('LayoutType')->enumValues()),
                Dropdownfield::create('BackgroundColor', 'Background Color', $BackgroundColor_opt),
                Dropdownfield::create('BackgroundPattern', 'Background Pattern', $BackgroundPattern_opt),
                Dropdownfield::create('BackgroundGradient', 'Background Overlay', $BackgroundGradient_opt),
                UploadField::create('bg_image', 'Background Image'),
                TextField::create('ExtraClass', _t(__CLASS__ . '.ExtraCssClassesLabel', 'Custom CSS classes'))
                    ->setAttribute(
                        'placeholder',
                        _t(__CLASS__ . '.ExtraCssClassesPlaceholder', 'my_class another_class')
                    )
            ),
            'Content'
        );
        /*
        $fields->addFieldToTab("Root.Main", new ToggleCompositeField('BlockOptions', 'Block Options', 
        array( 
            FieldGroup::create(
                'Block Options',
                // Dropdownfield::create('LayoutType', 'Layout Variation', $this->owner->dbObject('LayoutType')->enumValues()),
                Dropdownfield::create('BackgroundColor', 'Background Color', $BackgroundColor_opt),
                Dropdownfield::create('BackgroundPattern', 'Background Pattern', $BackgroundPattern_opt),
                Dropdownfield::create('BackgroundGradient', 'Background Overlay', $BackgroundGradient_opt),
                UploadField::create('bg_image', 'Background Image'),
                TextField::create('ExtraClass', _t(__CLASS__ . '.ExtraCssClassesLabel', 'Custom CSS classes'))
                    ->setAttribute(
                        'placeholder',
                        _t(__CLASS__ . '.ExtraCssClassesPlaceholder', 'my_class another_class')
                        )
                        ) 
                    )
        ), 'Metadata');
        */
              /*
        $fields->addFieldToTab("Root.Main",
        new TabSet( $name = "TheTabSetName", 
            new Tab( $title='Block Settings',  new LiteralField("","<br/>")),
            new Tab( $title='Block Styles',  FieldGroup::create(
                
                // Dropdownfield::create('LayoutType', 'Layout Variation', $this->owner->dbObject('LayoutType')->enumValues()),
                Dropdownfield::create('inner_wrap', 'Section width', $inner_wrapOptions),
                Dropdownfield::create('text_width', 'Text width', $text_widthOptions),
                Dropdownfield::create('pad_top', 'Padding top', $pad_topOptions),
                Dropdownfield::create('pad_bot', 'Padding bottom', $pad_botOptions),
                Dropdownfield::create('vheight', 'Vertical height', $vheightOptions),
                Dropdownfield::create('content_vertical_align', 'Content vertical alignment (relative to each other)', $this->owner->dbObject('content_vertical_align')->enumValues()),
                Dropdownfield::create('column_vertical_align', 'Column vertical alignment', $this->owner->dbObject('column_vertical_align')->enumValues())
            ) ), 
            new Tab( $title='Block Options', FieldGroup::create(
                
                // Dropdownfield::create('LayoutType', 'Layout Variation', $this->owner->dbObject('LayoutType')->enumValues()),
                Dropdownfield::create('BackgroundColor', 'Background Color', $BackgroundColor_opt),
                Dropdownfield::create('BackgroundPattern', 'Background Pattern', $BackgroundPattern_opt),
                Dropdownfield::create('BackgroundGradient', 'Background Overlay', $BackgroundGradient_opt),
                UploadField::create('bg_image', 'Background Image'),
                TextField::create('ExtraClass', _t(__CLASS__ . '.ExtraCssClassesLabel', 'Custom CSS classes'))
                    ->setAttribute(
                        'placeholder',
                        _t(__CLASS__ . '.ExtraCssClassesPlaceholder', 'my_class another_class')
                        )
                        ) 
                    )
             
        )
    ); */ 
        $fields->removeByName("Settings");
        $fields->removeByName(array(
            'content_after', 'AlternateGroup'
        ));

        return $fields;
    }

    public function getElementalAreaDropdownMap()
    {
        $available_areas = ElementalArea::get();
        if ($available_areas->exists()) {
            $area_list = new ArrayList();
            foreach ($available_areas as $area) {
                $ownerPage = $area->getOwnerPage();
                if ($ownerPage) {
                    $area_list->push(new ArrayData(array(
                        "AreaID" => $area->ID,
                        //"PageMenuTitle" => $ownerPage->MenuTitle,
                        // "PageLink" => $ownerPage->Link(),
                        // "PageSort" => $ownerPage->Sort,
                        //"PageParentSort" => $ownerPage->Parent()->Sort,
                        "DropdownTitle" =>  $area->ID . ': ' . $ownerPage->MenuTitle . ' (' . $ownerPage->Link() . ')'
                    )));
                }
            }
            $area_list = $area_list->sort(array(
                // 'PageParentSort' => 'ASC',
                // 'PageSort'       => 'ASC',
                // 'PageLink'       => 'ASC'
            ));
            return $area_list->map("AreaID", "DropdownTitle");
        }
    }


    public function onBeforeWrite()
    {
       // echo "<br/>owner->has_written: ".$this->owner->has_written;
       //  echo "<br/>has_written: ".$this->has_written;
       // echo "<br/><br/>onBeforeWrite";
        //echo "<br/>TempParentID: " . $this->owner->TempParentID;
        //$TempParentID = $this->owner->TempParentID;
        //echo "<br/>TempParentID: " . $TempParentID;
       // echo "<br/>ParentID: " . $this->owner->ParentID;
       // echo "<br/>ID: " . $this->owner->ID;
       // echo "<br/>ElementalAreaID: " . $this->owner->ElementalAreaID;
       // echo "<br/>ClassName: " . $this->owner->ClassName;
       // echo "<br/>Title: " . $this->owner->Title;
       // echo "<br/>Target URLSegment: ".SiteTree::get_by_id(2)->URLSegment;

  

            if (!$this->owner->has_written && $this->owner->TempParentID){

                $targetElemAreaID = SiteTree::get()->filter(['ID' =>  $this->owner->TempParentID ])->first()->ElementalAreaID;
              //  echo "<br/>Target Elemental Area: " .$targetElemAreaID;
            if($targetElemAreaID != $this->owner->ParentID) {
               // echo "<br/>different so start move";
                $this->owner->has_written = true;
                $element = BaseElement::get_by_id($this->owner->ID);
                $area = ElementalArea::get_by_id($targetElemAreaID);
               
               if($this->owner->CloneAll){
                try{
                    $CloneAllTheseArea = ElementalArea::get_by_id($this->owner->ParentID);
                    $AllCloneElements = $CloneAllTheseArea->Elements();
                    foreach($AllCloneElements as $elem){
                        //echo '<br/>CloneAll Elem '.$elem->owner->Title ;
                        $clone = $elem->owner->duplicate(false);
                        $clone->Title = "(CLONED) ".$elem->owner->Title;
                        $clone->Sort = $area->Elements()->Count() + 1; 
                        $area->Elements()->add($clone);
                    }
                    return $clone;
                }catch (Exception $e) {
                    throw new Exception("Something went wrong when cloning elements");
                }
               }else{

                try {
                    /// Be AWESOME to catch this as json and copy to clip board
                    // then-> paste into another page(s)
                    
                    //echo "<br/>try";
                    // var_dump($element);
                    // clone element
                   // $this->owner->duplicate(false);
                    //$clone = $element->duplicate(false);
                    $clone = $this->owner->duplicate(false);
                    
                    //$clone->Title = $this->newTitle($clone->Title);
                    $clone->Title = "(CLONED) ".$this->owner->Title;
                    $clone->Sort = $area->Elements()->Count() + 1; // must be zeroed for reorder to work
                    //echo "<br/>var_dump";
                    // var_dump($clone);
                    $sortElementsBasedFromThisID = $area->Elements()->Last()->ID;
                    $area->Elements()->add($clone);
                    // reorder
                    //$reorderer = Injector::inst()->create(ReorderElements::class, $clone);
                    //$reorderer->reorder($sortElementsBasedFromThisID);
                    return $clone;
                } catch (Exception $e) {
                    throw new Exception("Something went wrong when copying element: $elementID");
                }
            }
                
        }
            }
        
        parent::onBeforeWrite();
    }

}
