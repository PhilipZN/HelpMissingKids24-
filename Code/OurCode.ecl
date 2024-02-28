IMPORT $;
Import STD;
IMPORT Visualizer;
//#OPTION('obfuscateOutput', true);
HMK := $.File_AllData;

// Constant's Work
//OUTPUT((HMK.mc_byStateDS(currentage<22 AND STD.Date.Month(datemissing) = 01 )), NAMED('Table'));

January:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 01 ));
February:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 02));
March:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 03));
April:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 04));
May:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 05));
June:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 06));
July:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 07));
August:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 08));
September:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 09));
October:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 10));
November:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 11));
December:=COUNT(HMK.mc_byStateDS(STD.Date.Month(datemissing) = 12));

Winter:= December + January + february;
Spring := March + april + may;
Summer := June+ July + August;
Autumn := September + October + November;

TotalKids := January+February+march+april+may+june+july+august+september+october+november+december;

p1 := (january/totalkids)*100;
p2 := (february/totalkids)*100;
p3 := (march/totalkids)*100;
p4 := (april/totalkids)*100;
p5 := (may/totalkids)*100;
p6 := (june/totalkids)*100;
p7 := (july/totalkids)*100;
p8 := (august/totalkids)*100;
p9 := (september/totalkids)*100;
p10 := (october/totalkids)*100;
p11 := (november/totalkids)*100;
p12 := (december/totalkids)*100;
p13 := (winter/totalkids)*100;
p14 := (spring/totalkids)*100;
p15 := (summer/totalkids)*100;
p16 := (autumn/totalkids)*100;


monthCor := DATASET([{'January',January, p1},
                {'February',February, p2},
              {'March',March, p3},
              {'April',April, p4},
              {'May',May, p5},
              {'June',June, p6},
              {'July',July, p7},
              {'August',August, p8},
              {'September',September, p9},
              {'October',October, p10},
              {'November', November, p11},
              {'December', December, p12}],
              {STRING15 Month,INTEGER NumberOfMissingKids, UNSIGNED percentage});
OUTPUT(monthCor, NAMED('MCFromEachMonth'));

seasonCor := DATASET([{'Winter',Winter, p13},
                {'Spring',Spring, p14},
              {'Summer',Summer, p15},
              {'Autumn',Autumn, p16}],
              {STRING15 Season, INTEGER NumberOfMissingKids, UNSIGNED percentage});
OUTPUT(seasonCor, NAMED('MCFromEachSeason'));


//Philip's Work
EXPORT teen_pregnancy := RECORD
    STRING YEAR;
    STRING STATE;
    REAL RATE;
    STRING URL;
END;

EXPORT teen_pregnancyDS := DATASET('~hmk::in::teenpregnancy',teen_pregnancy,CSV(HEADING(1)));

//OUTPUT(teen_pregnancyDS,NAMED('TeenPregnancy'));

EXPORT youthmentalhealth := RECORD
    INTEGER RANK;
    STRING STATE;
    REAL PERCENTAGE;
    REAL NUMBER; 
END;

EXPORT youthmentalhealthDS := DATASET('~hmk::in::youthmentalhealthfixed', youthmentalhealth,CSV(HEADING(1)));
OUTPUT(youthmentalhealthDS,NAMED('YouthMentalHealth'));


// Jeff's Work
// All MC under the age of 21
twentyYears := HMK.mc_byStateDS(CurrentAge < 21);
NCMEC := CHOOSEN(twentyYears, 4000);  

Population := HMK.pop_estimatesDS(attribute = 'POP_ESTIMATE_2022' AND fips_code % 1000 = 0);
Population2 := TABLE(Population, {state, value});

// Population of each state using 2022 data
Output(Population2, NAMED('Populations'));

