<?php
    namespace Maverick\Timeline;
    use SilverStripe\ORM\DataObject;
    use SilverStripe\Forms\FieldList;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\AssetAdmin\Forms\UploadField;
    use SilverStripe\Assets\Image;
    use SilverStripe\Versioned\Versioned;
    use SilverStripe\Forms\Tab;
    use SilverStripe\Forms\TabSet;

    use SilverStripe\Forms\GridField\GridField;
    use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
    use SilverStripe\Forms\GridField\GridFieldConfig_RelationEditor;

    
    use SilverStripe\CMS\Controllers\ContentController;
    use SilverStripe\Forms\GridField\GridFieldButtonRow;
    use SilverStripe\Forms\GridField\GridFieldToolbarHeader;
    use SilverStripe\Forms\GridField\GridFieldDeleteAction;
    use SilverStripe\Forms\GridField\GridFieldAddNewButton;
    use SilverStripe\Forms\GridField\GridFieldSortableHeader;
    use SilverStripe\Forms\GridField\GridFieldSortableRows;
    use SilverStripe\Forms\GridField\GridFieldDataColumns;
    
    use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
    use Symbiote\GridFieldExtensions\GridFieldTitleHeader;
    use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
    use Symbiote\GridFieldExtensions\GridFieldOrderableRows;


    use  Dynamic\Elements\TimeLines\Elements\ElementTimeLine;


    class TimelineEntry extends DataObject {
      private static $table_name = 'TimelineEntry';
     
      private static $db = [
        'SortID'=>'Int',
        'Title' => 'Varchar',
        'Month' => 'Varchar',
        'Year' => 'Varchar',
        'Content' => 'HTMLText',
      ];
      
      private static $has_one = array (
        'ElementTimeLine' => ElementTimeLine::class,
        'HeroImage' => Image::class,
      );
      private static $owns = [
        'HeroImage'
      ];
      private static $summary_fields = array(
        'ImageThumbnail' => "image",
        'Content.Summary'=>'Content'
      );
     
      
      private static $default_sort='SortID';
      
    // this function creates the thumbnail for the summary fields to use
      public function ImageThumbnail() { 

        return $this->HeroImage()->CMSThumbnail();
      }
      
      public function getCMSFields(){
     
      $fields = parent::getCMSFields();
        $fields->removeByName('SortID');
        $fields->removeByName('ElementTimeLineID');
       $fields->addFieldToTab('Root.Main', TextField::create('Month','Month'),'SortID');
       $fields->addFieldToTab('Root.Main', TextField::create('Year','Year'),'SortID');
       $fields->addFieldToTab('Root.Main', TextField::create('Title','Title'),'SortID');
       $fields->removeByName('Content');
       $fields->addFieldToTab('Root.Main', HTMLEditorField::create('Content')
				->setDescription('Timeline entry'),
				'SortID'
			);
       //$fields->addFieldToTab('Root.Main', TextField::create('Longtitude','Longtitude'),'Content');

      /*
       $fields->addFieldToTab('Root.Main', 
       GridField::create(
        'Products',
        'Add as many resources as you want',
        $this->ApiProduct(),
        GridFieldConfig_RelationEditor::create()
       ));
       */
          return $fields;
      }

      
      
      public function getThumbnail() { 
        return $this->HeroImage()->CMSThumbnail();
      }
      



      
    
    }
  
  

