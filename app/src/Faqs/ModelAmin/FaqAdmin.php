<?php
namespace Maverick\Faq;

use SilverStripe\Admin\ModelAdmin;
use Maverick\Faq\FaqQuestion;
use Maverick\Faq\FaqCategory;

use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
use Symbiote\GridFieldExtensions\GridFieldTitleHeader;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use Symbiote\GridFieldExtensions\GridFieldToolbarHeader;
use Symbiote\GridFieldExtensions\GridFieldDeleteAction;
//use Symbiote\GridFieldExtensions\GridFieldButtonRow;
use  SilverStripe\Forms\GridField\GridFieldAddNewButton;


class FaqAdmin extends ModelAdmin
{

      private static $menu_title = 'FAQs';

    private static $url_segment = 'faqs';
    private static $menu_icon_class = 'font-icon-help-circled';
    private static $managed_models = [
        FaqQuestion::class,
        FaqCategory::class,
    ];
    

    public function getEditForm($id = null, $fields = null){
        $form = parent::getEditForm($id, $fields);
        $model = singleton($this->modelClass);
        if ( $model->hasField('SortOrder')&& $gridField=$form->Fields()->dataFieldByName($this->sanitiseClassName($this->modelClass))) {
            $gridField->getConfig()->addComponent(new GridFieldOrderableRows('SortOrder'));
        }

        return $form;
    }

}
