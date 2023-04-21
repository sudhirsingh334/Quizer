package com.quizer.utilities;

import jakarta.servlet.jsp.JspWriter;

public class Alert {
	public static void show(String message, JspWriter out) throws Exception {
		out.println("<script type=\"text/javascript\">");
		String alertTag = String.format("alert('%s');", message);
		out.println(alertTag);
		out.println("location='/Quizer';");
		out.println("</script>");
	}
}