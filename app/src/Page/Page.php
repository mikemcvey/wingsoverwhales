<?php

namespace {

use SilverStripe\TagField\TagField;
use DNADesign\Elemental\Models\ElementContent;
//use Maverick\Staff\ElementStaffMembers;
use Dynamic\Elements\StaffMembers\Elements\ElementStaffMembers;


use Maverick\Faq\FaqQuestion;

use SilverStripe\Blog\Model\BlogPost;
use Maverick\Blog\BlogPostGalleryImage;
use Maverick\Gallery\ImageGallery;
use Maverick\Gallery\ImageGalleryImage;
use Maverick\Experiences\GalleryImage;

    use SilverStripe\Forms\HTMLEditor\HTMLEditorField;
    use SilverStripe\ORM\DataObject;
    use SilverStripe\ORM\FieldType\DBField;
    use SilverStripe\Core\Injector\Injector;

    use SilverStripe\CMS\Model\SiteTree;
    use SilverStripe\Forms\GridField\GridField;
    use SilverStripe\Forms\GridField\GridFieldConfig;
    use SilverStripe\Forms\DropdownField;
    use SilverStripe\View\ArrayData;
    use SilverStripe\ORM\ArrayList;
    use SilverStripe\Assets\Image; 
    use SilverStripe\AssetAdmin\Forms\UploadField;
    use Silverstripe\SiteConfig\SiteConfig;
    use SilverStripe\View\HTML;


    use SilverStripe\View\Parsers\ShortcodeParser;
    use SilverStripe\Forms\TextField;
    use SilverStripe\Forms\TextareaField;
    use SilverStripe\Forms\CheckboxField;

    use SilverStripe\Forms\GridField\GridFieldConfig_RecordEditor;
    
    use SilverStripe\CMS\Controllers\ContentController;
    use SilverStripe\Forms\GridField\GridFieldButtonRow;
    use SilverStripe\Forms\GridField\GridFieldToolbarHeader;
    use SilverStripe\Forms\GridField\GridFieldDeleteAction;
    use SilverStripe\Forms\GridField\GridFieldAddNewButton;
    use SilverStripe\Forms\GridField\GridFieldSortableHeader;
    use SilverStripe\Forms\GridField\GridFieldSortableRows;
    use SilverStripe\Forms\GridField\GridFieldDataColumns;
    
    use Symbiote\GridFieldExtensions\GridFieldAddNewInlineButton;
    use Symbiote\GridFieldExtensions\GridFieldTitleHeader;
    use Symbiote\GridFieldExtensions\GridFieldEditableColumns;
    use SilverStripe\Control\Director;
    use SilverStripe\Control\Controller;    
    use SilverStripe\Control\HTTPRequest;
    use SilverStripe\Control\Session;
  

    use Symbiote\GridFieldExtensions\GridFieldOrderableRows;


    class Page extends SiteTree
    {

        private static $db = [  
            'Byline' => 'Varchar',
            'Teaser' => 'Varchar',     
            'HideSubpageFooter' => 'Boolean'

        ];

        private static $casting = [
            'socialIcons_func' => 'HTMLText',
            'MyShortCodeMethod' => 'HTMLText',
            'stories_func' => 'HTMLText',
            'product_link_func' => 'HTMLText',
            'Weather' => 'HTMLText',
            'eventfinda_func' =>'HTMLText', 
            'staff_member_func' => 'HTMLText', 
            'SurveyButton' => 'HTMLText',
            'AddImage'=> 'HTMLText',
            'add_gallery_func' => 'HTMLText',
            'add_booking_button_func' =>'HTMLText',
            'starRatingFunc' =>'HTMLText'
            
        ];
      
        private static $has_one = [
            'FeaturedImage' => Image::class,
        ];

        private static $has_many = array(
            'Banners' => Banner::class,
        );
        
        private static $belongs_many_many = [
            'ElementStaffMembers' => ElementStaffMembers::class,
        ];
        
        private static $many_many = [
            "ElementContent" => ElementContent::class,
        ];

        private static $owns = [
            "Banners", "FeaturedImage"
        ];

        public function getCMSFields()
        {
            $fields = parent::getCMSFields();

            $fields->addFieldToTab('Root.Banners', GridField::create(
                'Banners',
                'Banners on this page',
                $this->Banners(),
                GridFieldConfig_RecordEditor::create()
                ->addComponent(new GridFieldOrderableRows('SortID'))
            ));
            $fields->insertAfter(TextField::create('Byline'), 'MenuTitle');
            $fields->insertAfter(TextareaField::create('Teaser'), 'Byline');
            
            $fields->insertAfter(UploadField::create('FeaturedImage'), 'Teaser');
        
          
            /*$fields->addFieldToTab(
                'Root.Main',
                UploadField::create('FeaturedImage'), 'MenuTitle'
            );
            $fields->addFieldToTab(
                'Root.Main',
                TextField::create('Byline'), 'MenuTitle'
            );
            $fields->addFieldToTab(
                'Root.Main',
                TextareaField::create('Teaser'), 'MenuTitle'
            );
            ;*/
            $fields->addFieldToTab('Root.Footer', new CheckboxField('HideSubpageFooter'));

    

            return $fields;
        }

        

        public static function MyShortCodeMethod($arguments, $content = null, $parser = null, $tagName) 
        {
            return "<em>" . $tagName . "</em> " . $content . "; " . count($arguments) . " arguments.";
        }

        public static function staff_member_func($arguments, $content = null, $parser = null, $tagName) 
        {
            return "<em>" . $tagName . "</em> " . $content . "; " . count($arguments) . " arguments.";

        }
        
