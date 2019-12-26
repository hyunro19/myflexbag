package com.frame;

import java.util.ArrayList;


public interface DaoO<K,V> {
	public int insert(V v) throws Exception;
//	public void delete(K k) throws Exception;
//	public void update(V v) throws Exception;
	public V select(K k) throws Exception;
	public ArrayList<V> selectall(V v) throws Exception;

}
