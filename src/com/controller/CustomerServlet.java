package com.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bean.Customer;
import com.bean.Transaction;
import com.dao.CustomerDAO;

public class CustomerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private CustomerDAO customerDAO = new CustomerDAO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String actionType = request.getParameter("actionType");

		if ("getCustomerbyId".equals(actionType)) {
			try {
				getCustomerbyId(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("transfer".equals(actionType)) {
			try {
				transfer(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if ("getTransactionDetails".equals(actionType)) {
			try {
				getTransactions(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else {
			try {
				getCustomers(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}

	}

	private void getCustomers(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<String, Customer> customermap = customerDAO.getAllCustomers();

		HttpSession session = request.getSession();
		session.setAttribute("customermap", customermap);

		RequestDispatcher rd = request.getRequestDispatcher("/viewCustomers.jsp");
		rd.forward(request, response);
		return;
	}

	private void getCustomerbyId(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer cid = Integer.parseInt(request.getParameter("id"));
		Customer cust = customerDAO.getCustomerById(cid);

		// HttpSession session = request.getSession(false);
		// session.setAttribute("customer", cust);
		request.setAttribute("customer", cust);

		RequestDispatcher rd = request.getRequestDispatcher("/CustomerPage.jsp");
		rd.forward(request, response);
		return;
	}

	private void transfer(HttpServletRequest request, HttpServletResponse response) throws Exception {

		int senderId = Integer.parseInt(request.getParameter("senderId"));
		int receiverId = Integer.parseInt(request.getParameter("receiverId"));
		double amount = Double.parseDouble(request.getParameter("amount"));

		customerDAO.transact(senderId, receiverId, amount);

		// refresh all customer
		Map<String, Customer> customermap = customerDAO.getAllCustomers();

		HttpSession session = request.getSession(false);
		session.setAttribute("customermap", customermap);
		request.setAttribute("successMsg", "Transaction succesful!!");

		RequestDispatcher rd = request.getRequestDispatcher("/viewCustomers.jsp");
		rd.forward(request, response);

		return;

	}

	private void getTransactions(HttpServletRequest request, HttpServletResponse response) throws Exception {
		Map<Integer, Transaction> transactionmap = CustomerDAO.getAllTransactions();

		HttpSession session = request.getSession();
		session.setAttribute("transactionmap", transactionmap);

		RequestDispatcher rd = request.getRequestDispatcher("/transacHistory.jsp");
		rd.forward(request, response);
		return;
	}
};