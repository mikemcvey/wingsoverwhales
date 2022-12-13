<?php

namespace Maverick\Blog;

use SilverStripe\CMS\Controllers\ContentController;
use SilverStripe\Blog\Model\BlogPost;
use SilverStripe\Forms\Form;
use SilverStripe\Forms\FieldList;
use SilverStripe\Forms\TextField;
use SilverStripe\Forms\DropdownField;
use SilverStripe\Forms\FormAction;
use SilverStripe\ORM\ArrayLib;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\ORM\PaginatedList;

class BlogControllerExtension extends ContentController
{
    
    protected function init()
        {
            parent::init();
            
          
        }
    
public function getNextPost()
    {
        return BlogPost::get()
            ->filter(array(
                'ParentID' => $this->owner->ParentID,
                'PublishDate:GreaterThanOrEqual' => $this->owner->PublishDate
            ))
            ->exclude(array('ID' => $this->owner->ID))
            ->sort('PublishDate', 'ASC')
            ->first();
    }

    
    public function getPreviousPost()
    {
        return BlogPost::get()
            ->filter(array(
                'ParentID' => $this->owner->ParentID,
                'PublishDate:LessThanOrEqual' => $this->owner->PublishDate
            ))
            ->exclude(array('ID' => $this->owner->ID))
            ->sort('PublishDate', 'DESC')
            ->first();
    }
    
}
