package com.farm.dto;

public class PageGroupDto {
	private int start;
	private int end;
	
	
	public PageGroupDto(int start, int end) {
		this.start = start;
		this.end = end;
	}
	public PageGroupDto() {}
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
	@Override
	public String toString() {
		return "PageGroupDtop [start=" + start + ", end=" + end + "]";
	}
	
	
}
