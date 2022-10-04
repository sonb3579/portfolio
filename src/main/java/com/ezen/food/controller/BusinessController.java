package com.ezen.food.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.lang3.RandomStringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ezen.food.dto.BusinessVO;
import com.ezen.food.dto.CheckRestVO;
import com.ezen.food.dto.ImagesVO;
import com.ezen.food.dto.MenuVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.QnaVO;
import com.ezen.food.dto.RestVO;
import com.ezen.food.service.BusinessService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class BusinessController {

	@Autowired
	BusinessService bs;

	@Autowired
	ServletContext context;

	@RequestMapping("/business")
	public String business() {
		return "business/businessLoginForm";
	}

	@RequestMapping(value = "businessLogin", method = RequestMethod.POST)
	public String businessLogin(@ModelAttribute("dto") @Valid BusinessVO businessvo, BindingResult result,
			HttpServletRequest request, Model model) {

		String url = "business/businessLoginForm";
		if (result.getFieldError("businessId") != null) {
			model.addAttribute("message", result.getFieldError("businessId").getDefaultMessage());
			return url;
		} else if (result.getFieldError("businessPwd") != null) {
			model.addAttribute("message", result.getFieldError("businessPwd").getDefaultMessage());
			return url;
		} else {

			BusinessVO bvo = bs.getBusiness(businessvo.getBusinessId());

			if (bvo == null)
				model.addAttribute("message", "아이디가 없습니다");
			else if (bvo.getBusinessPwd() == null)
				model.addAttribute("message", "DB 오류. 관리자에게 문의하세요");
			else if (!bvo.getBusinessPwd().equals(businessvo.getBusinessPwd()))
				model.addAttribute("message", "비밀번호가 맞지않습니다");
			else if (bvo.getBusinessPwd().equals(businessvo.getBusinessPwd())) {
				HttpSession session = request.getSession();
				session.setAttribute("loginBusiness", bvo);

				url = "redirect:/myRestList";
			}
			return url;
		}
	}

	@RequestMapping("/businessLogout")
	public String businessLogout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginBusiness");
		return "business/businessLoginForm";
	}

	@RequestMapping("/myRestList")
	public ModelAndView myRestList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		BusinessVO bvo = (BusinessVO) session.getAttribute("loginBusiness");
		String businessId = bvo.getBusinessId();
		
		if (session.getAttribute("loginBusiness") == null)
			mav.setViewName("business/businessLoginForm");
		else {
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

			HashMap<String, Object> result = bs.getMyRestList(page, key, businessId);
			mav.addObject("myRestList", (List<RestVO>) result.get("myRestList"));
			mav.addObject("paging", (Paging) result.get("paging"));
			mav.setViewName("business/myRestList");
		}
		return mav;
	}

	@RequestMapping("/myRestDetail")
	public ModelAndView my_restdetail(@RequestParam("rseq") int rseq, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if (session.getAttribute("loginBusiness") == null)
			mav.setViewName("business/businessLoginForm");
		else {

			RestVO rvo = bs.getRestDetail(rseq);
			ImagesVO ivo = bs.getImageDetail(rseq);
			MenuVO mvo = bs.getMenuDetail(rseq);
		
			
			mav.addObject("restVO", rvo);
			mav.addObject("imagesVO", ivo);
			mav.addObject("menuVO", mvo);
			mav.setViewName("business/myRestDetail");
		}
		return mav;
	}

