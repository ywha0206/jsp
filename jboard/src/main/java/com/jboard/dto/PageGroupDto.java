package com.jboard.dto;

public class PageGroupDto {
	private int start;
	private int end;
	private int current;
	
	
	
	public PageGroupDto(int start, int end, int current) {
		super();
		this.start = start;
		this.end = end;
		this.current = current;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	public int getCurrent() {
		return current;
	}

	public void setCurrent(int current) {
		this.current = current;
	}

	@Override
	public String toString() {
		return "PageGroupDto [start=" + start + ", end=" + end + ", current=" + current + "]";
	}
	
	
}
