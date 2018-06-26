package com.libo.libo.member.service;
import com.libo.libo.member.PlaceFav;
import java.util.List;

public class PlaceFavService {
	
	public List<PlaceFav> getPlaceFavList(String memberId) {
		String sortKey = "desc";		
		getPlaceFavList(memberId, sortKey);
		return null;
	}
	
	public List<PlaceFav> getPlaceFavList(String memberId, String sortKey) {
		return null;
	}
	public int getPlaceFavCount() {
		return 0;
	}
	
	public void insertPlaceFav(PlaceFav placeFav) {
		
	}
	public void deletePlaceFav(long id) {
		
	}
	
}
