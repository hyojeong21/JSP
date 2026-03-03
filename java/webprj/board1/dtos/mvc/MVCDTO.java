package webprj.board1.dtos.mvc;

import java.util.Date;

import lombok.Data;

@Data
public class MVCDTO {
	private String idx;
	private String name;
	private String title;
	private String content;
	private Date postdate;
	private String ofile;
	private String sfile;
	private int downcount;
	private String pass;
	private int visitcount;
}