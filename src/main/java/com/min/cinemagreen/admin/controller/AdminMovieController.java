package com.min.cinemagreen.admin.controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.min.cinemagreen.admin.service.IAdminMovieService;
import com.min.cinemagreen.dto.MovieDTO;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class AdminMovieController {
  
  private final IAdminMovieService adminMovieService;

  // ------------------------- 페이지 이동 -------------------------
  @GetMapping("/movie.page")
  public String moviePage(Model model) {
    List<MovieDTO> movieList = adminMovieService.getMovieList(null);
    model.addAttribute("movieList", movieList);
    return "admin/movie"; // 사용자 목록
  }
  // ------------------------- 페이지 이동 -------------------------
  
  
  
  
  // ------------------------ 유저 관련 기능 ------------------------
  @GetMapping(value = "/getMovieList.do", produces = "application/json")
  public ResponseEntity<List<MovieDTO>> getMovieListDo(HttpServletRequest request) {
    return ResponseEntity.ok(adminMovieService.getMovieList(request));
  } // 모든 영화 목록
  // ------------------------ 유저 관련 기능 ------------------------
  
  
  
  
  
  // ------------------------------- 추가 기능 -------------------------------
  @GetMapping(value = "/getMovieDetail/{movieNo}", produces = "application/json")
  public ResponseEntity<MovieDTO> getMovieById(@PathVariable int movieNo) {
    MovieDTO movie = adminMovieService.getMovieById(movieNo);
    return ResponseEntity.ok(movie);
  } // 영화 상세보기에 해당 유저 정보 넣기
  // ------------------------------- 추가 기능 -------------------------------
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
}