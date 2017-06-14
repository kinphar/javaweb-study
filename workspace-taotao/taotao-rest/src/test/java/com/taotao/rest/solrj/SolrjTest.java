package com.taotao.rest.solrj;

import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.impl.HttpSolrServer;
import org.apache.solr.common.SolrInputDocument;
import org.junit.Test;

public class SolrjTest {

	/**
	 * 
	 * @throws Exception
	 * 更新时只要保持id不变修改其他内容后提交即可。
	 */
	@Test
	public void addDocument() throws Exception {
		SolrServer solrServer = new HttpSolrServer("http://192.168.249.132:8080/solr");
		SolrInputDocument document = new SolrInputDocument();
		document.addField("id", "test001");
		document.addField("item_title", "测试商品2");
		document.addField("item_price", 54321);
		solrServer.add(document);
		solrServer.commit();
	}
	
	@Test
	public void deleteDocument() throws Exception {
		SolrServer solrServer = new HttpSolrServer("http://192.168.249.132:8080/solr");
		solrServer.deleteById("test001");
		//通过查询删除全部。
		//solrServer.deleteByQuery("*:*");
		solrServer.commit();		
	}
}