_usStates2 := DATASET([ {'AL', (COUNT(NCMEC(missingstate = 'AL')))},
{'AK', (COUNT(NCMEC(missingstate = 'AK')))},
{'AZ', (COUNT(NCMEC(missingstate = 'AZ')))},
{'AR', (COUNT(NCMEC(missingstate = 'AR')))},
{'CA', (COUNT(NCMEC(missingstate = 'CA')))},
{'CO', (COUNT(NCMEC(missingstate = 'CO')))},
{'CT', (COUNT(NCMEC(missingstate = 'CT')))},
{'DE', (COUNT(NCMEC(missingstate = 'DE')))},
{'FL', (COUNT(NCMEC(missingstate = 'FL')))},
{'GA', (COUNT(NCMEC(missingstate = 'GA')))},
{'HI', (COUNT(NCMEC(missingstate = 'HI')))},
{'ID', (COUNT(NCMEC(missingstate = 'ID')))},
{'IL', (COUNT(NCMEC(missingstate = 'IL')))},
{'IN', (COUNT(NCMEC(missingstate = 'IN')))},
{'IA', (COUNT(NCMEC(missingstate = 'IA')))},
{'KS', (COUNT(NCMEC(missingstate = 'KS')))},
{'KY', (COUNT(NCMEC(missingstate = 'KY')))},
{'LA', (COUNT(NCMEC(missingstate = 'LA')))},
{'ME', (COUNT(NCMEC(missingstate = 'ME')))},
{'MD', (COUNT(NCMEC(missingstate = 'MD')))},
{'MA', (COUNT(NCMEC(missingstate = 'MA')))},
{'MI', (COUNT(NCMEC(missingstate = 'MI')))},
{'MN', (COUNT(NCMEC(missingstate = 'MN')))},
{'MS', (COUNT(NCMEC(missingstate = 'MS')))},
{'MO', (COUNT(NCMEC(missingstate = 'MO')))},
{'MT', (COUNT(NCMEC(missingstate = 'MT')))},
{'NE', (COUNT(NCMEC(missingstate = 'NE')))},
{'NV', (COUNT(NCMEC(missingstate = 'NV')))},
{'NH', (COUNT(NCMEC(missingstate = 'NH')))},
{'NJ', (COUNT(NCMEC(missingstate = 'NJ')))},
{'NM', (COUNT(NCMEC(missingstate = 'NM')))},
{'NY', (COUNT(NCMEC(missingstate = 'NY')))},
{'NC', (COUNT(NCMEC(missingstate = 'NC')))},
{'ND', (COUNT(NCMEC(missingstate = 'ND')))},
{'OH', (COUNT(NCMEC(missingstate = 'OH')))},
{'OK', (COUNT(NCMEC(missingstate = 'OK')))},
{'OR', (COUNT(NCMEC(missingstate = 'OR')))},
{'PA', (COUNT(NCMEC(missingstate = 'PA')))},
{'RI', (COUNT(NCMEC(missingstate = 'RI')))},
{'SC', (COUNT(NCMEC(missingstate = 'SC')))},
{'SD', (COUNT(NCMEC(missingstate = 'SD')))},
{'TN', (COUNT(NCMEC(missingstate = 'TN')))},
{'TX', (COUNT(NCMEC(missingstate = 'TX')))},
{'UT', (COUNT(NCMEC(missingstate = 'UT')))},
{'VT', (COUNT(NCMEC(missingstate = 'VT')))},
{'VA', (COUNT(NCMEC(missingstate = 'VA')))},
{'WA', (COUNT(NCMEC(missingstate = 'WA')))},
{'WV', (COUNT(NCMEC(missingstate = 'WV')))},
{'WI', (COUNT(NCMEC(missingstate = 'WI')))},
{'WY', (COUNT(NCMEC(missingstate = 'WY')))}],
{STRING State, DECIMAL weight});
data_usStates2 := OUTPUT(_usStates2, NAMED('choro_usStates2'));
data_usStates2;
viz_usstates2 := Visualizer.Choropleth.USStates('usStates2',, 'choro_usStates2');
viz_usstates2; 

/* 
  This visualization shows kids missing per state under 21 with state population being taken into account
  This is done by using the data from Population2 and multiplies the number of missing kids 
  from each state times a multiplier that is determined by dividing each states population by 
  californias population to show how many kids would be missing if each state had the same population.
*/