//08.25
	@RequestMapping("/myRestQnaList") // QnA리스트
	public ModelAndView myRestQnaList(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		BusinessVO bvo = (BusinessVO) session.getAttribute("loginBusiness");
		String businessId = bvo.getBusinessId();
		System.out.println(businessId);
		if (session.getAttribute("loginBusiness") == null) {
			mav.setViewName("business/businessLoginForm");
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
			HashMap<String, Object> result = bs.getQnaList(page,businessId);
			mav.addObject("qnaList", (List<QnaVO>) result.get("qnaList"));
			mav.addObject("paging", (Paging) result.get("paging"));
			mav.setViewName("business/myRestQnaList");
		}
		return mav;
	}




	// 08.23-----------------------------------------------------------------

	@RequestMapping("/boss_qna_detail") // QnA 상세
	public ModelAndView boss_qna_detail(HttpServletRequest request, @RequestParam("qseq") int qseq) {
		ModelAndView mav = new ModelAndView();

		HttpSession session = request.getSession();
		BusinessVO bvo = (BusinessVO) session.getAttribute("loginBusiness");
		String id = bvo.getBusinessId();

		QnaVO qvo = bs.qnaDetail(qseq);
		mav.addObject("dto", qvo);
		mav.setViewName("business/QnaReply");

		return mav;
	}

	@RequestMapping(value = "insertQnaReply", method = RequestMethod.POST) // QnA 등록
	public String insertQnaReply(@ModelAttribute("dto") @Valid QnaVO qnavo, BindingResult result,
			HttpServletRequest request, Model model) throws UnsupportedEncodingException {
		HttpSession session = request.getSession();

		String url;
		if (session.getAttribute("loginBusiness") == null) {
			return "Member/login";
		} else {
			url = "restaurant/writeQna";
			if (result.getFieldError("reply") != null)
				model.addAttribute("message", result.getFieldError("reply").getDefaultMessage());
			else {
				bs.insertQnaReply(qnavo);
				url = "redirect:/myRestQnaList";
			}
		}
		return url;
	}

	


	
	@RequestMapping("/idCheckFormB") // 중복확인폼
	public String idCheckForm(HttpServletRequest request, Model model, @RequestParam("businessId") String businessId) {
		
		BusinessVO bvo= bs.idCheck(businessId);
		if( bvo==null ) model.addAttribute("result", -1);
		else  model.addAttribute("result", 1);
		
		model.addAttribute("businessId", businessId);
		
		return "business/idcheck";
	}



@RequestMapping("/getNewCheck")
public ModelAndView getNewMyRestCheck(HttpServletRequest request, @RequestParam("rseq") int rseq) {
	ModelAndView mav = new ModelAndView();
	HttpSession session = request.getSession();
	
	if(session.getAttribute("loginBusiness") == null)
		mav.setViewName("business/businessLoginForm");
	else {
		if(request.getParameter("second")!=null) {
			session.removeAttribute("pageN");
		}
		int pageN = 1;
		if( request.getParameter("pageN")!=null) {
			pageN = Integer.parseInt( request.getParameter("pageN") );
			session.setAttribute("pageN", pageN);
		}else if( session.getAttribute("pageN") != null) {
			pageN = (Integer)session.getAttribute("pageN");
		}else {
			session.removeAttribute("pageN");
		}
		
		HashMap<String,Object> result = bs.getNewCheck(pageN, rseq);
		mav.addObject("NewCheck",(List<CheckRestVO>)result.get("getNewCheck"));
		mav.addObject("rseq",rseq);
		mav.addObject("paging", (Paging)result.get("paging"));
		mav.setViewName("business/nRestCheck");
		
		
	}
	return mav;

}



@RequestMapping("getCompleteCheck")
public ModelAndView getCompleteCheck(HttpServletRequest request, @RequestParam("rseq") int rseq) {
	ModelAndView mav = new ModelAndView();
	HttpSession session = request.getSession();

	
	if(session.getAttribute("loginBusiness") == null)
		mav.setViewName("business/businessLoginForm");
	else {
		
		if(request.getParameter("second")!=null) {
			session.removeAttribute("pageY");
		}
		int pageY = 1;
		if( request.getParameter("pageY")!=null) {
			pageY = Integer.parseInt( request.getParameter("pageY") );
			session.setAttribute("pageY", pageY);
		}else if( session.getAttribute("pageY") != null) {
			pageY = (Integer)session.getAttribute("pageY");
		}else {
			session.removeAttribute("pageY");
		}
		
		HashMap<String, Object> result = bs.getCompleteCheck(pageY, rseq);
		mav.addObject("CompleteCheck", (List<CheckRestVO>)result.get("completeCheck"));
		mav.addObject("rseq",rseq);
		mav.addObject("paging", (Paging)result.get("paging"));
		mav.setViewName("business/yRestCheck");
	}
	return mav;
	
}

@RequestMapping("/restConfirm")
public String rest_confrim(HttpServletRequest request, @RequestParam("cseq") int cseq,@RequestParam("rseq") int rseq) {
	HttpSession session = request.getSession();
	String url="";
	if(session.getAttribute("loginBusiness")==null){
		url= "business/businessLoginForm";
	}else {
		
		bs.restConfirm(cseq);
		url="redirect:/getNewCheck?rseq="+rseq;
	}
	return url;
}

@RequestMapping("/cancelConfirm")
public String cancel_confrim(HttpServletRequest request, @RequestParam("cseq") int cseq,@RequestParam("rseq") int rseq) {
	HttpSession session = request.getSession();
	String url="";
	if(session.getAttribute("loginBusiness")==null){
		url= "business/businessLoginForm";
	}else {
		
		bs.cancelConfirm(cseq);
		url="redirect:/getCompleteCheck?rseq=" + rseq;
	}
	return url;
}




