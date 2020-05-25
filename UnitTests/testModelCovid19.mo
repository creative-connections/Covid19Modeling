within Covid19Modeling.UnitTests;
model testModelCovid19

    type Severity = enumeration(
      Asymptomatic,
      Mild,
      Moderate,
      Severe);

// parameter Modelica.SIunits.Time delayX[4] = {172800,172800,172800,172800};

  Physiolibrary.Population.Components.Population uninfectedAtRisk(
      population_start=1e6)
    annotation (Placement(transformation(extent={{-196,26},{-166,56}})));
  Physiolibrary.Population.Components.Population recovered(population_start=
       0)
    annotation (Placement(transformation(extent={{126,14},{174,48}})));
  Parts.FirstDoubleLeakageConveyor infectedNotContagious[Severity](
    numberOfSlots=modelSettings.numberOfSlotsInfectedNotContagious,
    each useDeathFractionRate=false,
    delay(each displayUnit="d") = modelSettings.delayInfectedNotContagious)
    annotation (Placement(transformation(extent={{-114,12},{-78,48}})));

  Parts.DoubleLeakageConveyor asymptomaticContagious[Severity](
    numberOfSlots=modelSettings.numberOfSlotsAsymptomaticContagious,
    delay(each displayUnit="d") = modelSettings.delayAsymptomaticContagious,
    each useDeathFractionRate=false)
    annotation (Placement(transformation(extent={{-54,12},{-18,48}})));

  Parts.DoubleLeakageConveyor symptomaticContagious[Severity](
    numberOfSlots=modelSettings.numberOfSlotsSymptomaticContagious,
    delay(each displayUnit="d") = modelSettings.delaySymptomaticContagious,
    each useDeathFractionRate=true)
    annotation (Placement(transformation(extent={{10,12},{46,48}})));

  Parts.DoubleLeakageConveyor symptomaticNotContagious[Severity](
    numberOfSlots=modelSettings.numberOfSlotsSymptomaticNoLongerContagious,
    delay(each displayUnit="d") = modelSettings.delaySymptomaticNoLongerContagious,
    each useDeathFractionRate=true)
    annotation (Placement(transformation(extent={{76,12},{112,48}})));

/*
  Parts.Arriving arrivingInfectedNotContagious_Asymptomatic(
    timeOfArrival(displayUnit="d") = 0,
    numberOfArrivingPerson=1,
    durationOdArrival(displayUnit="d") = 21600)
    annotation (Placement(transformation(extent={{-172,70},{-152,90}})));
    
*/
  Parts.patientInflow patientInflow annotation (Placement(transformation(
        extent={{-14,-15},{14,15}},
        rotation=0,
        origin={-150,41})));
  Parts.LivingPopulation livingPopulation
    annotation (Placement(transformation(extent={{-44,-36},{-12,-14}})));
  Parts.DeathPopulation deathPopulation
    annotation (Placement(transformation(extent={{68,-94},{106,-70}})));
  Parts.InfectedContacts infectedContacts
    annotation (Placement(transformation(extent={{-120,-36},{-100,-12}})));

  //inner interfaces.ModelSettings modelSettings
  inner interfaces.ModelSettings modelSettings(
    testedAdjustment(displayUnit="1"),
    symptomaticAdjustment(displayUnit="1"),
    infectivity(displayUnit="iu"),
    severitySpread(displayUnit="1"),
    delayInfectedNotContagious(displayUnit="d"),
    delayAsymptomaticContagious(displayUnit="d"),
    delaySymptomaticContagious(displayUnit="d"),
    delaySymptomaticNoLongerContagious(displayUnit="d"),
    discreetStep(displayUnit="d"))
    annotation (Placement(transformation(extent={{140,-94},{160,-74}})));

