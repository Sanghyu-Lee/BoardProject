package com.mycompany.myapp.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.mycompany.myapp.user.BCrypt;
import com.mycompany.myapp.user.UserService;
import com.mycompany.myapp.user.UserVO;

@Controller
public class UserController {

	@Autowired
	private UserService service;

	@RequestMapping(value = "/insertUser.do")
	public String insertUser(UserVO vo) {
		String BC = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
		vo.setUserPassword(BC);
		service.insertUser(vo);
		return "user/login.jsp";
	}

	@RequestMapping(value = "/updateUser.do")
	public String updateUser(UserVO vo, HttpSession session) {
		if(vo.getPassword() == null || vo.getPassword() == "") {
			String userID = (String) session.getAttribute("userID");
			vo.setUserID(userID);
			UserVO user = service.getUser(vo);
			vo.setUserPassword(user.getUserPassword());
		} else {
			String BC = BCrypt.hashpw(vo.getPassword(), BCrypt.gensalt());
			vo.setUserPassword(BC);
		}
		service.updateUser(vo);
		session.setAttribute("userID", vo.getUserID());
		session.setAttribute("userNickName", vo.getUserNickname());
		return "main.jsp";
	}

	@RequestMapping(value = "/userCheck.do")
	public String userCheck(UserVO vo, HttpSession session, Model model, HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String path = request.getContextPath();
		PrintWriter out = response.getWriter();
		
		String userID = (String) session.getAttribute("userID");
		vo.setUserID(userID);
		UserVO user = service.getUser(vo);
		if (BCrypt.checkpw(vo.getPassword(), user.getUserPassword())) {
			model.addAttribute("user", user);
			return "user/userUpdate.jsp";
		}
		out.println("<script>");
		out.println("alert('비밀번호가 일치하지 않습니다.');");
		out.println("location.href='"+path+"/user/userCheck.jsp';");
		out.println("</script>");
		return null;
	}

	@RequestMapping(value = "/idCheck.do")
	public void idCheck(UserVO vo, HttpServletResponse response) throws IOException {
		UserVO user = service.getUser(vo);
		int check;
		if (user != null) {
			check = 1;
		} else {
			check = 0;
		}
		PrintWriter out = response.getWriter();
		out.println(check);
	}

	@RequestMapping(value = "/login.do")
	public String login(UserVO vo, HttpSession session, 
						HttpServletResponse response, 
						HttpServletRequest request) throws IOException {
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String path = request.getContextPath();
		PrintWriter out = response.getWriter();
		UserVO user = service.getUser(vo);
		if (user == null) {
			out.println("<script>");
			out.println("alert('아이디가 존재하지 않습니다.');");
			out.println("location.href='"+path+"/user/login.jsp';");
			out.println("</script>");
			return null;
		} else {
			if (BCrypt.checkpw(vo.getPassword(), user.getUserPassword())) {
				session.setAttribute("userID", user.getUserID());
				session.setAttribute("userNickName", user.getUserNickname());
				return "main.jsp";
			} else {
				out.println("<script>");
				out.println("alert('비밀번호가 일치하지 않습니다.');");
				out.println("location.href='"+path+"/user/login.jsp';");
				out.println("</script>");
				return null;
			}
		}
	}

	@RequestMapping(value = "logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "user/login.jsp";
	}
}
