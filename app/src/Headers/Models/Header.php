<?php

namespace Maverick\Headers\Models;

use Maverick\Utils\FormUtils;
use SilverStripe\ORM\DataObject;
use SilverStripe\Control\Director;
use SilverStripe\View\Requirements;
use SilverStripe\Control\Controller;
use SilverStripe\ORM\CMSPreviewable;
use SilverStripe\ORM\DataObjectSchema;
use Maverick\Headers\Models\HeaderMainLinks;
use SilverStripe\ORM\Filters\PartialMatchFilter;

/**
 * Header Table
 * 
 * The Headers table
 * 
 * @category Headers
 * 
 * @author   Jed Diaz
 * @since    30 June 2022
 */
class Header extends DataObject implements CMSPreviewable
{

    private static $singular_name = 'Header';

    /**
     * Table name
     * 
     * @return string
     */
    private static $table_name = 'Headers';

    /**
     * fields
     * 
     * @return array
     */
    private static $db = [
      'Title' => 'Varchar(255)',
      'UrlIdentifier' => 'Varchar(255)',
    ];

    private static $many_many = [
      "MainLinks" => HeaderMainLinks::class,
    ];

    private static $field_labels = [];

    private static $summary_fields = [
      'ID' => 'ID',
      'Title' => 'Title',
      'Created' => 'Created',
      'LastEdited' => 'Updated',
    ];

    private static $searchable_fields = [
      'ID' => PartialMatchFilter::class,
      'Title' => PartialMatchFilter::class,
    ];

    /**
     * @param null $action
     * @return String
     */
    public function PreviewLink($action = null)
    {
        return Controller::join_links(Director::baseURL(), 'cms-preview', 'show', urlencode($this->ClassName), $this->ID);
    }

    /**
     * @return String
     */
    public function CMSEditLink()
    {
        $sanitizedClass = str_replace('\\', '-', self::class);
        return Controller::join_links(
            '',
            $sanitizedClass,
            'EditForm',
            'field',
            $sanitizedClass,
            'item',
            $this->ID
        );
    }

    /**
     * @return string
     */
    public function getMimeType()
    {
        return 'text/html';
    }

    public function getExportFields()
    {
        $dbs = self::getSchema()->fieldSpecs(self::class, DataObjectSchema::DB_ONLY);
        $exportFields = [
            'ID' => 'ID',
            'Title' => 'Title',
            'getIsPublished' => 'Published',
        ];
        foreach ($dbs as $field => $spec) {
            $exportFields[$field] = $field;
        }
        $this->extend('updateExportFields', $exportFields);

        return $exportFields;
    }

    public function getCMSFields()
    {   
        Requirements::javascript('/library/javascript/admin/MVListingForm.js');

        $fields = $this->scaffoldFormFields(array(
          'includeRelations' => ($this->ID > 0),
          'tabbed' => true,
          'ajaxSafe' => true
        ));

        if ($this->exists())
            $fields->addFieldToTab('Root.MainLinks', FormUtils::make_grid_field_editor(
                'MainLinks',
                'Main Links',
                $this->MainLinks()->sort('Sort'),
                'Sort',
                'RecordEditor'
            ));

        $this->extend('updateCMSFields', $fields);
        $this->extend('updateListingCMSFields', $fields);
          
        return $fields;
    }

    public function onBeforeWrite() 
    {

      parent::onBeforeWrite();

    }

    public function onAfterDelete() 
    {

      parent::onAfterDelete();
  
    }


}