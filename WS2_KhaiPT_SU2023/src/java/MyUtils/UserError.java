package MyUtils;

public class UserError {
    private String userchecked;
    private String passchecked;
    private String namechecked;
    private String confirmchecked;
    private String messageError;

    public UserError() {
        this.userchecked="";
        this.passchecked="";
        this.confirmchecked="";
        this.namechecked="";
        this.messageError="";
    }

    public UserError(String userchecked, String passchecked , String confirmchecked, String namechecked, String messageError) {
        this.userchecked = userchecked;
        this.passchecked = passchecked;      
        this.confirmchecked = confirmchecked;
        this.namechecked = namechecked;
        this.messageError = messageError;
    }

    public String getUserchecked() {
        return userchecked;
    }

    public void setUserchecked(String userchecked) {
        this.userchecked = userchecked;
    }

    public String getPasschecked() {
        return passchecked;
    }

    public void setPasschecked(String passchecked) {
        this.passchecked = passchecked;
    }

    public String getNamechecked() {
        return namechecked;
    }

    public void setNamechecked(String namechecked) {
        this.namechecked = namechecked;
    }

    public String getConfirmchecked() {
        return confirmchecked;
    }

    public void setConfirmchecked(String confirmchecked) {
        this.confirmchecked = confirmchecked;
    }

    public String getMessageError() {
        return messageError;
    }

    public void setMessageError(String messageError) {
        this.messageError = messageError;
    }

}