        public static function socialIcons_func($arguments= null, $content = null, $parser = null, $tagName) 
        {
            $options = array(
                'facebook' 		=> array(
                    'key' 		=> 'facebook_site',
                    'icon' 		=> '<svg height="24" viewBox="0 0 48 48" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m27.3303691 44h-8.8883949v-18.8883948h-4.4419742v-7.2765674h4.4419742v-4.3686083c0-5.93374831 2.5077812-9.4664295 9.6309471-9.4664295h5.9337483v7.2787906h-3.7060916c-2.7745664 0-2.9590929 1.0182303-2.9590929 2.9146287l-.011116 3.6416185h6.7185415l-.7870164 7.2765674h-5.9315251z" fill-rule="evenodd"/></svg>',
                ),
                'twitter' 		=> array(
                    'key' 		=> 'twitter_site',
                    'prepend' 	=> 'https://twitter.com/',
                    'icon' 		=> '<svg height="24" viewBox="0 0 48 48" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m46 10.2625813c-1.6182207.7220984-3.358458 1.210165-5.184707 1.4321953 1.8642542-1.1261536 3.2944492-2.90639637 3.9685412-5.02868577-1.7462382 1.04214211-3.6745011 1.79824522-5.7327818 2.20430059-1.6462245-1.76624085-3.9905441-2.87039142-6.5888985-2.87039142-4.98668 0-9.027231 4.0705551-9.027231 9.0892394 0 .7140974.080011 1.4061918.234032 2.0722826-7.5010229-.3780515-14.15393012-3.996545-18.60453702-9.49529479-.77810611 1.34018275-1.22216666 2.90239579-1.22216666 4.56862299 0 3.1524299 1.59421739 5.9348093 4.01454743 7.5630313-1.48020184-.0480065-2.87039141-.4560622-4.08855753-1.1361549v.1160158c0 4.4026004 3.11042415 8.0751012 7.24298768 8.9112152-.7581034.2060281-1.55421193.3200436-2.37832431.3200436-.58207938 0-1.14815657-.0580079-1.69823158-.1660226 1.14815657 3.6104923 4.48261129 6.2388507 8.43114969 6.3128608-3.0884211 2.4383325-6.98095194 3.8905306-11.21152883 3.8905306-.72809929 0-1.44819748-.044006-2.15429377-.1260172 3.99454471 2.5783516 8.7391917 4.0825567 13.837887 4.0825567 16.6042642 0 25.6835023-13.8498886 25.6835023-25.8595263 0-.3940537-.0100014-.7841069-.0260036-1.1741601 1.7642406-1.2821749 3.2944493-2.8823931 4.5046143-4.7046416z" fill-rule="evenodd"/></svg>',
                ),
                'instagram' 	=> array(
                    'key' 		=> 'instagram_url',
                    'icon' 		=> '<svg height="24" viewBox="0 0 48 48" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m31.9591786 4c6.6394276 0 12.0408214 5.26122862 12.0408214 11.7279466v16.5441068c0 6.4668388-5.4013938 11.7279466-12.0408214 11.7279466h-15.9182332c-6.63942762 0-12.0409454-5.2611078-12.0409454-11.7279466v-16.5441068c0-6.46671798 5.40151778-11.7279466 12.0409454-11.7279466zm7.6928228 28.2720534v-16.5441068c0-4.1315881-3.4509697-7.49285141-7.6928228-7.49285141h-15.9182332c-4.2418531 0-7.69282279 3.36126331-7.69282279 7.49285141v16.5441068c0 4.1315881 3.45096969 7.4928514 7.69282279 7.4928514h15.9182332c4.2418531 0 7.6928228-3.3612633 7.6928228-7.4928514zm-15.5744383-19.4380664c3.5180547.1000046 6.4521849 1.2699851 8.4849462 3.3837282 1.9316998 2.008545 2.91615 4.700696 2.847081 7.7851352-.066341 2.9544816-1.2643222 5.7223606-3.3730966 7.7937104-2.1422548 2.1043224-4.9962799 3.2633121-8.0364317 3.2633121-6.2914786 0-11.4100243-4.9854915-11.4100243-11.1135468 0-6.2362728 5.1788106-11.2920573 11.4875254-11.1123391zm6.0187987 11.0558148c.0266604-1.1878558-.1967908-2.8693329-1.4125044-4.1333998-1.043351-1.0849525-2.6897227-1.6894485-4.7612965-1.7483884-.0558008-.0015701-.1112296-.0022947-.1665344-.0022947-1.5429542 0-3.0028273.6166946-4.1109072 1.7364313-1.1224642 1.1344716-1.7407371 2.6275344-1.7407371 4.2041759 0 3.2738197 2.7344874 5.9372254 6.0956798 5.9372254 3.3430881 0 6.0210307-2.6327279 6.0962998-5.9937497zm4.6846386-12.8765373c1.3559596 0 2.4551114 1.0705799 2.4551114 2.3912919 0 1.3205912-1.0991518 2.3911711-2.4551114 2.3911711-1.3559595 0-2.4551113-1.0705799-2.4551113-2.3911711 0-1.320712 1.0991518-2.3912919 2.4551113-2.3912919z" fill-rule="evenodd"/></svg>',
                ),
                'linkedin' 		=> array(
                    'key' 		=> 'linkedin_url',
                    'icon' 		=> '<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m5.2 21.6v-14.5h-4.8v14.5zm-2.4-16.5c1.7 0 2.7-1.1 2.7-2.5s-1-2.5-2.7-2.5c-1.6 0-2.7 1.1-2.7 2.5s1 2.5 2.7 2.5zm5.1 16.5h4.8v-8.1c0-.4 0-.9.2-1.2.3-.9 1.1-1.8 2.5-1.8 1.7 0 2.4 1.3 2.4 3.3v7.8h4.8v-8.3c0-4.5-2.4-6.5-5.5-6.5-2.6 0-3.7 1.5-4.4 2.4v-2.1h-4.8z" fill-rule="evenodd" transform="translate(.5 1)"/></svg>',
                ),
                'myspace' 		=> array(
                    'key' 		=> 'myspace_url',
                    'icon' 		=> '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M19.803 12.274c2.108 0 3.818-1.703 3.818-3.804s-1.71-3.795-3.818-3.795c-2.109 0-3.818 1.71-3.818 3.81 0 2.101 1.709 3.811 3.818 3.811v-.022zm-8.603.705c1.897 0 3.436-1.533 3.436-3.424S13.098 6.13 11.2 6.13 7.764 7.676 7.764 9.566C7.764 11.457 9.299 13 11.2 13v-.021zm-7.8.635c1.71 0 3.093-1.38 3.093-3.081 0-1.704-1.395-3.084-3.105-3.084C1.681 7.449.3 8.829.3 10.539c0 1.7 1.387 3.078 3.095 3.078l.005-.003zm0 .705c-1.96 0-3.4 1.717-3.4 3.495v1.196c0 .17.138.31.31.31h6.18c.171 0 .309-.14.309-.31v-1.196c0-1.779-1.437-3.5-3.398-3.5l-.001.005zm7.8-.56c-2.179 0-3.78 1.915-3.78 3.891v1.331c0 .188.156.344.345.344h6.871c.188 0 .342-.155.342-.344V17.65c0-1.976-1.598-3.891-3.778-3.891zm8.603-.617c-2.422 0-4.197 2.126-4.197 4.323v1.477c0 .21.172.381.382.381h7.63c.21 0 .383-.171.383-.381v-1.477c-.001-2.197-1.776-4.323-4.198-4.323z"/></svg>',
                ),
                'pinterest' 	=> array(
                    'key' 		=> 'pinterest_url',
                    'icon' 		=> '<svg height="24" viewBox="0 0 48 48" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m21.5273456 30.4552531c-1.1118822 5.5053449-2.4682375 10.7850224-6.4855878 13.5447469-1.2411708-8.323837 1.8217943-14.5743545 3.2439692-21.2103872-2.4235741-3.8598532.2914871-11.624223 5.4042647-9.7107513 6.2904795 2.353053-5.448928 14.3439856 2.4329769 15.8437337 8.2274582 1.5632171 11.5866118-13.5000835 6.4855878-18.3989472-7.3718026-7.07326331-21.4619124-.1621984-19.7294447 9.9646272.4231264 2.4776403 3.1264341 3.2275143 1.081323 6.6454355-4.71785955-.9896456-6.12828095-4.508647-5.94492617-9.2006489.29148709-7.6773938 7.29658007-13.05345008 14.32282937-13.79862273 8.8856548-.94028093 17.2259467 3.08647217 18.3777908 10.98953343 1.295237 8.9209154-4.0102982 18.582302-13.5141877 17.8864941-2.5740191-.1904069-3.6553421-1.3963172-5.6745954-2.5552135" fill-rule="evenodd"/></svg>',
                ),
                'youtube' 		=> array(
                    'key' 		=> 'youtube_url',
                    'icon' 		=> '<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="m24.0041653 8.22999954c0 1.85174986 0 3.77208316-.4114999 5.55524966-.2743334 1.2345-1.3030833 2.1946666-2.5375832 2.3318332-2.9490832.3429167-5.8981664.3429167-8.8472495.3429167-2.94908321 0-5.89816638 0-8.84724955-.3429167-1.23449993-.1371666-2.26324988-1.0287499-2.5375832-2.3318332-.41149997-1.7831665-.41149997-3.7034998-.41149997-5.55524966 0-1.85174989 0-3.77208312.41149997-5.55524969.34291665-1.23449993 1.37166659-2.19466654 2.60616653-2.3318332 2.88049984-.34291665 5.82958301-.34291665 8.77866622-.34291665 2.9490831 0 5.8981663 0 8.8472495.34291665 1.2344999.13716666 2.2632498 1.02874994 2.5375832 2.3318332.4114999 1.78316657.4114999 3.7034998.4114999 5.55524969zm-14.74541581 5.62383306 7.88708291-5.4866664-7.88708291-5.48666636z" fill-rule="evenodd" transform="translate(0 3.77)"/></svg>',
                ),
                'googleplus' 	=> array(
                    'key' 		=> 'google_plus_url',
                    'icon' 		=> '<svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg"><path d="M7.635 10.909v2.619h4.335c-.173 1.125-1.31 3.295-4.331 3.295-2.604 0-4.731-2.16-4.731-4.823 0-2.662 2.122-4.822 4.728-4.822 1.485 0 2.479.633 3.045 1.178l2.073-1.994c-1.33-1.245-3.056-1.995-5.115-1.995C3.412 4.365 0 7.785 0 12s3.414 7.635 7.635 7.635c4.41 0 7.332-3.098 7.332-7.461 0-.501-.054-.885-.12-1.265H7.635zm16.365 0h-2.183V8.726h-2.183v2.183h-2.182v2.181h2.184v2.184h2.189V13.09H24"/></svg>',
                ),
                'tripadvisor' 	=> array(
                    'key' 		=> 'tripadvisor_url',
                    'icon' 		=> '<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" version="1.1" id="Capa_1" x="0px" y="0px" width="24" viewBox="0 0 98.566 98.566"  xml:space="preserve" >
                    
                        <path d="M60.401,20.996c2.751,0.389,5.445,1.08,8.107,1.898c4.647,1.431,9.032,3.419,13.156,5.998    c0.287,0.178,0.67,0.291,1.008,0.291c4.844,0.02,9.686,0.013,14.526,0.017c0.39,0,0.778,0.041,1.167,0.063    c0,0.095,0.014,0.135-0.002,0.157c-0.226,0.348-0.455,0.691-0.682,1.038c-1.643,2.52-3.047,5.156-3.876,8.07    c-0.09,0.313-0.109,0.575,0.103,0.882c4.312,6.192,5.688,12.99,3.886,20.318c-1.58,6.427-5.264,11.438-10.862,14.986    c-4.001,2.537-8.421,3.745-13.143,3.771c-1.984,0.012-3.958-0.255-5.896-0.757c-4.722-1.225-8.77-3.579-12.106-7.144    c-0.44-0.468-0.854-0.957-1.323-1.486c-1.764,2.629-3.5,5.215-5.278,7.869c-1.771-2.646-3.483-5.207-5.191-7.758    c-0.118,0.062-0.152,0.069-0.175,0.091c-0.039,0.032-0.072,0.071-0.103,0.108c-4.035,4.765-9.111,7.686-15.295,8.663    c-3.44,0.545-6.847,0.349-10.188-0.572c-4.735-1.301-8.759-3.799-12.01-7.485c-3.177-3.604-5.153-7.788-5.895-12.545    c-0.849-4.44,0.185-8.721,0.443-9.76c0.748-3.02,2.052-5.793,3.842-8.343c0.126-0.181,0.17-0.501,0.11-0.717    c-0.73-2.677-1.988-5.112-3.461-7.444c-0.374-0.593-0.822-1.142-1.236-1.711c0-0.065,0-0.132,0-0.198    c0.083,0.01,0.165,0.026,0.246,0.026c4.956,0.002,9.911,0.004,14.867-0.006c0.216,0,0.456-0.089,0.64-0.207    c3.482-2.234,7.192-4.004,11.09-5.382c2.811-0.992,5.681-1.766,8.608-2.333c2.834-0.548,5.683-0.934,8.562-1.124    C51.059,19.73,56.669,20.473,60.401,20.996z M54.188,53.727c0,10.883,8.83,19.774,19.674,19.732    c10.885-0.039,19.675-8.68,19.667-19.683c-0.008-11.339-9.206-19.863-20.089-19.642C62.696,34.357,54.286,43.017,54.188,53.727z     M24.677,34.059C14.091,33.967,4.861,42.802,5.046,54.056c0.172,10.495,8.822,19.392,19.851,19.297    c10.784-0.092,19.452-8.898,19.472-19.562C44.386,42.835,35.612,34.059,24.677,34.059z M25.653,28.925    c5.98,0.365,11.233,2.449,15.671,6.485c4.429,4.028,7.024,9.053,7.967,14.962c0.97-5.839,3.497-10.817,7.843-14.805    c4.353-3.992,9.536-6.087,15.418-6.53c-6.98-3.103-14.34-4.421-21.916-4.567C42.026,24.301,33.651,25.57,25.653,28.925z" />
                        <path d="M73.822,41.311c6.735-0.011,12.19,5.415,12.19,12.143c0,6.754-5.362,11.975-11.688,12.216    c-7.065,0.271-12.718-5.358-12.716-12.186C61.614,46.578,67.307,41.197,73.822,41.311z M81.766,53.484    c-0.003-4.39-3.552-7.958-7.912-7.958c-4.41,0-8,3.549-8.018,7.926c-0.016,4.358,3.592,7.984,7.961,7.996    C78.173,61.465,81.768,57.866,81.766,53.484z"/>
                        <path d="M24.417,41.311c6.731-0.007,12.194,5.429,12.177,12.156c-0.019,6.809-5.386,11.916-11.601,12.199    c-7.093,0.324-12.816-5.33-12.803-12.195C12.204,46.516,17.936,41.195,24.417,41.311z M32.352,53.457    c-0.013-4.417-3.585-7.938-8.044-7.93c-4.301,0.008-7.905,3.638-7.895,7.955c0.011,4.367,3.611,7.958,7.992,7.97    C28.759,61.462,32.363,57.836,32.352,53.457z" />
                        <path d="M73.828,49.443c2.232-0.002,4.062,1.829,4.041,4.048c-0.022,2.224-1.821,4.026-4.016,4.027    c-2.26,0-4.077-1.786-4.072-3.999C69.785,51.223,71.55,49.445,73.828,49.443z" />
                        <path d="M24.396,49.407c2.266-0.002,4.087,1.808,4.096,4.067c0.009,2.24-1.829,4.079-4.084,4.084    c-2.309,0.005-4.09-1.779-4.088-4.1C20.32,51.179,22.097,49.41,24.396,49.407z" />
                    </svg>',
                )
                
            );
            $config = SiteConfig::current_site_config(); 
            ob_start(); ?>
            <ul class="social-links">
            <?php
            if($config->FacebookLink){ ?>
                <li><a href="<?php echo$config->FacebookLink; ?>" target="_blank"><?php echo $options['facebook']['icon']; ?></a></li>
            <?php }
            if($config->Instagram){ ?>
                <li><a href="<?php echo $config->Instagram; ?>" target="_blank"><?php echo $options['instagram']['icon']; ?></a></li>
            <?php }
            if($config->TwitterLink){ ?>
                <li><a href="<?php echo $config->TwitterLink; ?>" target="_blank"><?php echo $options['twitter']['icon']; ?></a></li>
            <?php }
            if($config->GoogleLink){ ?>
                <li><a href="<?php echo $config->GoogleLink; ?>" target="_blank"><?php echo $options['googleplus']['icon']; ?></a></li>
            <?php }
            if($config->YouTubeLink){ ?>
                <li><a href="<?php echo $config->YouTubeLink; ?>" target="_blank"><?php echo $options['youtube']['icon']; ?></a></li>
            <?php }
            if($config->LinkedInLink){ ?>
                <li><a href="<?php echo $config->LinkedInLink; ?>" target="_blank"><?php echo $options['linkedin']['icon']; ?></a></li>
            <?php }
            if($config->TripAdvisorLink){ ?>
                <li><a href="<?php echo $config->TripAdvisorLink; ?>" target="_blank"><?php echo $options['tripadvisor']['icon']; ?></a></li>
            <?php } ?>
            </ul>
            <?php

            return ob_get_clean();
        
        }

