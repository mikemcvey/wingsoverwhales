<?php
namespace Maverick\Mammals;
use SilverStripe\Assets\Image; 
use SilverStripe\ORM\DataObject;
use SilverStripe\Forms\TextField;
use SilverStripe\ORM\FieldType\DBHTMLText;
use SilverStripe\View\ArrayData;
use SilverStripe\ORM\ArrayList;

use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
use SilverStripe\Forms\GridField\GridFieldSortableRows;
use Bummzack\SortableFile\Forms\SortableUploadField;
use SilverStripe\TagField\TagField;


class Mammal extends DataObject
{

    private static $table_name = 'Mammals';
    
    private static $db = [
        'Title' => 'Varchar(200)',
        'SortOrder' => 'Int',
        'Content' => DBHTMLText::class,
        /*'Mass' => 'Varchar(200)',
        'Length' => 'Varchar(200)',
        'Lifespan' => 'Varchar(200)',
        'GestationPeriod' => 'Varchar(200)',
        'ConservationStatus' => 'Varchar(200)',
        'ScientificName' => 'Varchar(200)',
        'TrophicLevel' => 'Varchar(200)',
        'Species' => 'Varchar(200)',
        'Genus'  => 'Varchar(200)',
        'Class' => 'Varchar(200)',
        'Order' => 'Varchar(200)',
        'Family' => 'Varchar(200)',
        'SubFamily' => 'Varchar(200)',
        'Phylum' => 'Varchar(200)',
        'Kingdom' => 'Varchar(200)',*/
        
    ];
   

    private static $has_one = [
        'FeaturedImage' => Image::class,
    ];

    private static $owns = [
         "FeaturedImage"
    ];



    private static $default_sort = 'SortOrder';


    public function getCMSFields()
    {
        $fields = parent::getCMSFields();
 
        $fields->removeByName(array(
            'SortOrder'
        ));
       
       
 
        return $fields;
    }
 
    public function getEditForm($id = null, $fields = null)
    {
        $form = parent::getEditForm($id, $fields);
    

        return $form;
    }

    public static function add_mammals_func($arguments, $content = null, $parser = null, $tagName) 
    {
        if(!isset($arguments['layout'])){
            $arguments['layout'] ="Carousel";
        }


        ob_start(); 
    
        $arrayData = new ArrayData([
             'Mammals' => Mammal::get(),
             'Layout' => $arguments['layout']

         ]);
         
         echo $arrayData->renderWith('Maverick/Mammals/MammalShortcode');
        return ob_get_clean();
    }
   
    function FeaturedImage()
        {
            
            // echo $this->FeaturedImage;
            if($this->FeaturedImage->URL){
                //echo "FEatured IMage";
                return $this->FeaturedImage;
            }else{
               
                    return  Image::get()->byId(380);
                    return false;
                
            }
        }
}
