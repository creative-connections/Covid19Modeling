within Covid19Modeling.UnitTests;
model TestDoubleLeakConveyor
  Physiolibrary.Population.Sources.Growth InflowUntested(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-82,66},{-62,86}})));
  Physiolibrary.Population.Components.Population populationUntestedOut
    annotation (Placement(transformation(extent={{62,62},{82,82}})));
  Physiolibrary.Population.Components.Population populationTestedOut
    annotation (Placement(transformation(extent={{62,16},{82,36}})));
  Physiolibrary.Types.Constants.PopulationChangeConst testedFractionRate(k=
        0) "leakRaction/time"
    annotation (Placement(transformation(extent={{-90,38},{-78,48}})));
  Physiolibrary.Population.Sources.Growth InflowTested(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-88,18},{-68,38}})));
  Parts.DoubleLeakConveyor doubleLeakConveyor(numberOfSlots=400, delay(
        displayUnit="d") = 86400)
    annotation (Placement(transformation(extent={{-16,26},{18,62}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathUntestedFractionRate(k=4.6296296296296e-06) "leakRaction/time"
    annotation (Placement(transformation(extent={{-88,56},{-76,66}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathTestedFractionRate(k=4.6296296296296e-06) "leakRaction/time"
    annotation (Placement(transformation(extent={{-68,10},{-56,20}})));
  Parts.PopulationChangeMeasure inflowTested
    annotation (Placement(transformation(extent={{-60,20},{-44,36}})));
  Parts.PopulationChangeMeasure inflowUntested
    annotation (Placement(transformation(extent={{-54,68},{-38,84}})));
  Parts.PopulationChangeMeasure outflowUntested
    annotation (Placement(transformation(extent={{36,64},{52,80}})));
  Parts.PopulationChangeMeasure outflowTested
    annotation (Placement(transformation(extent={{38,18},{54,34}})));
  Parts.DoubleLeakageConveyor doubleLeakageConveyor(useDeathFractionRate=
        true)
    annotation (Placement(transformation(extent={{-12,-62},{30,-20}})));
  Physiolibrary.Population.Sources.Growth InflowUntested1(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-90,-16},{-70,4}})));
  Physiolibrary.Types.Constants.PopulationChangeConst testedFractionRate1(k=0)
           "leakRaction/time"
    annotation (Placement(transformation(extent={{-76,-56},{-64,-46}})));
  Physiolibrary.Population.Sources.Growth InflowTested1(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-96,-80},{-76,-60}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathUntestedFractionRate1(k=4.6296296296296e-06)
                                                     "leakRaction/time"
    annotation (Placement(transformation(extent={{-72,-34},{-60,-24}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathTestedFractionRate1(k=4.6296296296296e-06)
                                                   "leakRaction/time"
    annotation (Placement(transformation(extent={{-76,-94},{-64,-84}})));
  Parts.PopulationChangeMeasure inflowTested1
    annotation (Placement(transformation(extent={{-68,-78},{-52,-62}})));
  Parts.PopulationChangeMeasure inflowUntested1
    annotation (Placement(transformation(extent={{-62,-14},{-46,2}})));
  Physiolibrary.Population.Components.Population populationTestedOut1
    annotation (Placement(transformation(extent={{72,-78},{92,-58}})));
  Parts.PopulationChangeMeasure outflowTested1
    annotation (Placement(transformation(extent={{48,-76},{64,-60}})));
  Physiolibrary.Population.Components.Population populationUntestedOut1
    annotation (Placement(transformation(extent={{72,-32},{92,-12}})));
  Parts.PopulationChangeMeasure outflowUntested1
    annotation (Placement(transformation(extent={{46,-30},{62,-14}})));
equation
  connect(testedFractionRate.y, doubleLeakConveyor.testedFractionRate)
    annotation (Line(points={{-76.5,43},{-60,43},{-60,44},{-4.1,44}}, color=
         {0,0,127}));
  connect(doubleLeakConveyor.deathFractionUntestedRate,
    deathUntestedFractionRate.y) annotation (Line(points={{-17.7,49.76},{
          -60,49.76},{-60,61},{-74.5,61}}, color={0,0,127}));
  connect(deathTestedFractionRate.y, doubleLeakConveyor.deathFractionTestedRate)
    annotation (Line(points={{-54.5,15},{-30,15},{-30,28.88},{-17.7,28.88}},
        color={0,0,127}));
  connect(InflowUntested.port_b, inflowUntested.port_a) annotation (Line(
      points={{-62,76},{-53.2,76}},
      color={0,127,127},
      thickness=1));
  connect(inflowUntested.port_b, doubleLeakConveyor.inflowUntested)
    annotation (Line(
      points={{-38.8,76},{-34,76},{-34,54.8},{-16,54.8}},
      color={0,127,127},
      thickness=1));
  connect(InflowTested.port_b, inflowTested.port_a) annotation (Line(
      points={{-68,28},{-66,28},{-66,30},{-64,30},{-64,28},{-59.2,28}},
      color={0,127,127},
      thickness=1));
  connect(inflowTested.port_b, doubleLeakConveyor.inflowTested) annotation (
     Line(
      points={{-44.8,28},{-34,28},{-34,33.2},{-16,33.2}},
      color={0,127,127},
      thickness=1));
  connect(populationTestedOut.port, outflowTested.port_b) annotation (Line(
      points={{72,26},{53.2,26}},
      color={0,127,127},
      thickness=1));
  connect(outflowTested.port_a, doubleLeakConveyor.outflowTested)
    annotation (Line(
      points={{38.8,26},{34,26},{34,33.2},{18,33.2}},
      color={0,127,127},
      thickness=1));
  connect(doubleLeakConveyor.outflowUntested, outflowUntested.port_a)
    annotation (Line(
      points={{18,54.8},{28,54.8},{28,72},{36.8,72}},
      color={0,127,127},
      thickness=1));
  connect(outflowUntested.port_b, populationUntestedOut.port) annotation (
      Line(
      points={{51.2,72},{72,72}},
      color={0,127,127},
      thickness=1));
  connect(InflowUntested1.port_b, inflowUntested1.port_a) annotation (Line(
      points={{-70,-6},{-61.2,-6}},
      color={0,127,127},
      thickness=1));
  connect(InflowTested1.port_b, inflowTested1.port_a) annotation (Line(
      points={{-76,-70},{-67.2,-70}},
      color={0,127,127},
      thickness=1));
  connect(inflowUntested1.port_b, doubleLeakageConveyor.inflowUntested)
    annotation (Line(
      points={{-46.8,-6},{-28,-6},{-28,-28.4},{-12,-28.4}},
      color={0,127,127},
      thickness=1));
  connect(deathUntestedFractionRate1.y, doubleLeakageConveyor.deathFractionUntestedRate)
    annotation (Line(points={{-58.5,-29},{-35.25,-29},{-35.25,-34.28},{
          -14.1,-34.28}}, color={0,0,127}));
  connect(testedFractionRate1.y, doubleLeakageConveyor.testedFractionRate)
    annotation (Line(points={{-62.5,-51},{-31.25,-51},{-31.25,-42.47},{2.49,
          -42.47}}, color={0,0,127}));
  connect(inflowTested1.port_b, doubleLeakageConveyor.inflowTested)
    annotation (Line(
      points={{-52.8,-70},{-26,-70},{-26,-53.6},{-12,-53.6}},
      color={0,127,127},
      thickness=1));
  connect(deathTestedFractionRate1.y, doubleLeakageConveyor.deathFractionTestedRate)
    annotation (Line(points={{-62.5,-89},{-20,-89},{-20,-58.64},{-14.1,
          -58.64}}, color={0,0,127}));
  connect(populationTestedOut1.port, outflowTested1.port_b) annotation (
      Line(
      points={{82,-68},{63.2,-68}},
      color={0,127,127},
      thickness=1));
  connect(populationUntestedOut1.port, outflowUntested1.port_b) annotation (
     Line(
      points={{82,-22},{61.2,-22}},
      color={0,127,127},
      thickness=1));
  connect(outflowTested1.port_a, doubleLeakageConveyor.outflowTested)
    annotation (Line(
      points={{48.8,-68},{42,-68},{42,-53.6},{30,-53.6}},
      color={0,127,127},
      thickness=1));
  connect(outflowUntested1.port_a, doubleLeakageConveyor.outflowUntested)
    annotation (Line(
      points={{46.8,-22},{42,-22},{42,-28.4},{30,-28.4}},
      color={0,127,127},
      thickness=1));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=864000,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestDoubleLeakConveyor;
