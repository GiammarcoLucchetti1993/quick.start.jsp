package singleton;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import pojo.User;

public class DatabaseManagerSingleton {

	private static DatabaseManagerSingleton instance;
	private final static Logger logger = LoggerFactory.getLogger(DatabaseManagerSingleton.class);

	private DatabaseManagerSingleton() {
		logger.debug("Instanziato Costruttore Privato Database Manager Singleton");
	}

	public static DatabaseManagerSingleton getInstance() {
		if (instance == null) {
			instance = new DatabaseManagerSingleton();
		}
		return instance;
	}

	public boolean insertTableUsers(User messageToInsert) throws ClassNotFoundException, SQLException, IOException {
		boolean value = false;
		int rowsUpdate = 0;
		Connection con = getConnection();

		String query = "insert into users(email,password,firstname,lastname,dateofbirth,regdate,role)"
				+ " values(?,?,?,?,?,?,?);";

		PreparedStatement pStatement = con.prepareStatement(query);
		pStatement.setString(1, messageToInsert.getEmail());
		pStatement.setString(2, messageToInsert.getPassword());
		pStatement.setString(3, messageToInsert.getFirstName());
		pStatement.setString(4, messageToInsert.getLastName());
		pStatement.setDate(5, messageToInsert.getDateOfBirth());
		pStatement.setTimestamp(6, messageToInsert.getRegDate());
		pStatement.setInt(7, messageToInsert.getRole());
		rowsUpdate = pStatement.executeUpdate();
		con.close();
		if(rowsUpdate>0) {
			value = true;
		}
		return value;
	}

	public ArrayList<User> selectAllUsers() throws ParseException, IOException, ClassNotFoundException, SQLException {
		ArrayList<User> users = new ArrayList();
		Connection con = getConnection();
		String query = "SELECT * FROM users";
		PreparedStatement pStatement = con.prepareStatement(query);
		ResultSet res = pStatement.executeQuery();

		while (res.next()) {
			User getUser = new User();
			getUser.setId(res.getInt("id"));
			getUser.setEmail(res.getString("email"));
			getUser.setPassword(res.getString("password"));
			getUser.setFirstName(res.getString("firstname"));
			getUser.setLastName(res.getString("lastname"));
			getUser.setDateOfBirth(res.getDate("dateofbirth"));
			getUser.setRegDate(res.getTimestamp("regdate"));
			getUser.setRole(res.getInt("role"));
			users.add(getUser);
		}
		return users;
	}

	public boolean deleteRowUsers(int id) throws ClassNotFoundException, SQLException, IOException {
		boolean value = false;
		Connection con = getConnection();
		String query = "DELETE FROM users where id=?";
		PreparedStatement pStatement = con.prepareStatement(query);
		pStatement.setInt(1, id);
		int row = pStatement.executeUpdate();
		if (row > 0) {
			value = true;
		}

		con.close();
		return value;
	}

	public User getUser(String emailLog, String passwordLog) throws IOException, ClassNotFoundException, SQLException {
		User userToReturn = null;
		boolean returnValue = false;
		try {
			Connection con = getConnection();
			String query = "SELECT * FROM users where email =? AND password=?;";
			PreparedStatement pStatement = con.prepareStatement(query);
			pStatement.setString(1, emailLog);
			pStatement.setString(2, passwordLog);
			ResultSet res = pStatement.executeQuery();
			if (res.next() == true) {
				userToReturn = new User();
				userToReturn.setId(res.getInt("id"));
				userToReturn.setEmail(res.getString("email"));
				userToReturn.setPassword(res.getString("password"));
				userToReturn.setFirstName(res.getString("firstname"));
				userToReturn.setLastName(res.getString("lastname"));
				userToReturn.setDateOfBirth(res.getDate("dateofbirth"));
				userToReturn.setRegDate(res.getTimestamp("regdate"));
				userToReturn.setRole(res.getInt("role"));
				con.close();
				return userToReturn;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return userToReturn;
	}
	
	public boolean updateUserById(int id,User itemToInsert) throws IOException, ClassNotFoundException, SQLException {
		boolean returnValue = false;
		Connection con = getConnection();
		String query = "UPDATE users SET email =? , password=? , firstname=? , lastname=? WHERE id =?";
		PreparedStatement pStatement = con.prepareStatement(query);
		pStatement.setString(1, itemToInsert.getEmail());
		pStatement.setString(2, itemToInsert.getPassword());
		pStatement.setString(3, itemToInsert.getFirstName());
		pStatement.setString(4, itemToInsert.getLastName());
		pStatement.setInt(5, id);
		ResultSet res = pStatement.executeQuery();
		if (res.next() == true) {
			returnValue = true;
			return returnValue;
		}
		con.close();
		return returnValue;
	}
	
	private Connection getConnection() throws IOException, ClassNotFoundException, SQLException{
		String driver = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.driver");
		Class.forName(driver);
		String host = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.host");
		String port = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.port");
		String dbName= PropertiesManagerSingleton.getInstance().getProperty("database.mysql.db.name");
		String url = "jdbc:mariadb://"+host+":"+port+"/"+dbName;
		String userName = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.db.username");
		String password = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.db.password");
		Connection con = DriverManager.getConnection(url, userName, password);
		return con;
	}
	
}

//	public boolean login(String emailLog, String passwordLog) throws IOException, ClassNotFoundException, SQLException {
//
//		boolean returnValue = false;
//		try {
//			String driver = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.driver");
//			Class.forName(driver);
//			String host = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.host");
//			String port = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.port");
//			String dbName = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.db.name");
//			String url = "jdbc:mariadb://" + host + ":" + port + "/" + dbName;
//			String userName = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.db.username");
//			String password = PropertiesManagerSingleton.getInstance().getProperty("database.mysql.db.password");
//			Connection con = DriverManager.getConnection(url, userName, password);
//			String query = "SELECT * FROM users where email =? AND password=?;";
//			PreparedStatement pStatement = con.prepareStatement(query);
//			pStatement.setString(1, emailLog);
//			pStatement.setString(2, passwordLog);
//			ResultSet res = pStatement.executeQuery();
//			if (res.next() == true)
//				return true;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return returnValue;
//	}