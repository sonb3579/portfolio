package com.ezen.food.controller;

import java.io.IOException;
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
import com.ezen.food.dto.ImagesVO;
import com.ezen.food.dto.MemberVO;
import com.ezen.food.dto.MenuVO;
import com.ezen.food.dto.NoticeVO;
import com.ezen.food.dto.Paging;
import com.ezen.food.dto.RestVO;
import com.ezen.food.dto.ReviewVO;
import com.ezen.food.service.AdminService;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@Controller
public class AdminController {
	@Autowired
	AdminService as;
	
	@Autowired
	ServletContext context;
	
	@RequestMapping("/adminLoginForm")
	public String adminLoginForm(HttpServletRequest request) {
			HttpSession session = request.getSession();
			
			if(session.getAttribute("loginAdmin")==null){
				return "admin/adminLogin";
			}else {
				return "redirect:/adminRestList";
			}
			
	}
	
	
	@RequestMapping(value = "adminLogin", method = RequestMethod.POST)
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
				return "redirect:/adminRestList";
			}else model.addAttribute("message","데이터베이스오류2");
			
			return "admin/adminLogin";
			
	}
	
	
	@RequestMapping("/adminLogout")
	public String admin_logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.removeAttribute("loginAdmin");
		return "admin/adminLogin";
	}
	
	@RequestMapping("/adminRestList")
	public ModelAndView admin_restlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminLogin");
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
				mav.setViewName("admin/restaurant/restList");
		}
		return mav;
	}
	
	
	
	
	@RequestMapping("/adminMemberList")
	public ModelAndView admin_memberlist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
				
				HttpSession session = request.getSession();
				
				if(session.getAttribute("loginAdmin")==null){
					mav.setViewName("admin/adminLogin");
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
						mav.setViewName("admin/member/memberList");
				}
				return mav;
			}
	
	
	@RequestMapping("/adminNoticeList")
	public ModelAndView admin_noticelist(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
				
				HttpSession session = request.getSession();
				
				if(session.getAttribute("loginAdmin")==null){
					mav.setViewName("admin/adminLogin");
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
						mav.setViewName("admin/notice/noticeList");
				}
				return mav;
			}
	
	@RequestMapping("/adminNoticeWriteForm")
		public String adminNoticeWriteForm(HttpServletRequest request) {
			HttpSession session = request.getSession();
				
			if(session.getAttribute("loginAdmin")==null){
				return "admin/adminLogin";
			}else {
					return "admin/notice/adminNoticeWriteForm";
			}
			
	}
	
	@RequestMapping("/adminNoticeWrite")
	public String adminWrite(@ModelAttribute("dto") @Valid NoticeVO noticevo, BindingResult result, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		String url;
		if(session.getAttribute("loginAdmin")==null){
			return "admin/adminLogin";
		}else {
			
			url = "admin/notice/adminNoticeWriteForm";
			if(result.getFieldError("subject")!=null)model.addAttribute("message",result.getFieldError("subject").getDefaultMessage());
			else if(result.getFieldError("content")!=null)model.addAttribute("message",result.getFieldError("content").getDefaultMessage());
			else {
				as.insertNotice(noticevo);
				url = "redirect:/adminNoticeList";
			}
		
		return url;
	}
}
	
	@RequestMapping("/adminNoticeDetail")
	public ModelAndView admin_noticedetail(@RequestParam("nseq") int nseq, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			NoticeVO nvo = as.noticeDetail(nseq);
			
			mav.addObject("dto", nvo);
			mav.setViewName("admin/notice/noticeDetail");
		}
		return mav;
	}
	
	@RequestMapping("/adminNoticeUpdateForm")
	public ModelAndView admin_noticeform(@RequestParam("nseq") int nseq, HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			NoticeVO nvo = as.noticeDetail(nseq);
			mav.addObject("dto",nvo);
			mav.setViewName("admin/notice/noticeUpdate");
		}
		return mav;
	}
	
	@RequestMapping(value="adminNoticeUpdate", method=RequestMethod.POST)
	public String admin_noticeupdate(@ModelAttribute("dto") @Valid NoticeVO noticevo, BindingResult result, HttpServletRequest request, Model model ) {
		HttpSession session = request.getSession();
		
		String url = "";
		if(session.getAttribute("loginAdmin")==null){
			return "admin/adminLogin";
		}else {
			url = "admin/notice/noticeUpdate";
			if(result.getFieldError("subject")!=null)model.addAttribute("message",result.getFieldError("subject").getDefaultMessage());
			else if(result.getFieldError("content")!=null)model.addAttribute("message",result.getFieldError("content").getDefaultMessage());
			else {
				as.updateNotice(noticevo);
				url = "redirect:/adminNoticeDetail?nseq="+noticevo.getNseq();
			}
		
		return url;
		}
	}
	
	@RequestMapping("/adminNoticeDelete")
	public String admin_noticedelete(@RequestParam("nseq") int nseq, HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			return "admin/adminlogin";
		}else {
			as.deleteNotice(nseq);
			
			return "redirect:/adminNoticeList";
		}
	}
	
	@RequestMapping("/adminMemberDetail")
	public ModelAndView admin_memberdetail(@RequestParam("id") String id, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			MemberVO mvo = as.getMemberDetail(id);
			
			mav.addObject("memberVO",mvo);
			mav.setViewName("admin/member/memberDetail");
		}
		return mav;
	}
	
	@RequestMapping("/adminMemberReview")
	public ModelAndView admin_member_review(@RequestParam("id") String id, HttpServletRequest request) {
			ModelAndView mav = new ModelAndView();
			HttpSession session = request.getSession();
			
			if(session.getAttribute("loginAdmin")==null){
				mav.setViewName("admin/adminlogin");
			}else {
				List<ReviewVO> list = as.getMemberReview(id);
				
				
				
				mav.addObject("memberReviewList", list);
				mav.setViewName("admin/member/memberReview");
			}
			return mav;
	}
	
	@RequestMapping("/adminMemberOut")
	public String admin_memberout(@RequestParam("id") String id, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			return "admin/adminlogin";
		}else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("id", id);
			as.deleteMember(paramMap);
			return "redirect:/adminMemberList?page=1";
		}
	}
	
	@RequestMapping("/adminDeleteReview")
	public String admin_deletereview(@RequestParam("id") String id, @RequestParam("rwseq") int rwseq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			return "admin/adminlogin";
		}else {
			
			as.deleteReview(rwseq);
			
			return "redirect:/adminMemberReview?id=" + id;
		}

	}
	
	@RequestMapping("/adminRestDetail")
	public ModelAndView admin_restdetail(@RequestParam("rseq") int rseq, HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			
			RestVO rvo = as.getRestDetail(rseq);
			ImagesVO ivo = as.getImageDetail(rseq);
			MenuVO mvo = as.getMenuDetail(rseq);
			
			mav.addObject("restVO", rvo);
			mav.addObject("imagesVO", ivo);
			mav.addObject("menuVO", mvo);
			mav.setViewName("admin/restaurant/restDetail");
		}
		return mav;
	}
	
	@RequestMapping("/adminRestUpdateForm")
	public ModelAndView admin_restupdateform(@RequestParam("rseq") int rseq, HttpServletRequest request ) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			
			RestVO rvo = as.getRestDetail(rseq);
			ImagesVO ivo = as.getImageDetail(rseq);
			MenuVO mvo = as.getMenuDetail(rseq);
			
			String [] kindList = { "한식", "중식", "일식", "양식","카페" };
			
			mav.addObject("restVO", rvo);
			mav.addObject("imagesVO", ivo);
			mav.addObject("menuVO", mvo);
			mav.addObject("kindList",kindList);
			mav.setViewName("admin/restaurant/restUpdate");
		}
		return mav;
	}
	
	@RequestMapping("/adminRestUpdate")
	public ModelAndView admin_restupdate(@RequestParam("rseq") int rseq, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			String path = context.getRealPath("images/RestImages");
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
				as.updateMenu(mvo);
				
				
				/*이미지 파일 업데이트*/
				ImagesVO ivo = new ImagesVO();
				ivo.setRseq(Integer.parseInt( multi.getParameter("rseq") ));
				if(multi.getFilesystemName("r_img")==null)ivo.setR_img(multi.getParameter("oldR_img"));
				else ivo.setR_img(multi.getFilesystemName("r_img"));
				if(multi.getFilesystemName("m_img")==null)ivo.setM_img(multi.getParameter("oldM_img"));
				else ivo.setM_img(multi.getFilesystemName("m_img"));
				if(multi.getFilesystemName("s_img")==null)ivo.setS_img(multi.getParameter("oldS_img"));
				else ivo.setS_img(multi.getFilesystemName("s_img"));
				
				as.updateRest(rvo);
				as.updateImage(ivo);
				
				
				mav.setViewName("redirect:/adminRestDetail?rseq=" + rseq);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			
			
		} return mav;
	}
	
	@RequestMapping("/adminDeleteRest")
	public String admin_deleterest(@RequestParam("rseq") int rseq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			return "admin/adminlogin";
		}else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("rseq", rseq);
			
			as.deleteRest(paramMap);
			
			return "redirect:/adminRestList";
		}
	}
	
	@RequestMapping(value="/adminBannerList")
	public ModelAndView bannerList(HttpServletRequest request, Model model) {
		ModelAndView mav = new ModelAndView();
		
		HttpSession session = request.getSession();
		if( session.getAttribute("loginAdmin")==null) 
			mav.setViewName("admin/adminLogin");
		else {
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put( "ref_cursor", null );
			
			as.getBannerList(paramMap);
			ArrayList< HashMap<String,Object> > list 
				= (ArrayList<HashMap<String, Object>>) paramMap.get("ref_cursor");
			mav.addObject("bannerList", list);
			mav.setViewName("admin/banner/bannerList");
		}
		return mav;
	}
	
	@RequestMapping("/newBannerWrite")
	public String newBannerWrite(HttpServletRequest request, Model model) {
		return "admin/banner/writeBanner";
	}
	
	
	
	@RequestMapping("/selectimg")
	public String selectimg() {
		return "admin/banner/selectimg";
	}
	
	


	
	@RequestMapping(value="/fileupload" , method = RequestMethod.POST)
	public String fileupload(Model model, HttpServletRequest request) {
		String path = context.getRealPath("images/bannerImages");		
		try {
			MultipartRequest multi = new MultipartRequest(
					request, path, 5*1024*2000, "UTF-8", new DefaultFileRenamePolicy()
			);
			// 전송된 파일은 업로드 되고, 파일 이름은  모델에 저장합니다
			model.addAttribute("image", multi.getFilesystemName("image") );
		} catch (IOException e) {
			e.printStackTrace();
		}
		return "admin/banner/completupload";
	}
	
	
	
	
	
	@RequestMapping(value="/bannerWrite" )
	public String bannerWrite(
			Model model ,  HttpServletRequest request) {
		
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("name", request.getParameter("name") );
		if(request.getParameter("order_seq").equals("4")) paramMap.put("useyn", "n");
		else 	paramMap.put("useyn", "y");
		paramMap.put("order_seq", request.getParameter("order_seq") );
		paramMap.put("image",  request.getParameter("imgfilename") );
		
		//System.out.println("2 : " + request.getParameter("image") + " " + request.getParameter("name") + " " + request.getParameter("order_seq"));
		
		as.insertBanner( paramMap);
		
		return "redirect:/adminBannerList";
	}
	
	@RequestMapping("/editBannerForm")
	public ModelAndView edit_bannerform(@RequestParam("bseq") int bseq, Model model, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			mav.setViewName("admin/adminlogin");
		}else {
			
			HashMap<String, Object> paramMap = new HashMap<String, Object>();
			paramMap.put("bseq", bseq);
			paramMap.put("ref_cursor", null);
			as.getBannerDetail(paramMap);
			
			String [] orderList = {"1","2","3","4"};
			ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)paramMap.get("ref_cursor");
			
			mav.addObject("orderList", orderList);
			mav.addObject("bseq",bseq);
			mav.addObject("bannerVO", list.get(0));
			mav.setViewName("admin/banner/editBanner");
		}
		return mav;
	}
	
	@RequestMapping("editBanner")
	public String edit_banner(@RequestParam("bseq") int bseq, Model model, HttpServletRequest request) {
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		
		paramMap.put("bseq",bseq);
		paramMap.put("name", request.getParameter("name") );
		if(request.getParameter("order_seq").equals("4")) paramMap.put("useyn", "n");
		else 	paramMap.put("useyn", "y");
		paramMap.put("order_seq", request.getParameter("order_seq") );
		paramMap.put("image",  request.getParameter("imgfilename") );
		
		//System.out.println("2 : " + request.getParameter("image") + " " + request.getParameter("name") + " " + request.getParameter("order_seq"));
		
		as.updateBanner( paramMap);
		
		return "redirect:/adminBannerList";
	}
	
	@RequestMapping("/deleteBanner")
	public String delete_banner(@RequestParam("bseq") int bseq, HttpServletRequest request) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("loginAdmin")==null){
			return "admin/adminlogin";
		}else {
			as.deleteBanner(bseq);
			
			return "redirect:/adminBannerList";
		}
	}
}
