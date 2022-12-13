<?php

namespace Maverick\Extensions;

use SilverStripe\Core\Extension;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;

/**
 * Caption Asset Form Factory extension.
 * Extends the CMS detail form to allow caption addition.
 *
 * @extends Extension
 */
class CaptionAssetFormFactoryExtension extends Extension
{

    /**
     * Add FocusPoint field for selecting focus.
     */
    public function updateFormFields(FieldList $fields, $controller, $formName, $context)
    {
        $image = isset($context['Record']) ? $context['Record'] : null;
        if ($image && $image->appCategory() === 'image') {
            
            $captionField = TextField::create('Caption', 'Image Caption', $image);


            $titleField = $fields->fieldByName('Editor.Details.Title');
            if ($titleField) {
                if ($titleField->isReadonly()) $captionField = $captionField->performReadonlyTransformation();
                $fields->insertAfter(
                    'Title',
                    $captionField
                );
            }

        }
    }
}
