package com.multi.miraclebird.store;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.multi.miraclebird.profile.ProfileVO;

@Repository
public class StoreDAO {
	@Autowired
	SqlSessionTemplate mybatis;	
	
	public List<ProductVO> list(CategoryPageVO vo) {
		return mybatis.selectList("product.list", vo);
	}
	public int count(CategoryPageVO vo) {
		return mybatis.selectOne("product.count", vo);
	}
	public int myPoint(Long userId) {
		return mybatis.selectOne("profile.myPoint", userId);
	}
	public int productPoint(int productId) {
		return mybatis.selectOne("product.productPoint", productId);
	}
	public void pointUpdate(ProfileVO profileVO) {
		mybatis.update("profile.pointUpdate", profileVO);
	}
	public void orderInsert(OrderVO orderVO) {
		mybatis.insert("order.orderInsert", orderVO);
	}
	public void userProductInsert(UserProductVO userProductVO) {
		mybatis.insert("userProduct.userProductInsert", userProductVO);
	}
	public int findProduct(UserProductVO findProduct) {
		return mybatis.selectOne("userProduct.findProduct", findProduct);
	}
	public List<CategoryVO> cateList() {
		return mybatis.selectList("product.cateList");
	}
	public List<OrderVO> orderList(Long userId) {
		return mybatis.selectList("order.orderList", userId);
	}
	
//	파티원들의 아이템 조회
	public List<ProductVO> findPartyMemberProductByPartyId(Integer partyId) {
		return mybatis.selectList("product.findPartyMemberProductByPartyId", partyId);
	}
	
	
}
