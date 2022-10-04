package com.ezen.food.mcontroller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;

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

import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.WishVO;
import com.ezen.food.service.MainService;
import com.ezen.food.service.MemberService;

@Controller
public class Mmycontroller {

	@Autowired
	MainService ms;
	@Autowired
	MemberService mems;

	@RequestMapping("/MloginForm") // 로그인페이지
	public String MloginForm(HttpServletRequest request) {
		System.out.println("Mloginform입니다");
		return "mobile/Member/login";
	}
	
	// 로그인
		@RequestMapping(value = "Mlogin", method = RequestMethod.POST)
		public String Mlogin(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result,
				HttpServletRequest request, Model model) {

			String url = "mobile/Member/login";
			if (result.getFieldError("id") != null) {
				System.out.println("아이디 오류");
				model.addAttribute("message", result.getFieldError("id").getDefaultMessage());
				return url;
			} else if (result.getFieldError("pwd") != null) {
				System.out.println("비밀번호 오류");
				model.addAttribute("message", result.getFieldError("pwd").getDefaultMessage());
				return url;
			} else {
				MemberVO mvo = mems.getMember(membervo.getId());

				if (mvo == null)
					model.addAttribute("message", "아이디가 없습니다");
				else if (mvo.getPwd() == null)
					model.addAttribute("message", "DB 오류. 관리자에게 문의하세요");
				else if (!mvo.getPwd().equals(membervo.getPwd()))
					model.addAttribute("message", "비밀번호가 맞지않습니다");
				else if (mvo.getPwd().equals(membervo.getPwd())) {

					HttpSession session = request.getSession();
					session.setAttribute("loginUser", mvo);
					url = "redirect:/";
				}
				return url;
			}

		}
		
		@RequestMapping("/MmyPage")
		public String MmyPage() {
			System.out.println("마이페이지입니다.");
			return "mobile/Member/mypage";
		}
		
		
		@RequestMapping("/MmyCheck")
		public ModelAndView MmyCheck(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();

			HttpSession session = request.getSession();
			session.setAttribute("message", "0");
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
			String id = mvo.getId();

			if (request.getParameter("first") != null) {
				session.removeAttribute("key");
				session.removeAttribute("page");
			}
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if (session.getAttribute("page") != null) {
				page = (Integer) session.getAttribute("page");
			} else {
				session.removeAttribute("page");
			}

			HashMap<String, Object> result = mems.getLastCheck(page, id);
			mav.addObject("lastCheck", (List<CheckRestVO>) result.get("lastCheck"));

			mav.addObject("paging", (Paging) result.get("paging"));
			mav.setViewName("mobile/Member/check_reservation");

			return mav;
		}

		@RequestMapping("/MmyHistory")
		public ModelAndView MmyHistory(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();

			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
			String id = mvo.getId();

			if (request.getParameter("first") != null) {
				session.removeAttribute("key");
				session.removeAttribute("page");
			}
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if (session.getAttribute("page") != null) {
				page = (Integer) session.getAttribute("page");
			} else {
				session.removeAttribute("page");
			}

			HashMap<String, Object> result = mems.getRecentCheck(page, id);
			mav.addObject("recentCheck", (List<CheckRestVO>) result.get("recentCheck"));

			mav.addObject("paging", (Paging) result.get("paging"));
			mav.setViewName("mobile/Member/history_reservation");

			return mav;
		}

		@RequestMapping("/MmyWishlist")
		public ModelAndView MmyWish(HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();

			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
			String id = mvo.getId();

			if (request.getParameter("first") != null) {
				session.removeAttribute("key");
				session.removeAttribute("page");
			}
			int page = 1;
			if (request.getParameter("page") != null) {
				page = Integer.parseInt(request.getParameter("page"));
				session.setAttribute("page", page);
			} else if (session.getAttribute("page") != null) {
				page = (Integer) session.getAttribute("page");
			} else {
				session.removeAttribute("page");
			}

			HashMap<String, Object> result = mems.getWishlist(page, id);
			mav.addObject("wishlist", (List<WishVO>) result.get("wishlist"));

			mav.addObject("paging", (Paging) result.get("paging"));
			mav.setViewName("mobile/Member/mywishlist");

			return mav;
		}
		
