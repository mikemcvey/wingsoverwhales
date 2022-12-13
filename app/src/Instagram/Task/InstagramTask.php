<?php

namespace Maverick\Instagram\Task;

use GuzzleHttp\Client;
use SilverStripe\ORM\DB;
use SilverStripe\Dev\BuildTask;
use Geocoder\Exception\Exception;
use SilverStripe\Control\Director;
use SilverStripe\Control\HTTPRequest;

class InstagramTask extends BuildTask
{
    private static $segment = 'instagram';

    protected $title = 'Instagram Task';

    /**
     *
     * @param HTTPRequest $request
     * @return
     */
    public function run($request)
    {

      $api = 'https://v1.nocodeapi.com/jedmaverick/instagram/lBeXMKbfPnuRtRxt';

      try {
          $client = new Client();
          $response = $client->request('GET', $api);
          if($response->getStatusCode() == 200) {
              $body = $response->getBody();
              $dir=(__DIR__).'/'; //Path to current script location
              ///public_html/app/src/Instagram/Task
                $path="../../../../public/library/data/"; //Use any relative path to your script as you want and exists
                $file="instagram.json"; //A dummy test file
                $fullpath=$dir.$path.$file; //That is the important path to store your file

              $fp = fopen($fullpath, 'w');
              
              fwrite($fp, $body);
              fclose($fp);
            
          }
      } catch(Exception $e) {
          echo "Error: Fetching the api";
      }

      echo 'Instagram export complete.';
      exit;

    }
  
}