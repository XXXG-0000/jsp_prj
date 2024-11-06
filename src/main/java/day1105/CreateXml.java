package day1105;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateXml {

	public static void main(String[] args) {
		//1. XML 문서 객체 생성
		Document doc = new Document();
		
		//2. 최상위 부모 노드 생성
		Element rootNode = new Element("root");// <root/>
		
		//3. 자식 노드 생성
		Element msgNode = new Element("msg"); // <msg/>
		//자식 노드에 들어갈 내용 설정
		msgNode.setText("안녕하세요?");

		//3-1. 자식 노드 생성
		Element msgNode2 = new Element("msg"); // <msg/>
		//자식 노드에 들어갈 내용 설정
		msgNode2.setText("오늘은");
		
		//3-1. 자식 노드 생성
		Element msgNode3 = new Element("msg"); // <msg/>
		//자식 노드에 들어갈 내용 설정
		msgNode3.setText("화요일 입니다.");

		//4. 자식노드를 부모노드에 배치
		rootNode.addContent(msgNode);//<root><msg></root>
		rootNode.addContent(msgNode2);//<root><msg></root>
		rootNode.addContent(msgNode3);//<root><msg></root>
		
		//5. 최상위 부모 노드를 문서 노드에 배치
		doc.addContent(rootNode);
		
		//6. 생성된 문제 객체를 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		try{
			xOut.output(doc, System.out);
			File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/msg.xml");
			FileOutputStream fos = new FileOutputStream(file);
			
			xOut.output(doc, fos);//file 출력
			
			if(fos != null) { fos.close(); }// end if
			
		} catch (IOException e) {
			e.printStackTrace();
		}//end catch
		
	}//main

}//class
