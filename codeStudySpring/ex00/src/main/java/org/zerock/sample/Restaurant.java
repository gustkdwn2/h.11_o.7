package org.zerock.sample;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Component
@ToString
@Getter
@RequiredArgsConstructor
//@AllArgsConstructor 인스턴스 변수로 선언된 모든 것을 피라미터로 받는 생성자를 작성 
public class Restaurant {

	@NonNull
	private Chef chef;
}
