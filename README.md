Copyright (c) 2012 Veeva Systems, Inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. Coaching Reports Plus Plus is a coaching reports implementation that uses a combination of salesforce.com Approval Processes and VisualForce. The main advantages of this implementation over configuration-only Coaching Reports implmentation are:

Records are locked upon submission and cannot be unlocked or otherwise modified by either the rater or the rated employee. A rater who is not above the rated employee in the Role Hierarchy (as in the case where one District Manager filling in for another) may rate an employee and still retain visibility to the Coaching Report after submission.



VeevaMedicalInquiryEmail
========================

Medical Inquiry Email based on Email Template with Signature Attachment

Apex Class:  emailHelper <br/>
Method Summary:<br/>
  public static void sendEmail(ID recipientId, ID medicalInquiryId) <br/>

<h2>sendEmail  </h2>
  public static void sendEmail(ID recipientId, ID medicalInquiryId)
  
  This function takes a medical inquiry record and emails it to a recipient.  The content of the email is constructed using an email template that merges 
  fields from the MI record into the body of the email.  Any email template will work, and one has been provided as an example in the "Examples" directory. 
  **Note**:  You must modify the emailHelper class and replace the id of the emailTemplate with the one that corresponds to the id of the email template 
  that you wish to use in your environment.
  
  In terms of logic, this class decodes the signature stored on the MI record and attaches it to the email as a binary PNG file.  
  It will call the salesforce mail merge functionality by passing in the MI record and email template to generate the email body.
  
  Parameters:<br/>
		recipientId			salesforce Id of the intended recipient of the email<br/>
		medicalInquiryId	salesforce Id of the medical inquiry record for the mail merge fields and signature will be extracted<br/>
  Returns:<br/>
		void<br/>


Sample usage:<br/>
  emailHelper.sendEmail('005i0000000hBMn', 'a0ui0000000CsB2AAK');
  

This function can be called from anywhere that an Apex function can be called from, for example within a trigger.
