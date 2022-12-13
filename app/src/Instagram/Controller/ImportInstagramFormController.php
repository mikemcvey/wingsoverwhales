<?php

namespace Maverick\Instagram\Controller;

use SilverStripe\Core\Convert;
use SilverStripe\Control\Controller;
use SilverStripe\Control\HTTPRequest;
use SilverStripe\SiteConfig\SiteConfig;

/**
 * Submitted Form Controller Page
 *
 * @author   Jed
 * @since    14 May 2021
*/
class ImportInstagramFormController extends Controller 
{

  private static $allowed_actions = [
    'index',
  ];

  private static $url_segment = 'api-instagram';

  /**
   * Array filters
   *
   * @var array
   */
  protected $filters;

  /**
   * Map of listings
   *
   * @var array
   */
  protected $callback;

  /**
   * Returns json result listings
   *
   * @var json
   */
  public function index(HTTPRequest $request) 
  {

    $this->response->addHeader("X-Robots-Tag", "noindex");
    $this->response->addHeader('Content-Type', 'application/json');


    $this->sanitiseFilters();

    // echo $this->filters['formData'];
    // exit;
    if (!isset($this->filters['formData'])) {
      return Convert::array2json([
        'status' => false
      ]);
    }

    $importDate = date('j F, Y');

    $siteConfig = SiteConfig::get()->first();
    $siteConfig->InstagramImportDate = date('j F, Y');
    $siteConfig->write();

    $this->saveFile($this->filters['formData']);

    $this->callback = [
      'status' => true,
      'importDate' => $importDate,
    ];
    
    $result = Convert::array2json($this->callback);

    return $result;

  }

  /**
   * Generate the filters
   *
   * @var void
   */
  protected function sanitiseFilters() 
  {
    
    $request = $this->request;
    $filters = [];
    $filters['formData'] = $request->getBody();
    $this->filters = $filters;

  }

  public function saveFile($jsonContent)
  {
    $data = $jsonContent;
    $fp = fopen('library/data/instagram.json', 'w');
    //$fp = fopen('/home/u379863453/domains/kaikoura.co.nz/public_html/production/src/public/library/scripts/frontend/data/instagram.json', 'w');
    fwrite($fp, $data);

    fclose($fp);
  }

}