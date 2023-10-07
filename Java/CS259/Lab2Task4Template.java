// A template for Naive Bayes binary model: If John has a flu based on possibly having cough, fever or sneezing.
// 

import java.lang.Math; 


public class Tests {
	
	static  int pos_count = 0, neg_count = 0; // Counts of positive (flu) and negative (~flu) datapoints. 

	static int NumberOfFeatures =  ;
	
	// Feature counts to estimate conditional probabilities:
	static double [] FeatureCountsPos = new double [NumberOfFeatures];  // to count #{x AND pos}, where x can be cough, fever or sneezing. pos = having a flu 
	static double [] FeatureCountsNeg = new double [NumberOfFeatures]; // to count #{x AND ~pos}
			
	
	static void Assert (boolean res) 
	{
	 if(!res)	{
		 System.out.print("Something went wrong.");
	 	 System.exit(0);
	 }	
	}
	static class NaiveBayesModel {     
		
	   public NaiveBayesModel(){ }  

	   double estimate(double [] X){  // Returns the probability of the datapoint with the features X to belong to the positive class C, here C = having a flu 
		   							// Implements the Naive Bayes prediction model as the slides 23-26 explain.
			      	
		// Initialize the score to the log of prior odds: log O(C) = log ( #{flu}/#{~flu} ) :
		double s = Math.log((double)pos_count/neg_count); 
		Assert(neg_count > 0);
		Assert(pos_count > 0);

		Assert(NumberOfFeatures == X.length);
		for (int x = 0; x < NumberOfFeatures; x++) { // Update the score s according to the Naive Bayes formula for the odds: log O(C|x1,x2,x3,...) = log O(C) + log s1 + log s2 + log s3,
			// where s1 = P(x1|C)/P(x1|~C), s2 = P(x2|C)/P(x2|~C), s3 = P(x3|C)/P(x3|~C) are "feature strengths".    
			
	   		if(X[x] > 0) { // To simplify the model and to apply it later to MNIST, we only consider feature presence, not absences   
	   			
	   			 	   			
	   			double p_feature_cond_pos = FeatureCountsPos[x]/pos_count; // P(x|C) = #{x AND pos} / #{pos} 
	   			if (p_feature_cond_pos == 0)
	   				p_feature_cond_pos = .01; // We make each estimated probability to be at least 0.01 to avoid division by 0 later.
	   										  // This is called "smoothing."
	   			double p_feature_cond_neg =     ; // P(x|~C) = #{x AND ~pos} / #{~pos}	 	   			
	   			if (p_feature_cond_neg == 0)
	   				p_feature_cond_neg = .01; 
	   			
	   			double feature_strength =     ; //  
	   			
	   			s = s + Math.log(feature_strength);
	   		}	   			   		
	   	}
		return 1/(1 + Math.exp(-s)); // Convert back from log O(C|X) to P(C|X)   
	   }
	   public void Update(double X[], int label) { 

		   // Update the tables with occurrence counts for the features:
		   Assert(NumberOfFeatures == X.length);
		   for (int x = 0; x < NumberOfFeatures; x++) { 
			   
			   if(label > 0) { 
				   if(X[x] > 0)
					   FeatureCountsPos[x] ++;
			   }
			   else  
				   if(X[x] > 0)
					   // add a line of code here!			   
		   }		   
		   // Update the counts of #{pos} and #{~pos}:
		   if(label > 0)  
			   pos_count++;
		   else  
			   neg_count++;
	   }
	} 
	 


	public static void main(String[] args) throws Exception  {  

		NaiveBayesModel M = new NaiveBayesModel();   
				
		// Initialising feature counts to 0s:
		for (int x = 0; x < NumberOfFeatures; x++) {
					   FeatureCountsPos[x]=0;
					   FeatureCountsNeg[x]=0;
		}
		
		// Update our feature count tables:
		M.Update(new double [] {1,0,0}, 1); // The features: cough, fever, sneezing (in that order).   
		M.Update(new double [] {0,1,0}, 0); // Label is 1 for positive (flu) and 0 for negative (no flu).
		M.Update(new double [] {0,0,1}, 0); 
		M.Update(new double [] {0,1,1}, 1); 
		M.Update(new double [] {0,1,1}, 1);  
		M.Update(new double [] {0,0,0}, 0); 
		
		Assert(FeatureCountsPos[0] == 1); 
		Assert(FeatureCountsPos[1] == 2);  
		Assert(FeatureCountsPos[2] ==  ); // Finish those lines, but don't remove them!  
		Assert(FeatureCountsNeg[0] ==  );  
		Assert(FeatureCountsNeg[1] ==  );  
		Assert(FeatureCountsNeg[2] ==  ); 
	
		// Testing the probabilities of the features conditional on the flu:
		System.out.print("P(cough|flu)= "); System.out.println(FeatureCountsPos[0]/pos_count); 
		System.out.print("P(cough|~flu)= "); System.out.println(FeatureCountsNeg[0]/neg_count); 
		System.out.print("P(fever|flu)= "); System.out.println( );  // Finish those lines, but don't remove them! 
		System.out.print("P(fever|~flu)= "); System.out.println( ); 
		System.out.print("P(sneezing|flu)= "); System.out.println( );  
		System.out.print("P(sneezing|~flu)= "); System.out.println( ); 
	
		// Testing estimating the probabilities of having a flu based on the features (symptoms):
		System.out.print("P(flu|cough)= "); System.out.println(M.estimate(new double [] {1,0,0})); 
		Assert(Math.abs(M.estimate(new double [] {1,0,0})  - P) < 0.01); // Replace P with the theoretical estimate here for comparison  
		System.out.print("P(flu|fever)= "); System.out.println(M.estimate(new double [] {0,1,0})); 
		Assert(Math.abs(M.estimate(new double [] {0,1,0}) - P) < 0.01); // Replace P with the theoretical estimate here for comparison
		System.out.print("P(flu|sneez)= "); System.out.println(M.estimate(new double [] {0,0,1})); 
		Assert(Math.abs(M.estimate(new double [] {0,0,1}) - P) < 0.01); // Replace P with the theoretical estimate here for comparison
		System.out.print("P(flu|fever, sneez)= "); System.out.println(M.estimate(new double [] {0,1,1}));
		Assert(Math.abs(M.estimate(new double [] {0,1,1}) - P) < 0.01);  // Replace P with the theoretical estimate here for comparison
		System.out.print("P(flu|cough, fever, sneez)= "); System.out.println(M.estimate(new double [] {1,1,1}));
		Assert(Math.abs(M.estimate(new double [] {1,1,1}) - P) < 0.01); // Replace P with the theoretical estimate here for comparison
				
		System.out.print("All tests fine.");			
} 
}
