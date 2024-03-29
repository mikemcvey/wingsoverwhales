<?php 

namespace Maverick\SiteConfig;

use Maverick\Utils\FormUtils;
use Maverick\SiteConfig\Affilaites;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\GridField\GridField;
use SilverStripe\Forms\GridField\GridFieldConfig;
use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
    
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


use SilverStripe\Forms\CheckboxField;
use SilverStripe\Forms\FieldGroup;
// use Maverick\Footer\Models\FooterLinkGroup;

use SilverStripe\Assets\Image; 
use SilverStripe\AssetAdmin\Forms\UploadField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;


class SiteConfigExtension extends DataExtension
{

    private static $db = [
        'FacebookLink' => 'Varchar',
        'Instagram' => 'Varchar',
        'TwitterLink' => 'Varchar',
        'GoogleLink' => 'Varchar',
        'YouTubeLink' => 'Varchar',
        'LinkedInLink' => 'Varchar',
        'TripAdvisorLink' => 'Varchar',

       
        'AdminNotificationEmail' => 'Text',
        'CdnUrl' => 'Varchar(100)',
        'ImportNotificationEmails' => 'Text',
        'BugMeBarActive' => 'Boolean',
        'BugMeBarMessage' => 'HTMLText',

        'FooterContent' => 'HTMLText',
  
     
        'GoogleMapsJavaScriptAPIKey' => 'Varchar(100)',
        'BugMeBarActive' => 'Boolean',
        'ShowOnlyOnHomepage' => 'Boolean',
        'BugMeBarMessage' => 'HTMLText',

        'PopupActive' => 'Boolean',
        'PopupOnlyOnHomepage' => 'Boolean',
        'PopupLinkURL' => 'Varchar',
        'PopupMessage' => 'HTMLText',
        'PopupCookieName' => 'HTMLText',
        'PopupCookieLength' => 'HTMLText',
    ];
    private static $has_one = [
        'PopupImage' => Image::class,
    ];
    private static $has_many = [
        'Affiliates' => Affiliates::class,
      ];
      
    private static $many_many = [
    
    ];
    private static $owns = [
        "Affiliates","PopupImage"
    ];
    public function updateCMSFields(FieldList $fields)
    {
        $fields->addFieldToTab(
          'Root.Main',
          TextField::create('GoogleMapsJavaScriptAPIKey', 'Google Maps JavaScript API Key')
        );
        
        $fields->addFieldsToTab('Root.Main', array (
            TextField::create('CdnUrl', 'Content Delivery network URL'),
            TextField::create('ImportNotificationEmails', 'Import Notification Email To'),
        ));

        $fields->addFieldsToTab('Root.Social', array (

           
        ));
        $fields->addFieldToTab(
            'Root.Social',
            FieldGroup::create(
                TextField::create('FacebookLink','Facebook'),
                    TextField::create('Instagram','Instagram'),
                    TextField::create('TwitterLink','Twitter'),
                    TextField::create('GoogleLink','Google'),
                    TextField::create('YouTubeLink','YouTube'),
                    TextField::create('LinkedInLink','LinkedIn'),
                    TextField::create('TripAdvisorLink','TripAdvisor'),
            )->setTitle('Social Media')
        );

      
        $fields->addFieldsToTab('Root.Footer', array(
            HTMLEditorField::create('FooterContent'),
            /*
            FormUtils::make_grid_field_editor(
                'Affiliates',
                'Affiliates',
                Affiliates::get(),
                'Sort',
                'RecordEditor'
            ),

*/
           GridField::create(
                'Affiliates',
                'Affiliates',
                $this->Affiliates(),
                GridFieldConfig_RecordEditor::create()
                ->addComponent(new GridFieldOrderableRows('Sort'))
           ),
    
           /*
            FormUtils::make_grid_field_editor(
                'FooterLinks',
                'Footer Links',
                FooterLinkGroup::get(),
                'Sort',
                'RecordEditor'
            ), */
        ));

        $fields->addFieldsToTab('Root.PopUps.BugMeBar', array(
            CheckboxField::create('BugMeBarActive'),
            CheckboxField::create('ShowOnlyOnHomepage'),
            HTMLEditorField::create('BugMeBarMessage'),
        ));

        $fields->addFieldsToTab('Root.PopUps.PopupModal', array(
            CheckboxField::create('PopupActive'),
            CheckboxField::create('PopupOnlyOnHomepage'),
            TextField::create('PopupCookieName')->setDescription('Unique cookie name for this popup. If changing content please use new name in invalidate cookies.'),
            TextField::create('PopupCookieLength')->setDescription('Frequency in days to pause after initial showing (use decimals for 1/2 day ie .5)'),
            TextField::create('PopupLinkURL'),
            UploadField::create('PopupImage'),
            HTMLEditorField::create('PopupMessage')

        ));


    }

    public function FooterLinks() 
    {
        return FooterLinkGroup::get();
    }
    public function Affiliates() 
    {
       // return "Mike";
        return Affiliates::get();
    }
    public function getCompanyAffiliates() 
    {
       // return "Mike";
        return Affiliates::get();
    }

    
}