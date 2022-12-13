<?php
ini_set('memory_limit','10000M');
ini_set('max_execution_time',360);
ini_set('display_errors', 1);
error_reporting(E_ALL);

use SilverStripe\Admin\CMSMenu;
use SilverStripe\View\SSViewer;
use SilverStripe\ORM\DataObject;
use SilverStripe\Control\Director;
use SilverStripe\ORM\DataExtension;
use SilverStripe\Security\Security;
use SilverStripe\View\Requirements;
use SilverStripe\Core\Config\Config;
use SilverStripe\Control\Email\Email;
use Wilr\GoogleSitemaps\GoogleSitemap;
use SilverStripe\View\Parsers\ShortcodeParser;
use SilverStripe\Forms\HTMLEditor\TinyMCEConfig;
use SilverStripe\Forms\HTMLEditor\HtmlEditorConfig;
use Maverick\HTMLEditorSrcset\ImageShortcodeHandler;
use Maverick\Gallery\ImageGallery;

use Dynamic\Elements\Admin\TestimonialsAdmin;
use Dynamic\Elements\Sponsors\Admin\SponsorsAdmin;

use Maverick\Mammals\Mammal;


global $__offset, $collection;
$collection =[];

// Removing from Left Menu
CMSMenu::remove_menu_class(CampaignAdmin::class);
CMSMenu::remove_menu_class(TestimonialsAdmin::class);
CMSMenu::remove_menu_class(SponsorsAdmin::class);
// Temporary Removal
CMSMenu::remove_menu_class(CategoryAdmin::class);
CMSMenu::remove_menu_class(CompanyAdmin::class);

if(Director::isLive()) {
   Config::modify()->set(Email::class, 'admin_email', "no-rely@southpacifichelicopters.co.nz");
} else {
   Config::modify()->set(Email::class, 'admin_email', "no-rely@southpacifichelicopters.co.nz");
}

//Security::config()->set('default_reset_password_dest','operator-admin');
Security::config()->set('default_reset_password_dest', 'operator-admin');
//if(Director::isLive()) {
   // Config::inst()->update('Email', 'bcc_all_emails_to', "client@example.com");
//} else {
//}

// Director::set_environment_type('dev');

ShortcodeParser::get('default')->register('social_icons', ['Page', 'socialIcons_func']);
ShortcodeParser::get('default')->register('stories', ['Page', 'stories_func']);
ShortcodeParser::get('default')->register('itineraries', ['Page', 'itineraries_func']);
ShortcodeParser::get('default')->register('add_top_destinations', ['Page', 'add_top_destinations_func']);

// taken from bigfork -  img scrscet
ShortcodeParser::get('default')->register('image', [ImageShortcodeHandler::class, 'handle_shortcode']);

// read more shortcode
ShortcodeParser::get('default')->register('readmore', ['Page', 'readmore_func']);
ShortcodeParser::get('default')->register('product_link', ['Page', 'product_link_func']);
ShortcodeParser::get('default')->register('list_subpages', ['Page', 'list_subpages_func']);
ShortcodeParser::get('default')->register('eventfinda', ['Page', 'eventfinda_func']);
ShortcodeParser::get('default')->register('email_direct_link', ['Page', 'email_direct_link_func']);
ShortcodeParser::get('default')->register('staff', ['Page', 'staff_member_func']);
ShortcodeParser::get('default')->register('add_booking_button', ['Page', 'add_booking_button_func']);
ShortcodeParser::get('default')->register('add_gallery', ['Page', 'add_gallery_func']);
ShortcodeParser::get('default')->register('faqs', ['Page', 'add_faqs_func']);


ShortcodeParser::get('default')->register('add_mammals', ['Maverick\Mammals\Mammal', 'add_mammals_func']);

/* REQUIREMENTS */

Requirements::set_force_js_to_bottom(true);
/*
HtmlEditorConfig::get('cms')->setOption(
   'extended_valid_elements',
   'script[src|async|defer|type|charset],small,iframe' 
);
*/
HtmlEditorConfig::get('cms')->setOption(
   'extended_valid_elements',
   'img[class|src|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name|usemap],' .
   'iframe[src|name|width|height|title|align|allowfullscreen|frameborder|marginwidth|marginheight|scrolling],' .
   'object[classid|codebase|width|height|data|type],' .
   'embed[src|type|pluginspage|width|height|autoplay],' .
   'param[name|value],' .
   'map[class|name|id],' .
   'area[shape|coords|href|target|alt],' .
   'ol[start|type],'.
   'script[src|async|defer|type|charset],'.
   'small'
);


HtmlEditorConfig::get('cms')->setOption('image_size_presets', [
   [
       'width' => 600,
       'text' => 'Small fit',
       'name' => 'smallfit',
       
   ],
   [
       'width' => 900,
       'i18n' =>  TinyMCEConfig::class . '.BEST_FIT',
       'text' => 'Best fit',
       'name' => 'bestfit',
       'default' => true
   ],
   [
       'i18n' =>  TinyMCEConfig::class . '.ORIGINAL_SIZE',
       'text' => 'Original size',
       'name' => 'originalsize'
   ]
]);
TinyMCEConfig::get('cms')->setOption(
   'extended_valid_elements',
   'img[class|src|alt|title|hspace|vspace|width|height|align|onmouseover|onmouseout|name|usemap],' .
   'iframe[src|name|width|height|title|align|allowfullscreen|frameborder|marginwidth|marginheight|scrolling],' .
   'object[classid|codebase|width|height|data|type],' .
   'embed[src|type|pluginspage|width|height|autoplay],' .
   'param[name|value],' .
   'map[class|name|id],' .
   'area[shape|coords|href|target|alt],' .
   'ol[start|type],'.
   'script[src|async|defer|type|charset],'.
   'small'
);


$formats = [
   
 
   ['title'=>'Lead Paragraph','selector'=> 'p','classes'=>'lead'],
   ['title'=>'Button','selector'=> 'a','classes'=>'button'],
   ['title'=>'Small','inline' => 'small','merge_siblings' => true],
   ['title'=>'Alt Heading','selector'=> 'a,span,p,h1,h2,h3,h4,h5,h6', 'classes'=> 'likewise'],
   [
      'title' => 'Blue',
      'selector' => 'a,span,p,h1,h2,h3,h4,h5,h6,td,th,div,li',   // don't forget p-tag, or automatic span-generation won't work
      'classes' => 'blue',
   ],
  [
   'title' => 'Green',
   'selector' => 'a,span,p,h1,h2,h3,h4,h5,h6,td,th,div,li',   // don't forget p-tag, or automatic span-generation won't work
   'classes' => 'green',
]    
   
 ];
 

 TinyMCEConfig::get('cms')
 ->addButtonsToLine(2, 'styleselect')
 ->setOptions([
     'importcss_append' => true,
     'style_formats' => $formats,
 ]);

 TinyMCEConfig::get('cms')->enablePlugins('hr');
 TinyMCEConfig::get('cms')->addButtonsToLine(1, 'hr');

 TinyMCEConfig::get('cms')->addButtonsToLine(1, 'blockquote');

