package day1018;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

public class DataDAO {
	
	public List<DataVO> selectData(){
		List<DataVO> list = new ArrayList<DataVO>();
  
		if(new Random().nextBoolean()) {
			list.add(new DataVO("img.png","3조 조원 이인혁","모든 일에 최선을 다하는 조원.",1));
			list.add(new DataVO("img2.jpg","페페","이게 뭐에요?",2));
			list.add(new DataVO("img4.jpg","페페","뚜땨아...",3));
			list.add(new DataVO("img5.jpg","밍기적","밍기적...",4));
		}
		
		return list;
	}// selectData
	
}
