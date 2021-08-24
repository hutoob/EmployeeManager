package dao;

import bean.Employee;
import bean.Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Dao {
    //取出登录表信息验证登录信息
    public String verifyLogin(Login login){
        String verify="无此用户";
        String sql="select * from login";
        try {
            Connection con=Util.getConnection();
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                String account=resultSet.getString("account");
                String password=resultSet.getString("password");
                String status=resultSet.getString("status");
                if(status.equals(login.getStatus())){
                    if(account.equals(login.getAccount())&&password.equals(login.getPassword())){
                        verify="正确";
                    }
                    else if(account.equals(login.getAccount())&&!password.equals(login.getPassword())){
                        verify="密码错误";
                    }
                }
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return verify;
    }
    //从数据库中取出员工信息
    public List<Employee> getEmploy(){
        List<Employee> list=new ArrayList();
        String sql="select * from employee";
        try {
            Connection con=Util.getConnection();
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                String id=resultSet.getString("id");
                String name=resultSet.getString("name");
                String sex=resultSet.getString("sex");
                String department=resultSet.getString("department");
                String level=resultSet.getString("level");
                Employee employee=new Employee(id,name,sex,department,level);
                list.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    //删除员工信息
    public void delete(String id){
        String sql="delete from employee where id="+id;
        try {
            Connection con=Util.getConnection();
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    //添加员工信息到数据库
    public void addEm(Employee employee){
        String sql="insert into employee(id,name,sex,department,level) values(?,?,?,?,?)";
        String sql2="insert into login(account,password,status) values(?,?,?)";
        try {
            Connection con=Util.getConnection();
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setString(1,employee.getId());
            preparedStatement.setString(2,employee.getName());
            preparedStatement.setString(3,employee.getSex());
            preparedStatement.setString(4,employee.getDepartment());
            preparedStatement.setString(5,employee.getLevel());
            preparedStatement.execute();
            preparedStatement=con.prepareStatement(sql2);
            preparedStatement.setString(1,employee.getId());
            preparedStatement.setString(2,employee.getId());
            preparedStatement.setString(3,"员工");
            preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    //修改员工信息
    public void updataEm(Employee employee){
        String sql="update employee set name=?,sex=?,department=?,level=? where id=?";
        try {
            Connection con=Util.getConnection();
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setString(1,employee.getName());
            preparedStatement.setString(2,employee.getSex());
            preparedStatement.setString(3,employee.getDepartment());
            preparedStatement.setString(4,employee.getLevel());
            preparedStatement.setString(5,employee.getId());
            preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    //查询员工信息
    public List<Employee> search(String type,String adition){
        String sql="";
        List<Employee> list=new ArrayList();
        if("编号".equals(type)){
            sql="select * from employee where id=?";
        }
        else if("姓名".equals(type)){
            sql="select * from employee where name=?";
        }
        else if("性别".equals(type)){
            sql="select * from employee where sex=?";
        }
        else if("部门".equals(type)){
            sql="select * from employee where department=?";
        }
        else if("级别".equals(type)){
            sql="select * from employee where level=?";
        }
        Connection connection= null;
        try {
            connection = Util.getConnection();
            PreparedStatement preparedStatement=connection.prepareStatement(sql);
            preparedStatement.setString(1,adition);
            ResultSet resultSet=preparedStatement.executeQuery();
            while(resultSet.next()){
                Employee employee=new Employee();
                employee.setId(resultSet.getString("id"));
                employee.setName(resultSet.getString("name"));
                employee.setSex(resultSet.getString("sex"));
                employee.setDepartment(resultSet.getString("department"));
                employee.setLevel(resultSet.getString("level"));
                list.add(employee);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }
    //修改密码
    public void updatePassword(String password,String id){
        String sql="update login set password=? where account=?";
        try {
            Connection con=Util.getConnection();
            PreparedStatement preparedStatement=con.prepareStatement(sql);
            preparedStatement.setString(1,password);
            preparedStatement.setString(2,id);
            preparedStatement.execute();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
