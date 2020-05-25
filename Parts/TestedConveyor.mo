within Covid19_modeling.Parts;
model TestedConveyor
  Physiolibrary.Population.Interfaces.PopulationPort_a inflow annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-108,-8},{-88,12}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflow annotation (
      Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
          extent={{94,-10},{114,10}})));
  PopulationChangeMeasure populationChangeMeasure
    annotation (Placement(transformation(extent={{-84,-10},{-64,10}})));
  Physiolibrary.Population.Components.Change change(useChangeInput=true)
    annotation (Placement(transformation(extent={{62,-10},{82,10}})));
  Physiolibrary.Types.RealIO.PopulationOutput population annotation (
      Placement(transformation(extent={{-22,-30},{-2,-10}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-36,-46})));

  constant Modelica.SIunits.Time day=86400;
  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;

  Physiolibrary.Population.Components.Population populationInConveyor(
      population_start=0)
    annotation (Placement(transformation(extent={{-60,-10},{-40,10}})));
  Physiolibrary.Population.Components.Change changeLeak(useChangeInput=true)
    annotation (Placement(transformation(extent={{-12,28},{8,48}})));
  LeakageDigitalConveyor leakageDigitalConveyor( numberOfSlots=numberOfSlots, delay(displayUnit="d") = delay)
    annotation (Placement(transformation(extent={{-50,48},{-12,80}})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-68,30},{-54,44}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={10,-46})));
  Physiolibrary.Population.Components.Population populationDeath(
      population_start=0)
    annotation (Placement(transformation(extent={{12,28},{32,48}})));
  Physiolibrary.Types.RealIO.PopulationOutput deathPopulation annotation (
      Placement(transformation(extent={{34,8},{54,28}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={54,-46})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput deathRate annotation (
      Placement(transformation(extent={{10,46},{30,66}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={80,-46})));
equation
  connect(change.port_b, outflow) annotation (Line(
      points={{82,0},{100,0}},
      color={0,127,127},
      thickness=1));
  connect(inflow, populationChangeMeasure.port_a) annotation (Line(
      points={{-100,0},{-83,0}},
      color={0,127,127},
      thickness=1));
  connect(populationChangeMeasure.port_b, populationInConveyor.port)
    annotation (Line(
      points={{-65,0},{-50,0}},
      color={0,127,127},
      thickness=1));
  connect(population, populationInConveyor.population)
    annotation (Line(points={{-12,-20},{-44,-20},{-44,-10}},
                                                        color={0,0,127}));
  connect(populationInConveyor.port, change.port_a) annotation (Line(
      points={{-50,0},{62,0}},
      color={0,127,127},
      thickness=1));
  connect(changeLeak.port_a, change.port_a) annotation (Line(
      points={{-12,38},{-20,38},{-20,0},{62,0}},
      color={0,127,127},
      thickness=1));
  connect(populationChangeMeasure.populationChange, leakageDigitalConveyor.inflow)
    annotation (Line(points={{-74,9},{-74,64},{-51.9,64}},color={0,0,127}));
  connect(leakageDigitalConveyor.leakOutflow, changeLeak.populationChange)
    annotation (Line(points={{-10.1,59.52},{-2,59.52},{-2,42}},color={0,0,127}));
  connect(leakageDigitalConveyor.outflow, change.populationChange)
    annotation (Line(points={{-10.1,64},{72,64},{72,4}},color={0,0,127}));
  connect(deathFractionRate, leakageDigitalConveyor.leakFractionRate)
    annotation (Line(points={{-61,37},{-40.88,37},{-40.88,56}}, color={0,0,
          127}));
  connect(populationDeath.population, deathPopulation)
    annotation (Line(points={{28,28},{28,18},{44,18}}, color={0,0,127}));
  connect(changeLeak.port_b, populationDeath.port) annotation (Line(
      points={{8,38},{22,38}},
      color={0,127,127},
      thickness=1));
  connect(deathRate, changeLeak.populationChange)
    annotation (Line(points={{20,56},{-2,56},{-2,42}}, color={0,0,127}));
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
        Line(points={{84,44},{84,-36}}, color={0,0,0})}),
                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end TestedConveyor;
