<?php
namespace Maverick\Testimonials;
use  Dynamic\Elements\Testimonial\Elements\ElementTestimonial;
use  Maverick\Testimonials\TestimonialCategory;
use SilverStripe\ORM\DataObject;
use SilverStripe\ORM\FieldType\DBField;

use SilverStripe\Forms\TextField;
use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\GridField\GridFieldSortableRows;

use SilverStripe\View\Parsers\ShortcodeParser;


class Testimonial extends DataObject
{

    private static $table_name = 'Testimonials';
    
    private static $db = [
        'Title'     => 'Varchar(255)',
        'Location' => 'Varchar(255)',
        'StarRating' => 'Varchar(255)',
        'Content'   => 'HTMLText',
        'SortOrder' => 'Int'
    ];
    private static $has_one = array(
        'TestimonialCategory' => TestimonialCategory::class
    );
    private static $belongs_many_many = array(
        'ElementTestimonial'=> ElementTestimonial::class
    );

    private static $default_sort = 'SortOrder';


    private static $casting = [
        'myStarRating' => 'HTMLText',
    ];
    private static $field_labels = [
        'Title'   => 'Name',
        'Location' => 'Location',
        'TestimonialCategory.Title' => 'Category'
    ];
    private static $summary_fields = [
        'Title',
        'Location',
        'StarRating',
        'Content',
        'TestimonialCategory.Title'
     ];
     


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
 
        $fields->removeByName(array(
            'SortOrder'
        ));
        $fields->dataFieldByName('StarRating')->setDescription('Numeric values only! ie: 4 / 4.5 or 5');
              
        return $fields;
    }
 

    public function myStarRating($rating){
        if($this->StarRating>0){
         return ShortcodeParser::get_active()->parse('[star_rating rating="'.$this->StarRating.'"]');
        }
     }
    
   
}
