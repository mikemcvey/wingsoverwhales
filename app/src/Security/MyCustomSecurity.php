<?php

namespace Maverick\Security;

use SilverStripe\Security\MemberAuthenticator\ChangePasswordForm;

class CustomPasswordForm extends ChangePasswordForm
{
    
    function getFormFields()
    {
        $fields = parent::getFormFields();
        $fields->fieldByName('NewPassword1')->setDescription('8 or more characters long');
        $fields->fieldByName('NewPassword2')->setDescription('8 or more characters long');
        /*$fields->push(
                CheckboxField::create(
                    "AgreeTerms",
                    "Agree To Terms"
                )
            );
        */
        return $fields;
    }
}