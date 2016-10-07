* Load your data
	cd "/Users/malkaguillot/Documents/Enseignement/LSE - EC220/ps/data"
	use titanic.dta, clear

* Have a look at your data
	* Columns = variables
	* Rows = individual
	browse
	edit 
	ed age gender

	describe
	describe homedest

	codebook homedest
	
* Key statistics

	* How many passengers or observation? 
	count
	* How many males? 
	edit gender
	count if gender == "Male"
	codebook gender
	count if gender == 1
	tabulate gender
	
	* Average age?
	summarize age
	* Average age of females?
	summarize age if gender == 0
	
	* What other question can you think about?
	
* Managing the dataset
	* Creating a new variable
	codebook embarked
	generate embarked_in_the_uk = 0
	replace embarked_in_the_uk = 1 if embarked == "Southampton" | embarked == "Queenstown" 
	* beware of missing information
	replace embarked_in_the_uk = . if embarked == ""
	
	* other solution:
	generate embarked_in_the_uk2 =  (embarked == "Southampton" | embarked == "Queenstown") if !missing(embarked)
	
	*dropping or keeping variables
	drop embarked_in_the_uk boat
	
	* Rename variable
	rename embarked_in_the_uk2 embarked_in_the_uk
	* syntax: rename oldname newname
	
	*dropping or keeping observations
	drop if survived == 0
	
	keep if age < 19
	
* If we have time
	* dofiles
		* open and save
		* comments
	* use and save dataset
	* conditionning
	
*-------------------------------------------------------------------------------
* Additional resources


*  The basic syntax of any command in Stata is: command [args1] [arg2] [, options]
*  Some commands take arguments, some don't

display 2+2
di 3*3


*  Dofile colors

** commands are marked in dark blue, variables and all other text in black:
describe age pclass
** strings are marked in red:
dis "Hello"

** comments are marked in green; Stata ignores these when running your do-file
*     *      comments out the entire line
*     //     comments out the rest of the line
*     ///    instructs Stata to read the next line appended to the current one
*     /* */  comments out anything between /* and */, and 
			/* can span
			over 
			several 
			lines */
** macros are marked in light blue (see "Intro to programming" section)

* Commands shortcuts:
	* generate = gen
	* edit = ed
	* browse = br
	* summarize = sum
	* display = di
