package aaa.aaa.aaa.client.dto;


public class SearchCriteria extends Criteria{

   private String searchType ="";
   private String keyword = "";
   private String keyword2 = "";
public String getSearchType() {
	return searchType;
}
public void setSearchType(String searchType) {
	this.searchType = searchType;
}
public String getKeyword() {
	return keyword;
}
public void setKeyword(String keyword) {
	this.keyword = keyword;
}
public String getKeyword2() {
	return keyword2;
}
public void setKeyword2(String keyword2) {
	this.keyword2 = keyword2;
}
@Override
public String toString() {
	return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", keyword2=" + keyword2 + "]";
}
   
 
}