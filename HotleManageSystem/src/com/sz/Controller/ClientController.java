package com.sz.Controller;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Random;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sz.Pojo.Client;
import com.sz.Service.ClientService;

@Controller
public class ClientController {
	@Resource
	private ClientService clientServiceImpl;
	
	@RequestMapping("vaidCode")
	public void vaidCode(HttpServletRequest request , HttpServletResponse response , Date date ) throws IOException {
		int height = 50;
		int width = 100;
		BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_BGR);
		Random random = new Random();


		List<Integer>list = new ArrayList<Integer>();
		for(int i=0 ;i<4 ;i++) {
			list.add(random.nextInt(10));
		}

		Graphics2D gra = image.createGraphics();
		gra.setColor(Color.WHITE);

		gra.fillRect(0,0, width, height);


		Color[]colors = new Color[]{Color.BLACK,Color.red,Color.BLUE,Color.pink,Color.GREEN,Color.GRAY,Color.yellow};


		gra.setFont(new Font("宋体",Font.ITALIC|Font.BOLD,30));
		for(int i=0 ;i<list.size() ;i++) {
			gra.setColor(colors[random.nextInt(colors.length)]);
			gra.drawString(list.get(i)+"", i*width/4, 40+(new Random().nextInt(11)-10));
		}

		for(int i=0 ;i<3 ;i++) {
			gra.setColor(colors[random.nextInt(colors.length)]);
			gra.drawLine(0,random.nextInt(51), 100, random.nextInt(51));
		}

		ServletOutputStream out = response.getOutputStream();

		ImageIO.write(image, "jpg", out);


		HttpSession session = request.getSession();
		session.setAttribute("code", ""+list.get(0)+list.get(1)+list.get(2)+list.get(3));
	}
	
	@RequestMapping("clientLogin")
	@ResponseBody
	public void login(String username,String userpassword,String vaidCode,HttpSession session ,HttpServletResponse response ,HttpServletRequest request ) {
		response.setContentType("text/html;charset=UTF-8");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		Client client = new Client();
		client.setUsername(username);
		client = clientServiceImpl.loginClient(client);
		String code = request.getSession().getAttribute("code").toString();
		String message;
		if(client == null || !client.getUserpassword().equals(userpassword)) {
			message = "{\"message\":\"error\"}";
		}else if (!code.equals(vaidCode)){
			message = "{\"message\":\"wrong\"}";
		}else {
		    message = "{\"message\":\"success\"}";
		    session.setAttribute("client", client);
		}
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.write(message);
		pw.flush();
	}
	
	@RequestMapping("clientRegister")
	@ResponseBody
	public void register(String username,String name,String userpassword,String telephone , HttpServletRequest request ,HttpServletResponse response) throws IOException, ServletException {
		Client client = new Client();
		client.setUsername(username);
		String message;
		if(clientServiceImpl.loginClient(client)==null) { //该用户名尚未被注册过
			byte[]photo = returnByte(request);
			client.setName(name);
			client.setTelephone(telephone);
			client.setTimes(0);
			client.setUserpassword(userpassword);
			client.setPhoto(photo);
			int length = clientServiceImpl.insClient(client);
			if(length > 0) {
				message = "{\"message\":\"success\"}";
			}else {
				message = "{\"message\":\"wrong\"}";
			}	
		}else {
			message = "{\"message\":\"wrong\"}";
		}
		
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.write(message);
		pw.flush();
	}
	
	@RequestMapping("client.getPhoto")
	public void getPhoto(HttpSession session , HttpServletResponse response) {
		Client client = (Client) session.getAttribute("client");
		ByteArrayInputStream bai = new ByteArrayInputStream(client.getPhoto());
		try {
			BufferedImage bi = ImageIO.read(bai);
			ServletOutputStream out = response.getOutputStream();
			ImageIO.write(bi, "jpg", out);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}
	
	@RequestMapping("client.ChangeMessage")
	public String transforMessage() {
		return "clientMessage";
	}
	
	@RequestMapping("client.ShowMessage")
	public String showMessage(String message) {
		switch(message) {
			case "showMessage":
				return "/ClientMessage/showMessage";
			case "changePassword":
				return "/ClientMessage/changePassword";
			case "changePhoto":	
				return "/ClientMessage/changePhoto";
			case "changeMessage":
				return "/ClientMessage/changeMessage";
		}
		return "/ClientMessage/showMessage";
		
	}
	
	@RequestMapping("client.updateMessage")
	@ResponseBody
	public void updateMessage(String name , String telephone , String email , HttpSession session , HttpServletResponse response) {
		Client client = (Client) session.getAttribute("client");
		client.setEmail(email);
		client.setName(name);
		client.setTelephone(telephone);
		int length = clientServiceImpl.updMessage(client);
		String message = null;
		if(length > 0) {
			message = "{\"message\":\"success\"}";
		}else {
			message = "{\"message\":\"error\"}";
		}
		PrintWriter pw = null;
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.write(message);
		pw.flush();
		
	}
	
	@RequestMapping("client.updatePassword")
	@ResponseBody
	public void updatePassword(String old , String news , HttpSession session , HttpServletResponse response) {
		Client client = (Client) session.getAttribute("client");
		String message = null;
		PrintWriter pw = null;
		if(old.equals(client.getUserpassword())) {
			client.setUserpassword(news);
			int length = clientServiceImpl.updPassword(client);
			if(length > 0) {
				message = "{\"message\":\"success\"}";
			}else {
				message = "{\"message\":\"wrong\"}";
			}
		}else {
			message = "{\"message\":\"error\"}";
		}
		try {
			pw = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		pw.write(message);
		pw.flush();
	}
	
	
	@RequestMapping("client.changePhoto")
	public String changePhoto(MultipartFile  file , HttpSession session) throws IOException {
		Client client = (Client) session.getAttribute("client");
		client.setPhoto(file.getBytes());
		return "clientMessage";
	}
	
	
	private byte[] returnByte(HttpServletRequest request) throws IOException {
		byte[] arr = null;
		String path = request.getServletContext().getRealPath("file");
		File file = new File(path , "Default.jpg");
		arr = FileUtils.readFileToByteArray(file);
        return arr;
	}
}
