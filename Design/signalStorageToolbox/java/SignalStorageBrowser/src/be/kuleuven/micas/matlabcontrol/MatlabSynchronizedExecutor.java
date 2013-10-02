package be.kuleuven.micas.matlabcontrol;

import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.concurrent.Future;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;



public class MatlabSynchronizedExecutor {
	/**
	 * create thread safe executor for running matlab commands, using an executor to Schedulde different call to the mc object;  
	 */
	MatlabControl mc;
	ExecutorService exec;
	public MatlabSynchronizedExecutor(MatlabControl mc) {
		this.mc = mc;
		exec = Executors.newSingleThreadExecutor();
		
	}
	
	public void execFeval(final String Command, final Object[] args){
		Runnable taskToRun = new Runnable() {
			public void run() {
					mc.feval(Command, args);
			}
		};
//		try {
//			Future<?> f =
				exec.submit(taskToRun);
	//		f.get(1, TimeUnit.SECONDS);
//		} catch (InterruptedException e) {
//			e.printStackTrace();
//		} catch (TimeoutException e) {
//			e.printStackTrace();
//		} catch (ExecutionException e) {
//			e.printStackTrace();
//		}
		
	}
	
	public boolean execTestFunction(String Command , final Object[] args)  {
		//execute a command, and (attempt to ) transform the result in a boolean
		Object value = execBlockingFeval(Command, args);
		if (value == null) {
			outputMatlab("returned empty value...");
			value = new boolean[]{ true };
		}
		//}
		boolean rets = false;
		
		if ( value.getClass().getName() == "[Z" ) {
	//		outputMatlab("This is a boolean array, value= " + ((boolean[]) value )[0]);
			Object inside_rets = ((boolean[]) value )[0];
			rets = (Boolean) inside_rets;
		
		} else if ( value.getClass().getName() == "[D"  )  {
	//		outputMatlab("This is a double array, value= "+ ((double[]) value )[0] );
			Object inside_rets = ((double[]) value )[0];
			rets =  ( (Double)  inside_rets ) == 1;
		} else if (value.getClass().getName().equals("java.lang.Integer")) {
			//Object inside_rets = ((Integer[]) value )[0];
			outputMatlab("value is an Integer, equal to: " + value );
			rets =  (  (Integer) value ) == 1;
	} else {
			outputMatlab("ERROR: not a double,integer, neither a boolean. instead, a "+ value.getClass().getName() );
			Exception e =  new Exception("unknown type");
			e.printStackTrace();
			if ( value.getClass().getName().equalsIgnoreCase("java.lang.String") ) {
				outputMatlab("String:" + value);
			}
		}
		return rets;
	}
	
	public Object execBlockingFeval(final String Command, final Object[] args) {
		Callable<Object> taskToRun = new Callable<Object>() {
			public Object call() {
				Object result;
				try {
					result =  mc.blockingFeval(Command, args);
				} catch (InterruptedException e) {
					e.printStackTrace();
					result = "failedInterrupted1";
					
				}
				return result;
			}
		};
		Object result = "nothingYet";
		try {
			//result =  exec.submit(taskToRun).get();
			Future<Object> f = exec.submit(taskToRun);
			result = f.get(10, TimeUnit.MILLISECONDS);
		} catch (InterruptedException e) {
			e.printStackTrace();
			result = "failedInterrupted2";
		} catch (ExecutionException e) {
			e.printStackTrace();
			result = "ExecutionException1";
		} catch (TimeoutException e) {
			result = 0;
		} 
		return result;
		
	}
	
	public final boolean getGlobal(final String varname ) {
		Object[] args = new Object[2];
		args[0] = varname;
		args[1] = "keep";
		//Object value = MatExec.execBlockingFeval("setGlobal",args);
		boolean result;
		//try {
			result = execTestFunction("setGlobal",args);
		//} 
		//catch (TimeoutException e) {
		//	MatExec.outputMatlab("lost the server while getting the value for: " + varname);
		//	MatExec.outputMatlab("setting "+ varname + " to false instead");
		//	e.printStackTrace();
		//	result = false;
			
		//}
		//outputMatlab(varname+ " measured :" +result);

		return result;

}
	
	  public final  void outputMatlab(final String string) {
			Object[] Msg = { string };
			execFeval("disp", Msg);
	  }

	public void eval(final String cmd) {
		Runnable taskToRun = new Runnable() {
			public void run() {
					mc.eval(cmd);
			}
		};
		exec.submit(taskToRun);
		
	}

}