INTEGER CAPop := 39029342;
_usStates := DATASET([ {'AL', (COUNT(NCMEC(missingstate = 'AL')) * (CAPop / 5074296))},
{'AK', (COUNT(NCMEC(missingstate = 'AK')) * (CAPop / 	733583))},
{'AZ', (COUNT(NCMEC(missingstate = 'AZ')) * (CAPop / 	7359197))},
{'AR', (COUNT(NCMEC(missingstate = 'AR')) * (CAPop /    3045637))},
{'CA', (COUNT(NCMEC(missingstate = 'CA')) * (CAPop / 	39029342))},
{'CO', (COUNT(NCMEC(missingstate = 'CO')) * (CAPop / 	5839926))},
{'CT', (COUNT(NCMEC(missingstate = 'CT')) * (CAPop / 	3626205))},
{'DE', (COUNT(NCMEC(missingstate = 'DE')) * (CAPop / 	1018396))},
{'FL', (COUNT(NCMEC(missingstate = 'FL')) * (CAPop / 	22244823))},
{'GA', (COUNT(NCMEC(missingstate = 'GA')) * (CAPop /	10912876))},
{'HI', (COUNT(NCMEC(missingstate = 'HI')) * (CAPop / 	1440196))},
{'ID', (COUNT(NCMEC(missingstate = 'ID')) * (CAPop / 	1939033))},
{'IL', (COUNT(NCMEC(missingstate = 'IL')) * (CAPop / 	12582032))},
{'IN', (COUNT(NCMEC(missingstate = 'IN')) * (CAPop / 	6833037))},
{'IA', (COUNT(NCMEC(missingstate = 'IA')) * (CAPop / 	3200517))},
{'KS', (COUNT(NCMEC(missingstate = 'KS')) * (CAPop / 	2937150))},
{'KY', (COUNT(NCMEC(missingstate = 'KY')) * (CAPop /    4512310))},
{'LA', (COUNT(NCMEC(missingstate = 'LA')) * (CAPop / 	4590241))},
{'ME', (COUNT(NCMEC(missingstate = 'ME')) * (CAPop / 	1385340))},
{'MD', (COUNT(NCMEC(missingstate = 'MD')) * (CAPop / 	6164660))},
{'MA', (COUNT(NCMEC(missingstate = 'MA')) * (CAPop / 	6981974))},
{'MI', (COUNT(NCMEC(missingstate = 'MI')) * (CAPop / 	10034113))},
{'MN', (COUNT(NCMEC(missingstate = 'MN')) * (CAPop / 	5717184))},
{'MS', (COUNT(NCMEC(missingstate = 'MS')) * (CAPop /    2940057))},
{'MO', (COUNT(NCMEC(missingstate = 'MO')) * (CAPop /    6177957))},
{'MT', (COUNT(NCMEC(missingstate = 'MT')) * (CAPop /    1122867))},
{'NE', (COUNT(NCMEC(missingstate = 'NE')) * (CAPop /    1967923))},
{'NV', (COUNT(NCMEC(missingstate = 'NV')) * (CAPop /    3177772))},
{'NH', (COUNT(NCMEC(missingstate = 'NH')) * (CAPop / 	1395231))},
{'NJ', (COUNT(NCMEC(missingstate = 'NJ')) * (CAPop / 	9261699))},
{'NM', (COUNT(NCMEC(missingstate = 'NM')) * (CAPop / 	2113344))},
{'NY', (COUNT(NCMEC(missingstate = 'NY')) * (CAPop / 	19677151))},
{'NC', (COUNT(NCMEC(missingstate = 'NC')) * (CAPop / 	10698973))},
{'ND', (COUNT(NCMEC(missingstate = 'ND')) * (CAPop / 	779261))},
{'OH', (COUNT(NCMEC(missingstate = 'OH')) * (CAPop / 	11756058))},
{'OK', (COUNT(NCMEC(missingstate = 'OK')) * (CAPop / 	4019800))},
{'OR', (COUNT(NCMEC(missingstate = 'OR')) * (CAPop / 	4240137))},
{'PA', (COUNT(NCMEC(missingstate = 'PA')) * (CAPop / 	12972008))},
{'RI', (COUNT(NCMEC(missingstate = 'RI')) * (CAPop /    1093734))},
{'SC', (COUNT(NCMEC(missingstate = 'SC')) * (CAPop / 	5282634))},
{'SD', (COUNT(NCMEC(missingstate = 'SD')) * (CAPop / 	909824))},
{'TN', (COUNT(NCMEC(missingstate = 'TN')) * (CAPop / 	7051339))},
{'TX', (COUNT(NCMEC(missingstate = 'TX')) * (CAPop / 	30029572))},
{'UT', (COUNT(NCMEC(missingstate = 'UT')) * (CAPop / 	3380800))},
{'VT', (COUNT(NCMEC(missingstate = 'VT')) * (CAPop /    647064))},
{'VA', (COUNT(NCMEC(missingstate = 'VA')) * (CAPop / 	8683619))},
{'WA', (COUNT(NCMEC(missingstate = 'WA')) * (CAPop / 	7785786))},
{'WV', (COUNT(NCMEC(missingstate = 'WV')) * (CAPop / 	1775156))},
{'WI', (COUNT(NCMEC(missingstate = 'WI')) * (CAPop /    5892539))},
{'WY', (COUNT(NCMEC(missingstate = 'WY')) * (CAPop / 	581381))}],
{STRING State, DECIMAL weight});
data_usStates := OUTPUT(_usStates, NAMED('choro_usStates'));
data_usStates;
viz_usstates := Visualizer.Choropleth.USStates('usStates',, 'choro_usStates');
viz_usstates; 




