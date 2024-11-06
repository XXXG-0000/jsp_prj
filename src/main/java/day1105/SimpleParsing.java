package day1105;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.JDOMException;
import org.jdom2.input.SAXBuilder;

public class SimpleParsing {

	public static void main(String[] args) {
		//1. 파서 생성
		SAXBuilder builder = new SAXBuilder();
		//2. XML 문서 객체 얻기
		try {
			//local
			//Document xmlDoc = builder.build(new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/parsing.xml"));
			//network
			Document xmlDoc = builder.build(new URL("http://192.168.10.210/jsp_prj/day1105/parsing.xml"));
			System.out.println(xmlDoc);
			
			//3. 최상위 부모 노드 얻기
			Element namesNode = xmlDoc.getRootElement();
			System.out.println( namesNode );
			
			//4. 파싱할 자식 노드 얻기
			Element nameNode = namesNode.getChild("name");
			
			//5. 파싱
			String name = nameNode.getValue();
			System.out.println(name);
		} catch (JDOMException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//main

}//class
