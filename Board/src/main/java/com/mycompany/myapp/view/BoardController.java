package com.mycompany.myapp.view;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.mycompany.myapp.board.BoardService;
import com.mycompany.myapp.board.BoardVO;
import com.mycompany.myapp.board.reply.ReplyService;
import com.mycompany.myapp.board.reply.ReplyVO;
import com.mycompany.myapp.image.ImageService;
import com.mycompany.myapp.image.ImageUtil;
import com.mycompany.myapp.image.ImageVO;

@Controller
public class BoardController {

	@Autowired
	private BoardService service;

	@Autowired
	private ImageService i_Service;

	@Autowired
	private ReplyService r_Service;

	@RequestMapping(value = "/insertView.do")
	public String insertView(Model model) {
		model.addAttribute("nextIdx", service.nextIdx());
		return "/board/insertBoard.jsp";
	}

	@RequestMapping(value = "/insertBoard.do")
	public String insertBoard(BoardVO vo, ImageVO iVo, HttpServletRequest request) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("/board/images/");
		MultipartFile uploadFile = iVo.getUploadImage();

		ImageUtil imageUtil = new ImageUtil();

		if (!uploadFile.isEmpty()) {
			String fileName = imageUtil.uploadImage(uploadFile, path);
			iVo.setUploadImageStr(fileName);
			iVo.setBoard_Idx(service.nextIdx());
			i_Service.insertImage(iVo);
		}
		service.insertBoard(vo);
		return "getBoardList.do";
	}

	@RequestMapping(value = "/deleteBoard.do")
	public String deleteBoard(BoardVO vo, ImageVO iVo, HttpServletRequest request) {
		iVo.setBoard_Idx(vo.getBoard_Idx());
		ImageUtil imageUtil = new ImageUtil();
		if (i_Service.getImage(iVo) != null) {
			ImageVO oldImage = i_Service.getImage(iVo);
			String oldFileName = oldImage.getUploadImageStr();
			String path = request.getSession().getServletContext().getRealPath("/board/images/");
			imageUtil.deleteImage(oldFileName, path);
			i_Service.deleteImage(oldImage);
		}

		service.deleteBoard(vo);
		return "getBoardList.do";
	}

	@RequestMapping(value = "/updateBoard.do")
	public String updateBoard(BoardVO vo, ImageVO iVo, HttpServletRequest request) throws IOException {
		System.out.println(vo.toString());
		String path = request.getSession().getServletContext().getRealPath("/board/images/");

		MultipartFile uploadFile = iVo.getUploadImage();

		ImageUtil imageUtil = new ImageUtil();

		if (!uploadFile.isEmpty()) {
			String fileName = imageUtil.uploadImage(uploadFile, path);
			iVo.setUploadImageStr(fileName);
			if (i_Service.getImage(iVo) != null) {
				ImageVO oldImage = i_Service.getImage(iVo);
				String oldFileName = oldImage.getUploadImageStr();
				imageUtil.deleteImage(oldFileName, path);
				i_Service.updateImage(iVo);
			} else {
				i_Service.insertImage(iVo);
			}
		}

		service.updateBoard(vo);
		return "getBoard.do";
	}

	@RequestMapping(value = "/updateView.do")
	public String getBoardUpdate(BoardVO vo, ImageVO iVo, Model model) {
		iVo.setBoard_Idx(vo.getBoard_Idx());
		model.addAttribute("board", service.getBoard(vo));
		model.addAttribute("image", i_Service.getImage(iVo));
		return "/board/updateBoard.jsp";
	}

	@RequestMapping(value = "/getBoard.do")
	public String getBoard(BoardVO vo, ImageVO iVo, ReplyVO rVo, Model model) {
		iVo.setBoard_Idx(vo.getBoard_Idx());
		model.addAttribute("board", service.getBoard(vo));
		model.addAttribute("image", i_Service.getImage(iVo));
		model.addAttribute("replyList", r_Service.getReplyList(rVo));
		return "/board/getBoard.jsp";
	}

	@RequestMapping(value = "/getBoardList.do")
	public String getBoardList(BoardVO vo, Model model, HttpServletRequest request) {
		// 페이징 시작
		int totalCount = service.totalCount(vo);
		int pageSize = 10;
		int listSize = 10;
		int startIdx;
		if (vo.getPageNum() == 0) {
			startIdx = 1;
		} else {
			startIdx = (vo.getPageNum() - 1) * pageSize + 1;
		}
		vo.setStartIdx(startIdx);
		vo.setEndIdx((vo.getStartIdx() + pageSize - 1));

		int nowPage = (int) Math.floor((((double) startIdx / (double) pageSize) + 1.0));
		int totalPage = (int) Math.floor((((double) totalCount / (double) pageSize) + 1.0));
		int pageListStart = (int) Math.floor(((double) (nowPage - 1) / (double) listSize)) * listSize + 1;

		int pageListEnd = pageListStart + listSize - 1;
		if (pageListEnd > totalPage) {
			pageListEnd = totalPage;
		}
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("pageListStart", pageListStart);
		model.addAttribute("pageListEnd", pageListEnd);
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("searchCondition", vo.getSearchCondition());
		model.addAttribute("searchKeyword", vo.getSearchKeyword());
		// 페이징 끝
		model.addAttribute("boardList", service.getBoardList(vo));
		return "/board/getBoardList.jsp";
	}

	@RequestMapping(value = "/insertReply.do")
	public void insertReply(ReplyVO vo, HttpServletResponse response) throws IOException {
		r_Service.insertReply(vo);
		PrintWriter out = response.getWriter();
		out.print("success");
	}

	@RequestMapping(value = "/deleteReply.do")
	public void deleteReply(ReplyVO vo, HttpServletResponse response) throws IOException {
		r_Service.deleteReply(vo);
		PrintWriter out = response.getWriter();
		out.print("success");
	}

}
