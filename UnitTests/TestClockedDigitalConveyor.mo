within Covid19_modeling.UnitTests;
model TestClockedDigitalConveyor
  Physiolibrary.Population.Sources.Growth growth(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-90,-4},{-70,16}})));
  Physiolibrary.Population.Components.Population population1
    annotation (Placement(transformation(extent={{58,-4},{78,16}})));
  Parts.LagConveyor lagConveyor(delay(displayUnit="d") = 86400)
    annotation (Placement(transformation(extent={{-18,-4},{2,16}})));
equation
  connect(growth.port_b, lagConveyor.inflow) annotation (Line(
      points={{-70,6},{-44,6},{-44,6.2},{-17.6,6.2}},
      color={0,127,127},
      thickness=1));
  connect(lagConveyor.outflow, population1.port) annotation (Line(
      points={{2.4,6},{68,6}},
      color={0,127,127},
      thickness=1));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=2592000,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestClockedDigitalConveyor;
