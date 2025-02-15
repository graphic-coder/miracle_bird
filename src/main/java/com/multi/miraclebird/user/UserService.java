package com.multi.miraclebird.user;

import java.time.LocalDateTime;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.multi.miraclebird.api.InstagramApiService;
import com.multi.miraclebird.profile.ProfileDAO;
import com.multi.miraclebird.profile.ProfileVO;


@Service
@Transactional
public class UserService {

	@Autowired
	private InstagramApiService instagramApiService;
	
	@Autowired
	private UserDAO userDao;
	
	@Autowired
	private ProfileDAO profileDao;
	
	public UserVO createInstagramUser(String code) {
		UserVO userVO = new UserVO();
		ProfileVO profileVO = new ProfileVO();
		
		ResponseEntity<Map> shortToken = instagramApiService.getShortTokenAndUserId(code);
		userVO.setUserId((Long) shortToken.getBody().get("user_id"));
		userVO.setAccessToken((String) shortToken.getBody().get("access_token"));
		
		ResponseEntity<Map> longToken = instagramApiService.getLongTokenAndExpires(userVO.getAccessToken());
		userVO.setCreateDate(LocalDateTime.now());
		userVO.setAccessToken((String) longToken.getBody().get("access_token"));
		userVO.setExpiresIn((int) longToken.getBody().get("expires_in"));
		
		ResponseEntity<Map> profile = instagramApiService.getUserProfile(userVO);
		userVO.setUsername((String) profile.getBody().get("username"));
		
		userVO.setRole(Role.USER);
		
		profileVO.setUserId(userVO.getUserId());
		
		if(selectUserByUserId(userVO) != null) {
			userDao.updateAccessToken(userVO);
		} else {
			userDao.createInstagramUser(userVO);
			profileDao.createProfile(profileVO);
		}
		
		return userVO;
	}
	
	public void updateAccessToken(UserVO userVO) {
		userDao.updateAccessToken(userVO);
	}
	
	public UserVO selectUserByUserId(UserVO userVO) {
		return userDao.selectUserByUserId(userVO);
	}
	
	public String selectAccessTokenByUserId(Long userId) {
		return userDao.selectAccessTokenByUserId(userId);
	}
	
	public UserVO selectUser(Long userId) {
		return userDao.selectUser(userId);
	}
}