        public static function stories_func($arguments, $content = null, $parser = null, $tagName) 
        {
            $stories = Page::get()->filter(["ParentID" => 4]);

            ob_start(); 
            //echo "<pre>" . $tagName . "</em> " . $content . "; " . count($arguments) . " arguments.</pre>";
            if (isset($arguments['type'])  && $arguments['type'] = "nav"){
            
                    echo "<ul>";
                    foreach($stories as $child) {
                        
                            if($child->Link() && $child->ShowInMenus){
                            echo '<li><a href="'.$child->Link().'" title="Read more about - '.$child->Title.'">'.$child->Title.'</a></li>';
                            }
                        }
                        echo "</ul>";
                    
                
            }else{
        
            
            ?>
            <div class="features">
                <div class="grid blog grid-center"><?php
                    foreach($stories as $story) { ?>
                    <article class="tile col col-4">
                    <div class="blog_wrap">
                            <?php 
                        //  print_r( $story->FeaturedImage);
                        // echo $story->FeaturedImage->ScaleWidth(1920)->Link();
                            if($story->FeaturedImage){ ?>
                            <div class="bg-image">
                                <img  src="<?php echo $story->FeaturedImage->Fill(500,600)->URL; ?>" data-src="<?php echo $story->FeaturedImage->Fill(500,600)->URL; ?>" class="lazyload blur-up" style="object-position:<?php echo  $story->FeaturedImage->PercentageX.'%  '.$story->FeaturedImage->PercentageY; ?>%" alt="<?php echo $story->Title; ?>">
                            </div>
                            <?php } ?>
                            <div class="tile-copy blog__title">
                            <?php
                            echo "<h3>".$story->Title."</h3>";
                            ?>
                            <p class="meta"><?php echo $story->Teaser; ?></p>
                        
                            </div>
                            <a href="<?php echo $story->Link(); ?>" class="link-overlay" title="Read more about $Title"></a>
                        </div>
                        </article>
                    <?php
                    //  $story->Title;
                    } ?>
                </div>
            </div>
            <?php
            }
            return ob_get_clean();
        }
  