@RequestMapping("/bossJoinForm") // 회원가입폼
public String joinForm(HttpServletRequest request,  Model model) {
	String businessId=RandomStringUtils.random(5, new char[]{'a', 'b', 'c', 'd', 'e', 'f', 'g'}) + RandomStringUtils.random(5, new char[]{'1', '2', '3', '4', '5', '6', '7', '8', '9', '0'});
	model.addAttribute("businessId", businessId);
	return "business/bossJoinForm";
}


@RequestMapping("/joinBoss") // 사업자 회원가입
public ModelAndView joinBoss(@ModelAttribute("dto") @Valid BusinessVO businessvo, BindingResult result,
		HttpServletRequest request, Model model) {
	ModelAndView mav = new ModelAndView();
	mav.setViewName("business/bossJoinForm");

	if (result.getFieldError("businessId") != null)
		model.addAttribute("message", result.getFieldError("businessId").getDefaultMessage());
	else if (result.getFieldError("businessPwd") != null)
		model.addAttribute("message", result.getFieldError("businessPwd").getDefaultMessage());
	else if (result.getFieldError("name") != null)
		model.addAttribute("message", result.getFieldError("name").getDefaultMessage());
	else if (result.getFieldError("email") != null)
		model.addAttribute("message", result.getFieldError("email").getDefaultMessage());
	else if (result.getFieldError("phone") != null)
		model.addAttribute("message", result.getFieldError("phone").getDefaultMessage());
	else if(!request.getParameter("businessPwd").equals(request.getParameter("pwd_check"))) {
		mav.addObject("message", "비밀번호가 일치하지 않습니다");
	}
	else {
		bs.businessJoin(businessvo);
		mav.addObject("message", "회원가입을 완료했습니다");
		mav.setViewName("forward:/business");
	}

	return mav;
}
//

@RequestMapping("/registerNewRest") // 식당등록폼
public String registerNewRest(HttpServletRequest request,  Model model) {
	return "business/restInsert";
}



//-------0824 JH---------

@RequestMapping("/insertNewRest")
public ModelAndView insertNewRest(HttpServletRequest request) {
	
	ModelAndView mav = new ModelAndView();
	HttpSession session = request.getSession();
	BusinessVO bvo = (BusinessVO) session.getAttribute("loginBusiness");
	String businessId = bvo.getBusinessId();
	
	if(session.getAttribute("loginBusiness")==null){
		mav.setViewName("Member/login");
	}else {
		String path = context.getRealPath("images/RestImages");
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			String kind = multi.getParameter("kind");
			
			if(kind.equals("1"))kind="한식";
			else if(kind.equals("2"))kind="중식";
			else if(kind.equals("3"))kind="일식";
			else if(kind.equals("4"))kind="양식";
			else if(kind.equals("5"))kind="카페";
			
		
			/*restaurant 테이블 업데이트*/
			RestVO rvo = new RestVO();
			rvo.setR_kind(kind);
			rvo.setR_name(multi.getParameter("name"));
			rvo.setR_address(multi.getParameter("address"));
			rvo.setR_phone(multi.getParameter("phone"));
			rvo.setR_runtime(multi.getParameter("runtime"));
			rvo.setR_content(multi.getParameter("content"));
			rvo.setR_map(multi.getParameter("map"));
			rvo.setBusinessId(businessId);
			rvo.setM_image(multi.getFilesystemName("m_img"));
			bs.insertRest(rvo);
			
			int rseq= bs.getRseq(multi.getParameter("name"), businessId);
			/*Menu 테이블 업데이트*/
			MenuVO mvo = new MenuVO();
			mvo.setR_mname1(multi.getParameter("r_mname1"));
			mvo.setR_mname2(multi.getParameter("r_mname2"));
			mvo.setR_mprice1(Integer.parseInt(multi.getParameter("r_mprice1")));
			mvo.setR_mprice2(Integer.parseInt(multi.getParameter("r_mprice2")));
			mvo.setRseq(rseq );
			bs.insertMenu(mvo);
			
			
			/*이미지 파일 업데이트*/
			ImagesVO ivo = new ImagesVO();
			ivo.setRseq( rseq );
			ivo.setR_img(multi.getFilesystemName("r_img"));
			ivo.setM_img(multi.getFilesystemName("m_img"));
			ivo.setS_img(multi.getFilesystemName("s_img"));
			bs.insertImage(ivo);
			
			
			mav.setViewName("redirect:/myRestDetail?rseq=" + rseq);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	} return mav;
}