		// 위시리스트 삭제
		@RequestMapping("/MremoveMyWish") 
		public String removeMyWish(Model model, HttpServletRequest request, @RequestParam("wseq") int wseq,
				@RequestParam("rseq") int rseq, @RequestParam("kind") String kind ) throws UnsupportedEncodingException {
			kind = URLEncoder.encode(kind, "UTF-8");
			String url = "mobile/Member/login";
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
			if (mvo == null) {
				return url;
			} else {
				ms.removeWish(wseq, mvo.getId());
				url = "redirect:/MmyWishlist";
			}
			return url;
		}
		
		// 로그아웃
		@RequestMapping(value = "/Mlogout", method = RequestMethod.GET)
		public String Mlogout(HttpServletRequest request) {
			HttpSession session = request.getSession();
			session.invalidate();
			return "redirect:/";
		}

		// 이름변경
		@RequestMapping(value = "/MchangeName", method = RequestMethod.POST)
		public String MchangeName(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model,
				HttpServletRequest request) {
			mems.changeName(membervo);
			HttpSession session = request.getSession();
			session.removeAttribute("loginUser");
			session.setAttribute("loginUser", membervo);
			session.setAttribute("message", "1");
			String url = "redirect:/MmyPage";

			return url;
		}

		// 성별변경
		@RequestMapping(value = "/MchangeGender", method = RequestMethod.POST)
		public String MchangeGender(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model,
				HttpServletRequest request) {
			mems.changeGender(membervo);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", membervo);
			session.setAttribute("message", "2");
			String url = "redirect:/MmyPage";
			return url;
		}

		// 전화번호변경
		@RequestMapping(value = "/MchangePhone", method = RequestMethod.POST)
		public String MchangePhone(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model,
				HttpServletRequest request) {
			mems.changePhone(membervo);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", membervo);
			session.setAttribute("message", "3");
			String url = "redirect:/MmyPage";
			return url;
		}

		// 비밀번호변경
		@RequestMapping(value = "/MchangePwd", method = RequestMethod.POST)
		public String MchangePwd(@ModelAttribute("dto") @Valid MemberVO membervo, BindingResult result, Model model,
				HttpServletRequest request) {

			mems.changePwd(membervo);
			HttpSession session = request.getSession();
			session.setAttribute("loginUser", membervo);
			session.setAttribute("message", "4");
			String url = "redirect:/MmyPage";

			return url;
		}
		

		//예약변경폼
		@RequestMapping("/MupdateReserveForm")
		public ModelAndView MupdateReserveForm(HttpServletRequest request, @RequestParam("cseq") int cseq) {
			ModelAndView mav = new ModelAndView();

			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
			String id = mvo.getId();

			
			CheckRestVO cvo = mems.updateReserveForm( cseq);
			mav.addObject("CheckRestVO", cvo);

			mav.setViewName("mobile/Member/updateReserve");

			return mav;
		}

		//예약변경
		@RequestMapping("/MreserveUpdate")
		public ModelAndView MreserveUpdate(@ModelAttribute("dto") @Valid CheckRestVO cvo, BindingResult result, Model model,
				HttpServletRequest request, @RequestParam("cseq") int cseq, @RequestParam("rseq") int rseq,
				@RequestParam("id") String id) {

			ModelAndView mav = new ModelAndView();

			if(request.getParameter("rvtDay") == "" || request.getParameter("rvtTime") == "" || request.getParameter("rvpp") == "") {
				
				HttpSession session = request.getSession();
				cvo = mems.updateReserveForm( cseq);
				mav.addObject("CheckRestVO", cvo);
				mav.setViewName("mobile/Member/updateReserve");
				session.setAttribute("message", "1");
				
				return mav;
			}else {
				cvo.setCseq(cseq);
				cvo.setRseq(rseq);
				cvo.setId(id);
				cvo.setC_checkdate(request.getParameter("rvtDay"));
				cvo.setC_checkdatetime(request.getParameter("rvTime"));
				cvo.setC_people(Integer.parseInt(request.getParameter("rvpp")));
		
				mems.reserveUpdate(cvo);
				
				HttpSession session = request.getSession();
				session.setAttribute("message", "0");
				
				mav.setViewName("redirect:/MmyCheck");
				
				return mav;
			}
			

		}
		//예약취소
		@RequestMapping("/MdeleteReserve")
		public String MdeleteReserve(HttpServletRequest request, @RequestParam("cseq") int cseq) {
			
			HttpSession session = request.getSession();
			MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
			String id = mvo.getId();
			
			mems.deleteReserve(cseq);
				
			return "redirect:/MmyCheck";
			
		}
		
		
		@RequestMapping("/MjoinForm") // 회원가입
		public String joinForm(HttpServletRequest request) {
			return "mobile/Member/joinForm";
		}

