package webprj.board1.dtos;

import java.sql.Date;

import lombok.Data;

@Data

public class BoardDTO {
	
	private int num;
	private String title;
	private String content;
	private String id;
	private Date postdate;
	private String visitcount;
	private String name;
	
}