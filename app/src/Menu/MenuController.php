<?php

use SilverStripe\Core\Convert;
use SilverStripe\Admin\CMSMenu;
use SilverStripe\Admin\LeftAndMain;
use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\Admin\AdminRootController;

/**
 * Menu Controller Page
 *
 * @author   Jed
 * @since    21 July 2021
*/
class MenuController extends Controller 
{

  private static $allowed_actions = [
    'index',
  ];

  protected function init()
  {
    parent::init(); 
  }

  /**
   * Returns Bad Request
   *
   * @return void
   */
  public function index(HTTPRequest $request) 
  {
    $this->response->addHeader("X-Robots-Tag", "noindex");
    $this->response->addHeader('Content-Type', 'application/json');

    $menuItems = Page::get();

    $menu = [];
    if ($menuItems) {
      
      $allMenu = [];
      foreach ($menuItems as $menuItem) {
        $id = $menuItem->ID;
        $title = $menuItem->Title;
        $menuTitle = $menuItem->MenuTitle;
        $link = $menuItem->Link();
        $parentId = $menuItem->ParentID;
        $hasChildren = !empty($menuItem->Children()->items) ? true : false;

        if ($menuItem->ShowInMenus) {
          $allMenu[] = [
            "id" => $id,
            "title" => $menuTitle,
            "alt" => $title,
            "link" => $link,
            "parentid" => $parentId,
            "haschildren" => $hasChildren,
          ];
        }
      }

      $menu = [];
      foreach ($allMenu as $key => $item) {
        $id = $item['id'];
        $title = $item['alt'];
        $menuTitle = $item['title'];
        $link = $item['link'];
        $hasChildren = $item['haschildren'];

        $children = !empty($hasChildren) ? $this->getChildren($id, $allMenu) : [];
        if ($item['parentid'] == 0) {
          $menu[] = [
            "title" => $menuTitle,
            "alt" => $title,
            "link" => $link,
            "children" => $children,
          ];
        }
      }
    }

    return Convert::array2json([
      'menus' => $menu,
    ]);

  }

  public function getChildren($parentId, $childItems) 
  {

    $children = [];

    foreach ($childItems as $child) {

      if ($child['link'] && $child['parentid'] == $parentId){
        $id = $child['id'];
        $title = $child['alt'];
        $menuTitle = $child['title'];
        $link = $child['link'];
        $hasChildren = $child['haschildren'];
        $subChildren = !empty($hasChildren) ? $this->getChildren($id, $childItems) : [];
 
        $children[] = [
          "title" => $menuTitle,
          "alt" => $title,
          "link" => $link,
          "children" => $subChildren,
        ];
      }
      
    }

    return $children;
  }

} 