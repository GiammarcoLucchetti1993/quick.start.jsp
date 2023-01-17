package service;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.time.LocalDateTime;
import java.util.ArrayList;

import pojo.User;
import singleton.DatabaseManagerSingleton;
import singleton.PropertiesManagerSingleton;

public class UserService {

	private static UserService instance;

	private UserService() {
	}

	public static UserService getInstance() {
		if (instance == null) {
			instance = new UserService();
		}
		return instance;
	}

	public boolean login(String email, String password) {
		boolean responseValue = false;
		User userRetrieved;
		try {
			userRetrieved = DatabaseManagerSingleton.getInstance().getUser(email, password);
			responseValue = userRetrieved != null;
		} catch (ClassNotFoundException | IOException | SQLException e) {
			e.printStackTrace();
		}
		return responseValue;
	}

	public boolean insert(User userToInsert) throws ClassNotFoundException, SQLException, IOException {
		boolean responseValue = DatabaseManagerSingleton.getInstance().insertTableUsers(userToInsert);
		return responseValue;
	}

	public ArrayList<User> selectAllUsers() throws ParseException, IOException, ClassNotFoundException, SQLException {
		ArrayList<User> users = new ArrayList<User>();
		users = DatabaseManagerSingleton.getInstance().selectAllUsers();
		return users;
	}
	
	public boolean deleteUser(int id) throws ClassNotFoundException, SQLException, IOException {
		boolean value = DatabaseManagerSingleton.getInstance().deleteRowUsers(id);
		return value;
	}

}
