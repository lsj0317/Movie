package com.firstgroup.movies.util;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Utility {
	public long[] parseToList(String listString){
		List<Long> parsingIntList = new ArrayList<Long>();
		String[] valueList = listString.replace(" ","").split(",");
		for(String value : valueList) {
			parsingIntList.add(Long.parseLong(value));
		}
		return listToLongList(parsingIntList); 
	}
	
	public long[] listToLongList(List<Long> list) {
		return list.stream().mapToLong(Long::longValue).toArray();
	}
}
