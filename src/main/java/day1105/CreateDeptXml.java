package day1105;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.output.Format;
import org.jdom2.output.XMLOutputter;

public class CreateDeptXml {

	public static void main(String args[]) {
		//1. XML 문서 객체 생성
		Document doc = new Document();
		
		//2. 최상위 부모 노드 생성
		Element deptsNode = new Element("depts");//<depts/>
		
		//3-1. 부모 노드 생성
		Element deptNode1 = new Element("dept");//<dept/>
		
		//4-1. 자식 노드 생성
		Element deptnoNode1 = new Element("deptno");//<deptno/>
		deptnoNode1.setText("10");
		
		Element dnameNode1 = new Element("dname");//<dname/>
		dnameNode1.setText("개발부");
		
		Element locNode1 = new Element("loc");//<loc/>
		locNode1.setText("서울");
		
		//3-2. 부모 노드 생성
		Element deptNode2 = new Element("dept");//<dept/>
		
		//4-2. 자식 노드 생성
		Element deptnoNode2 = new Element("deptno");//<deptno/>
		deptnoNode2.setText("20");
		
		Element dnameNode2 = new Element("dname");//<dname/>
		dnameNode2.setText("유지보수");
		
		Element locNode2 = new Element("loc");//<loc/>
		locNode2.setText("서울");
		
		//3-3. 부모 노드 생성
		Element deptNode3 = new Element("dept");//<dept/>
		
		//4-3. 자식 노드 생성
		Element deptnoNode3 = new Element("deptno");//<deptno/>
		deptnoNode3.setText("30");
		
		Element dnameNode3 = new Element("dname");//<dname/>
		dnameNode3.setText("영업부");
		
		Element locNode3 = new Element("loc");//<loc/>
		locNode3.setText("서울");
		
		
		//5. 자식 노드를 부모 노드에 배치
		deptNode1.addContent(deptnoNode1);//<root><msg></root>
		deptNode1.addContent(dnameNode1);//<root><msg></root>
		deptNode1.addContent(locNode1);//<root><msg></root>
		
		deptNode2.addContent(deptnoNode2);//<root><msg></root>
		deptNode2.addContent(dnameNode2);//<root><msg></root>
		deptNode2.addContent(locNode2);//<root><msg></root>
		
		deptNode3.addContent(deptnoNode3);//<root><msg></root>
		deptNode3.addContent(dnameNode3);//<root><msg></root>
		deptNode3.addContent(locNode3);//<root><msg></root>

		//6. 부모 노드를 최상위 부모 노드에 배치
		deptsNode.addContent(deptNode1);//<root><msg></root>
		deptsNode.addContent(deptNode2);//<root><msg></root>
		deptsNode.addContent(deptNode3);//<root><msg></root>
		
		//6. 최상위 부모 노드를 문서 노드에 배치
		doc.addContent(deptsNode);
		
		//7. 생성된 문서 객체를 출력
		XMLOutputter xOut = new XMLOutputter(Format.getPrettyFormat());
		try {
			xOut.output(doc, System.out);
			File file = new File("C:/dev/workspace/jsp_prj/src/main/webapp/day1105/deptOut.xml");
			FileOutputStream fos = new FileOutputStream(file);
			
			xOut.output(doc, fos);//file 출력
			
			if(fos != null) { fos.close(); }//end if
		} catch(IOException ie) {
			ie.printStackTrace();
		}// end catch
		
	}//main
	
}//class
