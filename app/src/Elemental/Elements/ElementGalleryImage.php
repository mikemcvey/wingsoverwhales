<?php

namespace Dynamic\Elements\Gallery\Elements\ElementGallery;
use Page;
use Dynamic\Elements\Gallery\Elements\ElementGallery;
use SilverStripe\Assets\Image;

use SilverStripe\Versioned\Versioned;

use SilverStripe\ORM\DataObject;


class ElementGalleryImage extends DataObject
{
    private static $db = [
        'SortOrder' => 'Int'
    ];
    private static $table_name = 'ElementGalleryImages';
    private static $has_one = [
        'Image' => Image::class, 
        'ElementGallery' => ElementGallery::class,
    ];
     
    private static $belongs_many_many = [
    ];
 

    private static $default_sort = 'SortOrder';

    // It's important that you add the Versioned extension to this!
    private static $extensions = [
        Versioned::class
    ];

}