        public static function product_link_func($id)
        {
            $link = ApiProduct::get()->byID($id)->AbsoluteLink();
            $link = str_replace(array("https://","http://"), array('',''),$link);
            return $link;
        }
    
        public function MetaTags($includeTitle = true)
        {
            $tags = [];
            $tagsArray = $this->MetaComponents();
            if (!$includeTitle || strtolower($includeTitle) == 'false') {
                unset($tagsArray['title']);
            }
            foreach ($tagsArray as $tagProps) {
                $tag = array_merge([
                    'tag' => 'meta',
                    'attributes' => [],
                    'content' => null,
                ], $tagProps);
                $tags[] = HTML::createTag($tag['tag'], $tag['attributes'], $tag['content']);
            }

            $tagString = implode("\n", $tags);
            if ($this->ExtraMeta) {
                $tagString .= $this->obj('ExtraMeta')->forTemplate();
            }

            $this->extend('MetaTags', $tagString);

            return $tagString;
        }

        public function PreviousPage()
        {    
            $allPages = SiteTree::get();
            $allPagesBeforeTheCurrentPage = $allPages->filter(['ParentID' => $this->ParentID, 'Sort:LessThan' => $this->Sort, 'ShowInMenus' => true]);
            $prevPageBeforeTheCurrentPage = $allPagesBeforeTheCurrentPage->first();
            return $prevPageBeforeTheCurrentPage;
            //return  Page::get()->filter(['ID:LessThan'=>$this->ID,'ShowInMenus' => 1])->sort(array('ID' => 'DESC'))->first();
        }

