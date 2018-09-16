package egovframework.example.admin.main.domain;

import java.sql.Date;
import java.util.List;

public class AdminMainEmployAndResumesVO {
	private List<Date> employDates;
	private List<Date> resumeDates;

	public List<Date> getEmployDates() {
		return employDates;
	}

	public void setEmployDates(List<Date> employDates) {
		this.employDates = employDates;
	}

	public List<Date> getResumeDates() {
		return resumeDates;
	}

	public void setResumeDates(List<Date> resumeDates) {
		this.resumeDates = resumeDates;
	}

	@Override
	public String toString() {
		return "AdminMainEmployAndResumesVO [employDates=" + employDates
				+ ", resumeDates=" + resumeDates + "]";
	}

}
