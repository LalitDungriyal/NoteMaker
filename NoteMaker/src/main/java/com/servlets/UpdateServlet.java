package com.servlets;

import jakarta.servlet.http.HttpServlet;
import java.io.IOException;
import java.util.Date;

import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.hibernate.Session;


public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public UpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			int id=Integer.parseInt(request.getParameter("noteId").trim());
			
			Session s=FactoryProvider.getFactory().openSession();
			Transaction tx=s.beginTransaction();
			
			Note note=(Note)s.get(Note.class, id);
			
			note.setTitle(title);
			note.setContent(content);
			note.setAddedDate(new Date());
			
			tx.commit();
			s.close();
			
			response.sendRedirect("all_notes.jsp");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
