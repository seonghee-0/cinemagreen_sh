package com.min.cinemagreen.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.min.cinemagreen.dto.BlogDTO;
import com.min.cinemagreen.dto.UserDTO;
import com.min.cinemagreen.dto.BlogDTO;

@Mapper
public interface IUserMapper {
  int insertUser(UserDTO user);
  UserDTO getUserByMap(Map<String, Object> params);
  int insertAccess(Map<String, Object> params);
  int deleteUser(int userNo);
  UserDTO getUserInf(int userNo);
  int updateInf(UserDTO user);
  int pwchange(Map<String, Object> params);
  int pwupdate(Map<String, Object> params);
  UserDTO emailfindDo(Map<String, Object> params);
  UserDTO overlapcheckDo(UserDTO email);
  UserDTO xUsercheckDo(UserDTO email);
  int insertSnsUser(UserDTO user);
  UserDTO getsnsUserInfo(UserDTO user);
//블로그//////////////////
<<<<<<< HEAD
  int getBlogCount(int userNo);
  List<BlogDTO> userGetBlogList(Map<String, Object> params);
=======
  int getBlogCount();
  List<BlogDTO> getBlogList(Map<String, Object> params);
>>>>>>> b5d1386ee760d43da037d99cbeb514a07d42a5a8
  
}
