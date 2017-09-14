libname a 'D:\UTD_JSOM\Fall2017\Adv BI\projects';
data a.attrit;
  keep monthlyincome EducationField; 
  set a.attrition;
  run;

proc sort data=a.attrit;
by EducationField;
run;
proc kde data = a.attrit;
by EducationField;
univar monthlyIncome / unistats percentiles plots=none /*(plots=(density HISTDENSITY)*/
     out = a.attr (rename=(value=monthlyincome));
run;

/*density distribution */
proc kde data = a.attrit;
by EducationField;
univar monthlyIncome / unistats percentiles plots=(density HISTDENSITY)
     out = a.attr (rename=(value=monthlyincome));
run;

data attrt1;
  set a.attr;
    mirror=-density;
	zero=0;
run;

title 'Violin Plot of Monthly Income by Education Field';
proc sgpanel data=Attrt1 nocycleattrs;
  panelby EducationField / layout=columnlattice onepanel
    novarname noborder colheaderpos=bottom;
  band y=monthlyIncome upper=density lower=mirror/ fill outline;
  rowaxis label='Monthly Income' grid;
  colaxis label='Education Field' display=none;
run;



/*--Vertical Violin HighLow--*/
title 'Violin Plot of Monthly Income by Education Field';
proc sgpanel data=Attrt1 nocycleattrs;
  panelby EducationField / layout=columnlattice onepanel 
    novarname noborder colheaderpos=bottom;
  highlow y=monthlyIncome high=density low=mirror / 
     lineattrs=(thickness=4) transparency=0.5;
  rowaxis label='MonthlyIncome' grid;
  colaxis display=none;
run;


/*--Vertical Half Violin HighLow--*/
title 'Violin Plot of Monthly Income by Education Field';
proc sgpanel data=Attrt1 nocycleattrs;
  panelby EducationField / layout=columnlattice onepanel 
    novarname noborder colheaderpos=bottom;
  highlow y=monthlyIncome high=density low=zero / 
     lineattrs=(thickness=4) transparency=0.5;
  rowaxis label='MonthlyIncome' grid;
  colaxis display=none;
run;
