within Covid19Modeling.Parts;
model UntestedConveyor
  Physiolibrary.Population.Interfaces.PopulationPort_a inflow annotation (
      Placement(transformation(extent={{-110,-42},{-90,-22}}),
        iconTransformation(extent={{-108,-8},{-88,12}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflow annotation (
      Placement(transformation(extent={{86,-42},{106,-22}}), iconTransformation(
          extent={{94,10},{114,30}})));
  PopulationChangeMeasure populationChangeMeasure
    annotation (Placement(transformation(extent={{-92,-42},{-72,-22}})));
  Physiolibrary.Population.Components.Change outFlowLeak(useChangeInput=true)
    annotation (Placement(transformation(extent={{50,-42},{70,-22}})));
  Physiolibrary.Types.RealIO.PopulationOutput population annotation (Placement(
        transformation(extent={{-24,-62},{-4,-42}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-36,-46})));

  constant Modelica.SIunits.Time day=86400;
  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;

  Physiolibrary.Population.Components.Population populationInConveyor(
      population_start=0)
    annotation (Placement(transformation(extent={{-54,-42},{-34,-22}})));
  Physiolibrary.Population.Components.Change deathLeak(useChangeInput=true)
    annotation (Placement(transformation(extent={{12,-4},{32,16}})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-76,10},{-62,24}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-46})));
  Leakage2DigitalConveyor leakage2DigitalConveyor(numberOfSlots=numberOfSlots,
      delay=delay)
    annotation (Placement(transformation(extent={{-72,22},{-14,68}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b testedOutflow
    annotation (Placement(transformation(extent={{4,12},{24,32}}),
        iconTransformation(extent={{92,-26},{112,-6}})));
  Physiolibrary.Types.RealIO.PopulationChangeInput testedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-66,-4},{-52,10}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-106,-28})));
  Physiolibrary.Population.Components.Change testedLeak(useChangeInput=true)
    annotation (Placement(transformation(extent={{-16,12},{4,32}})));
  Physiolibrary.Types.RealIO.PopulationOutput deathPopulation annotation (
      Placement(transformation(extent={{54,-22},{70,-6}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-46})));
  Physiolibrary.Population.Components.Population populationDeath(
      population_start=0)
    annotation (Placement(transformation(extent={{34,-4},{54,16}})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput deathRate annotation (
      Placement(transformation(extent={{40,28},{60,48}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-46})));
equation
  connect(population, populationInConveyor.population)
    annotation (Line(points={{-14,-52},{-38,-52},{-38,-42}}, color={0,0,127}));
  connect(leakage2DigitalConveyor.deathFractionRate, deathFractionRate)
    annotation (Line(points={{-60.4,33.5},{-60.4,17},{-69,17}}, color={0,0,127}));
  connect(leakage2DigitalConveyor.testFractionRate, testedFractionRate)
    annotation (Line(points={{-48.8,33.5},{-48.8,3},{-59,3}}, color={0,0,127}));

  connect(testedLeak.port_b, testedOutflow) annotation (Line(
      points={{4,22},{14,22}},
      color={0,127,127},
      thickness=1));
  connect(deathLeak.port_b, populationDeath.port) annotation (Line(
      points={{32,6},{44,6}},
      color={0,127,127},
      thickness=1));
  connect(populationDeath.population, deathPopulation)
    annotation (Line(points={{50,-4},{50,-14},{62,-14}}, color={0,0,127}));
  connect(inflow, populationChangeMeasure.port_a) annotation (Line(
      points={{-100,-32},{-91,-32}},
      color={0,127,127},
      thickness=1));
  connect(populationChangeMeasure.populationChange, leakage2DigitalConveyor.inflow)
    annotation (Line(points={{-82,-23},{-82,45},{-74.9,45}}, color={0,0,127}));
  connect(populationChangeMeasure.port_b, populationInConveyor.port)
    annotation (Line(
      points={{-73,-32},{-44,-32}},
      color={0,127,127},
      thickness=1));
  connect(leakage2DigitalConveyor.outflow, outFlowLeak.populationChange)
    annotation (Line(points={{-11.1,50.06},{78,50.06},{78,-22},{60,-22},{60,-28}},
        color={0,0,127}));
  connect(outFlowLeak.port_b, outflow) annotation (Line(
      points={{70,-32},{96,-32}},
      color={0,127,127},
      thickness=1));
  connect(populationInConveyor.port, outFlowLeak.port_a) annotation (Line(
      points={{-44,-32},{50,-32}},
      color={0,127,127},
      thickness=1));
  connect(deathLeak.port_a, outFlowLeak.port_a) annotation (Line(
      points={{12,6},{0,6},{0,-32},{50,-32}},
      color={0,127,127},
      thickness=1));
  connect(testedLeak.port_a, outFlowLeak.port_a) annotation (Line(
      points={{-16,22},{-20,22},{-20,-32},{50,-32}},
      color={0,127,127},
      thickness=1));
  connect(deathLeak.populationChange, leakage2DigitalConveyor.deathOutflow)
    annotation (Line(points={{22,10},{22,44.54},{-11.1,44.54}}, color={0,0,127}));
  connect(leakage2DigitalConveyor.testOutflow, testedLeak.populationChange)
    annotation (Line(points={{-11.1,39.02},{-6,39.02},{-6,26}}, color={0,0,127}));
  connect(deathRate, leakage2DigitalConveyor.deathOutflow) annotation (Line(
        points={{50,38},{22,38},{22,44.54},{-11.1,44.54}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-144,66},{148,48}},
          lineColor={28,108,200},
          textString="%name"),
        Rectangle(extent={{-100,44},{100,-36}}, lineColor={0,0,0}),
        Line(points={{-76,44},{-76,-36}}, color={0,0,0}),
        Line(points={{-56,44},{-56,-36}}, color={0,0,0}),
        Line(points={{-36,44},{-36,-36}}, color={0,0,0}),
        Line(points={{-16,44},{-16,-36}}, color={0,0,0}),
        Line(points={{4,44},{4,-36}}, color={0,0,0}),
        Line(points={{24,44},{24,-36}}, color={0,0,0}),
        Line(points={{44,44},{44,-36}}, color={0,0,0}),
        Line(points={{64,44},{64,-36}}, color={0,0,0}),
        Line(points={{84,44},{84,-36}}, color={0,0,0})}), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end UntestedConveyor;