        public function NextPage()
        {    
           //                            if($child->Link() && $child->ShowInMenus){

            $allPages = SiteTree::get();
            $allPagesAfterTheCurrentPage = $allPages->filter(['ParentID' => $this->ParentID, 'Sort:GreaterThan' => $this->Sort, 'ShowInMenus' => true]);
            $nextPageAfterTheCurrentPage = $allPagesAfterTheCurrentPage->first();
            return $nextPageAfterTheCurrentPage;
            //return  Page::get()->filter(['ID:GreaterThan' => $this->ID,'ShowInMenus' => 1])->sort(array('ID' => 'ASC'))->first();
        }

        /*
                // add this function:
    public function NextPage() {
        $allPages = SiteTree::get();
        $allPagesAfterTheCurrentPage = $allPages->filter(['ParentID' => $this->ParentID, 'Sort:GreaterThan' => $this->Sort]);
        $nextPageAfterTheCurrentPage = $allPagesAfterTheCurrentPage->first();
        return $nextPageAfterTheCurrentPage;
    }
    */

        function FacebookImageURL()
        {
            
            if ($this->FeaturedImage->URL){
                //echo "FEatured IMage";
                return $this->FeaturedImage->URL;
            } else {
            // echo "has banner: ".$this->Banners()->first()->HeroImage.'<br/>';
                if($this->Banners()){
                // echo $this->Banners()->first()->URL;
                if($this->Banners()->first()){
                        return $this->Banners()->first()->HeroImage->URL;
                }else{
                    return false;
                }
                }else{
                    return false;
                }
            }
        }

