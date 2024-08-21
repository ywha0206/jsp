package com.jboard.util;

public class SQL {
	public static final String SELECT_TERMS = "select * from `terms`";

	//user
	public static final String SELECT_COUNT_USER = "select count(*) from `user`";
	public static final String WHERE_UID = "where `uid`=?";
	public static final String WHERE_NICK = "where `nick`=?";
	public static final String WHERE_EMAIL = "where `email`=?";
	public static final String WHERE_HP = "where `hp`=?";
	
	public static final String SELECT_USER = "select * from `user` where `uid` = ? and `pass` = SHA2(?,256)";
	
	public static final String INSERT_USER = "insert into `user` set "
											+ "`uid`=?,"
											+ "`pass`=SHA2(?,256),"
											+ "`name`=?,"
											+ "`nick`=?,"
											+ "`email`=?,"
											+ "`hp`=?,"
											+ "`zip`=?,"
											+ "`addr1`=?,"
											+ "`addr2`=?,"
											+ "`regip`=?,"
											+ "`regDate`=NOW()";
	
	//article
	public static final String SELECT_MAX_NO = "SELECT MAX(`no`) FROM `article`";

	
	public static final String INSERT_ARTICLE = "insert into `article` set "
											//+ "`cate`=?,"
											+ "`title`=?,"
											+ "`content`=?,"
											+ "`file`=?,"
											/*
											+ "`comment`=?,"
											+ "`hit`=?,"
											*/
											+ "`writer`=?,"
											+ "`regip`=?,"
											+ "`rDate`=NOW()";

	public static final String SELECT_ARTICLE = "select * from `article` where `writer` = ? ";
	public static final String SELECT_ARTICLES = "select * from `article` where `writer` = ? ";



	//file
	
	public static final String INSERT_FILE = "insert into `file` set "
											+ "`ano`=?,"
											+ "`oName`=?,"
											+ "`sName`=?,"
											+ "`rdate`=NOW()";





}//SQL class