// Police stations per state
policeStations := DATASET([ {'AL', COUNT(HMK.PoliceDS(state = 'AL'))},
{'AK', COUNT(HMK.PoliceDS(state = 'AK'))},
{'AZ', COUNT(HMK.PoliceDS(state = 'AZ'))},
{'AR', COUNT(HMK.PoliceDS(state = 'AR'))},
{'AS', COUNT(HMK.PoliceDS(state = 'AS'))},
{'CA', COUNT(HMK.PoliceDS(state = 'CA'))},
{'CO', COUNT(HMK.PoliceDS(state = 'CO'))},
{'CT', COUNT(HMK.PoliceDS(state = 'CT'))},
{'DE', COUNT(HMK.PoliceDS(state = 'DE'))},
{'FL', COUNT(HMK.PoliceDS(state = 'FL'))},
{'GA', COUNT(HMK.PoliceDS(state = 'GA'))},
{'HI', COUNT(HMK.PoliceDS(state = 'HI'))},
{'ID', COUNT(HMK.PoliceDS(state = 'ID'))},
{'IL', COUNT(HMK.PoliceDS(state = 'IL'))},
{'IN', COUNT(HMK.PoliceDS(state = 'IN'))},
{'IA', COUNT(HMK.PoliceDS(state = 'IA'))},
{'KS', COUNT(HMK.PoliceDS(state = 'KS'))},
{'KY', COUNT(HMK.PoliceDS(state = 'KY'))},
{'LA', COUNT(HMK.PoliceDS(state = 'LA'))},
{'ME', COUNT(HMK.PoliceDS(state = 'ME'))},
{'MD', COUNT(HMK.PoliceDS(state = 'MD'))},
{'MA', COUNT(HMK.PoliceDS(state = 'MA'))},
{'MI', COUNT(HMK.PoliceDS(state = 'MI'))},
{'MN', COUNT(HMK.PoliceDS(state = 'MN'))},
{'MS', COUNT(HMK.PoliceDS(state = 'MS'))},
{'MO', COUNT(HMK.PoliceDS(state = 'MO'))},
{'MT', COUNT(HMK.PoliceDS(state = 'MT'))},
{'NE', COUNT(HMK.PoliceDS(state = 'NE'))},
{'NV', COUNT(HMK.PoliceDS(state = 'NV'))},
{'NH', COUNT(HMK.PoliceDS(state = 'NH'))},
{'NJ', COUNT(HMK.PoliceDS(state = 'NJ'))},
{'NM', COUNT(HMK.PoliceDS(state = 'NM'))},
{'NY', COUNT(HMK.PoliceDS(state = 'NY'))},
{'NC', COUNT(HMK.PoliceDS(state = 'NC'))},
{'ND', COUNT(HMK.PoliceDS(state = 'ND'))},
{'OH', COUNT(HMK.PoliceDS(state = 'OH'))},
{'OK', COUNT(HMK.PoliceDS(state = 'OK'))},
{'OR', COUNT(HMK.PoliceDS(state = 'OR'))},
{'PA', COUNT(HMK.PoliceDS(state = 'PA'))},
{'RI', COUNT(HMK.PoliceDS(state = 'RI'))},
{'SC', COUNT(HMK.PoliceDS(state = 'SC'))},
{'SD', COUNT(HMK.PoliceDS(state = 'SD'))},
{'TN', COUNT(HMK.PoliceDS(state = 'TN'))},
{'TX', COUNT(HMK.PoliceDS(state = 'TX'))},
{'UT', COUNT(HMK.PoliceDS(state = 'UT'))},
{'VT', COUNT(HMK.PoliceDS(state = 'VT'))},
{'VA', COUNT(HMK.PoliceDS(state = 'VA'))},
{'WA', COUNT(HMK.PoliceDS(state = 'WA'))},
{'WV', COUNT(HMK.PoliceDS(state = 'WV'))},
{'WI', COUNT(HMK.PoliceDS(state = 'WI'))},
{'WY', COUNT(HMK.PoliceDS(state = 'WY'))}],
{STRING State, INTEGER4 weight});
data_policeStations := OUTPUT(policeStations, NAMED('choro_policeStations'));
data_policeStations;
viz_policeStations := Visualizer.Choropleth.USStates('policeStations',, 'choro_policeStations');
viz_policeStations;


