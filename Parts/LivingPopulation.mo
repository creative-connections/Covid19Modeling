within Covid19_modeling.Parts;
model LivingPopulation
  extends Physiolibrary.Icons.Population;
  Physiolibrary.Types.RealIO.PopulationInput populationAtRisk annotation (
      Placement(transformation(extent={{-68,-92},{-36,-60}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-93,109})));
  Physiolibrary.Types.RealIO.PopulationInput infectedNotContagiousUntested[4]
    annotation (Placement(transformation(extent={{-52,-60},{-20,-28}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-73,109})));
  Physiolibrary.Types.RealIO.PopulationInput infectedNotContagiousTested[4]
    annotation (Placement(transformation(extent={{-26,-10},{2,18}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-53,109})));
  Physiolibrary.Types.RealIO.PopulationInput asymptomaticContagiousUntested[4]
    annotation (Placement(transformation(extent={{-14,40},{18,72}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-33,109})));
  Physiolibrary.Types.RealIO.PopulationInput asymptomaticContagiousTested[4]
    annotation (Placement(transformation(extent={{-126,-80},{-86,-40}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={-13,109})));
  Physiolibrary.Types.RealIO.PopulationInput symptomaticContagiousUntested[4]
    annotation (Placement(transformation(extent={{-126,-18},{-86,22}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={7,109})));
  Physiolibrary.Types.RealIO.PopulationInput symptomaticContagiousTested[4]
    annotation (Placement(transformation(extent={{-126,46},{-86,86}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={27,109})));
  Physiolibrary.Types.RealIO.PopulationInput symptomaticNotContagiousUntested[4]
    annotation (Placement(transformation(extent={{-6,102},{34,142}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={47,109})));
  Physiolibrary.Types.RealIO.PopulationInput symptomaticNotContagiousTested[4]
    annotation (Placement(transformation(extent={{-82,116},{-42,156}}),
        iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={67,109})));
  Physiolibrary.Types.RealIO.PopulationInput recovered annotation (Placement(
        transformation(extent={{-144,102},{-104,142}}), iconTransformation(
        extent={{-9,-9},{9,9}},
        rotation=270,
        origin={87,109})));
  Physiolibrary.Types.RealIO.PopulationOutput
    notTestedMildlySymptomaticContagiousPopulation
    "not tested mildly symptomatic contagious population" annotation (Placement(
        transformation(extent={{104,-84},{124,-64}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,90})));
  Physiolibrary.Types.RealIO.PopulationOutput
    notTestedSevereSymptomaticContagiousPopulation
    "not tested severe symptomatic contagious population" annotation (Placement(
        transformation(extent={{104,-54},{124,-34}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,68})));
  Physiolibrary.Types.RealIO.PopulationOutput
    notTestedModerateSymptomaticContagiousPopulation
    "not tested moderate symptomatic moderate contagious population"
    annotation (Placement(transformation(extent={{106,-10},{126,10}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,48})));
  Physiolibrary.Types.RealIO.PopulationOutput
    notTestedAsymptomaticContagiousPopulation
    "not tested asymptomacic contagious population" annotation (Placement(
        transformation(extent={{104,18},{124,38}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,28})));
  Physiolibrary.Types.RealIO.PopulationOutput testedContagiousPopulation
    "tested asymptomatic and syptomatic contagious population" annotation (
      Placement(transformation(extent={{102,52},{122,72}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,8})));
  Physiolibrary.Types.RealIO.PopulationOutput totalLivingPopulation
    "total living (tested+untested) population" annotation (Placement(
        transformation(extent={{102,52},{122,72}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-12})));

  Physiolibrary.Types.RealIO.PopulationOutput untestedAsymptomatic
    "all untested asymptomatic population - the first two phases of the disease and of the other two phases only asymptomatic"
                                            annotation (Placement(
        transformation(extent={{102,52},{122,72}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-32})));
  Physiolibrary.Types.RealIO.PopulationOutput untestedMildlySymptomatic
    "mildly symptomatic untested population" annotation (Placement(
        transformation(extent={{102,52},{122,72}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-52})));
  Physiolibrary.Types.RealIO.PopulationOutput untestedModerateAndSevereSymtpomatic
    "untested realy sick symptomatic patients - moderate and severe" annotation (Placement(
        transformation(extent={{102,52},{122,72}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-72})));

Physiolibrary.Types.Population sickPopulation;

Physiolibrary.Types.Population asymptomaticPatients
  "number of asymptomatic patients during the symptomatic phase of the disease";

  Physiolibrary.Types.RealIO.PopulationOutput needingHospitalisation
    "servere sick symptomatic patient" annotation (Placement(transformation(
          extent={{102,52},{122,72}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-90,-110})));
  Physiolibrary.Types.RealIO.PopulationOutput tooIllToWork
    "realy sick symptomatic patients - moderate and severe" annotation (
      Placement(transformation(extent={{102,52},{122,72}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-110})));
equation
  notTestedMildlySymptomaticContagiousPopulation =
    symptomaticContagiousUntested[Severity.Mild];

  notTestedSevereSymptomaticContagiousPopulation =
    symptomaticContagiousUntested[Severity.Severe];

  notTestedModerateSymptomaticContagiousPopulation =
    symptomaticContagiousUntested[Severity.Moderate];

  notTestedAsymptomaticContagiousPopulation =
    asymptomaticContagiousUntested[Severity.Asymptomatic]
    + asymptomaticContagiousUntested[Severity.Mild]
    + asymptomaticContagiousUntested[Severity.Moderate]
    + asymptomaticContagiousUntested[Severity.Severe];
           //all not tested asymptomatic but contagious population

  testedContagiousPopulation =
    symptomaticContagiousTested[Severity.Asymptomatic]
    + symptomaticContagiousTested[Severity.Mild]
    + symptomaticContagiousTested[Severity.Moderate]
    + symptomaticContagiousTested[Severity.Severe]
    + asymptomaticContagiousTested[Severity.Asymptomatic]
    + asymptomaticContagiousTested[Severity.Mild]
    + asymptomaticContagiousTested[Severity.Moderate]
    + asymptomaticContagiousTested[Severity.Severe];
          //all tested contagious population

  totalLivingPopulation =
      testedContagiousPopulation
    + symptomaticContagiousUntested[Severity.Asymptomatic]
    + symptomaticContagiousUntested[Severity.Mild]
    + symptomaticContagiousUntested[Severity.Moderate]
    + symptomaticContagiousUntested[Severity.Severe]
    + asymptomaticContagiousUntested[Severity.Asymptomatic]
    + asymptomaticContagiousUntested[Severity.Mild]
    + asymptomaticContagiousUntested[Severity.Moderate]
    + asymptomaticContagiousUntested[Severity.Severe]
    + symptomaticNotContagiousUntested[Severity.Asymptomatic]
    + symptomaticNotContagiousUntested[Severity.Mild]
    + symptomaticNotContagiousUntested[Severity.Moderate]
    + symptomaticNotContagiousUntested[Severity.Severe]
    + symptomaticNotContagiousTested[Severity.Asymptomatic]
    + symptomaticNotContagiousTested[Severity.Mild]
    + symptomaticNotContagiousTested[Severity.Moderate]
    + symptomaticNotContagiousTested[Severity.Severe]
    + infectedNotContagiousUntested[Severity.Asymptomatic]
    + infectedNotContagiousUntested[Severity.Mild]
    + infectedNotContagiousUntested[Severity.Moderate]
    + infectedNotContagiousUntested[Severity.Severe]
    + infectedNotContagiousTested[Severity.Asymptomatic]
    + infectedNotContagiousTested[Severity.Mild]
    + infectedNotContagiousTested[Severity.Moderate]
    + infectedNotContagiousTested[Severity.Severe]
    +  populationAtRisk + recovered;
                       //total living population

  untestedAsymptomatic =
      infectedNotContagiousUntested[Severity.Asymptomatic]
    + infectedNotContagiousUntested[Severity.Mild]
    + infectedNotContagiousUntested[Severity.Moderate]
    + infectedNotContagiousUntested[Severity.Severe]
    + asymptomaticContagiousUntested[Severity.Asymptomatic]
    + asymptomaticContagiousUntested[Severity.Mild]
    + asymptomaticContagiousUntested[Severity.Moderate]
    + asymptomaticContagiousUntested[Severity.Severe]
    + symptomaticContagiousTested[Severity.Asymptomatic]
    + symptomaticNotContagiousTested[Severity.Asymptomatic];
                          //all untested asymptomatic population

  untestedMildlySymptomatic =
    + symptomaticContagiousUntested[Severity.Mild]
    + symptomaticNotContagiousUntested[Severity.Mild];
                         //mildly symptomatic untested

  untestedModerateAndSevereSymtpomatic =
    + symptomaticContagiousUntested[Severity.Moderate]
    + symptomaticContagiousUntested[Severity.Severe]
    + symptomaticNotContagiousTested[Severity.Moderate]
    + symptomaticNotContagiousTested[Severity.Severe];
                        //untested realy sick symptomatic patients

  sickPopulation =  infectedNotContagiousUntested[1]+
                    infectedNotContagiousUntested[2]+
                    infectedNotContagiousUntested[3]+
                    infectedNotContagiousUntested[4]+
                    infectedNotContagiousTested[1]+
                    infectedNotContagiousTested[2]+
                    infectedNotContagiousTested[3]+
                    infectedNotContagiousTested[4]+
                    asymptomaticContagiousUntested[1]+
                    asymptomaticContagiousUntested[2]+
                    asymptomaticContagiousUntested[3]+
                    asymptomaticContagiousUntested[4]+
                    asymptomaticContagiousTested[1]+
                    asymptomaticContagiousTested[2]+
                    asymptomaticContagiousTested[3]+
                    asymptomaticContagiousTested[4]+
                    symptomaticContagiousUntested[1]+
                    symptomaticContagiousUntested[2]+
                    symptomaticContagiousUntested[3]+
                    symptomaticContagiousUntested[4]+
                    symptomaticContagiousTested[1]+
                    symptomaticContagiousTested[2]+
                    symptomaticContagiousTested[3]+
                    symptomaticContagiousTested[4]+
                    symptomaticNotContagiousUntested[1]+
                    symptomaticNotContagiousUntested[2]+
                    symptomaticNotContagiousUntested[3]+
                    symptomaticNotContagiousUntested[4]+
                    symptomaticNotContagiousTested[1]+
                    symptomaticNotContagiousTested[2]+
                    symptomaticNotContagiousTested[3]+
                    symptomaticNotContagiousTested[4];

      // cimrmansMiners =  sickPopulation+populationAtRisk + recovered- totalLivingPopulation;

    //needing hospitalisatuion - all symptomatic patient with severe severity
    needingHospitalisation = symptomaticContagiousUntested[4]+
                             symptomaticContagiousTested[4]+
                             symptomaticNotContagiousUntested[4]+
                             symptomaticNotContagiousTested[4];

   //realy sick symptomatic patients - moderate and severe
   tooIllToWork = symptomaticContagiousUntested[3]+
                  symptomaticContagiousTested[3]+
                  symptomaticNotContagiousUntested[3]+
                   symptomaticNotContagiousTested[3]
                   +needingHospitalisation;

   //asymptomatic patients - number of asymptomatic patients during
   //                        the symptomatic phase of the disease
  asymptomaticPatients =  symptomaticContagiousUntested[1]+
                             symptomaticContagiousTested[1]+
                             symptomaticNotContagiousUntested[1]+
                             symptomaticNotContagiousTested[1];

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={Text(
          extent={{-256,-104},{264,-136}},
          lineColor={0,0,0},
          fillColor={208,253,255},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LivingPopulation;
