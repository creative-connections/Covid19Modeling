within Covid19_modeling.interfaces;
model ModelSettings "contain all model parameters"

  constant Modelica.SIunits.Time day=86400;
  //sec in day

  type Severity = enumeration(
      Asymptomatic,
      Mild,
      Moderate,
      Severe);

  parameter Real quarantineDuration_in_days=14 "Duration – How long the change to behavior will last. 
    This is in days and by default is 14 (two weeks) though that is a very 
    short time given the nature of this virus.";

  parameter Real quarantineStartDay_in_days=60 "Start – The time when an action is taken to dramatically decrease 
    interactions and virus spreading. Including canceling of public events, 
    closing of schools, cleaning of common areas, restricting movement 
    and changing work practices.";

  parameter Physiolibrary.Types.Fraction quarantineEffectiveness=0.1
  "Effectiveness – The extent to which contact and transmission is reduced 
   relative to business as usual. A value of 0 (the default) means nobody 
   changes behavior or reduces contacts. A value of 1 means perfect quarantine, 
   or effective no contact. This change begins at the start of the intervention 
   and persists during the duration of the intervention. After the end of 
   the intervention, life returns to normal.
   ";

  parameter Physiolibrary.Types.Fraction testedAdjustment=0.01
  "The adjustment to contacts that people who have tested positive to COVID-19 
    make. A value of 0.01 means that interactions are cut to a hundredth.
    ";

  parameter Physiolibrary.Types.Fraction midlySymptomaticAdjustment=0.5
  "The adjustment to contacts that mildly symptomatic people make.
    A value of 0.5 means contacts are cut in half.
    ";

  parameter Physiolibrary.Types.Fraction symptomaticAdjustment=0.05
  "The adjustment to contacts that symptomatic people make. 
    A value of 0.05 means contacts are cut to a 20th of what they were.";

  parameter Real baselineContactRate_person_per_day=1
  "The number of unique individuals that a person runs into each day, 
    averaged across the entire population.
    ";

  parameter Physiolibrary.Types.Fraction infectivity=0.4
  "The probability that the COV-19 will pass from one person to another when
 a contact occurs. This again is not well understood, but the dramatic rates
 of expansion when no actions are taken to mitigate transmission do suggest 
 it is high.
 ";

  parameter Physiolibrary.Types.Fraction severitySpread[Severity]={0.1,0.3,0.4,0.2}
    "This lets you set the distribution of severity. 
    [1] Asymptomatic has no symptoms at all (Typhoid Mary). 
    [2] Mild - The mild severity is with limited symptoms, perhaps like a cold. 
    There are no deaths associated with the first two groups. 
    [3] Moderate - is with noticeable symptoms, similar to a bad flu, 
    but not requiring hospitalization. A small fraction of the moderate group 
    may die as result of the sickness. 
    [4] Severe - the severe category requires hospitalization. There is a significant 
    chance of dying for those in this group this group. 
    Each group is entered when the infection occurs, there is no progression 
    from one group to another.";

