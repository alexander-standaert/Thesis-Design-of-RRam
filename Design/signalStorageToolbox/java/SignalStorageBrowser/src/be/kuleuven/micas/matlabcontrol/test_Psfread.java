package be.kuleuven.micas.matlabcontrol;

public class test_Psfread {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		String line = ("\"Vss:p\" \"I\" -1.62e-08"  );
		if( line.startsWith("\"") ) {
			String[] tokens = line.split(" ");
			String name = stripBrackets( tokens[0] );				
			String unit = stripBrackets( tokens[1] );
			String valueString =  tokens[2];
			double value = Double.valueOf( valueString );				
			if( true ) {
				String xUnit = unit;
				String xName = name;
				double xValue = value;
				System.out.println("name= " + xName + "unit= "+ xUnit +  " values: " + xValue);
			}								
		} else {
			System.out.println("failed 1");
		}
		
	}
	
	
	private static String stripBrackets( String in ) {
		String s = in.trim();
		return s.substring( 1, s.length()-1 );			
	}

}