        function FeaturedImage()
        {
            
            // echo $this->FeaturedImage;
            if($this->FeaturedImage->URL){
                //echo "FEatured IMage";
                return $this->FeaturedImage;
            }else{
                // echo "has banner: ".$this->Banners()->first()->HeroImage.'<br/>';
                if($this->Banners()){
                    // echo $this->Banners()->first()->URL;
                    if($this->Banners()->first()){
                        return $this->Banners()->first()->HeroImage;
                    }else{
                        return  Image::get()->byId(16);
                        return false;
                    }
                }else{
                    return  Image::get()->byId(16);
                    return false;
                }
            }
        }
        
        public function FullTeaser(){
            if($this->Teaser){
                return DBField::create_field('HTMLText', $this->Teaser);
            }
            return;

        }
        public function Teaser()
        {
        
            if($this->Teaser){

                return DBField::create_field('HTMLText', $this->Teaser)->LimitCharactersToClosestWord(200);
            }
            if($this->owner->ClassName != 'Maverick\Products\ApiProduct'){
                if($this->ElementalArea()->Elements()){
                    //echo "Elements";
                    $elements =  $this->ElementalArea()->Elements();
                    $metaDescription = '';
                    foreach($elements as $element){
                        if($element->HTML){
                            
                            $metaDescription .= $element->dbObject('HTML');//->LimitCharactersToClosestWord(320);
                        }
                    }
                    if($metaDescription == ''){
                        $metaDescription = false;
                    }else{
                    $metaDescription  = str_replace("</h2>", ".</h2>", $metaDescription);
                    $metaDescription  = str_replace("</h3>", ".</h3>", $metaDescription);
                    $metaDescription  = str_replace("..", ".", $metaDescription);
                    //echo $metaDescription;
                    $metaDescription =  preg_replace('#<[^>]+>#', ' ',$metaDescription);
                    $metaDescription =  str_replace('&nbsp;', ' ',$metaDescription);
                    // run twice should improve..
                    $metaDescription =  preg_replace('!\s+!', ' ',$metaDescription);
                
                    return DBField::create_field('HTMLText', $metaDescription)->LimitCharactersToClosestWord(200);
                    }
                }
            
            }
            return false;
        }

        public static function itineraries_func($arguments, $content = null, $parser = null, $tagName) 
        {
            return null;
        }
       
        public static function list_subpages_func($arguments, $content = null, $parser = null, $tagName) 
        {
            
            ob_start(); 
           // echo "<pre>" . $tagName . "</em> " . $content . "; " . count($arguments) . " arguments. ".$arguments['slug']."</pre>";
            //print($arguments);

            if(isset($arguments['slug'])){
                /*
                if ($arguments['pageID'] == '834') {
                    $arguments['pageID'] = '1064';
                }
                */
            //$current_page = Page::get()->byID($arguments['slug']);
                //$current_page = Page::get()->byID(6);
              //echo $arguments['slug'];
                /*$current_page = Page::get()->filter([
                    'URLSegment' => $arguments['slug'],
                ])->first(); */
                $current_page = SiteTree::get()->filter([
                    'URLSegment' => $arguments['slug'],
                ])->first();
               // echo ' $current_page'.$current_page;
               // var_dump($current_page);
                }else{
                $current_page = Director::get_current_page();
            }
          // echo  $current_page->ID;

        // $current_page =  DataObject::get_one('Page', "SiteTree.ID=2" );

        // $current_page = Page::get()->byID(7);
            //$this->Children()->count();
            if(substr(Controller::curr()->getRequest()->getURL(), 0, 6) == 'admin/'){
                return ob_get_clean();
            }
           // if(null !== $current_page && $current_page->Children() &&  $current_page->URLSegment != 'home'  && $current_page->URLSegment != 'stories'){ 

   
            if(null !== $current_page && $current_page->Children()){ 
                
                if (!empty($current_page->Children())) { 
                    
                    if(isset($arguments['type']) &&  $arguments['type'] == "nav"){
                        echo "<ul>";
                        foreach ($current_page->Children() as $child) {
                        
                            if($child->Link() && $child->ShowInMenus){
                            echo '<li><a href="'.$child->Link().'" title="Read more about - '.$child->Title.'">'.$child->Title.'</a></li>';
                            }
                        }
                        echo "</ul>";
                    
                    
                    }else{
                    
                    ?>

            <div class="blog-entry inner pad-bot-40  pad-bot-40">
              <div class="features">
                  <div class="grid blog grid-center">
                      <?php
                  // $dataSet->merge($children);
                      foreach ($current_page->Children() as $child) {
                          if($child->ShowInMenus){
                              echo $child->renderWith('SilverStripe\Blog\Includes\PostSummary');
                          }
                      }
                      ?>



                  </div>
              </div>
          </div> 
        <?php   
                    }
                }
        } 

            // return $this->renderWith('SilverStripe\\Blog\\PostSummary');
            return ob_get_clean();
        
        }

        public static function add_top_destinations_func($arguments, $content = null, $parser = null, $tagName)
        {
           
            return null;
        }
   
