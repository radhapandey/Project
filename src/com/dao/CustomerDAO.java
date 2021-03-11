package com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import com.bean.Customer;
import com.bean.Transaction;

public class CustomerDAO {

	static final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	static final String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";

	static final String USER = "system";
	static final String PASS = "radha123";

	public Map<String, Customer> getAllCustomers() throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Customer customer = null;
		Map<String, Customer> customerMap = new LinkedHashMap<String, Customer>();
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			String sql = "select * from customer";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				customer = new Customer();
				customer.setName(rs.getString("name"));
				customer.setEmail(rs.getString("email"));
				customer.setC_balance(rs.getDouble("c_balance"));
				customer.setC_id(rs.getInt("c_id"));
				customerMap.put(customer.getName(), customer);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return customerMap;
	}

	public static Map<Integer, Transaction> getAllTransactions() throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Transaction transaction = null;
		Map<Integer, Transaction> transactionMap = new HashMap<Integer, Transaction>();
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			String sql = "SELECT tr_id, sender_id, (select name from customer where c_id = transaction.sender_id) sn, receiver_id, (select name from customer where c_id = transaction.receiver_id) rn, AMOUNT, TIME_STAMP FROM TRANSACTION";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				transaction = new Transaction();
				transaction.setTrid(rs.getInt("tr_id"));
				transaction.setSenderid(rs.getInt("sender_id"));
				transaction.setSenderName(rs.getString("sn"));
				transaction.setReceiverid(rs.getInt("receiver_id"));
				transaction.setReceiverName(rs.getString("rn"));
				transaction.setAmount((rs.getDouble("amount")));
				transaction.setTimestamp(rs.getTimestamp("time_stamp"));
				transactionMap.put(transaction.getTrid(), transaction);
			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return transactionMap;
	}

	public Customer getCustomerById(Integer id) throws Exception {
		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		Customer customer = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);
			String sql = "SELECT * FROM Customer WHERE c_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			rs = ps.executeQuery();
			while (rs.next()) {
				customer = new Customer();
				customer.setName(rs.getString("name"));
				customer.setEmail(rs.getString("email"));
				customer.setC_balance(rs.getDouble("c_balance"));
				customer.setC_id(rs.getInt("c_id"));

			}
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
		return customer;
	}

	public void transact(int senderId, int receiverId, double amount) throws Exception {

		Connection conn = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(DB_URL, USER, PASS);

			// get sender's current balance
			String sql = "select c_balance from customer where c_id=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, senderId);
			rs = ps.executeQuery();
			double senderCurrBal = -1;
			while (rs.next()) {
				senderCurrBal = rs.getDouble("c_balance");
			}
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}

			// get receiver's current balance
			ps = conn.prepareStatement(sql);
			ps.setInt(1, receiverId);
			rs = ps.executeQuery();
			double receiverCurrBal = -1;
			while (rs.next()) {
				receiverCurrBal = rs.getDouble("c_balance");
			}
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}

			// calculate new amounts
			double senderNewAmount = senderCurrBal - amount;
			double receiverNewAmount = receiverCurrBal + amount;

			// update sender's balance
			sql = "update customer set c_balance=? where c_id=?";
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, senderNewAmount);
			ps.setInt(2, senderId);
			ps.executeUpdate();
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}

			// update receiver's balance
			ps = conn.prepareStatement(sql);
			ps.setDouble(1, receiverNewAmount);
			ps.setInt(2, receiverId);
			ps.executeUpdate();
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}

			// insert transaction history
			sql = "INSERT INTO TRANSACTION (TR_ID, SENDER_ID, RECEIVER_ID, AMOUNT, TIME_STAMP) VALUES ((SELECT NVL(MAX(TR_ID),0)+1 FROM TRANSACTION), ?, ?, ?, (SELECT SYSTIMESTAMP FROM DUAL))";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, senderId);
			ps.setInt(2, receiverId);
			ps.setDouble(3, amount);
			ps.executeUpdate();
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}

		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (conn != null) {
				conn.close();
			}
		}
	}
}