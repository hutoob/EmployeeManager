package bean;

public class Login {
    String account;
    String password;
    String status;

    public Login() {
    }

    public Login(String account, String password, String status) {
        this.account = account;
        this.password = password;
        this.status = status;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
