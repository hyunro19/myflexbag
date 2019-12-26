package com.frame;

import java.util.ArrayList;

import org.springframework.transaction.annotation.Transactional;

public interface ServiceO<K,V> {
	@Transactional
	public int register(V v) throws Exception;
//	@Transactional
//	public int remove(K k) throws Exception;
//	@Transactional
//	public int modify(V v) throws Exception;
//	
	public V get(K k) throws Exception;
	public ArrayList<V> getall(V v) throws Exception;
}



