within Covid19Modeling.Parts;
model LeakConveyor
  Physiolibrary.Population.Interfaces.PopulationPort_a inflow annotation (
      Placement(transformation(extent={{-110,-10},{-90,10}}),
        iconTransformation(extent={{-108,-8},{-88,12}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b outflow annotation (
      Placement(transformation(extent={{90,-10},{110,10}}), iconTransformation(
          extent={{94,-10},{114,10}})));
  PopulationChangeMeasure populationChangeMeasure
    annotation (Placement(transformation(extent={{-48,-10},{-28,10}})));
  Physiolibrary.Population.Components.Change change(useChangeInput=true)
    annotation (Placement(transformation(extent={{62,-10},{82,10}})));
  Physiolibrary.Types.RealIO.PopulationOutput population annotation (
      Placement(transformation(extent={{22,-30},{42,-10}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={-2,-70})));

  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;
  parameter Physiolibrary.Types.Fraction fractionLeak=0;

  Physiolibrary.Population.Interfaces.PopulationPort_b leakOutflow annotation (
      Placement(transformation(extent={{58,34},{76,16}}),
        iconTransformation(extent={{34,-70},{54,-50}})));
  LeakDigitalConveyor leakDigitalConveyor( numberOfSlots=numberOfSlots, delay(displayUnit="d") = delay, fractionLeak = fractionLeak)
    annotation (Placement(transformation(extent={{-18,24},{24,58}})));
  Physiolibrary.Population.Components.Population populationInConveyor
    annotation (Placement(transformation(extent={{-16,-10},{4,10}})));
  Physiolibrary.Population.Components.Change changeLeak(useChangeInput=true)
    annotation (Placement(transformation(extent={{32,16},{52,36}})));
equation
  connect(change.port_b, outflow) annotation (Line(
      points={{82,0},{100,0}},
      color={0,127,127},
      thickness=1));
  connect(inflow, populationChangeMeasure.port_a) annotation (Line(
      points={{-100,0},{-47,0}},
      color={0,127,127},
      thickness=1));
  connect(leakDigitalConveyor.outflow, change.populationChange)
    annotation (Line(points={{26.1,41},{72,41},{72,4}}, color={0,0,127}));
  connect(populationChangeMeasure.populationChange, leakDigitalConveyor.inflow)
    annotation (Line(points={{-38,9},{-38,41},{-20.1,41}}, color={0,0,127}));
  connect(populationChangeMeasure.port_b, populationInConveyor.port)
    annotation (Line(
      points={{-29,0},{-6,0}},
      color={0,127,127},
      thickness=1));
  connect(population, populationInConveyor.population)
    annotation (Line(points={{32,-20},{0,-20},{0,-10}}, color={0,0,127}));
  connect(changeLeak.populationChange, leakDigitalConveyor.leakOutflow)
    annotation (Line(points={{42,30},{42,36},{26.1,36},{26.1,36.24}}, color=
         {0,0,127}));
  connect(changeLeak.port_b, leakOutflow) annotation (Line(
      points={{52,26},{58,26},{58,25},{67,25}},
      color={0,127,127},
      thickness=1));
  connect(populationInConveyor.port, change.port_a) annotation (Line(
      points={{-6,0},{62,0}},
      color={0,127,127},
      thickness=1));
  connect(changeLeak.port_a, change.port_a) annotation (Line(
      points={{32,26},{16,26},{16,0},{62,0}},
      color={0,127,127},
      thickness=1));
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
end LeakConveyor;