//outer Modelica.SIunits.Time delayInfectedNotContagious;

  Parts.Testing testing annotation (Placement(transformation(
        extent={{-14,-14},{14,14}},
        rotation=0,
        origin={-108,-64})));
  Parts.Dying dying
    annotation (Placement(transformation(extent={{8,-74},{34,-48}})));
  Parts.HealthCare healthCare
    annotation (Placement(transformation(extent={{-182,-80},{-156,-52}})));

  Parts.Arriving arrivingInfectedNotContagious[Severity](
    timeOfArrival(each displayUnit="d") = modelSettings.infectedNotContagiousTimeOfArrival,
    numberOfArrivingPerson=modelSettings.infectedNotContagioustNumberOfArrivingPersons)
    annotation (Placement(transformation(extent={{-174,68},{-154,88}})));
  Parts.Arriving arrivingAsymptomaticContagious[Severity](
    timeOfArrival(each displayUnit="d") = modelSettings.asymptomaticContagiousTimeOfArrival,
    numberOfArrivingPerson=modelSettings.asymptomaticContagiousNumberOfArrivingPersons)
    annotation (Placement(transformation(extent={{-106,68},{-86,88}})));
  Parts.Arriving arrivingSymptomaticContagious[Severity](
    timeOfArrival(each displayUnit="d") = modelSettings.symptomaticContagiousTimeOfArrival,
    numberOfArrivingPerson=modelSettings.symptomaticContagiousNumberOfArrivingPersons)
    annotation (Placement(transformation(extent={{-36,68},{-16,88}})));

