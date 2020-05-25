within Covid19Modeling.UnitTests;
model TestArriving
  Physiolibrary.Population.Components.Population population
    annotation (Placement(transformation(extent={{-48,-4},{-28,16}})));
  Parts.Arriving arriving(
    timeOfArrival(displayUnit="d") = 86400,
    numberOfArrivingPerson=1,
    durationOdArrival=100)
    annotation (Placement(transformation(extent={{-78,40},{-58,60}})));
  inner interfaces.ModelSettings modelSettings
    annotation (Placement(transformation(extent={{72,-96},{92,-76}})));
equation
  connect(arriving.arriversFlow, population.port) annotation (Line(
      points={{-63,45.4},{-38,45.4},{-38,6}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=259200, __Dymola_Algorithm="Dassl"));
end TestArriving;
