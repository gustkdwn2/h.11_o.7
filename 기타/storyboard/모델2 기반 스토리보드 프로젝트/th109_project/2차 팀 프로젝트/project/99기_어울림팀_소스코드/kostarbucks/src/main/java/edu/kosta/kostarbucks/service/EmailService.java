package edu.kosta.kostarbucks.service;

import java.util.Random;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.kosta.kostarbucks.dao.ChainDao;
import edu.kosta.kostarbucks.dao.MemListDao;
import edu.kosta.kostarbucks.vo.GiftCardVo;
import edu.kosta.kostarbucks.vo.MemListVo;

@Service
public class EmailService {

	private SqlSession sqlSession;

	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 난수
	private static final char[] chars;
    static {
        StringBuilder buffer = new StringBuilder();
        for (char ch = '0'; ch <= '9'; ++ch)
            buffer.append(ch);
        for (char ch = 'a'; ch <= 'z'; ++ch)
            buffer.append(ch);
        for (char ch = 'A'; ch <= 'Z'; ++ch)
            buffer.append(ch);
        chars = buffer.toString().toCharArray();
    }

    // 난수 발생시키는 메소드
    public static String random(int length) {
        if (length < 1)
            throw new IllegalArgumentException("length < 1: " + length);
 
        StringBuilder randomString = new StringBuilder();
        Random random = new Random();
        
        for (int i = 0; i < length; i++) {
            randomString.append(chars[random.nextInt(chars.length)]);
        }
        return randomString.toString();
    }
    

    // 해당 회원의 메일을 가져오는 서비스
	public MemListVo findEmail(String mem_name) {
		MemListDao dao = sqlSession.getMapper(MemListDao.class);
		return dao.findEmail(mem_name);
	}

	// 난수 발생하는 서비스
	public String createkey() {
		ChainDao dao = sqlSession.getMapper(ChainDao.class);
		String key = random(14);
		GiftCardVo vo = dao.cardkey(key); // 발생한 난수가 상품권 테이블에 있는지 검색
		if(vo == null){
			dao.createkey(key); // 상품권테이블에 난수 등록
		}else{
			createkey();
		}
		return key;
	}

}
