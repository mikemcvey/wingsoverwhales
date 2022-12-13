<?php
namespace Maverick\Faq;
use  Maverick\Faq\FaqCategory;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\GridField\GridFieldSortableRows;

class FaqQuestion extends DataObject
{

    private static $table_name = 'FaqQuestion';
    
    private static $db = [
        'Title'     => 'Varchar(255)',
        'Answer'   => 'HTMLText',
        'SortOrder' => 'Int'
    ];
    private static $has_one = array(
        'FaqCategory' => FaqCategory::class
    );

    private static $default_sort = 'SortOrder';

    private static $field_labels = [
        'Title'   => 'Question',
        'Answer' => 'Answer',
        'FaqCategory.Title' => 'Category'
    ];
    private static $summary_fields = [
        'Title',
        'Answer',
        'FaqCategory.Title'
     ];
     private static $casting = [
        'Answer' => 'HTMLText'
        
    ];


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
 
        $fields->removeByName(array(
            'SortOrder'
        ));
 
        return $fields;
    }
 
    public function getEditForm($id = null, $fields = null)
    {
        $form = parent::getEditForm($id, $fields);
        
        //This check is simply to ensure you are on the managed model you want adjust accordingly
        if($this->modelClass == 'Distributor' && $gridField = $form->Fields()->dataFieldByName($this->sanitiseClassName($this->modelClass))) {
            //This is just a precaution to ensure we got a GridField from dataFieldByName() which you should have
            if($gridField instanceof GridField) {
                $gridField->getConfig()->addComponent(new GridFieldSortableRows('SortOrder'));
            }
        }



        return $form;
    }
 

   
}
