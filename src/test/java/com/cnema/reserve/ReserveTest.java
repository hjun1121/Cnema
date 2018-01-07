package com.cnema.reserve;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.junit.Test;

import com.cnema.c1.AbstractTest;

public class ReserveTest extends AbstractTest {

	@Inject
	private ReserveDAO reserveDAO;
	
	@Test
	public void test() {
		int startNum = 65;
		
		int lastNum = startNum+5-1;
		int xRow = lastNum-startNum+1;
		int yRow = 5;
		for(int i = startNum; i<=lastNum; i++){
			for(int j=1; j<=yRow; j++){
				System.out.println((char)i+"열"+j);
			}
		}
		
		
		/*int num = 65;
		char ch = (char)num;
		System.out.println("숫자 :"+num);
		System.out.println("문자 :"+ch);
		
		char ch2 = 'B';
		int num2 = ch2;
		System.out.println("문자 :"+ch2);		
		System.out.println("숫자 :"+num2);*/
	}
}
