within Covid19_modeling.Parts;
model FirstDoubleLeakConveyor
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
    annotation (Placement(transformation(extent={{-86,80},{-74,92}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,28})));
  Physiolibrary.Types.RealIO.PopulationOutput populationTested annotation (
      Placement(transformation(extent={{-2,-100},{14,-84}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-110})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionTestedRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-88,50},{-76,62}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-90})));
  Physiolibrary.Types.RealIO.PopulationChangeInput testedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-88,64},{-74,78}}), iconTransformation(
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
  Physiolibrary.Population.Interfaces.PopulationPort_b outflowTested
    annotation (Placement(transformation(extent={{60,-82},{80,-62}}),
        iconTransformation(extent={{90,-70},{110,-50}})));
  DoubleLeakDigitalConveyor doubleLeakDigitalConveyor(numberOfSlots=
        numberOfSlots, delay=delay)
    annotation (Placement(transformation(extent={{-46,50},{0,90}})));
  Physiolibrary.Population.Components.Population untestedPopulation
    annotation (Placement(transformation(extent={{-48,10},{-28,30}})));
  PopulationChangeMeasure inflowTestedMeasure
    annotation (Placement(transformation(extent={{-76,12},{-60,28}})));
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
  PopulationChangeMeasure inflowTestedMeasure1
    annotation (Placement(transformation(extent={{-64,-80},{-48,-64}})));
  Physiolibrary.Population.Components.Change deathTestedFlow(useChangeInput=
       true)
    annotation (Placement(transformation(extent={{4,-42},{20,-26}})));
  Physiolibrary.Population.Components.Population deathTestedPopulation
    annotation (Placement(transformation(extent={{40,-44},{60,-24}})));
  Physiolibrary.Population.Components.Change outflowFromTested(
      useChangeInput=true)
    annotation (Placement(transformation(extent={{14,-80},{30,-64}})));
  Physiolibrary.Population.Components.Change testingFlow(useChangeInput=
        true)
    annotation (Placement(transformation(extent={{-12,-34},{-28,-18}})));
  Physiolibrary.Population.Sources.Growth zeroFlow
    annotation (Placement(transformation(extent={{-96,-82},{-76,-62}})));
equation
  connect(inflowTestedMeasure.populationChange, doubleLeakDigitalConveyor.inflowUntested)
    annotation (Line(points={{-68,27.2},{-68,82},{-48.3,82}}, color={0,0,
          127}));
  connect(inflowTestedMeasure.port_b, untestedPopulation.port) annotation (
      Line(
      points={{-60.8,20},{-38,20}},
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
  connect(doubleLeakDigitalConveyor.deathUntestedRate, deathUntestedFlow.populationChange)
    annotation (Line(points={{2.3,76.4},{38,76.4},{38,49.2}}, color={0,0,
          127}));
  connect(outflowFromUntested.populationChange, doubleLeakDigitalConveyor.outflowUntested)
    annotation (Line(points={{50,23.2},{50,82},{2.3,82}}, color={0,0,127}));
  connect(doubleLeakDigitalConveyor.deathFractionUntestedRate,
    deathFractionUntestedRate) annotation (Line(points={{-48.3,75.6},{-65.15,
          75.6},{-65.15,86},{-80,86}}, color={0,0,127}));
  connect(populationUntested, untestedPopulation.population) annotation (
      Line(points={{-17,-7},{-32,-7},{-32,10}}, color={0,0,127}));
  connect(doubleLeakDigitalConveyor.testedFractionRate, testedFractionRate)
    annotation (Line(points={{-29.9,70},{-56,70},{-56,71},{-81,71}}, color=
          {0,0,127}));
  connect(inflowTestedMeasure.port_a, inflowUntested) annotation (Line(
      points={{-75.2,20},{-96,20}},
      color={0,127,127},
      thickness=1));
  connect(testedPopulation.port, inflowTestedMeasure1.port_b) annotation (
      Line(
      points={{-28,-72},{-48.8,-72}},
      color={0,127,127},
      thickness=1));
  connect(inflowTestedMeasure1.populationChange, doubleLeakDigitalConveyor.inflowTested)
    annotation (Line(points={{-56,-64.8},{-56,58},{-48.3,58}}, color={0,0,
          127}));
  connect(doubleLeakDigitalConveyor.deathFractionTestedRate,
    deathFractionTestedRate) annotation (Line(points={{-48.3,52},{-64,52},{
          -64,56},{-82,56}}, color={0,0,127}));
  connect(deathTestedFlow.port_b, deathTestedPopulation.port) annotation (
      Line(
      points={{20,-34},{50,-34}},
      color={0,127,127},
      thickness=1));
  connect(testedPopulation.port, outflowFromTested.port_a) annotation (Line(
      points={{-28,-72},{14,-72}},
      color={0,127,127},
      thickness=1));
  connect(outflowFromTested.port_b, outflowTested) annotation (Line(
      points={{30,-72},{70,-72}},
      color={0,127,127},
      thickness=1));
  connect(doubleLeakDigitalConveyor.outflowTested, outflowFromTested.populationChange)
    annotation (Line(points={{2.3,58},{22,58},{22,-68.8}}, color={0,0,127}));
  connect(deathTestedFlow.port_a, outflowFromTested.port_a) annotation (
      Line(
      points={{4,-34},{-4,-34},{-4,-72},{14,-72}},
      color={0,127,127},
      thickness=1));
  connect(doubleLeakDigitalConveyor.deathTestedRate, deathTestedFlow.populationChange)
    annotation (Line(points={{2.3,52.4},{12,52.4},{12,-30.8}}, color={0,0,
          127}));
  connect(deathUntestedPopulation.population, deathUntested)
    annotation (Line(points={{74,38},{74,33},{93,33}}, color={0,0,127}));
  connect(deathTestedPopulation.population, deathTested) annotation (Line(
        points={{56,-44},{56,-55},{85,-55}}, color={0,0,127}));
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
  connect(doubleLeakDigitalConveyor.testedRate, testingFlow.populationChange)
    annotation (Line(points={{-16.1,70},{18,70},{18,-12},{-20,-12},{-20,-22.8}},
        color={0,0,127}));
  connect(testingFlow.populationChange, testedRate) annotation (Line(points=
         {{-20,-22.8},{-20,-16},{-42,-16}}, color={0,0,127}));
  connect(zeroFlow.port_b, inflowTestedMeasure1.port_a) annotation (Line(
      points={{-76,-72},{-63.2,-72}},
      color={0,127,127},
      thickness=1));
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
end FirstDoubleLeakConveyor;
