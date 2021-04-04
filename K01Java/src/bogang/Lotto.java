package bogang;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Random;

public class Lotto {

	public static void main(String[] args) {

		Random random = new Random();
		HashSet<Integer> lottoNum = new HashSet<Integer>();
		int count=0;
		int[] arr = new int[6];
		while(true) {
			lottoNum.clear();
			while(true) {
				lottoNum.add(random.nextInt(44)+1);
				if(lottoNum.size()==6) {
					break;
				}
			}
			Iterator<Integer> a = lottoNum.iterator();
			int index = 0;
			while(a.hasNext()) {
				arr[index++]=a.next();
			}
			Arrays.sort(arr);
			System.out.println("[로또번호]");
			for(int b : arr) {
				System.out.print(b+" ");
			}
			System.out.println();
			count++;
			if(count==5) {
				break;
			}
		}
	}
}
