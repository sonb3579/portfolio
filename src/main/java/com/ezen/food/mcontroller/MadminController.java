package com.ezen.food.mcontroller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.food.dto.AdminVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.ReviewVO;
import com.ezen.food.service.AdminService;

@Controller
public class MadminController {

	@Autowired
	AdminService as;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/madminLoginForm")
	public String adminLoginForm(HttpServletRequest request) {
			HttpSession session = request.getSession();
			
			if(session.getAttribute("loginAdmin")==null){
				return "mobile/admin/adminLogin";
			}else {
				return "redirect:/madminRestList";
			}
			
	}
	
	
	@RequestMapping(value = "madminLogin", method = RequestMethod.POST)
	public String adminLogin(@ModelAttribute("dto")@Valid AdminVO adminvo, BindingResult result,Model model, HttpServletRequest request) {
			
			if(result.getFieldError("workId")==null)model.addAttribute("message","아이디를 입력하세요.");
			else if(result.getFieldError("workPwd")==null)model.addAttribute("message","비밀번호를 입력하세요.");
			
			AdminVO avo = as.getAdmin(adminvo.getWorkId());
			
			if(avo==null)model.addAttribute("message","아이디가 존재하지 않습니다.");
			else if(avo.getWorkPwd()==null) model.addAttribute("message","데이터베이스오류1");
			else if(!avo.getWorkPwd().equals(adminvo.getWorkPwd()))model.addAttribute("message","비밀번호가 일치하지 않습니다.");
			else if(avo.getWorkPwd().equals(adminvo.getWorkPwd())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginAdmin", avo);
				return "redirect:/madminRestList";
			}else model.addAttribute("message","데이터베이스오류2");
			
			return "mobile/admin/adminLogin";
			
	}
	
	
	@RequestMapping("/madminRestList")
	public ModelAndView admin_restlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("mobile/admin/adminLogin");
		}else {
			
				if(request.getParameter("first")!=null) {
					session.removeAttribute("key");
					session.removeAttribute("page");
				}
				
				int page=1;
				if(request.getParameter("page")!=null) {
					page = Integer.parseInt(request.getParameter("page"));
					session.setAttribute("page", page);
				}else if(session.getAttribute("page")!=null) {
					page = (Integer)session.getAttribute("page");
				}else {
					session.removeAttribute("page");
				}
				
				String key="";
				if(request.getParameter("key")!=null) {
					key = request.getParameter("key");
					session.setAttribute("key", key);
				}else if (session.getAttribute("key")!=null) {
					key = (String)session.getAttribute("key");
				}else {
					session.removeAttribute("key");
				}
				
				String [] ryn = {"n","y"};
				HashMap<String, Object> result = as.getRest(page,key);
				mav.addObject("restList", (List<RestVO>)result.get("restList"));
				mav.addObject("key",key);
				mav.addObject("rynList", ryn);
				mav.addObject("paging",(Paging)result.get("paging"));
				mav.setViewName("mobile/admin/restaurant/restList");
		}
		return mav;
	}
	
	@RequestMapping("/madminLogout")
	public String admin_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginAdmin");
		return "mobile/admin/adminLogin";
	}
	
	
	@RequestMapping("/madminMemberList")
	public ModelAndView admin_memberlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
				
				HttpSession session = request.getSession();
				
				if(session.getAttribute("loginAdmin")==null){
					mav.setViewName("mobile/admin/adminLogin");
				}else {
					
					if(request.getParameter("first")!=null) {
						session.removeAttribute("key");
						session.removeAttribute("page");
					}
					
						int page=1;
						if(request.getParameter("page")!=null) {
							page = Integer.parseInt(request.getParameter("page"));
							session.setAttribute("page", page);
						}else if(session.getAttribute("page")!=null) {
							page = (Integer)session.getAttribute("page");
						}else {
							session.removeAttribute("page");
						}
					
						String key="";
						if(request.getParameter("key")!=null) {
							key = request.getParameter("key");
							session.setAttribute("key", key);
						}else if (session.getAttribute("key")!=null) {
							key = (String)session.getAttribute("key");
						}else {
							session.removeAttribute("key");
						}
						
						
						HashMap<String, Object> result = as.getMember(page, key);
						mav.addObject("memberList", (List<MemberVO>)result.get("memberList"));
						mav.addObject("key",key);
						mav.addObject("paging",(Paging)result.get("paging"));
						mav.setViewName("mobile/admin/member/memberList");
				}
				return mav;
			}
	
	
	@RequestMapping("/madminNoticeList")
	public ModelAndView admin_noticelist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
				
				HttpSession session = request.getSession();
				
				if(session.getAttribute("loginAdmin")==null){
					mav.setViewName("mobile/admin/adminLogin");
				}else {
					
					if(request.getParameter("first")!=null) {
						session.removeAttribute("key");
						session.removeAttribute("page");
					}
					
						int page=1;
						if(request.getParameter("page")!=null) {
							page = Integer.parseInt(request.getParameter("page"));
							session.setAttribute("page", page);
						}else if(session.getAttribute("page")!=null) {
							page = (Integer)session.getAttribute("page");
						}else {
							session.removeAttribute("page");
						}
					
						String key="";
						if(request.getParameter("key")!=null) {
							key = request.getParameter("key");
							session.setAttribute("key", key);
						}else if (session.getAttribute("key")!=null) {
							key = (String)session.getAttribute("key");
						}else {
							session.removeAttribute("key");
						}
						
						HashMap<String, Object> result = as.getNotice(page,key);
						mav.addObject("noticeList", (List<NoticeVO>)result.get("noticeList"));
						mav.addObject("key",key);
						mav.addObject("paging",(Paging)result.get("paging"));
						mav.setViewName("mobile/admin/notice/noticeList");
				}
				return mav;
			}
	
	@RequestMapping("/madminMemberDetail")
	public ModelAndView admin_memberdetail(@RequestParam("id") String id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("mobile/admin/adminlogin");
		}else {
			MemberVO mvo = as.getMemberDetail(id);
			
			mav.addObject("memberVO",mvo);
			mav.setViewName("mobile/admin/member/memberDetail");
		}
		return mav;
	}
	
	@RequestMapping("/madminMemberReview")
	public ModelAndView admin_member_review(@RequestParam("id") String id, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			
			if(session.getAttribute("loginAdmin")==null){
				mav.setViewName("mobile/admin/adminlogin");
			}else {
				List<ReviewVO> list = as.getMemberReview(id);
				
				
				
				mav.addObject("memberReviewList", list);
				mav.setViewName("mobile/admin/member/memberReview");
			}
			return mav;
	}
	
	@RequestMapping("/madminMemberOut")
	public String admin_memberout(@RequestParam("id") String id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			return "mobile/admin/adminlogin";
		}else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			as.deleteMember(paramMap);
			return "redirect:/madminMemberList?page=1";
		}
	}
	
	@RequestMapping(value="/madminBannerList")
	public ModelAndView bannerList(HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		if( session.getAttribute("loginAdmin")==null) 
			mav.setViewName("mobile/admin/adminLogin");
		else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put( "ref_cursor", null );
			
			as.getBannerList(paramMap);
			ArrayList< HashMap<String,Object> > list 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			mav.addObject("bannerList", list);
			mav.setViewName("mobile/admin/banner/bannerList");
		}
		return mav;
	}
	
	@RequestMapping("/mdeleteBanner")
	public String delete_banner(@RequestParam("bseq") int bseq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			return "mobile/admin/adminlogin";
		}else {
			as.deleteBanner(bseq);
			
			return "redirect:/madminBannerList";
		}
	}
	
	@RequestMapping("/madminNoticeDetail")
	public ModelAndView admin_noticedetail(@RequestParam("nseq") int nseq, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			NoticeVO nvo = as.noticeDetail(nseq);
			
			mav.addObject("dto", nvo);
			mav.setViewName("mobile/admin/notice/noticeDetail");
		}
		return mav;
	}

	
}
