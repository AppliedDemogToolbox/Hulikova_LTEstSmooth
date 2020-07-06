*********************************************************
*								
* MORTALITY DATA SMOOTHING	
* Klara Hulikova				
* Macro for parameter estimation and producing the	
* results for many years or populations in one step	
*								
* More detailed description of this programm could 	
* be found in the Chapter 5 of the original Doctoral Thesis, available
* at https://github.com/AppliedDemogToolbox/Hulikova_LTEstSmooth/raw/master/Hulikova_Doctoral_Thesis_CH5_SAS_MACRO.pdf
* Please, use it if you need more detailed 		
* instructions and information.				
*					
*********************************************************
*
* Notes: There is no warranty for this script or the associated 
* macro and data. 
* The 32 bit version of this script, with link to the 32 bit macro, is available at
* https://raw.githubusercontent.com/AppliedDemogToolbox/Hulikova_LTEstSmooth/master/SMOOTH63.sas
* (Posted July 2012 (updated July 2020).)
*
*********************************************************
*						
* READ ME BEFORE THE FIRST PROCESSING               	
* 								
* Please read all the instructions below first.    	
*								
* Then fill the information which should be filled and	
* submit the whole code or separatedly the particular	
* parts of the code step by step.				
*								
* Please be sure that the input data file respects the  
* needs for its design. If it does not, the programm 	
* wouldn`t be successful!					
*								
* Close the output file before submiting the code - 	
* without it the programm wouldn`t be successful!	
*								
* It is highly recomended to read the log file after 	
* finishing the process.	
*				
*********************************************************

*Macro settings:										;
*Please fill the address where the file "macro_store_smooth_64" was saved and 
submit the two rows (the code could be also submited as a whole);
*(Macro is available at the following address: https://github.com/AppliedDemogToolbox/Hulikova_LTEstSmooth/raw/master/macro_store_smooth_64/sasmacr.sas7bcat);
libname smooth64 'g:\SAS\macro_store_smooth_64\';
options mstored mautosource spool SASMSTORE=smooth64;

*Graphical settings:										;
*Please fill the address where graphical outputs should be stored and 
submit the two rows (the code could be also submited as a whole);
ods html path="g:\SAS\pictures_store\";
ods graphics on;

*Please define the input file;
*(Data is available at the following address: https://github.com/AppliedDemogToolbox/Hulikova_LTEstSmooth/raw/master/data_example/FRA_F.xls);
%let adress_input="g:\SAS\data_example\FRA_F.xls";
*Please define the outputfile;
%let adress_output="g:\SAS\output_store\FRA_F_out.xls";

*"setup row"
in the setup row (below) user has to input the values defining the output:
start = the initial (calendar) year for which the parameters should be estimated
stop = the last (calendar) year for which the parameters should be estimated
minimal = the initial age used for the estimation procedure
omega = the last age for which the smoothed values should be calculated
maximal = the last age used for the estimation procedure
function = the selected function of mortality smoothing
	        - user can choose from this options (more detailed description 
			  of the functions could be found in the original Doctoral Thesis):
		K - Kannisto function
		M - Gompertz-Makeham function
		T - Thatcher function
		C - Coale-Kisker function
		F - modified Gompertz-Makeham function
		G - Gompertz function;
%smoothing (start=2000, stop=2005, minimal=30, omega=100, maximal=90, function=m);

*What to do in case of errors:
- please check that data for all the years defined by the "start" and "stop" command are available - results will 
	be produced only for those years where data are available
- please check that in the input data set all needed features are hold (unified design of the dataset is needed
- check whether the output file is closed while processing
- some functions (before all the modified Gompertz-Makeham function) are very sensitive to the data quality, if 
	wrong or unreal results are produced the reason for that can lie in the poor data quality - in that case plese select
	another method of smoothing.;
