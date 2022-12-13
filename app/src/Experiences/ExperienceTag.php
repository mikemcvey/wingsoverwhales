<?php
namespace Maverick\Experiences;
use ExperiencePage;
use SilverStripe\TagField\TagField;
use SilverStripe\ORM\DataObject;

use Dynamic\Elements\Experiences\Elements\ElementExperiences;

class ExperienceTag extends DataObject
{
    private static $table_name = 'ExperienceTag';

    private static $db = [
        'Title' => 'Varchar(200)',
    ];

    private static $belongs_many_many = [
        'ExperiencePage' => ExperiencePage::class,
        'ElementExperiences' => ElementExperiences::class
    ];
}

