within Covid19Modeling.Parts;
model LagConveyor
  Physiolibrary.Population.Interfaces.PopulationPort_a inflow annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-106,-8},{-86,12}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflow annotation (
      Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
          extent={{94,-10},{114,10}})));
  PopulationChangeMeasure populationChangeMeasure
    annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Physiolibrary.Population.Components.Change change(useChangeInput=true)
    annotation (Placement(transformation(extent={{54,-10},{74,10}})));
  Physiolibrary.Population.Components.Population conveyorPopulation
    annotation (Placement(transformation(extent={{-8,-10},{12,10}})));
  DigitalConveyor digitalConveyor(numberOfSlots=numberOfSlots, delay(displayUnit="d") = delay)
    annotation (Placement(transformation(extent={{-10,48},{10,68}})));
  Physiolibrary.Types.RealIO.PopulationOutput population annotation (
      Placement(transformation(extent={{38,-54},{58,-34}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,-70})));

  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;

equation
  connect(inflow, populationChangeMeasure.port_a) annotation (Line(
      points={{-100,0},{-47,0}},
      color={0,127,127},
      thickness=1));
  connect(populationChangeMeasure.port_b, conveyorPopulation.port)
    annotation (Line(
      points={{-29,0},{2,0}},
      color={0,127,127},
      thickness=1));
  connect(conveyorPopulation.port, change.port_a) annotation (Line(
      points={{2,0},{54,0}},
      color={0,127,127},
      thickness=1));
  connect(change.port_b, outflow) annotation (Line(
      points={{74,0},{100,0}},
      color={0,127,127},
      thickness=1));
  connect(populationChangeMeasure.populationChange, digitalConveyor.inflow)
    annotation (Line(points={{-38,9},{-38,58},{-11,58}}, color={0,0,127}));
  connect(digitalConveyor.outflow, change.populationChange)
    annotation (Line(points={{11,58},{64,58},{64,4}}, color={0,0,127}));
  connect(conveyorPopulation.population, population)
    annotation (Line(points={{8,-10},{8,-44},{48,-44}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(extent={{-100,60},{100,-60}}, lineColor={0,0,0}),
        Line(points={{-60,60},{-60,-60}}, color={0,0,0}),
        Line(points={{-20,60},{-20,-60}}, color={0,0,0}),
        Line(points={{20,60},{20,-60}}, color={0,0,0}),
        Line(points={{60,60},{60,-60}}, color={0,0,0}),
        Text(
          extent={{-142,86},{150,68}},
          lineColor={28,108,200},
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end LagConveyor;