// Fire stations per state
fireStations := DATASET([ {'AL', COUNT(HMK.FireDS(state = 'AL'))},
{'AK', COUNT(HMK.FireDS(state = 'AK'))},
{'AZ', COUNT(HMK.FireDS(state = 'AZ'))},
{'AR', COUNT(HMK.FireDS(state = 'AR'))},
{'AS', COUNT(HMK.FireDS(state = 'AS'))},
{'CA', COUNT(HMK.FireDS(state = 'CA'))},
{'CO', COUNT(HMK.FireDS(state = 'CO'))},
{'CT', COUNT(HMK.FireDS(state = 'CT'))},
{'DE', COUNT(HMK.FireDS(state = 'DE'))},
{'FL', COUNT(HMK.FireDS(state = 'FL'))},
{'GA', COUNT(HMK.FireDS(state = 'GA'))},
{'HI', COUNT(HMK.FireDS(state = 'HI'))},
{'ID', COUNT(HMK.FireDS(state = 'ID'))},
{'IL', COUNT(HMK.FireDS(state = 'IL'))},
{'IN', COUNT(HMK.FireDS(state = 'IN'))},
{'IA', COUNT(HMK.FireDS(state = 'IA'))},
{'KS', COUNT(HMK.FireDS(state = 'KS'))},
{'KY', COUNT(HMK.FireDS(state = 'KY'))},
{'LA', COUNT(HMK.FireDS(state = 'LA'))},
{'ME', COUNT(HMK.FireDS(state = 'ME'))},
{'MD', COUNT(HMK.FireDS(state = 'MD'))},
{'MA', COUNT(HMK.FireDS(state = 'MA'))},
{'MI', COUNT(HMK.FireDS(state = 'MI'))},
{'MN', COUNT(HMK.FireDS(state = 'MN'))},
{'MS', COUNT(HMK.FireDS(state = 'MS'))},
{'MO', COUNT(HMK.FireDS(state = 'MO'))},
{'MT', COUNT(HMK.FireDS(state = 'MT'))},
{'NE', COUNT(HMK.FireDS(state = 'NE'))},
{'NV', COUNT(HMK.FireDS(state = 'NV'))},
{'NH', COUNT(HMK.FireDS(state = 'NH'))},
{'NJ', COUNT(HMK.FireDS(state = 'NJ'))},
{'NM', COUNT(HMK.FireDS(state = 'NM'))},
{'NY', COUNT(HMK.FireDS(state = 'NY'))},
{'NC', COUNT(HMK.FireDS(state = 'NC'))},
{'ND', COUNT(HMK.FireDS(state = 'ND'))},
{'OH', COUNT(HMK.FireDS(state = 'OH'))},
{'OK', COUNT(HMK.FireDS(state = 'OK'))},
{'OR', COUNT(HMK.FireDS(state = 'OR'))},
{'PA', COUNT(HMK.FireDS(state = 'PA'))},
{'RI', COUNT(HMK.FireDS(state = 'RI'))},
{'SC', COUNT(HMK.FireDS(state = 'SC'))},
{'SD', COUNT(HMK.FireDS(state = 'SD'))},
{'TN', COUNT(HMK.FireDS(state = 'TN'))},
{'TX', COUNT(HMK.FireDS(state = 'TX'))},
{'UT', COUNT(HMK.FireDS(state = 'UT'))},
{'VT', COUNT(HMK.FireDS(state = 'VT'))},
{'VA', COUNT(HMK.FireDS(state = 'VA'))},
{'WA', COUNT(HMK.FireDS(state = 'WA'))},
{'WV', COUNT(HMK.FireDS(state = 'WV'))},
{'WI', COUNT(HMK.FireDS(state = 'WI'))},
{'WY', COUNT(HMK.FireDS(state = 'WY'))}],
{STRING State, INTEGER4 weight});
data_fireStations := OUTPUT(fireStations, NAMED('choro_fireStations'));
data_fireStations;
viz_fireStations := Visualizer.Choropleth.USStates('fireStations',, 'choro_fireStations');
viz_fireStations;

