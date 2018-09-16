package egovframework.example.admin.etc.excel;

import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.view.AbstractView;

import egovframework.example.admin.sidebar.member.domain.AdminMemberVO;

public class ExcelExport extends AbstractView{
	private final Logger logger = LoggerFactory.getLogger(ExcelExport.class);
	
	public ExcelExport() {
		setContentType("application/download; charset=utf-8");
	}
	
	@SuppressWarnings("unchecked")
	@Override
	protected void renderMergedOutputModel(Map<String, Object> model, HttpServletRequest request, HttpServletResponse response){
		Workbook workbook = (Workbook) model.get("workbook");
		Sheet sheet = workbook.createSheet("잡큐 회원 목록");
		
		CellStyle cellStyle = workbook.createCellStyle();
		
		response.setHeader("Content-Disposition", "attachment; filename=\"jobq_member_list." + (String)model.get("version") + "\";");
		
		setExcelHeaderStyle(cellStyle);
		setCellWidth(sheet);
		createHeader(sheet, cellStyle);
		createContent(sheet, (List<AdminMemberVO>)model.get("list"));
		
		try(ServletOutputStream outputStream = response.getOutputStream()){
			workbook.write(outputStream);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private void createContent(Sheet sheet, List<AdminMemberVO> list) {
		Row row = sheet.createRow(1);
		Cell cell = null;
		StringBuffer convertor = new StringBuffer("");
		AdminMemberVO member = null;
		
		for (int i = 1; i <= list.size(); i++) {
			member = list.get(i-1);
			
			row = sheet.createRow(i);
			
			if(member.getId().equals("admin"))
				continue;
			
			cell = row.createCell(0);
			if(member.getType().equals("p"))
				cell.setCellValue("일반 회원");
			else
				cell.setCellValue("기업 회원");
			
			cell = row.createCell(1);
			cell.setCellValue(member.getName());
			
			cell = row.createCell(2);
			cell.setCellValue(member.getId());
			
			cell = row.createCell(3);
			convertor.append(member.getPhone().getFirstNumber());
			convertor.append("-");
			convertor.append(member.getPhone().getMidNumber());
			convertor.append("-");
			convertor.append(member.getPhone().getLastNumber());
			
			cell.setCellValue(convertor.toString());	// 핸드폰 번호 추가
			convertor.setLength(0);
			
			cell = row.createCell(4);
			convertor.append(member.getEmail().getEmailId());
			convertor.append("@");
			convertor.append(member.getEmail().getEmailDomain());
			
			cell.setCellValue(convertor.toString());	// 핸드폰 번호 추가
			convertor.setLength(0);
			
			cell = row.createCell(5);
			if(member.getSex().equals("0"))
				cell.setCellValue("남자");
			else
				cell.setCellValue("여자");	
			
			cell = row.createCell(6);
			cell.setCellValue(member.getRegDate().toString());
			
			cell = row.createCell(7);
			if(member.getUpdateDate() == null)
				cell.setCellValue("미정");
			else
				cell.setCellValue(member.getUpdateDate().toString());
		}
		
	}

	private void createHeader(Sheet sheet, CellStyle cellStyle) {
		String[] headers = {
				"분류", "이름", "아이디", "휴대폰", "이메일", "성별", "가입일", "최근 수정 일자"
		};
		
		Row row = sheet.createRow(0);
		Cell cell = null;
		
		for (int i = 0; i < headers.length ; i++) {
			cell = row.createCell(i);
			cell.setCellStyle(cellStyle);
			cell.setCellValue(headers[i]);
		}
	}

	private void setCellWidth(Sheet sheet) {
		sheet.setColumnWidth(0, 256 * 12);	// 회원 분류
		sheet.setColumnWidth(1, 256 * 10);	// 이름 
		sheet.setColumnWidth(2, 256 * 15);	// 아이디
		sheet.setColumnWidth(3, 256 * 17);	// 휴대폰
		sheet.setColumnWidth(4, 256 * 22);	// 이메일
		sheet.setColumnWidth(5, 256 * 6);	// 성별
		sheet.setColumnWidth(6, 256 * 13);	// 가입일
		sheet.setColumnWidth(7, 256 * 17);	// 최근 수정 일자
	}

	private void setExcelHeaderStyle(CellStyle cellStyle){
		cellStyle.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		cellStyle.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);
	}
}