/*    
  parameter Real durationInfectedNotContagious_in_days=2
  "After first being infected, an individual will have the virus in their system 
 (and is presumed to test positive for it) but will not be shedding the virus 
 (passing to others). Like all the durations, this is still an uncertain number, 
 but is probably less than 5 and may very well be 0.
 ";
*/

  parameter Real dailyTestingCapacity = 100
  "Testing capacity – This is the number of tests that can run every day. 
  You can set it to any value, though in reality it would be necessary 
  to create sufficient capacity.
  ";

  parameter Real dailyTargetSymptomaticTestRate = 0.1
  "Target symptomatic test rate – This is the number of tests per day 
  that each sick person receives.";

  parameter Physiolibrary.Types.Fraction mildTestFraction = 0.25
  "fraction of testing of mild patient population (without significant symptoms)
  ";

  parameter Physiolibrary.Types.Fraction contactTestedPerPositiveTest=1
  "The average number of asymptomatic contacts tested per one positive test";

  parameter Physiolibrary.Types.Fraction contactTracingEffectivnetess=0.1
  "When someone tests positive for COVID-19, people that person has been in contact
  with may also be tested. This effectiveness says how likely the people identified
  are in fact going to test positive. This testing only occurs if there is sufficient
  test capacity after symptomatic testing
  ";

  parameter Modelica.SIunits.Time delayInfectedNotContagious[Severity](displayUnit="d")=
       {172800,172800,172800,172800}
  "After first being infected, an individual will have the virus in their system 
  (and is presumed to test positive for it) but will not be shedding the virus 
  (passing to others). Like all the durations, this is still an uncertain number,
  but is probably less than 5 and may very well be 0.
  Delay is set for various form of the disease: 
  {asymptomatic, mild, moderate, severe}
  ";
                                     //{2, 2, 2, 2} days

  parameter Modelica.SIunits.Time delayAsymptomaticContagious[Severity](displayUnit="d")=
       {345600,345600,345600,345600}
  "After being infected, there may be a period of time during which an individual
  is contagious, but shows no symptoms. There does not seem to be any consensus
  of how long this is, with estimates ranging from 2 to a as many as 14 days.
  Delay is set for various form of the disease: 
  {asymptomatic, mild, moderate, severe}
  ";
                                     //{4, 4, 4, 4} days

  parameter Modelica.SIunits.Time delaySymptomaticContagious[Severity](displayUnit="d")=
       {604800,604800,864000,1209600}
  "The COVID-19 disease progression is relatively slow. This length of time
  Symptomatic and Contagious increases with severity. To pick a different
  severity select from the drop-down. By default these are 7,7,10, 14.
  Delay is set for various form of the disease: 
  {asymptomatic, mild, moderate, severe}
  ";
                                      //{7, 7, 10, 10} days

  parameter Modelica.SIunits.Time delaySymptomaticNoLongerContagious[4](
      displayUnit="d") = {432000,432000,432000,432000}
  "Viral shedding can stop before symptoms disappear. There is some evidence 
  that the course of COVID-19 results in significant autoimmune damage after 
  the virus has been controlled. But again there is no clear consensus on if 
  or how long this is. There is better agreement on the sum of time spent in 
  the two symptomatic phases.Delay is set for various form of the disease: 
  {asymptomatic, mild, moderate, severe}.
  ";                        //{5, 5, 5, 5} days

  parameter Modelica.SIunits.Time discreetStep = day/10;

  parameter Integer numberOfSlotsInfectedNotContagious[4]=
  {    integer(delayInfectedNotContagious[1]/discreetStep),
       integer(delayInfectedNotContagious[2]/discreetStep),
       integer(delayInfectedNotContagious[3]/discreetStep),
       integer(delayInfectedNotContagious[4]/discreetStep)};

    parameter Integer numberOfSlotsAsymptomaticContagious[4]=
  {    integer(delayAsymptomaticContagious[1]/discreetStep),
       integer(delayAsymptomaticContagious[2]/discreetStep),
       integer(delayAsymptomaticContagious[3]/discreetStep),
       integer(delayAsymptomaticContagious[4]/discreetStep)};

    parameter Integer numberOfSlotsSymptomaticNoLongerContagious[4]=
  {    integer(delaySymptomaticNoLongerContagious[1]/discreetStep),
       integer(delaySymptomaticNoLongerContagious[2]/discreetStep),
       integer(delaySymptomaticNoLongerContagious[3]/discreetStep),
       integer(delaySymptomaticNoLongerContagious[4]/discreetStep)};

    parameter Integer numberOfSlotsSymptomaticContagious[4]=
  {    integer(delaySymptomaticContagious[1]/discreetStep),
       integer(delaySymptomaticContagious[2]/discreetStep),
       integer(delaySymptomaticContagious[3]/discreetStep),
       integer(delaySymptomaticContagious[4]/discreetStep)};

  parameter Physiolibrary.Types.Fraction crudeDeathRate[Severity] = {0,0,0.001,0.15}
  "Crude death rate for patients related to the group of disease
  Crude death rate is set for various form of the disease: 
  {asymptomatic, mild, moderate, severe}";

  parameter Modelica.SIunits.Time infectedNotContagiousTimeOfArrival[4]( displayUnit="d") = {0,0,0,0}
  "infected not contagious arriving - time of arrival
  with various form of the disease: {asymptomatic, mild, moderate, severe}";

  parameter Modelica.SIunits.Time asymptomaticContagiousTimeOfArrival[4]( displayUnit="d") = {0,0,0,0}
  "infected asymptomatic contagious arriving - time of arrival 
  with various form of the disease: {asymptomatic, mild, moderate, severe}";

  parameter Modelica.SIunits.Time symptomaticContagiousTimeOfArrival[4]( displayUnit="d") = {0,0,0,0}
  "infected symptomatic contagious arriving - time of arrival
   with various form of the disease: {asymptomatic, mild, moderate, severe}";

  parameter Physiolibrary.Types.Population infectedNotContagioustNumberOfArrivingPersons[4]= {1,0,0,0}
    "infected not contagious arriving - number of arriving persons 
    with various form of the disease: {asymptomatic, mild, moderate, severe}";

  parameter Physiolibrary.Types.Population asymptomaticContagiousNumberOfArrivingPersons[4]= {0,0,0,0}
    "asymptomatic contagiou arriving - number of arriving persons 
    with various form of the disease: {asymptomatic, mild, moderate, severe}";

  parameter Physiolibrary.Types.Population symptomaticContagiousNumberOfArrivingPersons[4]= {0,0,0,0}
    "symptomatic contagious arriving - number of arriving persons 
    with various form of the disease: {asymptomatic, mild, moderate, severe}";

  Physiolibrary.Types.Fraction targetSymptomaticTestRate=
      dailyTargetSymptomaticTestRate/day;

  Physiolibrary.Types.PopulationChange testingCapacity=
      dailyTestingCapacity/day;

  Modelica.SIunits.Time quarantineDuration=quarantineDuration_in_days*day;

  Modelica.SIunits.Time quarantineStartDay=quarantineStartDay_in_days*day;

  Physiolibrary.Types.PopulationChange baselineContactRate=
      baselineContactRate_person_per_day/day;

equation

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Polygon(
          points={{80,100},{40,100},{40,98},{40,60},{-60,-40},{-100,-40},{-100,-80},
              {-80,-60},{-60,-80},{-80,-100},{-40,-100},{-40,-60},{60,40},{100,40},
              {100,80},{80,60},{60,80},{80,100}},
          lineColor={0,0,0},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid), Polygon(
          points={{-80,100},{-40,100},{-40,98},{-40,60},{60,-40},{100,-40},{100,
              -80},{80,-60},{60,-80},{80,-100},{40,-100},{40,-60},{-60,40},{-100,
              40},{-100,80},{-80,60},{-60,80},{-80,100}},
          lineColor={0,0,0},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-244,-104},{240,-122}},
          lineColor={28,108,200},
          textString="%name")}),            Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end ModelSettings;
