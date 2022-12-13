<?php
namespace Maverick\Faq;
use Maverick\Faq\FaqQuestion;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\GridField\GridFieldSortableRows;

class FaqCategory extends DataObject {

    private static $db = array(
        'Title' => 'Text'
    );
    private static $table_name = 'FaqQuestion_Category';

    private static $has_many = array(
        'FaqQuestion' => FaqQuestion::class
    );
}