<?php

use SilverStripe\Security\Security;
use SilverStripe\ORM\DataExtension;
use SilverStripe\UserForms\Model\Submission\SubmittedFormField;
use SilverStripe\Control\Director;
use SilverStripe\ORM\Queries\SQLSelect;


/**
 * UserDefinedFormController Extensions
 *
 * @author   jedmaverick
 * @since    07 July 2020
*/
class UserDefinedForm_Controller_Extension extends DataExtension 
{
    
    /**
     * UpdateEmail extension.
     *
     * @return void
     */
    public function updateEmail($email, $recipient, &$emailData)
    {
        $currentPage = Director::get_current_page();

        if ($currentPage->URLSegment == 'list-your-business') {
            $this->updateListBusiness($currentPage, $emailData);
        }
    }
    
    /**
     * UpdateEmail list your business form.
     *
     * @return void
     */
    public function updateListBusiness($currentPage, &$emailData)
    {

        $sqlQuery = new SQLSelect();
        $pageId = $sqlQuery->setFrom('SiteTree')->selectField('ID')->addWhere([
            'URLSegment' => $currentPage->URLSegment,
            'ClassName' => $currentPage->ClassName,
        ])->setLimit(1)->execute()->value();

        $parentId = $emailData['Fields'][0]->ParentID;
        $urlPath  = '/admin/pages/edit/EditForm/'.$pageId.'/field/Submissions/item/'.$parentId.'/edit';
        $submissionId = $emailData['Fields'][(count($emailData['Fields']) - 1)]->ID + 1;

        $submittedField = SubmittedFormField::create();
        $submittedField->ParentID = $parentId;
        $submittedField->ID = $submissionId;
        $submittedField->Name = 'Admin_URL';
        $submittedField->Title = 'Admin URL:';
        $submittedField->Value = Director::absoluteURL($urlPath);
        $submittedField->UploadedFileID = '';
        $emailData['Fields']->push($submittedField);
    }
   

}