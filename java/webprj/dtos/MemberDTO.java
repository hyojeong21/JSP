package webprj.dtos;

import java.sql.Date;

import lombok.Data;

@Data

public class MemberDTO {

	private String id;
	private String name;
	private String pass;
	private Date reg_date;
	
}