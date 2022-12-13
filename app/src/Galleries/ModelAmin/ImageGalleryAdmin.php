<?php
namespace Maverick\Gallery;

use SilverStripe\Admin\ModelAdmin;
use Maverick\Gallery\ImageGallery;
use Maverick\Gallery\GalleryTag;

use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
use Symbiote\GridFieldExtensions\GridFieldTitleHeader;
use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
use Symbiote\GridFieldExtensions\GridFieldOrderableRows;
use Symbiote\GridFieldExtensions\GridFieldToolbarHeader;
use Symbiote\GridFieldExtensions\GridFieldDeleteAction;
//use Symbiote\GridFieldExtensions\GridFieldButtonRow;
use  SilverStripe\Forms\GridField\GridFieldAddNewButton;


class GalleryAdmin extends ModelAdmin
{

      private static $menu_title = 'Image Galleries';

    private static $url_segment = 'image-galleries';
    private static $menu_icon_class = 'font-icon-p-gallery-alt';
    private static $managed_models = [
        ImageGallery::class,
        GalleryTag::class,
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
