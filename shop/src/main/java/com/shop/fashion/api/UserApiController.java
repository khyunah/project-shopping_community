package com.shop.fashion.api;

import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.net.openssl.ciphers.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.shop.fashion.dto.KakaoAccount;
import com.shop.fashion.dto.KakaoProfile;
import com.shop.fashion.dto.OAuthToken;
import com.shop.fashion.dto.Profile;
import com.shop.fashion.dto.ResponseDto;
import com.shop.fashion.model.OAuthType;
import com.shop.fashion.model.User;
import com.shop.fashion.service.UserService;

@RestController
public class UserApiController {

	@Autowired
	private UserService userService;
	@Autowired
	private HttpSession httpSession;
	@Value("${kakao.key}")
	private String kakaoKey;

	// 회원가입시 아이디 중복 체크
	/**
	 * 회원가입시 아이디 중복 체크를 하는 기능 <br>
	 * 입력한 userId가 가입되어 있지 않으면 new User()로 넘어옴 <br>
	 * 입력한 userId로 이미 가입이 되어있으면 UserEntity로 넘어옴
	 */
	@PostMapping("/security/join-userIdCheck")
	public ResponseDto<User> checkUserId(String userId, Model model) {
		User checkUser = userService.checkUserId(userId);
		return new ResponseDto<User>(HttpStatus.OK.value(), checkUser);
	}

	// 로그인
	@PostMapping("/security/login")
	public ResponseDto<User> loginUser(@RequestBody User user) {
		User userEntity = userService.loginUser(user);
		
		if(userEntity.getUserId() != null) {
			httpSession.setAttribute("principal", userEntity);
		}
		return new ResponseDto<User>(HttpStatus.OK.value(), userEntity);
	}
	
	@GetMapping("/auth/kakao/callback")
	public String kakaoCallback(String code) {
		// 토큰 받기
		HttpHeaders tokenHeaders = new HttpHeaders();
		tokenHeaders.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		MultiValueMap<String, String> tokenParams = new LinkedMultiValueMap<String, String>();
		tokenParams.add("grant_type", "authorization_code");
		tokenParams.add("client_id", "0d6bcf296d67c35ad944b2a3d38df9be");
		tokenParams.add("redirect_uri", "http://localhost:9090/auth/kakao/callback");
		tokenParams.add("code", code);
		
		HttpEntity<MultiValueMap<String, String>> tokenRequest = new HttpEntity<MultiValueMap<String,String>>(tokenParams, tokenHeaders);
		
		RestTemplate tokenRt = new RestTemplate();
		ResponseEntity<OAuthToken> tokenResponse = tokenRt.exchange(
				"https://kauth.kakao.com/oauth/token",
				HttpMethod.POST,
				tokenRequest,
				OAuthToken.class);
		
		// 사용자 정보 가져오기 
		HttpHeaders kakaoUserInfoHeaders = new HttpHeaders();
		kakaoUserInfoHeaders.add("Authorization", "Bearer " + tokenResponse.getBody().getAccessToken());
		
		HttpEntity<MultiValueMap<String, String>> kakaoUserInfoRequest = new HttpEntity<>(kakaoUserInfoHeaders);
		
		RestTemplate kakaoUserInfoRt = new RestTemplate();
		ResponseEntity<KakaoProfile> kakaoUserInfoResponse = kakaoUserInfoRt.exchange(
				"https://kapi.kakao.com/v2/user/me",
				HttpMethod.POST,
				kakaoUserInfoRequest,
				KakaoProfile.class);
		
		// 가져온 사용자 정보로 해당 사이트의 회원으로 가입시키기
		KakaoProfile kakaoUserProfile = kakaoUserInfoResponse.getBody();
		KakaoAccount kakaoUser = kakaoUserProfile.getKakaoAccount();
		Profile kakaoProfile = kakaoUser.getProfile();
		
		User kakaoLoginUser = User.builder()
				.userId(kakaoUser.getEmail() + "_" + kakaoUserProfile.getId())
				.username(kakaoProfile.getNickname())
				.password(kakaoKey)
				.email(kakaoUser.getEmail())
				.oauth(OAuthType.KAKAO)
				.build();
		
		User originUser = userService.checkUserId(kakaoLoginUser.getUserId());
		
		if(originUser.getUsername() != null) {
			userService.joinUser(kakaoLoginUser);
		}
		
		// TODO
		// 사용자 정보를 세션에 강제 수정해주기 
		
		return "사용자 정보 : " + kakaoUserInfoResponse;
	}
}
