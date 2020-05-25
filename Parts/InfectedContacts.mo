within Covid19Modeling.Parts;
model InfectedContacts
  Physiolibrary.Types.RealIO.PopulationChangeOutput contacts annotation (
      Placement(transformation(extent={{-34,-90},{-14,-70}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));

  Physiolibrary.Types.RealIO.PopulationInput testedContagiousPopulation
    "tested asymptomatic and syptomatic contagious population" annotation (
      Placement(transformation(extent={{-72,-62},{-44,-34}}),
        iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=180,
        origin={114,-46})));
  Physiolibrary.Types.RealIO.PopulationInput
    notTestedModerateSymptomaticContagiousPopulation
    "not tested moderate symptomatic moderate contagious population"
    annotation (Placement(transformation(extent={{-74,-22},{-50,2}}),
        iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=180,
        origin={114,8})));
  Physiolibrary.Types.RealIO.PopulationInput
    notTestedMildlySymptomaticContagiousPopulation
    "not tested mildly symptomatic contagious population" annotation (Placement(
        transformation(extent={{-84,-90},{-56,-62}}),
                                                    iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=180,
        origin={114,64})));
  Physiolibrary.Types.RealIO.PopulationInput
    notTestedSevereSymptomaticContagiousPopulation
    "not tested msevere symptomatic contagious population" annotation (
      Placement(transformation(extent={{-84,0},{-52,32}}),iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=180,
        origin={114,36})));
  Physiolibrary.Types.RealIO.PopulationInput
    notTestedAsymptomaticContagiousPopulation
    "not tested asymptomacic contagious population" annotation (Placement(
        transformation(extent={{-68,34},{-42,60}}),  iconTransformation(
        extent={{-14,-14},{14,14}},
        rotation=180,
        origin={114,-18})));

  Physiolibrary.Types.PopulationChange globalContactRate;
  Physiolibrary.Types.PopulationChange symptomaticContactRate;
  Physiolibrary.Types.PopulationChange mildlySympomaticContactRate;
  Physiolibrary.Types.PopulationChange testedContactRate;

/*
  outer  parameter Modelica.SIunits.Time quarantineDuration
    "Duration – How long the change to behavior will last. 
    This is in days and by default is 14 (two weeks) though that is a very 
    short time given the nature of this virus.";

 outer parameter  Modelica.SIunits.Time quarantineStartDay
    "Start – The time when an action is taken to dramatically decrease 
    interactions and virus spreading. Including canceling of public events, 
    closing of schools, cleaning of common areas, restricting movement 
    and changing work practices.";

 outer parameter Physiolibrary.Types.Fraction quarantineEffectiveness
    "Effectiveness – The extent to which contact and transmission is reduced 
    relative to business as usual. A value of 0 (the default) means nobody 
    changes behavior or reduces contacts. A value of 1 means perfect quarantine, 
    or effective no contact. This change begins at the start of the intervention 
    and persists during the duration of the intervention. After the end of 
    the intervention, life returns to normal.";

 outer parameter Physiolibrary.Types.Fraction testedAdjustment
    "The adjustment to contacts that people who have tested positive to COVID-19 
    make. A value of 0.01 means that interactions are cut to a hundredth.";

 outer parameter Physiolibrary.Types.Fraction midlySymptomaticAdjustment
    "The adjustment to contacts that mildly symptomatic people make.
    A value of 0.5 means contacts are cut in half.";

 outer parameter Physiolibrary.Types.Fraction symptomaticAdjustment
    "The adjustment to contacts that symptomatic people make. 
    A value of 0.05 means contacts are cut to a 20th of what they were.";

 outer parameter Physiolibrary.Types.PopulationChange baselineContactRate
    "The number of unique individuals that a person runs into each day, 
    averaged across the entire population.";
*/
 outer interfaces.ModelSettings modelSettings
    annotation (Placement(transformation(extent={{-72,70},{-52,90}})));
equation

  if (time>modelSettings.quarantineStartDay) and (time<modelSettings.quarantineStartDay+modelSettings.quarantineDuration) then
     globalContactRate = modelSettings.baselineContactRate*(1-modelSettings.quarantineEffectiveness);
  else
     globalContactRate = modelSettings.baselineContactRate;
  end if;

  symptomaticContactRate = if (globalContactRate)<(modelSettings.baselineContactRate*modelSettings.symptomaticAdjustment)
                           then globalContactRate else modelSettings.baselineContactRate*modelSettings.symptomaticAdjustment;

  mildlySympomaticContactRate = if (globalContactRate)<(modelSettings.baselineContactRate*modelSettings.midlySymptomaticAdjustment)
                                then globalContactRate else modelSettings.baselineContactRate*modelSettings.midlySymptomaticAdjustment;

   testedContactRate = if (globalContactRate)<(modelSettings.baselineContactRate*modelSettings.testedAdjustment)
                       then globalContactRate else  modelSettings.baselineContactRate*modelSettings.testedAdjustment;

    contacts =  notTestedAsymptomaticContagiousPopulation*globalContactRate
              + notTestedMildlySymptomaticContagiousPopulation*mildlySympomaticContactRate
              + notTestedModerateSymptomaticContagiousPopulation*symptomaticContactRate
              + notTestedSevereSymptomaticContagiousPopulation*symptomaticContactRate
              + testedContagiousPopulation*testedContactRate;

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{32,-14},{90.0078,-14},{94.371,-14},{98,-14},{94,12},{88,
              30},{74,38},{52,38},{44,34},{38,26},{32,8},{30,-12},{32,-14}},
          lineColor={0,0,127},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{40,84},{90,36}},
          lineColor={0,0,127},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-168,-112},{170,-126}},
          lineColor={238,46,47},
          textString="%name"),
        Polygon(
          points={{-36,-42},{22.0078,-42},{26.3707,-42},{30,-42},{26,-16},{
              20,2},{6,10},{-16,10},{-24,6},{-30,-2},{-36,-20},{-38,-40},{
              -36,-42}},
          lineColor={0,0,127},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{-28,56},{22,8}},
          lineColor={0,0,127},
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-2,-92},{56.0078,-92},{60.3707,-92},{64,-92},{60,-66},{
              54,-48},{40,-40},{18,-40},{10,-44},{4,-52},{-2,-70},{-4,-90},
              {-2,-92}},
          lineColor={0,0,127},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{6,8},{56,-40}},
          lineColor={0,0,127},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{-92,-68},{-33.9922,-68},{-29.6293,-68},{-26,-68},{-30,
              -42},{-36,-24},{-50,-16},{-72,-16},{-80,-20},{-86,-28},{-92,
              -46},{-94,-66},{-92,-68}},
          lineColor={0,0,127},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid,
          smooth=Smooth.Bezier),
        Ellipse(
          extent={{-84,32},{-34,-16}},
          lineColor={0,0,127},
          fillColor={28,108,200},
          fillPattern=FillPattern.Solid)}),
          Diagram(coordinateSystem(preserveAspectRatio=false)));
end InfectedContacts;
