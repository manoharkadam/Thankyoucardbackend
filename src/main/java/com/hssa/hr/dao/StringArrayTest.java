package com.hssa.hr.dao;
import java.util.Arrays;
import java.util.List;
import java.util.ArrayList;
public class StringArrayTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String email="word1";
		   String[] words = email.split(",");

		      List<String> wordList = Arrays.asList(words);

		      for (String e : wordList)
		      {
		         System.out.println(e);
		      }
	}

}
