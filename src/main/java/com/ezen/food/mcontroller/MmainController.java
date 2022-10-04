package com.ezen.food.mcontroller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
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
import com.ezen.food.dto.QnaVO;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.ReviewVO;
import com.ezen.food.dto.WishVO;
import com.ezen.food.service.MainService;

@Controller
public class MmainController {
	
	@Autowired
	MainService ms;
	
	@RequestMapping("/mobilemain")
		public String index(HttpServletRequest request, Model model) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("ref_cursor", null);
		paramMap.put("ref_cursor2", null);
		
		ms.getBannerList(paramMap);
		ms.getNewRestList(paramMap);
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
		ArrayList<HashMap<String, Object>> list2 = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor2");
		
		model.addAttribute("bannerList", list);
		model.addAttribute("newRestList", list2);
		
		return "mobile/main";
	}
	
	@RequestMapping("/Mcategory") // 카테고리
	public String catagory(Model model, HttpServletRequest request, @RequestParam("kind") String kind) {

		HttpSession session = request.getSession();

		// 페이징
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if (session.getAttribute("page") != null) {
			page = (Integer) session.getAttribute("page");
		} else {
			session.removeAttribute("page");
		}

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("page", page);
		paramMap.put("kind", kind);
		paramMap.put("ref_cursor", null);

		ms.getKindList(paramMap);

		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");

		model.addAttribute("restKindList", list);
		model.addAttribute("paging", (Paging) paramMap.get("paging"));
		model.addAttribute("kind", kind);

		return "/mobile/restaurant/restKind";
	}
	

	@RequestMapping("/MdetailForm") // 식당 상세 페이지
	public ModelAndView detailForm(Model model, HttpServletRequest request, @RequestParam("rseq") int rseq,
			@RequestParam("kind") String kind) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();

		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");

		if (mvo != null) {
			WishVO wvo = ms.getResult(mvo.getId(), rseq);
			request.setAttribute("WishVO", wvo);
		}

		Integer avg = ms.getAvgRating(rseq);
		model.addAttribute("average", avg);
		if (avg == null)
			avg = 0;
		else
			ms.pushRating(avg, rseq);

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rseq", rseq);
		paramMap.put("kind", kind);
		paramMap.put("ref_cursor", null);
		paramMap.put("ref_cursor2", null);
		paramMap.put("ref_cursor3", null);
		paramMap.put("ref_cursor4", null);
		paramMap.put("ref_cursor5", null);

		ms.getDetail(paramMap);
		ms.getReviews(paramMap);
		ms.getImages(paramMap);
		ms.getMenu(paramMap);
		ms.getKindListInDetail(paramMap);

		ArrayList<HashMap<String, Object>> list1 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
		ArrayList<HashMap<String, Object>> list2 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor2");
		ArrayList<HashMap<String, Object>> list3 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor3");
		ArrayList<HashMap<String, Object>> list4 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor4");
		ArrayList<HashMap<String, Object>> list5 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor5");

		mav.addObject("RestVO", list1.get(0));
		mav.addObject("reviewList", list2);
		mav.addObject("ImagesVO", list3.get(0));
		mav.addObject("restKindList", list4);
		mav.addObject("menuVO", list5.get(0));

		mav.setViewName("mobile/detail/detail2");
		return mav;
	}
	
	
	 
	@RequestMapping("/MsearchRestList") // 메인 검색
	public ModelAndView searchRestList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		String key = "";
		if (session.getAttribute("loginUser") == null) {
			mav.setViewName("mobile/Member/login");
		} else {
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

			if (request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key", key);
			} else if (session.getAttribute("key") != null) {
				key = (String) session.getAttribute("key");
			} else {
				mav.setViewName("redirect:/mobilemain");
				session.removeAttribute("key");
			}
			mav.setViewName("mobile/restaurant/restKind2");
			HashMap<String, Object> result = ms.searchRestList(page, key);
			mav.addObject("restKindList", (List<RestVO>) result.get("restKindList"));
			mav.addObject("key", key);
			mav.addObject("paging", (Paging) result.get("paging"));

		}
		return mav;
	}

	@RequestMapping("/Mnotice") // 공지사항
	public ModelAndView notice(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();

		if (session.getAttribute("loginUser") == null) {
			mav.setViewName("mobile/Member/login");
		} else {
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

			String key = "";
			if (request.getParameter("key") != null) {
				key = request.getParameter("key");
				session.setAttribute("key", key);
			} else if (session.getAttribute("key") != null) {
				key = (String) session.getAttribute("key");
			} else {
				session.removeAttribute("key");
			}

			HashMap<String, Object> result = ms.getNoticeListM(page, key);
			mav.addObject("noticeList", (List<NoticeVO>) result.get("noticeList"));
			mav.addObject("key", key);
			mav.addObject("paging", (Paging) result.get("paging"));
			mav.setViewName("mobile/restaurant/notice");
		}
		return mav;
	}

	@RequestMapping("/MnoticeDetail") // 공지사항 상세
	public ModelAndView noticeDetail(@RequestParam("nseq") int nseq, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();

		if (session.getAttribute("loginUser") == null) {
			mav.setViewName("mobile/Member/login");
		} else {
			NoticeVO nvo = ms.noticeDetail(nseq);
			mav.addObject("dto", nvo);
			mav.setViewName("mobile/restaurant/noticeDetail");
		}
		return mav;
	}

	@RequestMapping("/MaddWish") // 위시리스트 추가
	public String addWish(Model model, HttpServletRequest request, @RequestParam("rseq") int rseq,
			@RequestParam("kind") String kind) throws UnsupportedEncodingException {
		kind = URLEncoder.encode(kind, "UTF-8");
		String url = "mobile/Member/login";
		HttpSession session = request.getSession();

		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");

		if (mvo == null) {
			return url;
		} else {
			ms.addWish(rseq, mvo.getId());
			url = "redirect:/MdetailForm?rseq=" + rseq + "&kind=" + kind;
		}
		return url;
	}

	@RequestMapping("/MremoveWish") // 위시리스트 삭제
	public String removeWish(Model model, HttpServletRequest request, @RequestParam("wseq") int wseq,
			@RequestParam("rseq") int rseq, @RequestParam("kind") String kind) throws UnsupportedEncodingException {
		kind = URLEncoder.encode(kind, "UTF-8");
		String url = "mobile/Member/login";
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if (mvo == null) {
			return url;
		} else {
			ms.removeWish(wseq, mvo.getId());
			url = "redirect:/MdetailForm?rseq=" + rseq + "&kind=" + kind;
		}
		return url;
	}

	@RequestMapping("/MreserveForm") // 식당 예약폼 이동
	public String reserveForm(Model model, HttpServletRequest request, @RequestParam("rseq") int rseq) {
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rseq", rseq);
		ms.getDetail(paramMap);
		ArrayList<HashMap<String, Object>> list1 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
		model.addAttribute("RestVO", list1.get(0));
		if (mvo == null)
			return "redirect:/MloginForm";
		else
			return "mobile/detail/reservation";
	}

	@RequestMapping("/MreserveInsert") // 식당 예약
	public ModelAndView reserveForm(@ModelAttribute("dto") @Valid CheckRestVO checkrestvo, BindingResult result,
			HttpServletRequest request, Model model, @RequestParam("rseq") int rseq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/MloginForm");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if (mvo == null) {
			return mav;
		} else {
			mav.setViewName("mobile/detail/reservation");
			if (result.getFieldError("c_checkdate") != null)
				model.addAttribute("message", result.getFieldError("c_checkdate").getDefaultMessage());
			else if (result.getFieldError("c_checkdatetime") != null)
				model.addAttribute("message", result.getFieldError("c_checkdatetime").getDefaultMessage());
			else if (result.getFieldError("c_people") != null)
				model.addAttribute("message", result.getFieldError("c_people").getDefaultMessage());
			else {
				ms.reserveInsert(checkrestvo);
				mav.setViewName("redirect:/MmyCheck");
			}
		}

		return mav;
	}

	@RequestMapping("/MreviewSubmit") // 리뷰 등록
	public ModelAndView reviewSubmit(@ModelAttribute("dto") @Valid ReviewVO reviewvo, BindingResult result,
			HttpServletRequest request, Model model, @RequestParam("kind") String kind)
			throws UnsupportedEncodingException {
		kind = URLEncoder.encode(kind, "UTF-8");
		ModelAndView mav = new ModelAndView();
		int rseq = Integer.parseInt(request.getParameter("rseq"));
		mav.setViewName("redirect:/MloginForm");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if (mvo == null) {
			return mav;
		} else {
			mav.setViewName("forward:/MdetailForm?rseq=" + rseq + "&kind=" + kind);
			if (result.getFieldError("rating1") != null)
				model.addAttribute("message", result.getFieldError("rating1").getDefaultMessage());
			else if (result.getFieldError("content") != null)
				model.addAttribute("message", result.getFieldError("content").getDefaultMessage());
			else {
				ms.reviewSubmit(reviewvo);
				mav.setViewName("redirect:/MdetailForm?rseq=" + rseq + "&kind=" + kind);
			}
		}

		return mav;
	}

	@RequestMapping("/MeditReview") // 리뷰 수정 페이지 이동
	public String editReview(HttpServletRequest request, Model model, @RequestParam("rwseq") int rwseq) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rwseq", rwseq);
		paramMap.put("ref_cursor", null);
		ms.getReviewOne(paramMap);
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
		model.addAttribute("ReviewVO", list.get(0));
		return "mobile/detail/edit";
	}

	@RequestMapping("/MreviewUpdate") // 리뷰 수정
	public ModelAndView reviewUpdate(@ModelAttribute("dto") @Valid ReviewVO reviewvo, BindingResult result,
			HttpServletRequest request, Model model, @RequestParam("rwseq") int rwseq) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("forward:/MeditReview?rwseq=" + rwseq);
		if (result.getFieldError("rating1") != null)
			model.addAttribute("message", result.getFieldError("rating1").getDefaultMessage());
		else if (result.getFieldError("content") != null)
			model.addAttribute("message", result.getFieldError("content").getDefaultMessage());
		else {
			ms.updateReview(reviewvo);
			mav.setViewName("mobile/detail/result");
		}
		return mav;
	}

	@RequestMapping("/MreviewDelete") // 리뷰 삭제
	public ModelAndView reviewDelete(@ModelAttribute("dto") @Valid ReviewVO reviewvo, BindingResult result,
			HttpServletRequest request, Model model, @RequestParam("rwseq") int rwseq) {
		ModelAndView mav = new ModelAndView();
		ms.reviewDelete(rwseq);
		mav.setViewName("mobile/detail/result");
		return mav;
	}

	@RequestMapping("/MmoreReview") // 리뷰 페이지
	public ModelAndView moreReview(HttpServletRequest request, Model model, @RequestParam("rseq") String rseq) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();

		// 페이징
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if (session.getAttribute("page") != null) {
			page = (Integer) session.getAttribute("page");
		} else {
			session.removeAttribute("page");
		}

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rseq", rseq);
		paramMap.put("page", page);
		paramMap.put("ref_cursor2", null);

		ms.getDetail(paramMap);
		ms.getReviewsPage(paramMap);

		ArrayList<HashMap<String, Object>> list1 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
		ArrayList<HashMap<String, Object>> list2 = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor2");

		mav.addObject("RestVO", list1.get(0));
		mav.addObject("reviewList", list2);
		model.addAttribute("paging", (Paging) paramMap.get("paging"));
		mav.addObject("rseq", rseq);
		mav.setViewName("mobile/detail/reviews");
		return mav;
	}

	@RequestMapping("/Mbestrest") // 베스트 식당
	public String bestrest(Model model, HttpServletRequest request, @RequestParam("kind") String kind) {

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("kind", kind);
		paramMap.put("ref_cursor", null);

		ms.getBestList(paramMap);

		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");

		model.addAttribute("bestList", list);

		return "mobile/restaurant/bestRest";
	}

	@RequestMapping("/MrestQna") // 식당 QnA
	public String restQna(Model model, HttpServletRequest request, @RequestParam("rseq") int rseq,
			@RequestParam("r_name") String r_name) {

		HttpSession session = request.getSession();

		// 페이징
		int page = 1;
		if (request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
			session.setAttribute("page", page);
		} else if (session.getAttribute("page") != null) {
			page = (Integer) session.getAttribute("page");
		} else {
			session.removeAttribute("page");
		}

		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rseq", rseq);
		paramMap.put("page", page);
		paramMap.put("ref_cursor", null);

		ms.getQnaList(paramMap);

		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");

		model.addAttribute("qnaList", list);
		model.addAttribute("paging", (Paging) paramMap.get("paging"));
		model.addAttribute("rseq", rseq);
		model.addAttribute("r_name", r_name);

		return "mobile/restaurant/qnaList";
	}

	@RequestMapping("/MwriteQna") // QnA 등록페이지
	public ModelAndView writeQna(Model model, HttpServletRequest request, @RequestParam("rseq") int rseq,
			@RequestParam("r_name") String r_name) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/MloginForm");
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("loginUser");
		if (mvo == null) {
			return mav;
		} else {
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("rseq", rseq);
			ms.getDetail(paramMap);
			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			
			mav.addObject("r_name", r_name);
			mav.addObject("RestVO", list.get(0));
			mav.setViewName("mobile/restaurant/writeQna");
		}
		return mav;
	}

	@RequestMapping(value="MqnaWrite", method = RequestMethod.POST) //QnA 등록
	public String qnaWrite(@ModelAttribute("dto") @Valid QnaVO qnavo, BindingResult result, 
			HttpServletRequest request, Model model, @RequestParam("r_name") String r_name) throws UnsupportedEncodingException {
		r_name = URLEncoder.encode(r_name, "UTF-8");
		HttpSession session = request.getSession();
		
		String url;
		if(session.getAttribute("loginUser")==null){
			return "Member/login";
		}else {
			url = "mobile/restaurant/writeQna";
			if(result.getFieldError("subject")!=null)model.addAttribute("message",result.getFieldError("subject").getDefaultMessage());
			else if(result.getFieldError("content")!=null)model.addAttribute("message",result.getFieldError("content").getDefaultMessage());
			else {
				ms.insertQna(qnavo);
				url = "redirect:/MrestQna?rseq="+qnavo.getRseq()+"&r_name="+r_name;
			}
		}
		return url;
	}
	
	@RequestMapping("/MqnaDelete") // QnA 삭제
	public String qnaDelete(Model model, HttpServletRequest request, @RequestParam("qseq") int qseq) {
		HttpSession session = request.getSession();
		if(session.getAttribute("loginUser")==null){
			return "mobile/Member/login";
		}else {
			ms.deletetQna(qseq);
		}
		return "redirect:/";
	}
	 
	
}
