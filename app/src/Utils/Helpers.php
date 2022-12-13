<?php

namespace Maverick\Utils;

use SilverStripe\Assets\Image;
use SilverStripe\Core\Injector\Injector;
use SilverStripe\Assets\Storage\AssetStore;

/**
 * Defines Helpers
 *
 * @category Utils
 * 
 * @author Jed Diaz
 */
class Helpers 
{

    public static function prefix_url($url, $ssl = false) 
    {
        if (!$url || !trim($url)) {
            return '';
        }
        if (!preg_match('/^https?:\/\//i', $url)) {
            return $ssl ? 'https://' . $url : 'http://' . $url;
        }

        return $url;
    }

    /**
     * Validate an image.
     * @param Image $image
     * @param int $minWith
     * @param int $minHeight
     * @param int $minFileSize
     *
     * @return bool
     */
    public static function validate_image(Image $image, $minWith = 0, $minHeight = 0, $minFileSize = 0)
    {
        $store = Injector::inst()->get(AssetStore::class);
        $stream = $store->getAsStream($image->File->Filename, $image->File->Hash);
        if (!$stream) {
            return false;
        }

        $meta = stream_get_meta_data($stream);
        $filePath = $meta['uri'];

        if (!$image->exists()) {
            return false;
        }

        if (!$imageSize = getimagesize($filePath)) {
            return false;
        }

        if ($imageSize[0] < $minWith || $imageSize[1] < $minHeight) {
            return false;
        }

        if (!$imageFileSize = filesize($filePath)) {
            return false;
        }

        if ($imageSize < $minFileSize) {
            return false;
        }

        return true;
    }

    public static function get_browser_lang()
    {
        $langs = array();

        if (isset($_SERVER['HTTP_ACCEPT_LANGUAGE'])) {
            // break up string into pieces (languages and q factors)
            preg_match_all('/([a-z]{1,8}(-[a-z]{1,8})?)\s*(;\s*q\s*=\s*(1|0\.[0-9]+))?/i', $_SERVER['HTTP_ACCEPT_LANGUAGE'], $lang_parse);

            if (count($lang_parse[1])) {
                // create a list like "en" => 0.8
                $langs = array_combine($lang_parse[1], $lang_parse[4]);

                // set default to 1 for any without q factor
                foreach ($langs as $lang => $val) {
                    if ($val === '')
                        $langs[$lang] = 1;
                }

                // sort list based on value
                arsort($langs, SORT_NUMERIC);
            }
        }


        if (count($langs)) {
            $lang = array_keys($langs)[0];
            $langParts = explode('-', $lang);
            if (isset($langParts[1])) {
                //Safari is returning lower case here, unbelievable!
                $langParts[1] = strtoupper($langParts[1]);
            }

            return implode('_', $langParts);
        }

        return '';
    }

    public static function open_graph_tag_format($name, $content) 
    {
        return sprintf('<meta property="%s" content="%s" />', $name, $content) . PHP_EOL;
    }

    public static function get_client_ip_address() 
    {
        if(isset($_REQUEST['TEST_IP'])) {
            return $_REQUEST['TEST_IP'];
        }

        if (isset($_SERVER["HTTP_CF_CONNECTING_IP"])) {
            return $_SERVER["HTTP_CF_CONNECTING_IP"];
        }
        return $_SERVER['REMOTE_ADDR'];
    }

}