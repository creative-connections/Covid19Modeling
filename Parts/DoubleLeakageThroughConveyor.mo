within Covid19Modeling.Parts;
model DoubleLeakageThroughConveyor
  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;

  Physiolibrary.Types.RealIO.PopulationOutput populationUntested
    annotation (Placement(transformation(extent={{-24,-14},{-10,0}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-68,10})));
  Physiolibrary.Types.RealIO.PopulationChangeInput
    deathFractionUntestedRate "leak fraction (relative number) /time"
    annotation (Placement(transformation(extent={{-98,76},{-86,88}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,32})));
  Physiolibrary.Types.RealIO.PopulationOutput populationTested annotation (
      Placement(transformation(extent={{-2,-100},{14,-84}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-110})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionTestedRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-90,46},{-76,60}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-84})));
  Physiolibrary.Types.RealIO.PopulationChangeInput testedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-102,62},{-86,78}}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,0})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput testedRate annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-42,-16}), iconTransformation(extent={{20,-10},{40,10}})));
  Physiolibrary.Population.Interfaces.PopulationPort_a inflowUntested
    annotation (Placement(transformation(extent={{-106,10},{-86,30}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflowUntested
    annotation (Placement(transformation(extent={{60,10},{80,30}}),
        iconTransformation(extent={{90,50},{110,70}})));
  Physiolibrary.Population.Interfaces.PopulationPort_a inflowTested
    annotation (Placement(transformation(extent={{-106,-82},{-86,-62}}),
        iconTransformation(extent={{-110,-70},{-90,-50}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflowTested
    annotation (Placement(transformation(extent={{60,-82},{80,-62}}),
        iconTransformation(extent={{90,-70},{110,-50}})));
  Physiolibrary.Population.Components.Population untestedPopulation
    annotation (Placement(transformation(extent={{-48,10},{-28,30}})));
  Parts.PopulationChangeMeasure inflowTestedMeasure
    annotation (Placement(transformation(extent={{-70,12},{-54,28}})));
  Physiolibrary.Population.Components.Change outflowFromUntested(
      useChangeInput=true)
    annotation (Placement(transformation(extent={{42,12},{58,28}})));
  Physiolibrary.Types.RealIO.PopulationOutput deathUntested annotation (
      Placement(transformation(extent={{86,26},{100,40}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,10})));
  Physiolibrary.Types.RealIO.PopulationOutput deathTested annotation (
      Placement(transformation(extent={{78,-62},{92,-48}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,-110})));
  Physiolibrary.Population.Components.Change deathUntestedFlow(
      useChangeInput=true)
    annotation (Placement(transformation(extent={{30,38},{46,54}})));
  Physiolibrary.Population.Components.Population deathUntestedPopulation
    annotation (Placement(transformation(extent={{58,38},{78,54}})));
  Physiolibrary.Population.Components.Population testedPopulation
    annotation (Placement(transformation(extent={{-38,-82},{-18,-62}})));
  Parts.PopulationChangeMeasure inflowTestedMeasure1
    annotation (Placement(transformation(extent={{-64,-80},{-48,-64}})));
  Physiolibrary.Population.Components.Change deathTestedFlow(useChangeInput=
       true)
    annotation (Placement(transformation(extent={{4,-50},{20,-34}})));
  Physiolibrary.Population.Components.Population deathTestedPopulation
    annotation (Placement(transformation(extent={{40,-52},{60,-32}})));
  Physiolibrary.Population.Components.Change outflowFromTested(
      useChangeInput=true)
    annotation (Placement(transformation(extent={{16,-80},{32,-64}})));
  Physiolibrary.Population.Components.Change testingFlow(useChangeInput=
        true)
    annotation (Placement(transformation(extent={{-12,-34},{-28,-18}})));
  DoubleLeakageThroughDigitalConveyor doubleLeakageThroughDigitalConveyor
    annotation (Placement(transformation(extent={{-32,54},{12,92}})));
equation
  connect(inflowTestedMeasure.port_b, untestedPopulation.port) annotation (
      Line(
      points={{-54.8,20},{-38,20}},
      color={0,127,127},
      thickness=1));
  connect(untestedPopulation.port, outflowFromUntested.port_a) annotation (
      Line(
      points={{-38,20},{42,20}},
      color={0,127,127},
      thickness=1));
  connect(outflowFromUntested.port_b, outflowUntested) annotation (Line(
      points={{58,20},{70,20}},
      color={0,127,127},
      thickness=1));
  connect(untestedPopulation.port, deathUntestedFlow.port_a) annotation (
      Line(
      points={{-38,20},{6,20},{6,46},{30,46}},
      color={0,127,127},
      thickness=1));
  connect(deathUntestedFlow.port_b, deathUntestedPopulation.port)
    annotation (Line(
      points={{46,46},{68,46}},
      color={0,127,127},
      thickness=1));
  connect(populationUntested, untestedPopulation.population) annotation (
      Line(points={{-17,-7},{-32,-7},{-32,10}}, color={0,0,127}));
  connect(inflowTestedMeasure.port_a, inflowUntested) annotation (Line(
      points={{-69.2,20},{-96,20}},
      color={0,127,127},
      thickness=1));
  connect(testedPopulation.port, inflowTestedMeasure1.port_b) annotation (
      Line(
      points={{-28,-72},{-48.8,-72}},
      color={0,127,127},
      thickness=1));
  connect(inflowTestedMeasure1.port_a, inflowTested) annotation (Line(
      points={{-63.2,-72},{-96,-72}},
      color={0,127,127},
      thickness=1));
  connect(deathTestedFlow.port_b, deathTestedPopulation.port) annotation (
      Line(
      points={{20,-42},{50,-42}},
      color={0,127,127},
      thickness=1));
  connect(testedPopulation.port, outflowFromTested.port_a) annotation (Line(
      points={{-28,-72},{16,-72}},
      color={0,127,127},
      thickness=1));
  connect(outflowFromTested.port_b, outflowTested) annotation (Line(
      points={{32,-72},{70,-72}},
      color={0,127,127},
      thickness=1));
  connect(deathTestedFlow.port_a, outflowFromTested.port_a) annotation (
      Line(
      points={{4,-42},{-4,-42},{-4,-72},{16,-72}},
      color={0,127,127},
      thickness=1));
  connect(deathUntestedPopulation.population, deathUntested)
    annotation (Line(points={{74,38},{74,33},{93,33}}, color={0,0,127}));
  connect(deathTestedPopulation.population, deathTested) annotation (Line(
        points={{56,-52},{56,-55},{85,-55}}, color={0,0,127}));
  connect(testedPopulation.population, populationTested) annotation (Line(
        points={{-22,-82},{-22,-92},{6,-92}}, color={0,0,127}));
  connect(testingFlow.port_a, outflowFromUntested.port_a) annotation (Line(
      points={{-12,-26},{6,-26},{6,20},{42,20}},
      color={0,127,127},
      thickness=1));
  connect(testingFlow.port_b, inflowTestedMeasure1.port_b) annotation (Line(
      points={{-28,-26},{-42,-26},{-42,-72},{-48.8,-72}},
      color={0,127,127},
      thickness=1));
  connect(testingFlow.populationChange, testedRate) annotation (Line(points=
         {{-20,-22.8},{-20,-16},{-42,-16}}, color={0,0,127}));
  connect(inflowTestedMeasure.populationChange,
    doubleLeakageThroughDigitalConveyor.inflowUntested) annotation (Line(
        points={{-62,27.2},{-62,86},{-34.2,86},{-34.2,87.06}}, color={0,0,
          127}));
  connect(inflowTestedMeasure1.populationChange,
    doubleLeakageThroughDigitalConveyor.inflowTested) annotation (Line(
        points={{-56,-64.8},{-52,-64.8},{-52,66},{-34.2,66},{-34.2,65.02}},
        color={0,0,127}));
  connect(deathFractionUntestedRate, doubleLeakageThroughDigitalConveyor.deathUntestedFractionRate)
    annotation (Line(points={{-92,82},{-58,82},{-58,80.98},{-34.2,80.98}},
        color={0,0,127}));
  connect(testedFractionRate, doubleLeakageThroughDigitalConveyor.testFractionRate)
    annotation (Line(points={{-94,70},{-56,70},{-56,72.24},{-16.6,72.24}},
        color={0,0,127}));
  connect(deathFractionTestedRate, doubleLeakageThroughDigitalConveyor.deathTestedFractionRate)
    annotation (Line(points={{-83,53},{-42,53},{-42,58.18},{-34.2,58.18}},
        color={0,0,127}));
  connect(doubleLeakageThroughDigitalConveyor.outflowUntested,
    outflowFromUntested.populationChange) annotation (Line(points={{14.2,
          86.3},{50,86.3},{50,23.2}}, color={0,0,127}));
  connect(doubleLeakageThroughDigitalConveyor.outflowTested,
    outflowFromTested.populationChange) annotation (Line(points={{14.2,
          64.26},{24,64.26},{24,-68.8}}, color={0,0,127}));
  connect(doubleLeakageThroughDigitalConveyor.deathOutflowTested,
    deathTestedFlow.populationChange) annotation (Line(points={{14.2,58.18},
          {22,58.18},{22,-32},{12,-32},{12,-38.8}}, color={0,0,127}));
  connect(doubleLeakageThroughDigitalConveyor.deathOutflowUntested,
    deathUntestedFlow.populationChange) annotation (Line(points={{14.2,
          81.36},{38,81.36},{38,49.2}}, color={0,0,127}));
  connect(doubleLeakageThroughDigitalConveyor.testThroughFlow, testedRate)
    annotation (Line(points={{-3.4,72.24},{26,72.24},{26,-16},{-42,-16}},
        color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-254,106},{246,140}},
          lineColor={0,0,255},
          textString="%name"),
        Rectangle(
          extent={{-100,100},{100,20}},
          lineColor={0,0,0},
          fillColor={208,253,255},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,100},{-80,20}}, color={0,0,0}),
        Line(points={{-60,100},{-60,20}}, color={0,0,0}),
        Line(points={{-40,100},{-40,20}}, color={0,0,0}),
        Line(points={{-20,100},{-20,20}}, color={0,0,0}),
        Line(points={{0,100},{0,20}}, color={0,0,0}),
        Line(points={{20,100},{20,20}}, color={0,0,0}),
        Line(points={{40,100},{40,20}}, color={0,0,0}),
        Line(points={{60,100},{60,20}}, color={0,0,0}),
        Line(points={{80,100},{80,20}}, color={0,0,0}),
        Rectangle(
          extent={{-100,-20},{100,-100}},
          lineColor={0,0,0},
          fillColor={255,241,230},
          fillPattern=FillPattern.Solid),
        Line(points={{-80,-20},{-80,-100}}, color={0,0,0}),
        Line(points={{-60,-20},{-60,-100}}, color={0,0,0}),
        Line(points={{-38,-20},{-38,-100}}, color={0,0,0}),
        Line(points={{-20,-20},{-20,-100}}, color={0,0,0}),
        Line(points={{0,-20},{0,-100}}, color={0,0,0}),
        Line(points={{20,-20},{20,-100}}, color={0,0,0}),
        Line(points={{40,-20},{40,-100}}, color={0,0,0}),
        Line(points={{60,-20},{60,-100}}, color={0,0,0}),
        Line(points={{82,-20},{82,-100}}, color={0,0,0}),
        Rectangle(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,0},
          fillColor={208,253,255},
          fillPattern=FillPattern.VerticalCylinder),
        Text(
          extent={{-100,84},{104,38}},
          lineColor={0,0,0},
          fillColor={255,213,170},
          fillPattern=FillPattern.Solid,
          textString="Untested"),
        Text(
          extent={{-98,-38},{106,-84}},
          lineColor={0,0,0},
          fillColor={255,213,170},
          fillPattern=FillPattern.Solid,
          textString="Tested"),
        Polygon(
          points={{-10,-10},{0,-20},{8,-10},{0,-10},{-10,-10}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-4,20},{2,-10}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end DoubleLeakageThroughConveyor;
