<?php
namespace Maverick\Testimonials;

use SilverStripe\Admin\ModelAdmin;
use Maverick\Testimonials\Testimonial;
use Maverick\Testimonials\TestimonialCategory;

use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
use Symbiote\GridFieldExtensions\GridFieldTitleHeader;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use Symbiote\GridFieldExtensions\GridFieldToolbarHeader;
use Symbiote\GridFieldExtensions\GridFieldDeleteAction;
//use Symbiote\GridFieldExtensions\GridFieldButtonRow;
use  SilverStripe\Forms\GridField\GridFieldAddNewButton;
use  SilverStripe\Forms\GridField\GridFieldFilterHeader;


class TestimonialAdmin extends ModelAdmin
{

      private static $menu_title = 'Testimonial';

    private static $url_segment = 'testimonial';
    private static $menu_icon_class = 'font-icon-chat';
    private static $managed_models = [
        Testimonial::class,
        TestimonialCategory::class,
    ];
    

    public function getEditForm($id = null, $fields = null){
        $form = parent::getEditForm($id, $fields);
        //print_r($form->Fields());
			$gridFieldName = 'Maverick-Testimonials-Testimonial';
			$gridField = $form->Fields()->fieldByName($gridFieldName);

			if ($gridField) {
              
				$gridField->getConfig()->addComponent(new GridFieldFilterHeader())->addComponent(new GridFieldOrderableRows('SortOrder'));
			}

        return $form;
    }
   

}
