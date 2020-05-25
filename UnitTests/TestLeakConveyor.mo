within Covid19Modeling.UnitTests;
model TestLeakConveyor
  Physiolibrary.Population.Sources.Growth growth(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-90,-4},{-70,16}})));
  Physiolibrary.Population.Components.Population population1
    annotation (Placement(transformation(extent={{58,-4},{78,16}})));
  Physiolibrary.Population.Components.Population leakPopulation
    annotation (Placement(transformation(extent={{-28,-46},{-8,-26}})));
  Parts.LeakConveyor leakConveyor(
    numberOfSlots=4,
    delay(displayUnit="d") = 86400,
    fractionLeak=0.1)
    annotation (Placement(transformation(extent={{-32,-10},{-12,10}})));
equation
  connect(leakConveyor.outflow, population1.port) annotation (Line(
      points={{-11.6,0},{28,0},{28,6},{68,6}},
      color={0,127,127},
      thickness=1));
  connect(leakConveyor.inflow, growth.port_b) annotation (Line(
      points={{-31.8,0.2},{-50.9,0.2},{-50.9,6},{-70,6}},
      color={0,127,127},
      thickness=1));
  connect(leakConveyor.leakOutflow, leakPopulation.port) annotation (Line(
      points={{-17.6,-6},{-18,-6},{-18,-36}},
      color={0,127,127},
      thickness=1));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=259200,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestLeakConveyor;
