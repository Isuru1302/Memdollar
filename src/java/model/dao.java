package model;

import java.sql.*;
import java.util.*;
import passwordHashing.BCrypt;
import passwordHashing.randomString;

public class dao {

    public static Connection dbConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://178.128.217.219:3306/memdollar", "rana", "abc@123");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return con;
    }

    public static ResultSet createstmt(String sql) {
        ResultSet rs = null;
        try {
            Connection con = dao.dbConnection();
            Statement st = con.createStatement();
            rs = st.executeQuery(sql);
            return rs;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static int registerNewStudent(String first, String last, String dob, int gender, int cNumber, String userName, String userEmail, String tempPW) {
        int status = 0;

        try {

            String checkSQL = "SELECT * FROM users";
            ResultSet rs = createstmt(checkSQL);

            if (rs.next()) {
                if (rs.getString("userName").equals(userName) || rs.getString("userEmail").equals(userEmail)) {
                    status = -1;
                } else {
                    Connection con = dao.dbConnection();
                    PreparedStatement ps = con.prepareStatement("INSERT INTO users(userName,userEmail,userPassword,userstatus,uFirstName,uLastName,userDOB,userGender,userContactNumber,userCity,"
                            + "userCountry,userProfilePic)values(?,?,?,?,?,?,?,?,?,?,?,?)");
                    ps.setString(1, userName);
                    ps.setString(2, userEmail);
                    ps.setString(3, tempPW);
                    ps.setInt(4, 0);
                    ps.setString(5, first);
                    ps.setString(6, last);
                    ps.setString(7, dob);
                    ps.setInt(8, gender);
                    ps.setInt(9, cNumber);
                    ps.setString(10, "");
                    ps.setString(11, "");
                    ps.setString(12, "");
                    status = ps.executeUpdate();
                    status = 2;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;

    }

    public static users userLogin(String UNAME, String UPW) throws SQLException {
        users u = new users();

        String SQL = "SELECT * FROM users WHERE userName = '" + UNAME + "' or userEmail = '" + UNAME + "'";
        ResultSet rs = createstmt(SQL);

        if (rs.first()) {
            String dbPW = rs.getString("userPassword");
            int UT = rs.getInt("userstatus");

            if (BCrypt.checkpw(UPW, dbPW) && UT > 0) {

                String firstname = "";
                String profilePic = "";

                if (!rs.getString("uFirstName").equals("")) {
                    firstname = rs.getString("uFirstName");
                } else {
                    firstname = rs.getString("userName");
                }

                if (!rs.getString("userProfilePic").equals("")) {
                    profilePic = rs.getString("userProfilePic");
                } else {
                    profilePic = "profilepic/user.jpg";
                }

                u.setUserID(rs.getInt("userID"));
                u.setuFirstName(firstname);
                u.setUserName(rs.getString("userName"));
                u.setuStatus(rs.getInt("userstatus"));
                u.setProfilePic(profilePic);

            } else {
                u.setUserID(0);
            }
        }

        return u;
    }

    public static users userLoginbyGoogle(String userName, String Email, String password, String firstName, String lastName, String Pic) {
        users u = new users();
        try {
            Connection con = dao.dbConnection();
            String SQL = "SELECT * FROM users WHERE userEmail = '" + Email + "'";
            ResultSet rs = createstmt(SQL);

            if (rs.first()) {
                String firstname = "";
                String profilePic = "";

                if (!rs.getString("uFirstName").equals("")) {
                    firstname = rs.getString("uFirstName");
                } else {
                    firstname = rs.getString("userName");
                }

                if (!rs.getString("userProfilePic").equals("")) {
                    profilePic = rs.getString("userProfilePic");
                } else {
                    profilePic = "../profilepic/user.jpg";
                }

                u.setUserID(rs.getInt("userID"));
                u.setuFirstName(firstname);
                u.setUserName(rs.getString("userName"));
                u.setuStatus(rs.getInt("userstatus"));
                u.setProfilePic(profilePic);
            } else {
                
                int status = 0;
                PreparedStatement ps = con.prepareStatement("INSERT INTO users(userName,userEmail,userPassword,userstatus,uFirstName,uLastName,userDOB,userGender,userContactNumber,userCity,"
                        + "userCountry,userProfilePic)values(?,?,?,?,?,?,?,?,?,?,?,?)");
                ps.setString(1, userName);
                ps.setString(2, Email);
                ps.setString(3, password);
                ps.setInt(4, 1);
                ps.setString(5, firstName);
                ps.setString(6, lastName);
                ps.setInt(8, 0);
                ps.setInt(9, 0);
                ps.setString(7, "");
                ps.setString(10, "");
                ps.setString(11, "");
                ps.setString(12, Pic);
                status = ps.executeUpdate();
                if (status > 0) {
                    String SQL2 = "SELECT * FROM users WHERE userEmail = '" + Email + "' AND userPassword = '" + password + "'";
                    ResultSet rs2 = createstmt(SQL);

                    if (rs2.first()) {
                        String firstname = "";
                        String profilePic = "";

                        if (!rs2.getString("uFirstName").equals("")) {
                            firstname = rs2.getString("uFirstName");
                        } else {
                            firstname = rs2.getString("userName");
                        }

                        if (!rs2.getString("userProfilePic").equals("")) {
                            profilePic = rs2.getString("userProfilePic");
                        } else {
                            profilePic = "profilepic/user.jpg";
                        }

                        u.setUserID(rs2.getInt("userID"));
                        u.setuFirstName(firstname);
                        u.setUserName(rs2.getString("userName"));
                        u.setuStatus(rs2.getInt("userstatus"));
                        u.setProfilePic(profilePic);
                        history.addLoginType(rs2.getInt("userID"));
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public static int newPassword(String userName, String token, String newPassword) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();

            String SQL = "SELECT userPassword FROM users WHERE userName = '" + userName + "'";
            ResultSet rs = createstmt(SQL);

            String PW = BCrypt.hashpw(newPassword, BCrypt.gensalt());

            if (rs.next()) {
                if (BCrypt.checkpw(rs.getString("userPassword"), token)) {
                    PreparedStatement ps = con.prepareStatement("UPDATE users SET userPassword=?,userstatus=? WHERE userName=?");
                    ps.setString(1, PW);
                    ps.setInt(2, 1);
                    ps.setString(3, userName);
                    status = ps.executeUpdate();
                } else {
                    status = -1;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static users getUserDetailsByID(int ID) {
        users user = new users();

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE userID = ? ");
            ps.setInt(1, ID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user.setuFirstName(rs.getString("uFirstName"));
                user.setuLastName(rs.getString("uLastName"));
                user.setuEmail(rs.getString("userEmail"));
                user.setUserDOB(rs.getString("userDOB"));
                String uCity = rs.getString("userCity");
                String uCountry = rs.getString("userCountry");
                user.setProfilePic(rs.getString("userProfilePic"));
                user.setUserPassword(rs.getString("userPassword"));
                user.setContactNo(rs.getInt("userContactNumber"));

                int genderIndex = rs.getInt("userGender");

                if (genderIndex == 1) {
                    user.setGender("Male");
                } else {
                    user.setGender("Female");
                }

                if (!uCity.equals("")) {
                    user.setUserCity(uCity);
                } else {
                    user.setUserCity("Enter Your City");
                }

                if (!uCountry.equals("")) {
                    user.setUserCountry(uCountry);
                } else {
                    user.setUserCountry("Enter Your Country");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static int getUserIDbyPassword(String token, String newPassword) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();

            PreparedStatement ps = con.prepareStatement("UPDATE users SET userPassword=? WHERE userPassword=?");
            ps.setString(1, BCrypt.hashpw(newPassword, BCrypt.gensalt()));
            ps.setString(2, token);
            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int updateUDetils(users u) {
        int updateStatus = 0;

        try {
            Connection con = dao.dbConnection();
            String updateSQL = "UPDATE users SET uFirstName=?,uLastName=?,userEmail=?,userDOB=?,userGender=?,userContactNumber=?,userCity=?,userCountry=? WHERE userID=?";
            PreparedStatement ps = con.prepareStatement(updateSQL);
            ps.setString(1, u.getuFirstName());
            ps.setString(2, u.getuLastName());
            ps.setString(3, u.getuEmail());
            ps.setString(4, u.getUserDOB());

            if (u.getGender().equals("Male")) {
                ps.setInt(5, 1);
            } else {
                ps.setInt(5, 2);
            }

            ps.setInt(6, u.getContactNo());
            ps.setString(7, u.getUserCity());
            ps.setString(8, u.getUserCountry());
            ps.setInt(9, u.getUserID());

            updateStatus = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return updateStatus;
    }

    public static int updatePassword(int ID, String O_Password, String N_Password) {
        int upwStatus = 0;

        try {
            Connection con = dao.dbConnection();

            String checkPW = "SELECT userPassword FROM users WHERE userID='" + ID + "'";
            ResultSet rscheckPW = createstmt(checkPW);

            if (rscheckPW.first()) {

                if (BCrypt.checkpw(O_Password, rscheckPW.getString("userPassword"))) {

                    PreparedStatement pes = con.prepareStatement("UPDATE users SET userPassword=? WHERE userID=?");
                    pes.setString(1, BCrypt.hashpw(N_Password, BCrypt.gensalt()));
                    pes.setInt(2, ID);
                    upwStatus = pes.executeUpdate();
                }
            } else {
                upwStatus = 0;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return upwStatus;
    }

    public static users resetPassword(String email) {
        users u = new users();
        int status = 0;
        String token = "";
        try {
            token = randomString.randomString();

            Connection con = dao.dbConnection();

            PreparedStatement ps = con.prepareStatement("UPDATE users SET userPassword =? WHERE userEmail=?");
            ps.setString(1, token);
            ps.setString(2, email);
            status = ps.executeUpdate();

            if (status > 0) {
                u.setUserPassword(token);
            } else {
                u.setUserPassword("null");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return u;
    }

    public static ResultSet getUsermessages() {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * from usermessages ORDER BY messageID DESC");
            rs = ps.executeQuery();
        } catch (Exception e) {

        }

        return rs;
    }

    public static int messageCount() {
        int mCount = 0;

        try {

            String SQL = "SELECT COUNT(*) AS total FROM usermessages WHERE status='1'";
            ResultSet r = createstmt(SQL);
            r.next();
            mCount = r.getInt("total");
            r.close();
        } catch (Exception e) {

        }

        return mCount;
    }

    public static int readMessage(int msgID) {
        int read = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE usermessages SET status = ? WHERE messageID = ?");
            ps.setInt(1, 0);
            ps.setInt(2, msgID);
            read = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return read;
    }

    public static int notificationCount() {
        int nCount = 0;

        try {
            String SQL = "SELECT COUNT(*) AS totalN FROM feedbacks WHERE feedbackstatus='1'";
            ResultSet r = createstmt(SQL);
            r.next();
            nCount = r.getInt("totalN");
            r.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return nCount;
    }

    public static ResultSet getUserNotifications() {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * from feedbacks ORDER BY feedbackID DESC");
            rs = ps.executeQuery();
        } catch (Exception e) {

        }

        return rs;
    }

    public static int readNotification(int ID) {
        int readN = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE feedbacks SET feedbackstatus = ? WHERE feedbackID = ?");
            ps.setInt(1, 0);
            ps.setInt(2, ID);
            readN = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return readN;
    }

    public static int studentsCount() {
        int mCount = 0;

        try {
            String SQL = "SELECT COUNT(*) AS total FROM users WHERE userstatus='1'";
            ResultSet r = createstmt(SQL);
            r.next();
            mCount = r.getInt("total");
            r.close();
        } catch (Exception e) {

        }

        return mCount;
    }

    public static ResultSet viewAllStudent() {
        ResultSet rStudents = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE userstatus<=?");
            ps.setInt(1, 1);
            rStudents = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rStudents;
    }

    public static ResultSet viewAllAdmins() {
        ResultSet rStudents = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE userstatus=?");
            ps.setInt(1, 2);
            rStudents = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rStudents;
    }

    public static int removeStudent(int ID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE users SET userstatus = '0' WHERE userID=?");
            ps.setInt(1, ID);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int addStudent(int ID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE users SET userstatus = '1' WHERE userID=?");
            ps.setInt(1, ID);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int addAdmin(int ID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE users SET userstatus = '2' WHERE userID=?");
            ps.setInt(1, ID);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int removeAdmin(int ID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE users SET userstatus = '1' WHERE userID=?");
            ps.setInt(1, ID);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int removeCategory(int ID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE category SET categoryStatus = '0' WHERE categoryID=?");
            ps.setInt(1, ID);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static ResultSet viewAvialableCategory() {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM category WHERE categoryStatus>0");
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static ResultSet viewAllCategories() {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM category,questions");
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static ResultSet getQuestionTags(int ID) {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM category c, tags t WHERE c.categoryID = t.cID AND t.qID = '" + ID + "'");
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static int addCategory(int ID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE category SET categoryStatus = '1' WHERE categoryID=?");
            ps.setInt(1, ID);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int addNewCategory(String courseName) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();

            String checkSQL = "SELECT COUNT(categoryID) FROM category WHERE categoryName = '" + courseName + "'";
            PreparedStatement checkps = con.prepareStatement(checkSQL);
            ResultSet rs = checkps.executeQuery();
            rs.next();
            int count = rs.getInt(1);

            if (count < 1) {
                String SQL = " INSERT INTO category(categoryName,categoryStatus) VALUES (?,?)";
                PreparedStatement ps = con.prepareStatement(SQL);
                ps.setString(1, courseName);
                ps.setInt(2, 1);
                status = ps.executeUpdate();
            } else {
                status = 1;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int newMessage(String name, String email, String message) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO usermessages(name,email,message,status) VALUES(?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);
            ps.setInt(4, 1);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int questionCount() {
        int questionCount = 0;
        try {

            String sql = "SELECT COUNT(*) as total FROM questions";
            ResultSet r = createstmt(sql);
            r.next();
            questionCount = r.getInt("total");
            r.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return questionCount;
    }

    public static ResultSet allQuestions() {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions q, users u WHERE u.userID =q.studentID");
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static ResultSet allAnswers() {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM answers a,users u,questions q,marks m WHERe a.stuID = u.userID AND a.qID = q.questionID AND m.qID = a.qID AND a.stuID = m.stuID");
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static ResultSet allAvialableQuestions() {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions q, users u WHERE u.userID =q.studentID AND q.questionStatus = 1");
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static ResultSet allQuestions(int calc_page, int countPerPage, int sid) {
        ResultSet rs = null;
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT  * FROM users u, questions q WHERE u.userID  = q.studentID AND q.questionStatus =1 AND q.studentID !=? AND NOT EXISTS (SELECT qID FROM answers a WHERE a.stuID =? AND a.qID = q.questionID) AND NOT EXISTS (SELECT qID FROM history h WHERE h.qID = q.questionID AND h.stuID =? AND h.Skip = 1) ORDER BY q.questionID LIMIT ?,?");
            ps.setInt(1, sid);
            ps.setInt(2, sid);
            ps.setInt(3, sid);
            ps.setInt(4, calc_page);
            ps.setInt(5, countPerPage);
            rs = ps.executeQuery();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static int countAllQuestions(int sID) {
        int count = 0;
        ResultSet rs;
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT  COUNT(*) as rowcount FROM users u, questions q WHERE u.userID  = q.studentID AND q.questionStatus =1 AND q.studentID !=? AND NOT EXISTS (SELECT qID FROM answers a WHERE a.stuID =? AND a.qID = q.questionID) AND NOT EXISTS (SELECT qID FROM history h WHERE h.qID = q.questionID AND h.stuID =? AND h.Skip = 1)  ");
            ps.setInt(1, sID);
            ps.setInt(2, sID);
            ps.setInt(3, sID);
            rs = ps.executeQuery();
            rs.next();
            count = rs.getInt("rowcount");
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public static ResultSet allQuestionsByID(int ID, int calc_page, int countPerPage) {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions q,users u WHERE q.studentID = ? AND u.userID = q.studentID AND q.questionStatus != ? ORDER BY q.questionID DESC LIMIT ?,?");
            ps.setInt(1, ID);
            ps.setInt(2, 0);
            ps.setInt(3, calc_page);
            ps.setInt(4, countPerPage);

            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static int countAllQuestionsByID(int ID) {
        int count = 0;
        ResultSet rs;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) as totalCount FROM questions q,users u WHERE q.studentID = ? AND u.userID = q.studentID AND q.questionStatus != ?");
            ps.setInt(1, ID);
            ps.setInt(2, 0);

            rs = ps.executeQuery();
            rs.next();
            count = rs.getInt("totalCount");
            rs.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return count;
    }

    public static ResultSet questionByID(int ID) {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions WHERE questionID = ?");
            ps.setInt(1, ID);

            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static int updateQuestion(int id, String question, String title) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE questions SET question = ?,questionTitle=? WHERE questionID=?");
            ps.setString(1, question);
            ps.setString(2, title);
            ps.setInt(3, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int addRemoveQuestion(int id, int value) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE questions SET questionStatus = ? WHERE questionID=?");
            ps.setInt(1, value);
            ps.setInt(2, id);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int addQutstion(int stuID, String title, String question, String tags, String date) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO questions(studentID,questionTitle,question,questionTags,questionLikes,questionDisLikes,questionStatus,date) VALUES (?,?,?,?,?,?,?,?)");
            ps.setInt(1, stuID);
            ps.setString(2, title);
            ps.setString(3, question);
            ps.setString(4, tags);
            ps.setInt(5, 0);
            ps.setInt(6, 0);
            ps.setInt(7, 1);
            ps.setString(8, date);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static int reportQuestion(int id, String name, String email, String message) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO feedbacks(studentName,studentEmail,studentMessage,feedbackStatus,question) VALUES (?,?,?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, message);
            ps.setInt(4, 1);
            ps.setInt(5, id);
            status = ps.executeUpdate();
        } catch (Exception q) {
            q.printStackTrace();
        }
        return status;
    }

    public static int answerQuestion(int stuID, int Qid, String answer, String date) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO answers(qID,stuID,answer,date,status) VALUES (?,?,?,?,?)");
            ps.setInt(1, Qid);
            ps.setInt(2, stuID);
            ps.setString(3, answer);
            ps.setString(4, date);
            ps.setInt(5, 1);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static ResultSet answersByID(int id) {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM answers a,users u,logintype l,marks m WHERE a.qID = ? AND a.stuID = u.userID AND l.uID = a.stuID AND a.qID = m.qID AND a.stuID = m.stuID ORDER BY a.answerID DESC");
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static ResultSet myAnswers(int id) {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM answers a,users u,marks m,questions q WHERE a.stuID = ? AND a.stuID = u.userID AND a.qID = m.qID AND a.stuID = m.stuID AND q.questionID = a.qID ORDER BY a.answerID DESC");
            ps.setInt(1, id);
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rs;
    }

    public static int calculateMarks(int id) {
        int marks = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT SUM(marks) FROM marks WHERE stuID = ?");
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            rs.next();
            marks = rs.getInt(1);
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return marks;
    }

    public static int inviteFriends(String name, String email) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO invitations(Name,Email,Date) VALUES(?,?,?)");
            ps.setString(1, name);
            ps.setString(2, email);
            ps.setString(3, history.date());
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static ResultSet invitations() {
        ResultSet rs = null;
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM invitations ORDER BY inviteID DESC");
            rs = ps.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static int markAnswer(int stuID, int qID, int mark, String review) {
        int status = 0;
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE marks SET marks = ?, answerFeedback=? WHERE stuID = ? AND qID = ?");
            ps.setInt(1, mark);
            ps.setString(2, review);
            ps.setInt(3, stuID);
            ps.setInt(4, qID);
            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int getLikeCount(int qID) {
        int count=0;
        ResultSet rs;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT questionLikes FROM questions WHERE questionID = ?");
            ps.setInt(1, qID);
            rs = ps.executeQuery();
            
            if(rs.next()){
                count = rs.getInt("questionLikes");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public static int getDisLikeCount(int qID) {
        int count=0;
        ResultSet rs;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT questionDisLikes FROM questions WHERE questionID = ?");
            ps.setInt(1, qID);
            rs = ps.executeQuery();
            
            if(rs.next()){
                count = rs.getInt("questionDisLikes");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }


    public static void addNewLike(int qID) {

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE questions SET questionLikes = questionLikes + 1 WHERE questionID =?");
            ps.setInt(1, qID);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addNewUnLike(int qID) {

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE questions SET questionDisLikes = questionDisLikes + 1 WHERE questionID =?");
            ps.setInt(1, qID);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void LikeToDisLike(int qID) {

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE questions SET questionLikes = questionLikes - 1,questionDisLikes = questionDisLikes + 1 WHERE questionID =?");
            ps.setInt(1, qID);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
    
    public static void disLiketoLike(int qID){
       
        try{
            Connection con =dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE questions SET questionLikes = questionLikes + 1,questionDisLikes = questionDisLikes - 1 WHERE questionID =?");
            ps.setInt(1, qID);
            ps.executeUpdate();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
    }
    
    
    public static ResultSet searchResultsByTags(int uID,String keyword, int num1, int num2){
        ResultSet rs = null;
        
        try{
           Connection con = dao.dbConnection();
           PreparedStatement ps = con.prepareStatement("SELECT * FROM questions q, users u WHERE q.studentID != ? AND u.userID =q.studentID AND q.questionStatus = 1 AND(q.questionTags LIKE '%" + keyword + "%' OR q.questionTitle LIKE '%" + keyword + "%'  OR q.question LIKE '%" + keyword + "%') LIMIT ?,?");
           ps.setInt(1, uID);
           ps.setInt(2, num1);
           ps.setInt(3, num2);
           rs = ps.executeQuery();
        }catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }

    public static int searchResultsByTagsCount(int uID,String keyword) {
        int count = 0;
        ResultSet rs;

        try {

            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS total FROM questions q, users u WHERE q.studentID != ? AND u.userID =q.studentID AND q.questionStatus = 1 AND(q.questionTags LIKE '%" + keyword + "%' OR q.questionTitle LIKE '%" + keyword + "%'  OR q.question LIKE '%" + keyword + "%') ");
            ps.setInt(1, uID);
            rs = ps.executeQuery();
            rs.next();
            count = rs.getInt("total");
            rs.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
    
    public static void closeConnection(){
        try{
            Connection con = dao.dbConnection();
            con.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
