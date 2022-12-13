<?php
namespace Maverick\Staff;
use StaffPage;
use SilverStripe\TagField\TagField;
use SilverStripe\ORM\DataObject;

//use Maverick\Staff\ElementStaffMembers;
use Dynamic\Elements\StaffMembers\Elements\ElementStaffMembers;

class StaffTag extends DataObject
{
    private static $table_name = 'StaffTag';

    private static $db = [
        'Title' => 'Varchar(200)',
    ];

    private static $belongs_many_many = [
        'StaffPage' => StaffPage::class,
        'ElementStaffMembers' => ElementStaffMembers::class
    ];
}

