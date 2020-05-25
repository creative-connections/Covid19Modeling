within Covid19Modeling.UnitTests;
model TestDoubleLeakageConveyor
  Physiolibrary.Population.Sources.Growth InflowUntested(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-84,66},{-64,86}})));
  Physiolibrary.Population.Components.Population populationUntestedOut(
      population_start=0)
    annotation (Placement(transformation(extent={{60,62},{80,82}})));
  Physiolibrary.Population.Components.Population populationTestedOut(
      population_start=0)
    annotation (Placement(transformation(extent={{60,-6},{80,14}})));
  Physiolibrary.Types.Constants.PopulationChangeConst testedFractionRate(k=
        2.3148148148148e-06)
           "leakRaction/time"
    annotation (Placement(transformation(extent={{-88,30},{-76,40}})));
  Physiolibrary.Population.Sources.Growth InflowTested(PopulationChange(
        displayUnit="1/d") = 5.787037037037e-05)
    annotation (Placement(transformation(extent={{-96,-4},{-76,16}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathUntestedFractionRate(k=0)                   "leakRaction/time"
    annotation (Placement(transformation(extent={{-88,52},{-76,62}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathTestedFractionRate(k=0)                   "leakRaction/time"
    annotation (Placement(transformation(extent={{-82,-26},{-70,-16}})));
  Parts.PopulationChangeMeasure inflowTested
    annotation (Placement(transformation(extent={{-70,-2},{-54,14}})));
  Parts.PopulationChangeMeasure inflowUntested
    annotation (Placement(transformation(extent={{-56,68},{-40,84}})));
  Parts.PopulationChangeMeasure outflowUntested
    annotation (Placement(transformation(extent={{36,64},{52,80}})));
  Parts.PopulationChangeMeasure outflowTested
    annotation (Placement(transformation(extent={{36,-4},{52,12}})));
  Parts.DoubleLeakageConveyor doubleLeakageConveyor
    annotation (Placement(transformation(extent={{-26,14},{22,62}})));
equation
  connect(InflowUntested.port_b, inflowUntested.port_a) annotation (Line(
      points={{-64,76},{-55.2,76}},
      color={0,127,127},
      thickness=1));
  connect(InflowTested.port_b, inflowTested.port_a) annotation (Line(
      points={{-76,6},{-69.2,6}},
      color={0,127,127},
      thickness=1));
  connect(populationTestedOut.port, outflowTested.port_b) annotation (Line(
      points={{70,4},{51.2,4}},
      color={0,127,127},
      thickness=1));
  connect(outflowUntested.port_b, populationUntestedOut.port) annotation (
      Line(
      points={{51.2,72},{70,72}},
      color={0,127,127},
      thickness=1));
  connect(doubleLeakageConveyor.inflowUntested, inflowUntested.port_b)
    annotation (Line(
      points={{-26,52.4},{-26,54},{-38,54},{-38,76},{-40.8,76}},
      color={0,127,127},
      thickness=1));
  connect(doubleLeakageConveyor.outflowUntested, outflowUntested.port_a)
    annotation (Line(
      points={{22,52.4},{22,54},{34,54},{34,72},{36.8,72}},
      color={0,127,127},
      thickness=1));
  connect(outflowTested.port_a, doubleLeakageConveyor.outflowTested)
    annotation (Line(
      points={{36.8,4},{32,4},{32,23.6},{22,23.6}},
      color={0,127,127},
      thickness=1));
  connect(inflowTested.port_b, doubleLeakageConveyor.inflowTested)
    annotation (Line(
      points={{-54.8,6},{-48,6},{-48,23.6},{-26,23.6}},
      color={0,127,127},
      thickness=1));
  connect(deathUntestedFractionRate.y, doubleLeakageConveyor.deathFractionUntestedRate)
    annotation (Line(points={{-74.5,57},{-49.25,57},{-49.25,45.68},{-28.4,
          45.68}}, color={0,0,127}));
  connect(deathTestedFractionRate.y, doubleLeakageConveyor.deathFractionTestedRate)
    annotation (Line(points={{-68.5,-21},{-38,-21},{-38,17.84},{-28.4,17.84}},
        color={0,0,127}));
  connect(doubleLeakageConveyor.testedFractionRate, testedFractionRate.y)
    annotation (Line(points={{-9.44,36.32},{-51.72,36.32},{-51.72,35},{
          -74.5,35}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=259200,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestDoubleLeakageConveyor;
