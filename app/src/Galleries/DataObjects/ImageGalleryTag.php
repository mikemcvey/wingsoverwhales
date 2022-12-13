<?php
namespace Maverick\Gallery;
use Maverick\Gallery\ImageGallery;
use SilverStripe\TagField\TagField;
use SilverStripe\ORM\DataObject;


class GalleryTag extends DataObject
{
    private static $table_name = 'GalleryTag';

    private static $db = [
        'Title' => 'Varchar(200)',
    ];

    private static $belongs_many_many = [
        'ImageGallery' => ImageGallery::class 
    ];
}

