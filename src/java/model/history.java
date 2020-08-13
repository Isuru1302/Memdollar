package model;

import java.sql.*;
import java.util.*;
import java.time.format.DateTimeFormatter;
import java.time.LocalDateTime;

public class history {

    public static String date() {
        String date;

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        LocalDateTime now = LocalDateTime.now();
        date = dtf.format(now);
        return date;
    }

    public static int checkAnswerdQuestion(int sID, int qID) {
        int rowcount = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM answers WHERE stuID = ? AND qID = ?");
            ps.setInt(1, sID);
            ps.setInt(2, qID);
            ResultSet rs = ps.executeQuery();

            if (rs.last()) {
                rowcount = rs.getRow();
                rs.beforeFirst();
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowcount;
    }

    public static int skipQuestion(int stuID, int qID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO history (stuID,qID,Likes,Dislike,Skip) VALUES (?,?,?,?,?)");
            ps.setInt(1, stuID);
            ps.setInt(2, qID);
            ps.setInt(3, 0);
            ps.setInt(4, 0);
            ps.setInt(5, 1);
            status = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static users checkUserForMarking(int qID) {
        users u = new users();

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions q,answers a WHERE a.answerID = ? and a.qID=q.questionID");
            ps.setInt(1, qID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u.setUserID(rs.getInt("studentID"));
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }

    public static ResultSet checkUserForMarkin2g(int qID) {
        ResultSet rs = null;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions q,answers a,marks m WHERE a.answerID = ? and a.qID=q.questionID AND a.qID = m.qID and a.stuID = m.stuID");
            ps.setInt(1, qID);
            rs = ps.executeQuery();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static int checkUserForQuestion(int qID) {
        int user = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT studentID FROM questions WHERE questionID = ?");
            ps.setInt(1, qID);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                user = rs.getInt("studentID");
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public static int answerStatus(int aID) {
        int rs = 0;
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE answers SET status = ? WHERE answerID = ?");
            ps.setInt(1, 0);
            ps.setInt(2, aID);
            rs = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rs;
    }

    public static int checkSkipedQuestion(int stuID, int qID) {
        int status = 0;
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM history WHERE stuID = ? AND qID = ? AND Skip=?");
            ps.setInt(1, stuID);
            ps.setInt(2, qID);
            ps.setInt(3, 1);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                status = 1;
            }
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int answerQuestion(int qID, int stuID) {
        int status = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO history (stuID,qID,Likes,Dislike,Skip) VALUES (?,?,?,?,?)");
            ps.setInt(1, stuID);
            ps.setInt(2, qID);
            ps.setInt(3, 0);
            ps.setInt(4, 0);
            ps.setInt(5, 1);
            status = ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public static int LikeAndDislike(int sID, int qID) {
        int status = 0;
        ResultSet rs;
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM history WHERE stuID = ? AND qID = ?");
            ps.setInt(1, sID);
            ps.setInt(2, qID);
            rs = ps.executeQuery();

            if (rs.next()) {
                int like = rs.getInt("Likes");
                int dislike = rs.getInt("DisLike");

                if (like == 1 && dislike == 0) {
                    status = 1;
                } else if (like == 0 && dislike == 1) {
                    status = 2;
                } else {
                    status = 0;
                }

            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }

    public static void addNewLikeOrDislike(int sID, int qID, int like, int dislike) {
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO history(stuID,qID,Likes,Dislike,Skip) VALUES (?,?,?,?,?)");
            ps.setInt(1, sID);
            ps.setInt(2, qID);
            ps.setInt(3, like);
            ps.setInt(4, dislike);
            ps.setInt(5, 0);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void changeLikeDislike(int sID, int qID, int status1, int status2) {
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE history SET Likes = ? ,DisLike = ? WHERE stuID = ? AND qID = ? AND Likes = ? AND DisLike = ?");
            ps.setInt(1, status1);
            ps.setInt(2, status2);
            ps.setInt(3, sID);
            ps.setInt(4, qID);
            ps.setInt(5, status2);
            ps.setInt(6, status1);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void addLoginType(int stuID) {
        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO logintype(uID,loginType) values (?,?)");
            ps.setInt(1, stuID);
            ps.setInt(2, 2);
            ps.executeUpdate();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static int loginType(int stuID) {
        int type = 0;

        try {
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM logintype WHERE uID = ?");
            ps.setInt(1, stuID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                if (rs.getInt("logintype") == 2) {
                    type = 2;
                } else {
                    type = 1;
                }
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        return type;
    }
    
    public static ResultSet recentQuestions(int stuID){
        ResultSet rs = null;
        try{
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM questions WHERE studentID = ? LIMIT 2");
            ps.setInt(1, stuID);
            rs = ps.executeQuery();
            
        } catch(Exception e){
            e.printStackTrace();
        }
        return rs;
    }
    
    public static int totalAnsweredQuestions(int stuID){
        int count = 0;
        ResultSet rs;
        try{
            Connection con = dao.dbConnection();
            PreparedStatement ps = con.prepareStatement("SELECT COUNT(*) AS total FROM answers WHERE stuID = ?");
            ps.setInt(1, stuID);
            rs = ps.executeQuery();
            rs.next();
            count = rs.getInt("total");
            rs.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return count;
    }
}
