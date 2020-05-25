within Covid19_modeling.UnitTests;
model TestDoubleLeakageConveyorPopulationSum
  Physiolibrary.Population.Components.Population populationUntestedOut(
      population_start=0)
    annotation (Placement(transformation(extent={{60,62},{80,82}})));
  Physiolibrary.Population.Components.Population populationTestedOut(
      population_start=0)
    annotation (Placement(transformation(extent={{64,-30},{84,-10}})));
  Physiolibrary.Types.Constants.PopulationChangeConst testedFractionRate(k=
        2.3148148148148e-06)
           "leakRaction/time"
    annotation (Placement(transformation(extent={{-88,30},{-76,40}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathUntestedFractionRate(k=1.1574074074074e-05) "leakRaction/time"
    annotation (Placement(transformation(extent={{-88,52},{-76,62}})));
  Physiolibrary.Types.Constants.PopulationChangeConst
    deathTestedFractionRate(k=0)                   "leakRaction/time"
    annotation (Placement(transformation(extent={{-82,-26},{-70,-16}})));
  Parts.PopulationChangeMeasure inflowTested
    annotation (Placement(transformation(extent={{-68,-2},{-52,14}})));
  Parts.PopulationChangeMeasure inflowUntested
    annotation (Placement(transformation(extent={{-54,68},{-38,84}})));
  Parts.PopulationChangeMeasure outflowUntested
    annotation (Placement(transformation(extent={{36,64},{52,80}})));
  Parts.PopulationChangeMeasure outflowTested
    annotation (Placement(transformation(extent={{38,-30},{54,-14}})));
  Parts.DoubleLeakageConveyor doubleLeakageConveyor
    annotation (Placement(transformation(extent={{-20,14},{28,62}})));
  Physiolibrary.Population.Components.Change fromTestedPopulation(
      useChangeInput=false, PopulationChange=0.00011574074074074)
    annotation (Placement(transformation(extent={{-98,-4},{-78,16}})));
  Physiolibrary.Population.Components.Change fromUntestedPopulation1(
      useChangeInput=false, PopulationChange=0.00011574074074074)
    annotation (Placement(transformation(extent={{-90,68},{-70,88}})));
  Physiolibrary.Population.Components.Population TestedInit(
      population_start=1000)
    annotation (Placement(transformation(extent={{-152,-28},{-132,-8}})));
  Physiolibrary.Population.Components.Population UntestedInit(
      population_start=1000)
    annotation (Placement(transformation(extent={{-136,40},{-116,60}})));
  Modelica.Blocks.Math.Add add
    annotation (Placement(transformation(extent={{2,-78},{18,-62}})));
  Modelica.Blocks.Math.Add add1
    annotation (Placement(transformation(extent={{42,-60},{58,-44}})));
  Modelica.Blocks.Math.Add add2
    annotation (Placement(transformation(extent={{80,-66},{96,-50}})));
  Modelica.Blocks.Math.Add add3
    annotation (Placement(transformation(extent={{32,-84},{48,-68}})));
  Modelica.Blocks.Math.Add cimrmanovyHornic
    annotation (Placement(transformation(extent={{128,-88},{144,-72}})));
equation
  connect(populationTestedOut.port, outflowTested.port_b) annotation (Line(
      points={{74,-20},{60,-20},{60,-22},{53.2,-22}},
      color={0,127,127},
      thickness=1));
  connect(outflowUntested.port_b, populationUntestedOut.port) annotation (
      Line(
      points={{51.2,72},{70,72}},
      color={0,127,127},
      thickness=1));
  connect(doubleLeakageConveyor.inflowUntested, inflowUntested.port_b)
    annotation (Line(
      points={{-20,52.4},{-20,54},{-38,54},{-38,76},{-38.8,76}},
      color={0,127,127},
      thickness=1));
  connect(doubleLeakageConveyor.outflowUntested, outflowUntested.port_a)
    annotation (Line(
      points={{28,52.4},{28,54},{34,54},{34,72},{36.8,72}},
      color={0,127,127},
      thickness=1));
  connect(outflowTested.port_a, doubleLeakageConveyor.outflowTested)
    annotation (Line(
      points={{38.8,-22},{32,-22},{32,23.6},{28,23.6}},
      color={0,127,127},
      thickness=1));
  connect(inflowTested.port_b, doubleLeakageConveyor.inflowTested)
    annotation (Line(
      points={{-52.8,6},{-44,6},{-44,23.6},{-20,23.6}},
      color={0,127,127},
      thickness=1));
  connect(deathUntestedFractionRate.y, doubleLeakageConveyor.deathFractionUntestedRate)
    annotation (Line(points={{-74.5,57},{-49.25,57},{-49.25,45.68},{-22.4,
          45.68}}, color={0,0,127}));
  connect(deathTestedFractionRate.y, doubleLeakageConveyor.deathFractionTestedRate)
    annotation (Line(points={{-68.5,-21},{-36,-21},{-36,17.84},{-22.4,17.84}},
        color={0,0,127}));
  connect(doubleLeakageConveyor.testedFractionRate, testedFractionRate.y)
    annotation (Line(points={{-3.44,36.32},{-51.72,36.32},{-51.72,35},{
          -74.5,35}}, color={0,0,127}));
  connect(inflowTested.port_a, fromTestedPopulation.port_b) annotation (
      Line(
      points={{-67.2,6},{-78,6}},
      color={0,127,127},
      thickness=1));
  connect(UntestedInit.port, fromUntestedPopulation1.port_a) annotation (
      Line(
      points={{-126,50},{-104,50},{-104,78},{-90,78}},
      color={0,127,127},
      thickness=1));
  connect(fromUntestedPopulation1.port_b, inflowUntested.port_a)
    annotation (Line(
      points={{-70,78},{-60,78},{-60,76},{-53.2,76}},
      color={0,127,127},
      thickness=1));
  connect(TestedInit.port, fromTestedPopulation.port_a) annotation (Line(
      points={{-142,-18},{-120,-18},{-120,6},{-98,6}},
      color={0,127,127},
      thickness=1));
  connect(add.u1, doubleLeakageConveyor.populationUntested) annotation (
      Line(points={{0.4,-65.2},{-32,-65.2},{-32,40.4},{-12.32,40.4}}, color=
         {0,0,127}));
  connect(add.u2, doubleLeakageConveyor.populationTested) annotation (Line(
        points={{0.4,-74.8},{-12.8,-74.8},{-12.8,11.6}}, color={0,0,127}));
  connect(add1.u1, doubleLeakageConveyor.deathUntested) annotation (Line(
        points={{40.4,-47.2},{40.4,40.4},{25.6,40.4}}, color={0,0,127}));
  connect(add1.u2, doubleLeakageConveyor.deathTested) annotation (Line(
        points={{40.4,-56.8},{25.6,-56.8},{25.6,11.6}}, color={0,0,127}));
  connect(add2.u1, populationUntestedOut.population) annotation (Line(
        points={{78.4,-53.2},{64,-53.2},{64,46},{76,46},{76,62}}, color={0,
          0,127}));
  connect(add2.u2, populationTestedOut.population) annotation (Line(points=
          {{78.4,-62.8},{74,-62.8},{74,-36},{80,-36},{80,-30}}, color={0,0,
          127}));
  connect(add.y, add3.u1) annotation (Line(points={{18.8,-70},{26,-70},{26,
          -71.2},{30.4,-71.2}}, color={0,0,127}));
  connect(add2.y, add3.u2) annotation (Line(points={{96.8,-58},{102,-58},{
          102,-96},{22,-96},{22,-80.8},{30.4,-80.8}}, color={0,0,127}));
  connect(add3.y, cimrmanovyHornic.u2) annotation (Line(points={{48.8,-76},
          {86,-76},{86,-84.8},{126.4,-84.8}}, color={0,0,127}));
  connect(add1.y, cimrmanovyHornic.u1) annotation (Line(points={{58.8,-52},
          {62,-52},{62,-70},{126.4,-70},{126.4,-75.2}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=864000,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestDoubleLeakageConveyorPopulationSum;
