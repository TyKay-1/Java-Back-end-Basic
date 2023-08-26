/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package KhaiPT.Database;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author admin
 */
public class DBUtils implements Serializable{
    public static Connection makeConnection() throws NamingException, SQLException{
        Context ctx = new InitialContext();
        Context envCtx = (Context) ctx.lookup("java:comp/env");
        DataSource ds = (DataSource) envCtx.lookup("KhaiPT_SU23");
        Connection con = ds.getConnection();
        return con;
        
       /* try{
            //1. Load driver
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            //2. Tao connection string - protocol:loadserver://diachiIP:port;tendb;teninstance
            String url = "jdbc:sqlserver://localhost:1433;databaseName=KhaiPT_SU23;instanceName=MYSQL";
            //3. Lay Connection
            Connection con = DriverManager.getConnection(url, "sa", "12345");
            //4. Tra connection cho doi tuong goi
            return con;
        } catch(ClassNotFoundException e){
            e.printStackTrace();
        } catch (SQLException e){
            e.printStackTrace();
        }
        return null;*/
    }
}