//Mental Health of each state in 2022 correlated with missing children
popHealth := JOIN(_usStates, youthmentalhealthDS, LEFT.state=RIGHT.state);
OUTPUT(popHealth, NAMED('popMentalHealth'));
mentalHealthCorrelation := Correlation(popHealth, weight, percentage);

//Teen pregnancy rates of each state in 2021 correlated with missing children
Pregnancy := teen_pregnancyDS(year = '2021');
Pregnancy2 := TABLE(Pregnancy, {state, rate});

popPregnancy := JOIN(_usStates, Pregnancy2, LEFT.state=RIGHT.state);
OUTPUT(popPregnancy, NAMED('popPregnancy'));
pregnancyCorrelation := Correlation(popPregnancy, weight, rate);

//Education with less than than a high school diploma from 2017-2021 correlated with missing children 
Education := HMK.EducationDS(attribute = 'Percent of adults with less than a high school diploma, 2017-21' AND fips_code % 1000 = 0);
Education2 := TABLE(Education, {state, value});

popEducation := JOIN(_usStates, Education2, LEFT.state=RIGHT.state);
OUTPUT(popEducation, NAMED('popEducation'));
educationCorrelation := Correlation(popEducation, weight, value);

//Overall poverty for each state in 2021 correlated with missing children
Poverty := HMK.pov_estimatesDS(attribute = 'POVALL_2021' AND fips_code % 1000 = 0);
Poverty2 := TABLE(Poverty, {state, value});

popPoverty := JOIN(_usStates, Poverty2, LEFT.state=RIGHT.state);
OUTPUT(popPoverty, NAMED('popPoverty'));
povertyCorrelation := Correlation(popPoverty, weight, value);

Correlations := DATASET([{'MentalHealth_Population', mentalHealthCorrelation},
                {'TeenPregnancy_Population', pregnancyCorrelation},
                {'EducationLevel_Population', educationCorrelation},
                {'OverallPoverty_Population', povertyCorrelation} ], 
                {STRING Correlation, DECIMAL Value});

OUTPUT(Correlations, NAMED('Correlations'));
