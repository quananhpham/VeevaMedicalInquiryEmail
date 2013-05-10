Global class emailHelper {

public static void sendEmail(ID recipientId, ID medicalInquiryId) {
 
   // grab the signature store in the MI field
   Medical_Inquiry_vod__c mi = [SELECT Id, Signature_vod__c FROM Medical_Inquiry_vod__c WHERE Id = :medicalInquiryId];
 
   // decode the contents of the field and convert it to a blob
   Blob body = EncodingUtil.base64Decode(mi.Signature_vod__c);

   // Create attachment
   Messaging.EmailFileAttachment efa = new Messaging.EmailFileAttachment();
   efa.setFileName('signature.png');
   efa.setBody(body);
   efa.setContentType('image/png');

   // create the email
   Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage(); 
   mail.setTargetObjectId(recipientId);
   mail.setTemplateId('00Xi0000000h1Ie');          // use the email template
   mail.setWhatId(medicalInquiryId);    
   mail.setBccSender(false);
   mail.setUseSignature(false);
   mail.setReplyTo('MIR@acme.com');
   mail.setSenderDisplayName('Apex Attachment');
   mail.setSaveAsActivity(false);  
   mail.setFileAttachments(new Messaging.EmailFileAttachment[] {efa} );
 
   // send the mail
   Messaging.sendEmail(new Messaging.SingleEmailMessage[] { mail });

    }  
}