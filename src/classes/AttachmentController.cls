public class AttachmentController {

    public AttachmentController(ApexPages.StandardController controller) {

    }
    public blob getAttachement(){
    return [select body from Attachment where ParentId='a0M9000000EwWWX'].Body;
}
}