        public static function readmore_func($arguments, $content = null, $parser = null, $tagName) 
        {
            $randomNumber = rand(10000,350000); 
            ob_start(); 
            $textAlign = 'text-left';
            if(isset($arguments['align'])){
            $textAlign =  $arguments['align'];
            }
            ?>
            <div class="readmore-toggle hidden readmore-<?php echo $randomNumber; ?>"  >
                <?php echo $content ?>
            </div>
            <p class="<?php echo $textAlign ?>">
            <a href="" data-target = ".readmore-<?php echo $randomNumber; ?>"  class="readmore  more button" title="Read More">+ Read More</a>
            </p>
            <?php
            return ob_get_clean();
        }
        public static function add_booking_button_func($arguments, $content = null, $parser = null, $tagName) 
        {
            ob_start(); 
            ?>
            <a href="/book-now" class="booking_but button">Book Now</a>
            <?php
            return ob_get_clean();
        }

        public static function add_gallery_func($arguments, $content = null, $parser = null, $tagName) 
        {
            ob_start(); 
            $galleryImages = new ArrayList();
            //echo Director::get_current_page()->ClassName;
            $currentPage = Director::get_current_page();
            $currentClass = $currentPage->ClassName;
            $currentID = $currentPage->ID;
         // echo $currentClass;
            // [add_gallery gallery="My Gallery Title"]
           

            if(isset($arguments['gallery'])){
               // $galleryImages = ImageGallery::get()->filter(['Title' => $arguments['gallery']])->first()->ID;
                $_galleryImages = ImageGalleryImage::get()->filter(['ImageGalleryID'=> ImageGallery::get()->filter(['Title' => $arguments['gallery']])->first()->ID]);
                foreach($_galleryImages as $Image){
                 $galleryImages->push(Image::get()->byID($Image->ImageID));
                }
            }else if(isset($arguments['blogpost'])){
                $galleryImages = BlogPost::get()->filter(['URLSegment' => $arguments['blogpost']])->first()->Images();
            }else if(isset($arguments['experiencepage'])){
                $galleryImages = ExperiencePage::get()->filter(['URLSegment' => $arguments['experiencepage']])->first()->Images();
            }else if('SilverStripe\Blog\Model\BlogPost' == $currentClass){
                $_galleryImages = BlogPostGalleryImage::get()->filter(['BlogPostID'=> $currentID]);
                foreach($_galleryImages as $Image){
                 $galleryImages->push(Image::get()->byID($Image->ImageID));
                };
                
            }else if('ExperiencePage' == $currentClass){
                $_galleryImages = GalleryImage::get()->filter(['ExperiencePageID'=> $currentID]);
                //echo ExperiencePage::get()->filter(['ID'=> $currentID])->Title;
                //foreach($_galleryImages as $Image){
                // $galleryImages->push(Image::get()->byID($Image->ImageID));
                //};
                $count =1;
                foreach($_galleryImages as $Image){
                    if($count == 1){
                    }else{
                        
                        $galleryImages->push(Image::get()->byID($Image->ImageID));
                    }
                    $count++;
                }
            }
          
            
/*
            if('SilverStripe\Blog\Model\BlogPost' == SiteTree::get()->filter(['URLSegment' => 'new-blog-post'])->first()->ClassName){
                $galleryImages=  BlogPost::get()->filter(['URLSegment' => 'new-blog-post'])->first()->Images();
            }else if('ExperiencePage' == SiteTree::get()->filter(['URLSegment' => 'new-blog-post'])->first()->ClassName){
                $galleryImages =  ExperiencePage::get()->filter(['URLSegment' => 'new-blog-post'])->first()->Images();
            }
            */

           $GalleryID = 'GalleryShortcode-'.rand(100000,1000000);
          

          
           $numImages = $galleryImages->Count();
           if($numImages%4==0){
            $class="four-column";
          }else if($numImages%3==0){
            $class="three-column";
          }else if($numImages%2==0){
            $class="two-column";
          }else{
            $class="three-column";
          }
         
           if(!isset($arguments['layout'])){
            $arguments['layout'] = '';
           }
            $arrayData = new SilverStripe\View\ArrayData([
               // 'Name' => 'John',
                'ID' =>  $GalleryID,
                'GalleryLayoutType' => $arguments['layout'],
                'GalleryClass' => $class,
                'Images' => $galleryImages
            ]);
            
            echo $arrayData->renderWith('Maverick/Galleries/GalleryShortcode');
            //echo $galleryImages->renderWith('GalleryShortcode');
            return ob_get_clean();
        }

        public function SurveyButton(){
            return '<a href="/tairawhiti-wellness-survey" class="survey_button"><span class="anim">Take the survey</span></a>';
        }
       

        public static function starRatingFunc($arguments, $content = null, $parser = null, $tagName) {
        
            if(!isset($arguments['rating'])){
                return;
            }
            $count1 = $arguments['rating'] / 5;
            $count2 = $count1 * 100;
            $rating = number_format($count2, 0);

            ob_start(); 
            ?>
            <div class="star-rating">
                <span style="width: <?php echo $rating; ?>%"></span>
            </div>
            <?php
            
            $output = ob_get_clean();
            return $output;
        }
     
        
       
        public function AddImage($id,$class,$alt){
           
            return ShortcodeParser::get_active()->parse('[image id="'.$id.'" alt="'.$alt.'" class="'.$class.'" ]');
           // return ImageShortcodeHandler::handle_shortcode('', )
        }
      
        
        
        public static function add_faqs_func($arguments, $content = null, $parser = null, $tagName) 
        {
            ob_start(); 
            $FaqQuestions = FaqQuestion::get();
            $arrayData = new SilverStripe\View\ArrayData([
                // 'Name' => 'John',
                 'FaqQuestions' => $FaqQuestions
             ]);
             
             echo $arrayData->renderWith('Maverick/Faqs/FaqShortCode');
             //echo $galleryImages->renderWith('GalleryShortcode');
             return ob_get_clean();
            
        }

