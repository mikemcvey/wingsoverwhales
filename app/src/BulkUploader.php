<?php
namespace Maverick\BulkUploaded;

use SilverStripe\Forms\Form;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\FileField;
use SilverStripe\Forms\FormAction;
use SilverStripe\Forms\RequiredFields;
use SilverStripe\Dev\CsvBulkLoader;
use SilverStripe\Control\Controller;

class MyController extends Controller 
{

    private static $allowed_actions = [
        'Form'
    ];

    protected $template = "Page";

    public function Link($action = null) 
    {
        return Controller::join_links('MyController', $action);
    }

    public function Form() 
    {
        $form = new Form(
            $this,
            'Form',
            new FieldList(
                new FileField('CsvFile', false)
            ),
            new FieldList(
                new FormAction('doUpload', 'Upload')
            ),
            new RequiredFields()
        );
        return $form;
    }

    public function doUpload($data, $form) 
    {
        $loader = new CsvBulkLoader('BlocksPage');
        $results = $loader->load($_FILES['CsvFile']['tmp_name']);
        $messages = [];

        if($results->CreatedCount()) {
            $messages[] = sprintf('Imported %d items', $results->CreatedCount());
        }

        if($results->UpdatedCount()) {
            $messages[] = sprintf('Updated %d items', $results->UpdatedCount());
        }

        if($results->DeletedCount()) {
            $messages[] = sprintf('Deleted %d items', $results->DeletedCount());
        }

        if(!$messages) {
            $messages[] = 'No changes';
        }

        $form->sessionMessage(implode(', ', $messages), 'good');

        return $this->redirectBack();
    }
}