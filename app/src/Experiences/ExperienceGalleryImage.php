<?php

namespace Maverick\Experiences;
use ExperiencePage;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\Versioned\Versioned;

class GalleryImage extends DataObject
{
    private static $db = [
        'SortOrder' => 'Int'
    ];
    private static $table_name = 'GalleryImages';
    private static $has_one = [
        'Image' => Image::class,
        'ExperiencePage' => ExperiencePage::class
    ];

    private static $default_sort = 'SortOrder';

    // It's important that you add the Versioned extension to this!
    private static $extensions = [
        Versioned::class
    ];
}