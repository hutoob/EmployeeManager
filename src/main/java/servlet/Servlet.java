package servlet;

import bean.Employee;
import bean.Login;
import com.google.gson.Gson;
import dao.Dao;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Servlet", value = "/Servlet")
public class Servlet extends HttpServlet {
    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        String account=request.getParameter("account");
        String password=request.getParameter("password");
        String status=request.getParameter("status");
        Login login=new Login(account,password,status);
        System.out.println(account);
        Dao dao=new Dao();
        String verify=dao.verifyLogin(login);
        if(verify.equals("正确")){
            if("员工".equals(status)){
                response.getWriter().write("员工");
            }
            else if("管理员".equals(status)){
                response.getWriter().write("管理员");
            }
        }
        else {
            response.getWriter().write(verify);
        }
    }
    private void showEm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("utf-8");
        Dao dao=new Dao();
        List<Employee> list=dao.getEmploy();
        Gson gson=new Gson();
        String json=gson.toJson(list);
        response.getWriter().write(json);
    }
    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setCharacterEncoding("utf-8");
        String id=request.getParameter("id");
        Dao dao=new Dao();
        dao.delete(id);
        request.getRequestDispatcher("showEm.jsp").forward(request,response);
    }
    private void updataEm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setCharacterEncoding("utf-8");
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String department=request.getParameter("department");
        String level=request.getParameter("level");
        System.out.println(id);
        Employee employee=new Employee(id,name,sex,department,level);
        Dao dao=new Dao();
        dao.updataEm(employee);
        response.getWriter().write("修改成功");
    }
    private void addEm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setCharacterEncoding("utf-8");
        String id=request.getParameter("id");
        String name=request.getParameter("name");
        String sex=request.getParameter("sex");
        String department=request.getParameter("department");
        String level=request.getParameter("level");
        Employee employee=new Employee(id,name,sex,department,level);
        Dao dao=new Dao();
        dao.addEm(employee);
        response.getWriter().write("添加成功!!!");
    }
    private void searchEm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setCharacterEncoding("utf-8");
        request.setCharacterEncoding("utf-8");
        String type=request.getParameter("type");
        String admition=request.getParameter("admition");
        Dao dao=new Dao();
        List<Employee> list=dao.search(type,admition);
        if(list.size()<=0){
            System.out.println(list.size());
            response.getWriter().write("未查到相关信息");
        }
        else{
            System.out.println(list.size());
            Gson gson=new Gson();
            String json=gson.toJson(list);
            response.getWriter().write(json);
        }
    }
    private void updatePassword(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        response.setCharacterEncoding("utf-8");
        String password=request.getParameter("password");
        String id=request.getSession().getAttribute("emid").toString();
        System.out.println(password+id);
        Dao dao=new Dao();
        dao.updatePassword(password,id);
        response.getWriter().write("修改成功");
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String method=request.getParameter("method");
        System.out.println(method);
        if("login".equals(method)){
            login(request,response);
        }
        else if("showEm".equals(method)){
            showEm(request,response);
        }
        else if("delete".equals(method)){
            delete(request,response);
        }
        else if("updataEm".equals(method)){
            updataEm(request,response);
        }
        else if("addEm".equals(method)){
            addEm(request,response);
        }
        else if("searchEm".equals(method)){
            searchEm(request,response);
        }
        else if("updatePassword".equals(method)){
            updatePassword(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request,response);
    }
}
