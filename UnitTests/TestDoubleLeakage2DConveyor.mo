within Covid19_modeling.UnitTests;
model TestDoubleLeakage2DConveyor
  Parts.DoubleLeakageConveyor doubleLeakageConveyor(useDeathFractionRate=
        true)
    annotation (Placement(transformation(extent={{-16,36},{26,78}})));
  Physiolibrary.Population.Sources.Growth InflowUntested1(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-94,82},{-74,102}})));
  Physiolibrary.Types.Constants.PopulationChangeConst testedFractionRate1(k=0)
           "leakRaction/time"
    annotation (Placement(transformation(extent={{-80,42},{-68,52}})));
  Physiolibrary.Population.Sources.Growth InflowTested1(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-100,18},{-80,38}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathUntestedFractionRate1(k=4.6296296296296e-06)
                                                     "leakRaction/time"
    annotation (Placement(transformation(extent={{-76,64},{-64,74}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathTestedFractionRate1(k=4.6296296296296e-06)
                                                   "leakRaction/time"
    annotation (Placement(transformation(extent={{-80,4},{-68,14}})));
  Parts.PopulationChangeMeasure inflowTested1
    annotation (Placement(transformation(extent={{-72,20},{-56,36}})));
  Parts.PopulationChangeMeasure inflowUntested1
    annotation (Placement(transformation(extent={{-66,84},{-50,100}})));
  Physiolibrary.Population.Components.Population populationTestedOut1
    annotation (Placement(transformation(extent={{68,20},{88,40}})));
  Parts.PopulationChangeMeasure outflowTested1
    annotation (Placement(transformation(extent={{44,22},{60,38}})));
  Physiolibrary.Population.Components.Population populationUntestedOut1
    annotation (Placement(transformation(extent={{68,66},{88,86}})));
  Parts.PopulationChangeMeasure outflowUntested1
    annotation (Placement(transformation(extent={{42,68},{58,84}})));
equation
  connect(InflowUntested1.port_b, inflowUntested1.port_a) annotation (Line(
      points={{-74,92},{-65.2,92}},
      color={0,127,127},
      thickness=1));
  connect(InflowTested1.port_b, inflowTested1.port_a) annotation (Line(
      points={{-80,28},{-71.2,28}},
      color={0,127,127},
      thickness=1));
  connect(inflowUntested1.port_b, doubleLeakageConveyor.inflowUntested)
    annotation (Line(
      points={{-50.8,92},{-32,92},{-32,69.6},{-16,69.6}},
      color={0,127,127},
      thickness=1));
  connect(deathUntestedFractionRate1.y, doubleLeakageConveyor.deathFractionUntestedRate)
    annotation (Line(points={{-62.5,69},{-39.25,69},{-39.25,63.72},{-18.1,
          63.72}}, color={0,0,127}));
  connect(testedFractionRate1.y, doubleLeakageConveyor.testedFractionRate)
    annotation (Line(points={{-66.5,47},{-35.25,47},{-35.25,55.53},{-1.51,
          55.53}}, color={0,0,127}));
  connect(inflowTested1.port_b, doubleLeakageConveyor.inflowTested)
    annotation (Line(
      points={{-56.8,28},{-30,28},{-30,44.4},{-16,44.4}},
      color={0,127,127},
      thickness=1));
  connect(deathTestedFractionRate1.y, doubleLeakageConveyor.deathFractionTestedRate)
    annotation (Line(points={{-66.5,9},{-24,9},{-24,39.36},{-18.1,39.36}},
        color={0,0,127}));
  connect(populationTestedOut1.port, outflowTested1.port_b) annotation (
      Line(
      points={{78,30},{59.2,30}},
      color={0,127,127},
      thickness=1));
  connect(populationUntestedOut1.port, outflowUntested1.port_b) annotation (
     Line(
      points={{78,76},{57.2,76}},
      color={0,127,127},
      thickness=1));
  connect(outflowTested1.port_a, doubleLeakageConveyor.outflowTested)
    annotation (Line(
      points={{44.8,30},{38,30},{38,44.4},{26,44.4}},
      color={0,127,127},
      thickness=1));
  connect(outflowUntested1.port_a, doubleLeakageConveyor.outflowUntested)
    annotation (Line(
      points={{42.8,76},{38,76},{38,69.6},{26,69.6}},
      color={0,127,127},
      thickness=1));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=864000,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestDoubleLeakage2DConveyor;