		@RequestMapping("/MdeleteAccountForm") // 회원탈퇴폼
		public String deleteAccountForm(HttpServletRequest request) {
			return "mobile/Member/deleteForm";
		}
/*
		@RequestMapping("/MdeleteAccount")
		public ModelAndView deleteAccount(@RequestParam("id") String id, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();

			MemberVO mvo = mems.deleteAccount(id);

			mav.setViewName("main");

			return mav;
		}
		*/
		@RequestMapping("/Mcontract") // 회원가입 약관창 이동
		public String contract(HttpServletRequest request) {
			return "mobile/Member/contract";
		}


		@RequestMapping("/MidCheckForm")
		public String id_check_form(@RequestParam("id") String id, Model model) {

			MemberVO mvo = mems.getMember(id);

			if (mvo == null)
				model.addAttribute("result", -1);
			else
				model.addAttribute("result", 1);

			model.addAttribute("id", id);
			return "mobile/Member/idcheck";
		}

		@RequestMapping(value = "Mjoin", method = RequestMethod.POST)
		public String join(@ModelAttribute("mvo") MemberVO membervo, Model model) {

			HashMap<String, Object> paramMap = new HashMap<String, Object>();

			paramMap.put("id", membervo.getId());
			paramMap.put("pwd", membervo.getPwd());
			paramMap.put("name", membervo.getName());
			paramMap.put("gender", membervo.getGender());
			paramMap.put("email", membervo.getEmail());
			paramMap.put("phone", membervo.getPhone());

			mems.insertMember(paramMap);

			model.addAttribute("message", "회원가입이 완료되었어요. 로그인하세요");

			return "mobile/Member/login";
		}

		@RequestMapping("/MfindForm")
		public String find_form() {
			return "mobile/find/find";
		}

		@RequestMapping(value = "MfindId", method = RequestMethod.POST)
		public String find_id(@RequestParam("find_name") String find_name, @RequestParam("find_tel") String find_tel,
				Model model) {

			String url = "mobile/find/find";

			MemberVO mvo = mems.findId_ByNP(find_name, find_tel);
			if (mvo == null)
				model.addAttribute("msg", "해당이름과 전화번호의 회원이 없습니다");
			else {
				model.addAttribute("MemberVO", mvo);
				url = "mobile/find/findIdResult";
			}
			return url;
		}
		
		
		
		

	@RequestMapping(value = "MfindPw", method = RequestMethod.POST)
		public String find_pwd(@RequestParam("find_id") String find_id, @RequestParam("find_tel") String find_tel,
				Model model) {

			String url = "mobile/find/find";

			MemberVO mvo = mems.findIdbyId_Phone(find_id, find_tel);
			if (mvo == null)
				model.addAttribute("msg2", "해당이름과 전화번호의 회원이 없습니다");
			else {
				model.addAttribute("MemberVO", mvo);
				url = "mobile/find/findPwdResult1";
			}
			return url;
		}

		@RequestMapping("/MfindPw2")
		public String find_pwd2(@RequestParam("chk_num") String chk_num, @RequestParam("id") String id, @RequestParam("phone") String phone,Model model) {
			String url="mobile/find/find";
		
			MemberVO mvo = mems.findIdbyId_Phone(id, phone);
			
			System.out.println(chk_num);
			if( !chk_num.equals("1234") ) {
				model.addAttribute("msg2", "인증번호가 일치하지 않습니다.");
			} else {
				model.addAttribute("MemberVO", mvo);
				url = "mobile/find/findPwdResult3";
			}
			return url;
		}
		

}
	
	
	
	
	