@RequestMapping("/myRestUpdateForm")
public ModelAndView myRestUpdateForm(@RequestParam("rseq") int rseq, HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	HttpSession session = request.getSession();
	if(session.getAttribute("loginBusiness")==null) {
		mav.setViewName("business/businessLoginForm");
	} else {
		
		RestVO rvo = bs.getRestDetail(rseq);
		ImagesVO ivo = bs.getImageDetail(rseq);
		MenuVO mvo = bs.getMenuDetail(rseq);
		
		String [] kindList = { "한식", "중식", "일식", "양식","카페" };
		
		mav.addObject("restVO", rvo);
		mav.addObject("imagesVO", ivo);
		mav.addObject("menuVO", mvo);
		mav.addObject("kindList",kindList);
		mav.setViewName("business/myRestUpdate");
	}
	return mav;
		
	}
@RequestMapping("/myRestUpdate")
public ModelAndView myRestUpdate(@RequestParam("rseq") int rseq, HttpServletRequest request) {
	ModelAndView mav = new ModelAndView();
	HttpSession session = request.getSession();
	if(session.getAttribute("loginBusiness")==null){
		mav.setViewName("business/businessLoginForm");
	}else {
		String path = context.getRealPath("RestImages");
		MultipartRequest multi;
		try {
			multi = new MultipartRequest(request, path, 5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			/* "숫자" 형태로 날아온 kind를 restaurant 테이블에 저장하기로 한 kind 형식('한식,'양식'...)으로 먼저 변환해주기 */
			String kind = multi.getParameter("kind");
			
			if(kind.equals("1"))kind="한식";
			else if(kind.equals("2"))kind="중식";
			else if(kind.equals("3"))kind="일식";
			else if(kind.equals("4"))kind="양식";
			else if(kind.equals("5"))kind="카페";
			
			
			
			
			/*restaurant 테이블 업데이트*/
			RestVO rvo = new RestVO();
			rvo.setR_kind(kind);
			rvo.setRseq(Integer.parseInt( multi.getParameter("rseq") ));
			rvo.setR_name(multi.getParameter("name"));
			rvo.setR_address(multi.getParameter("address"));
			rvo.setR_phone(multi.getParameter("phone"));
			rvo.setR_runtime(multi.getParameter("runtime"));
			rvo.setR_content(multi.getParameter("content"));
			rvo.setR_map(multi.getParameter("map"));
			rvo.setRyn(multi.getParameter("ryn"));
			System.out.println(multi.getParameter("ryn"));
			
			/*Menu 테이블 업데이트*/
			MenuVO mvo = new MenuVO();
			mvo.setR_mname1(multi.getParameter("r_mname1"));
			mvo.setR_mname2(multi.getParameter("r_mname2"));
			mvo.setR_mprice1(Integer.parseInt(multi.getParameter("r_mprice1")));
			mvo.setR_mprice2(Integer.parseInt(multi.getParameter("r_mprice2")));
			mvo.setRseq(Integer.parseInt( multi.getParameter("rseq") ));
			bs.updateMenu(mvo);
			
			
			/*이미지 파일 업데이트*/
			ImagesVO ivo = new ImagesVO();
			ivo.setRseq(Integer.parseInt( multi.getParameter("rseq") ));
			if(multi.getFilesystemName("r_img")==null)ivo.setR_img(multi.getParameter("oldR_img"));
			else ivo.setR_img(multi.getFilesystemName("r_img"));
			if(multi.getFilesystemName("m_img")==null)ivo.setM_img(multi.getParameter("oldM_img"));
			else ivo.setM_img(multi.getFilesystemName("m_img"));
			if(multi.getFilesystemName("s_img")==null)ivo.setS_img(multi.getParameter("oldS_img"));
			else ivo.setS_img(multi.getFilesystemName("s_img"));
			
			bs.updateRest(rvo);
			bs.updateImage(ivo);
			
			
			mav.setViewName("redirect:/myRestDetail?rseq=" + rseq);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
	} return mav;
}

@RequestMapping("/myDeleteRest")
public String myDeleteRest(@RequestParam("rseq") int rseq, HttpServletRequest request) {
	HttpSession session = request.getSession();
	
	if(session.getAttribute("loginBusiness")==null){
		return "business/businessLonginForm";
	}else {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("rseq", rseq);
		
		bs.myDeleteRest(paramMap);
		
		return "redirect:/myRestList";
	}
}
//---------------------------
}