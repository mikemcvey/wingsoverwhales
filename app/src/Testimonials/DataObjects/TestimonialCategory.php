<?php
namespace Maverick\Testimonials;
use Maverick\Testimonials\Testimonial;
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\GridField\GridFieldSortableRows;

class TestimonialCategory extends DataObject {

    private static $db = array(
        'Title' => 'Text'
    );
    private static $table_name = 'Testimonial_Categories';


    private static $has_many = array(
        'Testimonial' => Testimonial::class
    );
}