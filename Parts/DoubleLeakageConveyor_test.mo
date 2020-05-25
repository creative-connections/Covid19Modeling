within Covid19_modeling.Parts;
model DoubleLeakageConveyor_test
  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;

  parameter Boolean useDeathFractionRate = false;

  Physiolibrary.Types.RealIO.PopulationOutput populationUntested annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-52,32}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-68,10})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionUntestedRate if useDeathFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-50,-2},{-26,22}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,32})));
  Physiolibrary.Types.RealIO.PopulationOutput populationTested annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-52,-68}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-110})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionTestedRate if useDeathFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-34,-102},{-10,-78}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-84})));
  Physiolibrary.Types.RealIO.PopulationChangeInput testedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-88,40},{-72,56}}), iconTransformation(
        extent={{-11,-11},{11,11}},
        rotation=0,
        origin={-31,-7})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput testedRate annotation (
      Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={71,-11}), iconTransformation(extent={{20,-18},{40,2}})));
  Physiolibrary.Population.Interfaces.PopulationPort_a inflowUntested
    annotation (Placement(transformation(extent={{-92,50},{-66,76}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflowUntested
    annotation (Placement(transformation(extent={{84,60},{108,84}}),
        iconTransformation(extent={{90,50},{110,70}})));
  Physiolibrary.Population.Interfaces.PopulationPort_a inflowTested annotation (
     Placement(transformation(extent={{-96,-50},{-70,-24}}),
        iconTransformation(extent={{-110,-70},{-90,-50}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflowTested
    annotation (Placement(transformation(extent={{72,-48},{92,-28}}),
        iconTransformation(extent={{90,-70},{110,-50}})));
  Physiolibrary.Types.RealIO.PopulationOutput deathUntested annotation (
      Placement(transformation(extent={{50,12},{70,32}}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,10})));
  Physiolibrary.Types.RealIO.PopulationOutput deathTested  annotation (Placement(
        transformation(extent={{30,-88},{50,-68}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,-110})));
  TestedConveyor testedConveyor(numberOfSlots=numberOfSlots, delay=delay)
    annotation (Placement(transformation(extent={{-54,-86},{48,10}})));
  UntestedConveyor untestedConveyor(numberOfSlots=numberOfSlots, delay=delay)
    annotation (Placement(transformation(extent={{-54,12},{46,112}})));
  Parts.PopulationChangeMeasure testedRateMeasure annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={50,2})));
equation
  if not useDeathFractionRate then
    deathUntested=0;
    deathTested=0;
  end if;

  connect(testedConveyor.outflow, outflowTested) annotation (Line(
      points={{50.04,-38},{82,-38}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.outflow, outflowUntested) annotation (Line(
      points={{48,72},{96,72}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.inflow, inflowUntested) annotation (Line(
      points={{-53,63},{-79,63}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.deathFractionRate, deathFractionUntestedRate)
    annotation (Line(points={{1,39},{1,10},{-38,10}}, color={0,0,127}));
  connect(untestedConveyor.population, populationUntested)
    annotation (Line(points={{-22,39},{-22,32},{-52,32}}, color={0,0,127}));
  connect(testedConveyor.population, populationTested) annotation (Line(points={{-21.36,
          -60.08},{-21.36,-68},{-52,-68}},         color={0,0,127}));
  connect(testedConveyor.deathPopulation, deathTested) annotation (Line(points={{24.54,
          -60.08},{24.54,-78},{40,-78}},        color={0,0,127}));
  connect(untestedConveyor.deathPopulation, deathUntested)
    annotation (Line(points={{23,39},{23,22},{60,22}}, color={0,0,127}));
  connect(testedConveyor.inflow, inflowTested) annotation (Line(
      points={{-52.98,-37.04},{-67.49,-37.04},{-67.49,-37},{-83,-37}},
      color={0,127,127},
      thickness=1));
  connect(testedConveyor.deathFractionRate, deathFractionTestedRate)
    annotation (Line(points={{2.1,-60.08},{2.1,-90},{-22,-90}},   color={0,0,127}));
  connect(testedRateMeasure.populationChange, testedRate)
    annotation (Line(points={{50,-5.2},{50,-11},{71,-11}}, color={0,0,127}));
  connect(testedRateMeasure.port_a, untestedConveyor.testedOutflow) annotation (
     Line(
      points={{57.2,2},{92,2},{92,54},{47,54}},
      color={0,127,127},
      thickness=1));
  connect(testedRateMeasure.port_b, inflowTested) annotation (Line(
      points={{42.8,2},{-66,2},{-66,-37.04},{-67.49,-37.04},{-67.49,-37},{-83,-37}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.testedFractionRate, testedFractionRate)
    annotation (Line(points={{-57,48},{-80,48}}, color={0,0,127}));
  connect(populationTested, populationTested)
    annotation (Line(points={{-52,-68},{-52,-68}}, color={0,0,127}));
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
end DoubleLeakageConveyor_test;
