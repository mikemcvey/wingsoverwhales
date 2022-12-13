<?php

namespace Maverick\Blog;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Assets\Image;
use SilverStripe\ORM\DataObject;
use SilverStripe\Versioned\Versioned;

class BlogPostGalleryImage extends DataObject
{
    private static $db = [
        'SortOrder' => 'Int'
    ];
 
    private static $table_name = 'BlogPostGalleryImages';
    private static $has_one = [
        'Image' => Image::class, 
        'BlogPost' => BlogPost::class
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