        function Weather()
        {
            $json_string = 'https://api.openweathermap.org/data/2.5/weather?q=Gisborne&units=metric&appid=d6eb5d45f34aac69fc52a398a49dcfd3';
            $jsondata = file_get_contents($json_string);
            $obj = json_decode($jsondata, true);
            $temp = number_format((float)$obj['main']['temp'], 1, '.', '');
            return '<li class="weather"><i class="owf owf-'.$obj['weather'][0]['id'].' "></i> '.$temp.'&deg;<sup>C</sup></li>';
        }

        public static function email_direct_link_func($arguments, $content = null, $parser = null, $tagName) 
        {
            $request = Injector::inst()->get(HTTPRequest::class);
            $session = $request->getSession();
            $request = Injector::inst()->get(HTTPRequest::class);
            $session = $request->getSession();

            $params = Controller::curr()->getURLParams();

            $FormId = $params['ID'];
            $subID =$session->get('userformssubmission'.  $params['ID']);

            if($subID){
                    return '<a href="'.Director::AbsoluteURL('admin/pages/edit/EditForm/'.$FormId.'/field/Submissions/item/'.$subID.'/edit').'">View in cms</a><br/>';
            }
            return false;
        }

        public function eventfinda_cache()
        {
            return "eventfinda_cache";
            return date("W");
        }

        public static function eventfinda_func($arguments, $content = null, $parser = null, $tagName) 
        {
            $username = 'bayofplentynzcom2';
            $password = 'yyt9rmynpscm';
            $baseurl = 'https://api.eventfinda.co.nz/v2/';

            if (isset($arguments['feed'])){
                $feed = $arguments['feed'];
            } else {
                $feed = 'https://www.eventfinda.co.nz/feed/events/bay-of-plenty/whatson/upcoming.rss';
            }

            $rss = new DOMDocument();
            $rss->load($feed);
            $feed = [];//new ArrayList();
                
            ob_start();
            foreach ($rss->getElementsByTagName('item') as $node) {
                $item = array ( 
                    'title' => $node->getElementsByTagName('title')->item(0)->nodeValue,
                    'desc' => $node->getElementsByTagName('description')->item(0)->nodeValue,
                    'content' => $node->getElementsByTagName('encoded')->item(0)->nodeValue,
                    'link' => $node->getElementsByTagName('link')->item(0)->nodeValue,
                    'date' => $node->getElementsByTagName('pubDate')->item(0)->nodeValue,
                );
                
                if($node->getElementsByTagName('content')->item(0)){
                        //    $item['content'] = $node->getElementsByTagName('content')->item(0)->nodeValue;
                }
                if($node->getElementsByTagName('enclosure')->item(0)){
                    $url = $node->getElementsByTagName('enclosure')->item(0)->getAttribute('url');
                    $url = str_replace('-13.jpg','-14.jpg',$url);
                    $url = str_replace('-13.png','-14.png',$url);
                    if (@getimagesize($url)) {
                            $item['image'] = $url;
                        } else {
                            $url = str_replace('-34.jpg','-33.jpg',$url);
                            $url = str_replace('-34.png','-33.png',$url);
                            if (@getimagesize($url)) {
                                $item['image'] = $url;
                            }
                        }
                    }
                array_push($feed, $item);
            }

            $limit = 20;
            for ($x=0;$x<count($feed);$x++) {
                $title = str_replace(' & ', ' &amp; ', $feed[$x]['title']);
                $link = $feed[$x]['link'];
                $description = $feed[$x]['desc'];

                if (strpos(strtolower($description), 'rotorua') == false){
                    $date = date('l F d, Y', strtotime($feed[$x]['date']));
                    echo "<div class='eventfinda_tile grid'>";
                    if(isset($feed[$x]['image'])){
                    echo '<div class="col nop col-md col-align-top" >
                    <img src="data:image/gif;base64,R0lGODlhAQABAAAAACH5BAEKAAEALAAAAAABAAEAAAICTAEAOw==" data-src="'.$feed[$x]['image'].'" class="b-lazy" alt="'.$title.'" />
                    <a  class="venobox link-overlay" target="_blank" class="link-overlay" href="'.$feed[$x]['image'].'" title="zoom"></a>
                    </div>';
                    }
                    echo '<div class="col col-md"><h3><strong><a class="venobox" data-vbtype="iframe" target="_blank" href="'.$link.'" title="Find out more about '.$title.'">'.$title.'</a></strong></h3>';
                    echo '<div class="description">'.$description.'</div>';
                    
                    echo '</div>';
                    echo "</div>";
                }
                
            }
        
            return ob_get_clean();

                $current_page = Director::get_current_page();

                $data['Results'] = ob_get_clean();
                $data['CacheID'] = 'EventFinda-'.$current_page->URLSegment;

               // return $feed->customise($data)->renderWith('Includes\EventFinda');
                return ob_get_clean();
        }

        public function getRandomNumber(){
            return rand();
        }
       public function getInstagram(){
        //return $this->Instagram;
        $instagrams = json_decode(file_get_contents("library/data/instagram.json"), true);
        $instagramPosts = new ArrayList();
        $count = 0;
        foreach ($instagrams['data'] as $post){
            $count ++;
            if($post['media_type']== 'IMAGE' || $post['media_type']== 'CAROUSEL_ALBUM' ){
                $post['thumbnail'] = $post['media_url'];
            }else{
                $post['thumbnail'] = $post['thumbnail_url'];
            }
           
            $instagramPosts->push($post);
            if( $count == 12){
                break;
            }
          }
         // print_r($instagramPosts[0]);
      return $instagramPosts;
           
       }
      

    }
    
}