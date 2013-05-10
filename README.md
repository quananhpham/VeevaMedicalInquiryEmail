VeevaMedicalInquiryEmail
========================

Medical Inquiry Email based on Email Template with Signature Attachment

Apex Class:  emailHelper
Method Summary:
  public static void sendEmail(ID recipientId, ID medicalInquiryId) 

sendEmail  
  public static void sendEmail(ID recipientId, ID medicalInquiryId)
  
  This function takes a medical inquiry record and emails it to a recipient.  The content of the email is constructed using an email template that merges 
  fields from the MI record into the body of the email.  Any email template will work, and one has been provided as an example in the "Examples" directory. 
  **Note**:  You must modify the emailHelper class and replace the id of the emailTemplate with the one that corresponds to the id of the email template 
  that you wish to use in your environment.
  
  In terms of logic, this class decodes the signature stored on the MI record and attaches it to the email as a binary PNG file.  
  It will call the salesforce mail merge functionality by passing in the MI record and email template to generate the email body.
  
  Parameters:
		recipientId			salesforce Id of the intended recipient of the email
		medicalInquiryId	salesforce Id of the medical inquiry record for the mail merge fields and signature will be extracted
  Returns:
		void


Sample usage:
  emailHelper.sendEmail('005i0000000hBMn', 'a0ui0000000CsB2AAK');
  

This function can be called from anywhere that an Apex function can be called from, for example within a trigger.
