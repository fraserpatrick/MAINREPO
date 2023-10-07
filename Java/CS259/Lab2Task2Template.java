//The template for Bayes Theorem Illustration.
//Medical Diagnosis Problem.

import java.util.SplittableRandom; 

public class Tests {
	
	static void Assert (boolean res) // We use this to test our results - don't delete or modify!
	{
	 if(!res)	{
		 System.out.print("Something went wrong.");
	 	 System.exit(0);
	 }
	}
		
	public static void main(String[] args) throws Exception  {  
	
		
		SplittableRandom random = new SplittableRandom(); // Need this for random experiments
		
		int sick_positive = 0, sick_negative = 0, healthy_positive  = 0, healthy_negative = 0;
		int sick_total = 0, healthy_total = 0;
		
		for(int trial=0;trial<1000;trial++) {   // You may need to increase that

			// Defining the experiment: 4 possible outcomes: {(sick, positive),(sick, negative),(healthy, positive), (healthy, negative)}
			boolean sick;
			if(random.nextInt(1, 10001) == 1) // Only one out of 10000 is sick.
				sick  = true;
			else
				sick  = false;

			if (sick) {
				sick_total ++; 
				if (random.nextInt(1, 101) == 1) // 99% accuracy test, so only 1 out of 100 tests makes a mistake.
					sick_negative ++; 
				else
					sick_positive ++;
			}
			else { // healthy

				// Put some code here:
			}
		}			
		
		// If one of those asserts fails, then most likely we need to run more trials:
		Assert(healthy_positive > 0);
		Assert(healthy_negative > 0);
		Assert(sick_positive > 0);
		Assert(sick_negative > 0); 
		
		// Print the results of the trials and the estimates of probabilities:		
		System.out.print("healthy_positive: "); System.out.println(healthy_positive);
		System.out.print("healthy_negative: "); System.out.println(healthy_negative);
		System.out.print("sick_positive: "); System.out.println(sick_positive);
		System.out.print("sick_negative: "); System.out.println(sick_negative);
		Assert(healthy_total == healthy_positive + healthy_negative);
		Assert(sick_total == sick_positive + sick_negative);
		double p_empiricial = (double)sick_positive / (sick_positive + healthy_positive);
		System.out.print("Empirical estimate for P(sick|positive): "); System.out.println(p_empiricial);
		
		// Compare with the estimate from Bayes Theorem:
		// P(sick|pos) = P(sick)*P(pos|sick)/[P(pos|sick)*P(sick) + P(pos|~sick)*P(~sick)]
		double p_Bayes =     ; 	// Put Bayes formula from slides here	
		System.out.print("Bayes theorem estimate: "); System.out.println(p_Bayes);
		Assert(Math.abs(p_Bayes - p_empiricial)/Math.max(p_Bayes, p_empiricial) < 0.1); // Relative difference should not exceed 10% - don't delete this!
						
		System.out.print("All tests fine.");
	
}
}




