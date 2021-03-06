package web;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import security.DataException;
import security.ModelManager;
import util.RoleCheck;

@Controller
public class TransacationController {

	String role;
	int id;
	String name;
	public static List<HashMap<String, String>> list;

	public void setUserDetails(HttpServletRequest request) throws DataException {
		try {
			role = (String) request.getSession(false).getAttribute("role");
			id = (Integer) request.getSession(false).getAttribute("id");
			name = (String) request.getSession(false).getAttribute("name");
		} catch (NullPointerException e) {
			throw new DataException("Login failed");
		}
	}

	@RequestMapping(value = "/transaction", method = RequestMethod.POST)
	public String viewTransaction(Model model, HttpServletRequest request, RedirectAttributes redAttr) {
		if (request.getSession(false) != null) {
			try {
				setUserDetails(request);
				if (RoleCheck.isExternal(role)) {
					list = ModelManager.getCompleteTrasaction(request.getParameter("accNo").split(",")[0]);
					return "redirect:/transaction";
				}
			} catch (DataException e) {
			}
		}
		redAttr.addFlashAttribute("home", "Illegal Activity detected. Incident will reported");
		return "redirect:/login";

	}

	@RequestMapping(value = "/transaction", method = RequestMethod.GET)
	public String getTransaction(Model model, HttpServletRequest request, RedirectAttributes redAttr) {
		if (request.getSession(false) != null) {
			try {
				setUserDetails(request);
				if (RoleCheck.isExternal(role) && list != null) {
					model.addAttribute("transactionlist", list);
					list = null;
					return "transaction";
				} else {
					redAttr.addFlashAttribute("home", "You don't have the previlege to view transactions");
				}

			} catch (DataException e) {
				redAttr.addFlashAttribute("home", "Failed to fetch transactions");
			}
			return "redirect:/home";
		}
		redAttr.addFlashAttribute("home", "Illegal Activity detected. Incident will reported");
		return "redirect:/login";

	}
}
