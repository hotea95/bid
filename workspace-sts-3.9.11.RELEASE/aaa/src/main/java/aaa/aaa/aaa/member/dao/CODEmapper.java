package aaa.aaa.aaa.member.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import aaa.aaa.aaa.member.dto.CODEMDTO;

@Mapper
public interface CODEmapper {

	@Select("SELECT CODE,CODENUM,CODEM FROM CODEM WHERE CODE = #{CODE}")
	public List<CODEMDTO> getCodeVal(String CODE);
}
