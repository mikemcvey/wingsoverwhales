<?php

namespace Maverick\HTMLEditorSrcset;
// ripped from namespace Bigfork\HTMLEditorSrcset;
// converted to use width not densities
/*  TO DO */
// add javascript to set media query in srcset when in column layouts and display at 50%
// THIS IS NOT CONFIGURABLE ANYMORE
use SilverStripe\Assets\Image;
use SilverStripe\Assets\Shortcodes\ImageShortcodeProvider;
//use SilverStripe\Core\Config\Config;
//use SilverStripe\Core\Config\Configurable;
use SilverStripe\Core\Convert;

class ImageShortcodeHandler
{
  //  use Configurable;
    

    /**
     * @var array
     * @config
     */
    // private static $default_pixel_densities = [1, 2];

    /**
     * @var array
     * @config
     */
    // private static $pixel_densities = [];

    /**
     * Most of this is copied straight from Image::handle_shortcode()
     *
     * Replace"[image id=n]" shortcode with an image reference.
     * Permission checks will be enforced by the file routing itself.
     *
     * @param array $args Arguments passed to the parser
     * @param string $content Raw shortcode
     * @param ShortcodeParser $parser Parser
     * @param string $shortcode Name of shortcode used to register this handler
     * @param array $extra Extra arguments
     * @return string Result of the handled shortcode
     */
    public static function handle_shortcode($args, $content, $parser, $shortcode, $extra = array())
    {
    //  echo("handle_shortcode");
      //   print_r($args);
        // echo "<br/>";
         //echo $content;
         //echo "<br/>";
         //echo $shortcode;
     //    var_dump($parser);
         //echo "<br/>";
        // Find appropriate record, with fallback for error handlers
        $record = ImageShortcodeProvider::find_shortcode_record($args);


        if (!$record) {
           
            return null; // There were no suitable matches at all.
        }

        $srcsetSources = [];

        // Check if a resize is required
        $src = $record->Link();
        if ($record instanceof Image) {
            
            $recordWidth = $record->getWidth();
            $recordHeight = $record->getHeight();

            $width = isset($args['width']) ? $args['width'] : $recordWidth;
            $height = isset($args['height']) ? $args['height'] : $recordHeight;
          
            $hasCustomDimensions = ($width && $height);
            if ($hasCustomDimensions && (($width != $recordWidth) || ($height != $recordHeight))) {
                $resized = $record->ResizedImage($width, $height);
                // Make sure that the resized image actually returns an image
                if ($resized) {
                    $src = $resized->getURL();
                }
            }
            /*  DENSITIES REMOVED
            // Output srcset attribute for different pixel densities
            $densities = (array)static::config()->get('pixel_densities');
            if (empty($densities)) {
                $densities = (array)static::config()->get('default_pixel_densities');
            }
            */
            /*
            srcset="images/space-needle.jpg 200w, images/space-needle-2x.jpg 400w,
            images/space-needle-hd.jpg 600w
            */
            if($recordWidth > 420):
                $resized = $record->ScaleWidth(420);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " 420w";
                }
            endif;
            if($recordWidth > 420 && $recordWidth < 620):
                $resized = $record->ScaleWidth($recordWidth);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " ".$recordWidth."w";
                }
            endif;
            if($recordWidth > 620):
                $resized = $record->ScaleWidth(620);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " 620w";
                }
            endif;
            if($recordWidth > 620 && $recordWidth < 900):
                $resized = $record->ScaleWidth($recordWidth);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " ".$recordWidth."w";
                }
            endif;
            if($recordWidth > 900):
                $resized = $record->ScaleWidth(900);
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " 900w";
                }
            endif;
            if($recordWidth > 900 && $recordWidth < 1240):
                $resized = $record->ScaleWidth($recordWidth);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " ".$recordWidth."w";
                }
            endif;
            if($recordWidth > 1240):
                $resized = $record->ScaleWidth(1400);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " 1240w";
                }
            endif;
            if($recordWidth > 1240 && $recordWidth < 1920):
                $resized = $record->ScaleWidth($recordWidth);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " ".$recordWidth."w";
                }
            endif;
            if($recordWidth > 1920):
                $resized = $record->ScaleWidth(1920);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " 1920w";
                }
            endif;
            if($recordWidth > 1920 && $recordWidth < 2480):
                $resized = $record->ScaleWidth($recordWidth);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " ".$recordWidth."w";
                }
            endif;
            if($recordWidth >= 2480):
                $resized = $record->ScaleWidth(2480);
                //-- 
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " 2480w";
                }
            endif;
            /*
            foreach ($densities as $density) {
                $density = (int)$density;
                $resized = $record->ResizedImage((int)ceil($width * $density), (int)ceil($height * $density));
                // Output in the format "assets/foo.jpg 1x"
                if ($resized && $resizedUrl = $resized->getURL()) {
                    $srcsetSources[] = $resizedUrl . " {$density}x";
                }
            }
            */
        }

        // Build the HTML tag
        $attrs = array_merge(
            // Set overrideable defaults
            ['src' => '', 'alt' => $record->Title, 'loading'=>'lazy'],
            // Use all other shortcode arguments
            $args,
            // But enforce some values
            ['id' => '', 'src' => $src, 'srcset' => implode(', ', $srcsetSources)]
        );

        // Clean out any empty attributes
        $attrs = array_filter($attrs, function ($v) {
            return (bool)$v;
        });

        // Condense to HTML attribute string
        $attrsStr = join(' ', array_map(function ($name) use ($attrs) {
            return Convert::raw2att($name) . '="' . Convert::raw2att($attrs[$name]) . '"';
        }, array_keys($attrs)));

        return '<img ' . $attrsStr . '  />';
    }
}
