package hmhc;
public class Hmhc {
	public static void main(String[] args) {
		int cock,hen,chicken=0;
		for(cock=0;cock<=19;cock++){
			for(hen=0;hen<=33;hen++){
				chicken=100-cock-hen;
				int p;
				p=chicken%3;
				if(((5*cock+3*hen+chicken/3)==100)&&(p==0)){
					System.out.print("    可以买公鸡的只数："+cock);
					System.out.print("    可以买母鸡的只数："+hen);
					System.out.print("    可以买小鸡的只数："+chicken);
					System.out.println("\n");
				}
			}
		}
	}
}
