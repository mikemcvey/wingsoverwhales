<?php

namespace Maverick\Extensions;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataExtension;

/**
 * Caption Image extension.
 *
 * @extends DataExtension
 */
class ImageCaptionExtension extends DataExtension
{
    private static $db = array(
        'Caption' => 'Varchar',
    );
}
