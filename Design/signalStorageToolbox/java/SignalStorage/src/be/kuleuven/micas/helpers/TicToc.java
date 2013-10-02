package be.kuleuven.micas.helpers;

public class TicToc {
	
	public static long tic( ) {
		return System.nanoTime();
	}
	
	public static void tocP( long tic ) {
		double time = System.nanoTime()-tic;
		System.out.println( "time elapsed: "+(time/1e6)+"ms");
	}
	
	public static void tocP( long tic, String completedTask ) {
		double time = System.nanoTime()-tic;
		System.out.println( "completed ["+completedTask+ "] ("+(time/1e6)+"ms)");
	}
	
	
	public static long tic( boolean verbose ) {
		return System.nanoTime();
	}
	

	public static void tocP( boolean verbose, long tic ) {
		double time = System.nanoTime()-tic;
		if( verbose ) {
			System.out.println( "time elapsed: "+(time/1e6)+"ms");
		}		
	}
	
	public static void tocP( boolean verbose, long tic, String completedTask ) {		
		double time = System.nanoTime()-tic;
		if( verbose ) {
			System.out.println( "completed ["+completedTask+ "] ("+(time/1e6)+"ms)");
		}
	}
	
	
}
