<?php

namespace App\Extensions\PageTypes;

use DNADesign\Elemental\Extensions\ElementalAreasExtension;
use SilverStripe\Core\Extension;

class VirtualPageExtension extends Extension
{
    public function onBeforeWrite()
    {
        /** @var ElementalAreasExtension $owner */
        $owner = $this->owner;
        foreach ($owner->getElementalRelations() as $elementalRelation) {
            $field = "{$elementalRelation}ID";
            $owner->$field = 0;
        }
    }
}