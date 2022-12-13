<?php

namespace {

use Maverick\Footers\Models\Footer;
use Maverick\Selections\Models\Selections;
use Maverick\Footer\Models\FooterLinkGroup;
use SilverStripe\Blog\Model\BlogPost;
    use Maverick\AbstractPage;
    use Maverick\Headers\Models\Header;
    use SilverStripe\Control\HTTPRequest;

    use SilverStripe\CMS\Controllers\ContentController;
    use SilverStripe\ORM\DataObject;
    use SilverStripe\ORM\FieldType\DBField;
    use SilverStripe\CMS\Search\SearchForm;
    use SilverStripe\View\Requirements;
    use SilverStripe\ORM\DB;

    class PageController extends ContentController
    {
        /**
         * @var array
         */
        private static $allowed_actions = ['SearchForm'];

        protected function init()
        {
            parent::init();
            
          
        }

        public function onBeforeWrite() 
        {
                parent::onBeforeWrite();
                /** @var Image $relation  - auto puching owned assets. **/
                foreach (static::$has_one as $key => $relation) {
                    if ($relation == Image::class && !$this->{$key}()->exists() && !$this->{$key}()->isPublished()) {
                        $this->{$key}()->publishSingle();
                    }
                }
        }
        
        function GetPageList()
        {
            $PageList = DataObject::get("Page", "ShowOnFrontPage=1", "LastEdited DESC", "", 4);	
            return $PageList;
        }


        function RandomNumber() 
        {
            return rand(1000, 300000);
        } 

        function latestBlog()
        {
            $blog = DataObject::get("BlogEntry", "", "Date DESC", "", 2);		
            return $blog;	
        }

        function PageById($id)
        {
            return DataObject::get_by_id("SiteTree", (int)$id);
        }

        public function SearchForm()
        {
            $form = SearchForm::create($this, 'SearchForm');
            $form->setFormAction("/search/SearchForm/");

            return $form;
        }

        public function results($data, $form, $request)
        {
            $data = [
                'Results' => $form->getResults(),
                'Query' => DBField::create_field('Text', $form->getSearchQuery()),
                'Title' => _t('SilverStripe\\CMS\\Search\\SearchForm.SearchResults', 'Search Results'),
            ];
            return $this->owner->customise($data)->renderWith([
                    'Page_results', 
                    'Page',
                ]);
        }

        public function getHeaderMenus() 
        {
            $urlPath = $_SERVER['REQUEST_URI'];
            if (!empty($urlPath)) {

                $urlArray = explode('/', $urlPath);
                $urlSegment = $urlArray[1];

                $header = Header::get()->filter([
                    'UrlIdentifier' => $urlSegment
                ]);

                return $header;
            }

           return null;
        }

        public function getFooterMenus() 
        {
            $urlPath = $_SERVER['REQUEST_URI'];
            if (!empty($urlPath)) {

                $urlArray = explode('/', $urlPath);
                $urlSegment = $urlArray[1];

                $footer = Footer::get()->filter([
                    'UrlIdentifier' => $urlSegment
                ]);

                return $footer;
            }

           return null;
        }

        public function getFooterGroupMenus() 
        {
            $footer = FooterLinkGroup::get();
            return $footer;
        }

        public function getNavigationCategories() 
        {
           
            return;
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
}

