libname a 'D:\UTD_JSOM\Fall2017\Adv BI\projects';

/*For box plot, first of the group variable should be sorted 
for eg : in the below case the attrition is the grouping variable hence it is sorted*/

proc sort data=a.attrition1;
by attrition;
run;


/*Creating a box plot 

plot analysisvaraible * grouping variable

boxstyle is used to see the outlier points in the graph

outbox is used to find the outlier values*/

/*The BOXWIDTHSCALE=value option specifies that the widths of the box plots vary in proportion to a particular function of the group size . 
The function is determined by value and is identified on the box plot with a legend if the BWSLEGEND option is specified. 
The BOXWIDTHSCALE= option is useful in situations where the group sizes vary widely.
( FROM SAS Site)*/

options nogstyle;
title 'Box Plot for MonthlyIncome vs Attrition of IBM HR Attrition Data';
symbol value=dot color=salmon;


proc boxplot data=a.attrition1;
   plot  monthlyIncome*attrition / boxstyle= schematic
   					boxwidthscale=1
   					outbox=atr
					bwslegend;
run;
options gstyle;
goptions reset=symbol;

/*Creating notched box plot */
/*Box plot between EducationField and MonthlyIncome*/
proc sort data=a.attrition1;
by EducationField;
run;
options nogstyle;
title 'Box Plot for MonthlyIncome vs Education Field of IBM HR Attrition Data';
title2 'Using the notches option'
symbol value=dot color=salmon;


proc boxplot data=a.attrition1;
   plot  monthlyIncome*EducationField / boxstyle= schematic	
					nohlabel
					notches ;

run;
/*Creating a box plot where you can list the third variable of the outliers*/


options gstyle;
goptions reset=symbol;

options nogstyle;
title 'Box Plot for MonthlyIncome vs Education Field of IBM HR Attrition Data';
title2 'Using the notches option'
symbol value=dot color=salmon;


proc boxplot data=a.attrition1;
   plot  monthlyIncome*EducationField / boxstyle= schematicid	
					nohlabel
					notches ;
  id gender;
run;
options gstyle;
goptions reset=symbol;