equation

  connect(infectedNotContagious.outflowUntested, asymptomaticContagious.inflowUntested)
    annotation (Line(
      points={{-78,40.8},{-54,40.8}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious.outflowTested, asymptomaticContagious.inflowTested)
    annotation (Line(
      points={{-78,19.2},{-54,19.2}},
      color={0,127,127},
      thickness=1));
  connect(symptomaticContagious.outflowTested, symptomaticNotContagious.inflowTested)
    annotation (Line(
      points={{46,19.2},{76,19.2}},
      color={0,127,127},
      thickness=1));
  connect(symptomaticContagious.outflowUntested, symptomaticNotContagious.inflowUntested)
    annotation (Line(
      points={{46,40.8},{76,40.8}},
      color={0,127,127},
      thickness=1));
  connect(uninfectedAtRisk.port, patientInflow.fromPopulation) annotation (Line(
      points={{-181,41},{-172.5,41},{-172.5,39.6364},{-163.44,39.6364}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(patientInflow.toPatiens, infectedNotContagious.inflowUntested)
    annotation (Line(
      points={{-135.44,39.6364},{-124.72,39.6364},{-124.72,40.8},{-114,40.8}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(uninfectedAtRisk.population, livingPopulation.populationAtRisk)
    annotation (Line(points={{-172,26},{-172,-10},{-42.88,-10},{-42.88,-13.01}},
        color={0,0,127}));
  connect(infectedNotContagious.populationUntested, livingPopulation.infectedNotContagiousUntested)
    annotation (Line(points={{-108.24,31.8},{-124,31.8},{-124,-8},{-39.68,-8},{-39.68,
          -13.01}}, color={0,0,127}));
  connect(asymptomaticContagious.populationUntested, livingPopulation.asymptomaticContagiousUntested)
    annotation (Line(points={{-48.24,31.8},{-62,31.8},{-62,-4},{-33.28,-4},{-33.28,
          -13.01}}, color={0,0,127}));
  connect(symptomaticContagious.populationUntested, livingPopulation.symptomaticContagiousUntested)
    annotation (Line(points={{15.76,31.8},{2,31.8},{2,-4},{-26.88,-4},{-26.88,-13.01}},
                    color={0,0,127}));
  connect(infectedNotContagious.populationTested, livingPopulation.infectedNotContagiousTested)
    annotation (Line(points={{-108.6,10.2},{-108.6,-6},{-36.48,-6},{-36.48,-13.01}},
        color={0,0,127}));
  connect(asymptomaticContagious.populationTested, livingPopulation.asymptomaticContagiousTested)
    annotation (Line(points={{-48.6,10.2},{-48.6,-2},{-30.08,-2},{-30.08,-13.01}},
        color={0,0,127}));
  connect(symptomaticNotContagious.populationTested, livingPopulation.symptomaticNotContagiousTested)
    annotation (Line(points={{81.4,10.2},{81.4,-10},{-17.28,-10},{-17.28,-13.01}},
        color={0,0,127}));
  connect(symptomaticContagious.populationTested, livingPopulation.symptomaticContagiousTested)
    annotation (Line(points={{15.4,10.2},{15.4,-6},{-23.68,-6},{-23.68,-13.01}},
        color={0,0,127}));
  connect(symptomaticNotContagious.populationUntested, livingPopulation.symptomaticNotContagiousUntested)
    annotation (Line(points={{81.76,31.8},{58,31.8},{58,-10},{-20.48,-10},{-20.48,
          -13.01}}, color={0,0,127}));
  connect(recovered.population, livingPopulation.recovered) annotation (Line(
        points={{164.4,14},{164.4,-12},{-14.08,-12},{-14.08,-13.01}}, color={0,0,
          127}));
  connect(symptomaticNotContagious.deathUntested, deathPopulation.symptomaticNotContagiousUntested)
    annotation (Line(points={{108.4,31.8},{118,31.8},{118,-44},{98.97,-44},{98.97,
          -68.68}}, color={0,0,127}));
  connect(patientInflow.uninfectedPopulation, livingPopulation.populationAtRisk)
    annotation (Line(points={{-161.2,33.0909},{-161.2,18},{-172,18},{-172,-10},{
          -42.88,-10},{-42.88,-13.01}}, color={0,0,127}));
  connect(livingPopulation.totalLivingPopulation, patientInflow.totalPopulation)
    annotation (Line(points={{-45.6,-26.32},{-82,-26.32},{-82,-42},{-155.6,-42},
          {-155.6,33.0909}},
                     color={0,0,127}));
  connect(infectedContacts.contacts, patientInflow.contacts) annotation (Line(
        points={{-121,-24},{-150,-24},{-150,33.0909}}, color={0,0,127}));
  connect(livingPopulation.testedContagiousPopulation, infectedContacts.testedContagiousPopulation)
    annotation (Line(
      points={{-45.6,-24.12},{-86,-24.12},{-86,-29.52},{-98.6,-29.52}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(livingPopulation.notTestedAsymptomaticContagiousPopulation,
    infectedContacts.notTestedAsymptomaticContagiousPopulation) annotation (
     Line(
      points={{-45.6,-21.92},{-87.8,-21.92},{-87.8,-26.16},{-98.6,-26.16}},
      color={0,0,127},
      smooth=Smooth.Bezier));

  connect(livingPopulation.notTestedModerateSymptomaticContagiousPopulation,
    infectedContacts.notTestedModerateSymptomaticContagiousPopulation)
    annotation (Line(
      points={{-45.6,-19.72},{-88,-19.72},{-88,-23.04},{-98.6,-23.04}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(livingPopulation.notTestedSevereSymptomaticContagiousPopulation,
    infectedContacts.notTestedSevereSymptomaticContagiousPopulation)
    annotation (Line(
      points={{-45.6,-17.52},{-88,-17.52},{-88,-19.68},{-98.6,-19.68}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(livingPopulation.notTestedMildlySymptomaticContagiousPopulation,
    infectedContacts.notTestedMildlySymptomaticContagiousPopulation)
    annotation (Line(
      points={{-45.6,-15.1},{-86,-15.1},{-86,-16.32},{-98.6,-16.32}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(testing.untestedAsymptomatic, livingPopulation.untestedAsymptomatic)
    annotation (Line(points={{-92.32,-52.24},{-80,-52.24},{-80,-28.52},{-45.6,-28.52}},
                    color={0,0,127}));
  connect(testing.untestedMildSymptomatic, livingPopulation.untestedMildlySymptomatic)
    annotation (Line(points={{-92.32,-55.88},{-78,-55.88},{-78,-30.72},{-45.6,-30.72}},
                    color={0,0,127}));
  connect(testing.untestedModerateAndSevereSymptomatic, livingPopulation.untestedModerateAndSevereSymtpomatic)
    annotation (Line(points={{-92.32,-59.52},{-76,-59.52},{-76,-32.92},{-45.6,-32.92}},
                          color={0,0,127}));
  connect(testing.InfectedNotContagiousTestFractionRate,
    infectedNotContagious.testedFractionRate) annotation (Line(points={{-123.4,-57.28},
          {-142,-57.28},{-142,28.74},{-101.58,28.74}},               color=
          {0,0,127}));
  connect(testing.AsymptomaticContagiousTestFractionRate,
    asymptomaticContagious.testedFractionRate) annotation (Line(points={{-123.4,
          -61.76},{-138,-61.76},{-138,8},{-58,8},{-58,28.74},{-41.58,28.74}},
                   color={0,0,127}));
  connect(testing.SymptomaticContagiousTestFractionRate,
    symptomaticContagious.testedFractionRate) annotation (Line(points={{-123.4,-66.24},
          {-132,-66.24},{-132,-82},{0,-82},{0,28.74},{22.42,28.74}},
                   color={0,0,127}));
  connect(testing.SymptomaticNotContagiousTestFractionRate,
    symptomaticNotContagious.testedFractionRate) annotation (Line(points={{-123.4,
          -70.72},{-140,-70.72},{-140,-84},{62,-84},{62,28.74},{88.42,28.74}},
        color={0,0,127}));
  connect(testing.InfectedNotContagiousTestRate, infectedNotContagious.testedRate)
    annotation (Line(points={{-92.32,-64.84},{-72,-64.84},{-72,28.56},{-90.6,28.56}},
                         color={0,0,127}));
  connect(testing.AsymptomaticContagiousTestRate, asymptomaticContagious.testedRate)
    annotation (Line(points={{-92.32,-69.04},{-68,-69.04},{-68,4},{-14,4},{-14,28.56},
          {-30.6,28.56}},           color={0,0,127}));
  connect(testing.SymptomaticContagiousTestRate, symptomaticContagious.testedRate)
    annotation (Line(points={{-92.32,-72.96},{-60,-72.96},{-60,2},{50,2},{50,28.56},
          {33.4,28.56}},           color={0,0,127}));
  connect(testing.SymptomaticNotContagiousTestRate, symptomaticNotContagious.testedRate)
    annotation (Line(points={{-92.32,-76.6},{-62,-76.6},{-62,0},{116,0},{116,28.56},
          {99.4,28.56}},  color={0,0,127}));
  connect(testing.testingPositiveRate, healthCare.testingPositiveRate)
    annotation (Line(points={{-123.4,-76.04},{-148,-76.04},{-148,-66},{-154.44,-66}},
                         color={0,0,127}));
  connect(healthCare.recentTestingPositive, testing.recentTestingPositiveRate)
    annotation (Line(points={{-183.3,-74.12},{-188,-74.12},{-188,-90},{-120.6,-90},
          {-120.6,-79.4}},             color={0,0,127}));
  connect(dying.dyingFractionRate, symptomaticContagious.deathFractionUntestedRate)
    annotation (Line(points={{21,-46.7},{21,-16},{4,-16},{4,35.76},{8.2,35.76}},
                   color={0,0,127}));
  connect(dying.dyingFractionRate, symptomaticContagious.deathFractionTestedRate)
    annotation (Line(points={{21,-46.7},{21,-16},{4,-16},{4,14.88},{8.2,14.88}},
                   color={0,0,127}));
  connect(dying.dyingFractionRate, symptomaticNotContagious.deathFractionTestedRate)
    annotation (Line(points={{21,-46.7},{21,-16},{72,-16},{72,14.88},{74.2,14.88}},
                   color={0,0,127}));
  connect(dying.dyingFractionRate, symptomaticNotContagious.deathFractionUntestedRate)
    annotation (Line(points={{21,-46.7},{21,-16},{72,-16},{72,35.76},{74.2,35.76}},
                   color={0,0,127}));
  connect(symptomaticContagious.deathTested, deathPopulation.symptomaticContagiousTested)
    annotation (Line(points={{44.2,10.2},{44.2,-48},{71.23,-48},{71.23,-68.92}},
                    color={0,0,127}));
  connect(symptomaticContagious.deathUntested, deathPopulation.symptomaticContagiousUntested)
    annotation (Line(points={{42.4,31.8},{52,31.8},{52,-42},{81.87,-42},{81.87,-68.68}},
                          color={0,0,127}));
  connect(deathPopulation.symptomaticNotContagiousTested,
    symptomaticNotContagious.deathTested) annotation (Line(points={{90.99,-68.68},
          {90.99,-38},{110.2,-38},{110.2,10.2}},         color={0,0,127}));
  connect(livingPopulation.needingHospitalisation, healthCare.needingHospitalisation)
    annotation (Line(points={{-42.4,-37.1},{-42.4,-86},{-150,-86},{-150,-71.04},
          {-154.7,-71.04}}, color={0,0,127}));
  connect(livingPopulation.tooIllToWork, healthCare.tooIllToWork) annotation (
      Line(points={{-39.2,-37.1},{-39.2,-88},{-152,-88},{-152,-76.08},{-154.7,-76.08}},
        color={0,0,127}));
  connect(arrivingInfectedNotContagious.arriversFlow, infectedNotContagious.inflowUntested)
    annotation (Line(
      points={{-159,73.4},{-126,73.4},{-126,40.8},{-114,40.8}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(arrivingAsymptomaticContagious.arriversFlow, asymptomaticContagious.inflowUntested)
    annotation (Line(
      points={{-91,73.4},{-68,73.4},{-68,40.8},{-54,40.8}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(asymptomaticContagious.outflowUntested, symptomaticContagious.inflowUntested)
    annotation (Line(
      points={{-18,40.8},{-2,40.8},{10,40.8}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(asymptomaticContagious.outflowTested, symptomaticContagious.inflowTested)
    annotation (Line(
      points={{-18,19.2},{-4,19.2},{10,19.2}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[1].outflowUntested, recovered.port)
    annotation (Line(
      points={{112,40.8},{132,40.8},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[2].outflowUntested, recovered.port)
    annotation (Line(
      points={{112,40.8},{132,40.8},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[3].outflowUntested, recovered.port)
    annotation (Line(
      points={{112,40.8},{132,40.8},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[4].outflowUntested, recovered.port)
    annotation (Line(
      points={{112,40.8},{132,40.8},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[1].outflowTested, recovered.port)
    annotation (Line(
      points={{112,19.2},{132,19.2},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[2].outflowTested, recovered.port)
    annotation (Line(
      points={{112,19.2},{132,19.2},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[3].outflowTested, recovered.port)
    annotation (Line(
      points={{112,19.2},{132,19.2},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(symptomaticNotContagious[4].outflowTested, recovered.port)
    annotation (Line(
      points={{112,19.2},{132,19.2},{132,31},{150,31}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(arrivingSymptomaticContagious.arriversFlow, symptomaticContagious.inflowUntested)
    annotation (Line(
      points={{-21,73.4},{-21,59.4},{-2,59.4},{-2,40.8},{10,40.8}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
    annotation (Placement(transformation(extent={{-52,78},{-32,98}})),
      experiment(StopTime=31536000, __Dymola_Algorithm="Cvode"),
              Icon(coordinateSystem(preserveAspectRatio=false, extent={{-200,-100},
            {180,100}})),            Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-200,-100},{180,100}})));
end testModelCovid19;
