<?php

use SilverStripe\Forms\FieldList;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;

/**
 * @package userforms
 */
class UserDefinedFormExtension extends DataExtension
{
    private static $db = [
        'UserDefinedContent'=> "HTMLText",
    ];

    public function updateCMSFields(FieldList $fields)
    {

        $fields->addFieldToTab(
            'Root.Main',
            HTMLEditorField::create('UserDefinedContent')
        );

    }
}
