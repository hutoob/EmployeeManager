package bean;

public class Employee {
    String id;
    String name;
    String sex;
    String department;
    String level;

    public Employee() {
    }

    public Employee(String id, String name, String sex, String department, String level) {
        this.id = id;
        this.name = name;
        this.sex = sex;
        this.department = department;
        this.level = level;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
