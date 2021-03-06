package daily.admin.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import daily.admin.board.service.AdminHairGoodsService;
import daily.admin.board.vo.AdminHairGoodsVO;
import daily.common.page.Paging;
import daily.common.util.FileUploadUtil;

@Controller
@RequestMapping(value = "/admin")
public class AdminHairGoodsController {
	private Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private AdminHairGoodsService HairGoodsService;

	@RequestMapping(value = "/board/HairGoodsList.do", method = RequestMethod.GET)
	public ModelAndView HairGoodsList(@ModelAttribute AdminHairGoodsVO hgvo) {
		ModelAndView mav = new ModelAndView();
		log.info("리스트 메소드 호출 성공");

		// 페이징 세팅
		Paging.setPage(hgvo);

		// 전체 레코드 수 구현
		int total = HairGoodsService.boardListCnt(hgvo);

		List<AdminHairGoodsVO> hgList = HairGoodsService.hairGoodslist(hgvo);
		mav.addObject("hgList", hgList);
		mav.addObject("total", total);
		mav.addObject("data", hgvo);
		mav.setViewName("admin/board/HairGoodsList");
		return mav;

	}

	@RequestMapping(value = "/board/HGInsertForm.do")
	public String HairGoodsInsertForm() {
		log.info("입력 폼 호출 성공");

		return "admin/board/HairGoodsInsertForm";
	}

	@RequestMapping(value = "/board/HGInsert.do")
	@ResponseBody
	public int hairGoodsInsert(@ModelAttribute AdminHairGoodsVO hgvo, HttpServletRequest request)
			throws IOException {
		log.info("입력 로직 메소드 성공");

		int result = HairGoodsService.hairGoodsinsert(hgvo, request);

		return result;
	}

	@RequestMapping(value = "/board/HGDetail.do")
	public String detail(@ModelAttribute AdminHairGoodsVO hgvo, Model model) {
		log.info("디테일 호출 메소드 성공");

		log.info(hgvo.getHg_img1());

		AdminHairGoodsVO detail = HairGoodsService.hairGoodsdetail(hgvo.getHg_num());

		model.addAttribute("detail", detail);

		return "admin/board/HairGoodsDetail";
	}

	@RequestMapping(value = "/board/HGDelete.do")
	public String delete(@ModelAttribute AdminHairGoodsVO hgvo, HttpServletRequest request)
			throws IOException {
		log.info("글삭제 메소드 성공");
		String url = "";
		int delete = HairGoodsService.hairGoodsdelete(hgvo, request);

	
		if (delete == 1) {
			url = "HairGoodsList.do";
		} else {
			url = "admin/board/HairGoodsDetail?hg_num" + hgvo.getHg_num();
		}

		return "redirect:" + url;

	}

	// 게시글 수정
	@RequestMapping(value = "/board/HGUpdate.do")
	public String update(@ModelAttribute AdminHairGoodsVO hgvo, HttpServletRequest request)
			throws IOException {
		log.info("글수정 메소드 성공");

		int result = HairGoodsService.hairGoodsupdate(hgvo, request);
		String url = "";

		if (result == 1) {
			url = "HairGoodsList.do";
		} else {
			url = "admin/board/HairGoodsDetail";
		}

		return "redirect:" + url;

	}

}
