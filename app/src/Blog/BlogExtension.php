<?php

namespace Maverick\Blog;

use SilverStripe\Core\Convert;
use SilverStripe\ORM\DataList;
use SilverStripe\Blog\Model\Blog;
use SilverStripe\Forms\FieldList;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Control\Controller;
use SilverStripe\Blog\Model\BlogPost;

class BlogExtension extends DataExtension {

  public function updateBlogCMSFields(FieldList $fields) 
  {

      $fields->removeByName('Blocks');
      $fields->removeByName('Tags');
      $fields->removeByName('DisplaySearchBlock');
      $fields->removeByName('SearchBarTitle');
      $fields->removeByName('Categories');
      $fields->removeByName('Categorisation');
      
  }

  public function __updateGetBlogPosts(DataList &$blogPosts) 
  {

      $blogPosts = BlogPost::get()
		    ->sort(array('Featured' => 'DESC', 'PublishDate' => 'DESC'));
  
  }


    public function updateSocialTitle(&$title)
    {
      if(Controller::has_curr() && Controller::curr()->getRequest()->getVar('start')) {
        $paginatedList = $this->owner->PaginatedList_Crowdriff();
        $title = 'Page ' . $paginatedList->CurrentPage() . ' of ' . $paginatedList->TotalPages() .
        ' ' . $title;
      }
    }

    public function MetaDescription()
    {
      if(Controller::has_curr() && Controller::curr()->getRequest()->getVar('start')) {
        return '';
      }
      return $this->owner->MetaDescription;
    }

    public function Setting($id) 
    {
      $settingData = [];
      $pageFilter = [];

      // foreach (array(
      //     'Tags' => 'tags',
      //     'Categories' => 'categories',
      // ) as $k => $v) {
      //     if($this->{$k}()->count()) {
      //         $pageFilter[$v] = array();
      //         foreach($this->{$k}() as $item) {
      //             $pageFilter[$v][] = array(
      //                 'ID' => $item->ID,
      //                 'Title' => $item->Title
      //             );
      //         }
      //     }
      // }

      $blogs = Blog::get()->byId($id);
      
      $blogsCategories = $blogs->Categories();
      foreach ($blogsCategories as $category) {
        $pageFilter['categories'][] = array(
          'ID' => $category->ID,
          'Title' => $category->Title
        );
      }

      $blogsTags = $blogs->Tags();
      foreach ($blogsTags as $category) {
        $pageFilter['tags'][] = array(
          'ID' => $category->ID,
          'Title' => $category->Title
        );
      }
      

      $settingData['pageFilter'] = $pageFilter;
      $settingData['pageId'] = $id;

      return Convert::array2json($settingData);
    }

}