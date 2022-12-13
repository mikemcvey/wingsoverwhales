<?php
namespace Maverick\Mammals;

use SilverStripe\Admin\ModelAdmin;

use Maverick\Mammals\Mammal;
use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
use Symbiote\GridFieldExtensions\GridFieldTitleHeader;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use Symbiote\GridFieldExtensions\GridFieldToolbarHeader;
use Symbiote\GridFieldExtensions\GridFieldDeleteAction;
//use Symbiote\GridFieldExtensions\GridFieldButtonRow;
use  SilverStripe\Forms\GridField\GridFieldAddNewButton;


class MammalAdmin extends ModelAdmin
{

      private static $menu_title = 'Sea Life Information';

    private static $url_segment = 'mammals';
    private static $menu_icon_class = 'font-icon-eye';
    private static $managed_models = [
        Mammal::class
        
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
