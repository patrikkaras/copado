trigger AttachmentTrigger on Attachment (before insert, after insert) {
    system.debug('AttachmentTrigger '+Trigger.new);

}