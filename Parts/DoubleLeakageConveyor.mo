within Covid19_modeling.Parts;
model DoubleLeakageConveyor
  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;

  parameter Boolean useDeathFractionRate = false;
  Physiolibrary.Types.RealIO.PopulationOutput populationUntested annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-58,28}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-68,10})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionUntestedRate if useDeathFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-56,-6},{-32,18}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,32})));
  Physiolibrary.Types.RealIO.PopulationOutput populationTested annotation (
      Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-66,-72}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-70,-110})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionTestedRate if useDeathFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-44,-102},{-20,-78}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-84})));
  Physiolibrary.Types.RealIO.PopulationChangeInput testedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-94,36},{-78,52}}), iconTransformation(
        extent={{-11,-11},{11,11}},
        rotation=0,
        origin={-31,-7})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput testedRate annotation (
      Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={65,-15}), iconTransformation(extent={{20,-18},{40,2}})));
  Physiolibrary.Population.Interfaces.PopulationPort_a inflowUntested
    annotation (Placement(transformation(extent={{-98,46},{-72,72}}),
        iconTransformation(extent={{-110,50},{-90,70}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflowUntested
    annotation (Placement(transformation(extent={{78,56},{102,80}}),
        iconTransformation(extent={{90,50},{110,70}})));
  Physiolibrary.Population.Interfaces.PopulationPort_a inflowTested annotation (
     Placement(transformation(extent={{-102,-54},{-76,-28}}),
        iconTransformation(extent={{-110,-70},{-90,-50}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflowTested
    annotation (Placement(transformation(extent={{66,-52},{86,-32}}),
        iconTransformation(extent={{90,-70},{110,-50}})));
  Physiolibrary.Types.RealIO.PopulationOutput deathUntested annotation (
      Placement(transformation(extent={{34,2},{54,22}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,10})));
  Physiolibrary.Types.RealIO.PopulationOutput deathTested annotation (Placement(
        transformation(extent={{26,-98},{46,-78}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,-110})));
  TestedConveyor testedConveyor(numberOfSlots=numberOfSlots, delay=delay)
    annotation (Placement(transformation(extent={{-60,-90},{42,6}})));
  UntestedConveyor untestedConveyor(numberOfSlots=numberOfSlots, delay=delay)
    annotation (Placement(transformation(extent={{-60,8},{40,108}})));
  PopulationChangeMeasure testedRateMeasure annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={44,-2})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput untestedDeathRate
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={57,29}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,10})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput testedDeathRate
    annotation (Placement(transformation(
        extent={{-9,-9},{9,9}},
        rotation=0,
        origin={67,-71}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50,-110})));
equation
  if not useDeathFractionRate then
    untestedConveyor.deathFractionRate = 0;
    testedConveyor.deathFractionRate = 0;
  end if;
  connect(testedConveyor.outflow, outflowTested) annotation (Line(
      points={{44.04,-42},{76,-42}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.outflow, outflowUntested) annotation (Line(
      points={{42,68},{64,68},{64,68},{90,68}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.inflow, inflowUntested) annotation (Line(
      points={{-59,59},{-59,59},{-72,59},{-85,59}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.deathFractionRate, deathFractionUntestedRate)
    annotation (Line(points={{-5,35},{-5,6},{-44,6}}, color={0,0,127}));
  connect(untestedConveyor.population, populationUntested)
    annotation (Line(points={{-28,35},{-28,28},{-58,28}}, color={0,0,127}));
  connect(testedConveyor.population, populationTested) annotation (Line(points={
          {-27.36,-64.08},{-27.36,-72},{-66,-72}}, color={0,0,127}));
  connect(testedConveyor.deathPopulation, deathTested) annotation (Line(points={{18.54,
          -64.08},{18.54,-88},{36,-88}},        color={0,0,127}));
  connect(untestedConveyor.deathPopulation, deathUntested)
    annotation (Line(points={{17,35},{17,12},{44,12}}, color={0,0,127}));
  connect(testedConveyor.inflow, inflowTested) annotation (Line(
      points={{-58.98,-41.04},{-73.49,-41.04},{-73.49,-41},{-89,-41}},
      color={0,127,127},
      thickness=1));
  connect(testedConveyor.deathFractionRate, deathFractionTestedRate)
    annotation (Line(points={{-3.9,-64.08},{-3.9,-90},{-32,-90}}, color={0,0,127}));
  connect(testedRateMeasure.populationChange, testedRate)
    annotation (Line(points={{44,-9.2},{44,-15},{65,-15}}, color={0,0,127}));
  connect(testedRateMeasure.port_a, untestedConveyor.testedOutflow) annotation (
     Line(
      points={{51.2,-2},{86,-2},{86,50},{41,50}},
      color={0,127,127},
      thickness=1));
  connect(testedRateMeasure.port_b, inflowTested) annotation (Line(
      points={{36.8,-2},{-72,-2},{-72,-41.04},{-73.49,-41.04},{-73.49,-41},{-89,
          -41}},
      color={0,127,127},
      thickness=1));
  connect(untestedConveyor.testedFractionRate, testedFractionRate)
    annotation (Line(points={{-63,44},{-62,44},{-62,44},{-86,44}},
                                                 color={0,0,127}));
  connect(testedConveyor.deathRate, testedDeathRate) annotation (Line(
        points={{31.8,-64.08},{31.8,-71},{67,-71}}, color={0,0,127}));
  connect(untestedConveyor.deathRate, untestedDeathRate)
    annotation (Line(points={{30,35},{30,29},{57,29}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-254,106},{246,140}},
          lineColor={28,108,200},
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
end DoubleLeakageConveyor;
