<?php

namespace Maverick\Gallery;
use Page;
use Maverick\Gallery\ImageGallery;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\Versioned\Versioned;

class ImageGalleryImage extends DataObject
{
    private static $db = [
        'SortOrder' => 'Int'
    ];
    private static $table_name = 'ImageGalleryImages';
    private static $has_one = [
        'Image' => Image::class, 
        'ImageGallery' => ImageGallery::class
        
    ];
     
    private static $belongs_many_many = [
      //  'BlogPost' => BlogPost::class
    ];
 

    private static $default_sort = 'SortOrder';

    // It's important that you add the Versioned extension to this!
    private static $extensions = [
        Versioned::class
    ];

}