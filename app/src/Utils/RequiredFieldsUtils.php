<?php

namespace Maverick\Utils;

use SilverStripe\Forms\RequiredFields;
use SilverStripe\Forms\FormField;
use SilverStripe\Forms\FileField;

/**
 * Defines the Required Fields
 *
 * @category Utils
 * 
 * @author Jed Diaz
 */
class RequiredFieldsUtils extends RequiredFields
{
    
  public function php($data) 
  {

		$valid = true;
		$fields = $this->form->Fields();

		foreach ($fields as $field) {
			$valid = ($field->validate($this) && $valid);
		}

		if ($this->required) {
      
			foreach ($this->required as $fieldName) {
				if (!$fieldName) {
					continue;
				}

				if ($fieldName instanceof FormField) {
					$formField = $fieldName;
					$fieldName = $fieldName->getName();
				} else {
					$formField = $fields->dataFieldByName($fieldName);
				}

				$error = true;
				
				// submitted data for file upload fields come back as an array
				$value = isset($data[$fieldName]) ? $data[$fieldName] : null;

				if (is_array($value)) {
					if($formField instanceof FileField && isset($value['error']) && $value['error']) {
						$error = true;
					} else {
						$error = (count($value)) ? false : true;
					}
				} else {
					// assume a string or integer
					$error = (strlen($value)) ? false : true;
				}

				if ($formField && $error) {
					$errorMessage = _t(
						'Form.FIELDISREQUIRED', 
						'{name} is required',
						array(
							'name' => strip_tags(
								'"' . ($formField->Title() ? $formField->Title() : $fieldName) . '"'
							)
						)
					);

					if($msg = $formField->getCustomValidationMessage()) {
						$errorMessage = $msg;
					}

					$this->validationError(
						$fieldName,
						$errorMessage,
						"required"
					);

					$valid = false;
        }
        
			}
		}
		
		if (!$valid) {
		    $this->form->setMessage('All Required fields must be filled. Please check all the fields messages below.', 'bad');
		}
		
    return $valid;
    
	}
}
