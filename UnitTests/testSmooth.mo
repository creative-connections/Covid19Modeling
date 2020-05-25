within Covid19_modeling.UnitTests;
model testSmooth
  Modelica.Blocks.Sources.Step step
    annotation (Placement(transformation(extent={{-64,44},{-44,64}})));
  Parts.Smoothing smoothing(HalfTime(displayUnit="d") = 86400)
    annotation (Placement(transformation(extent={{-12,12},{20,44}})));
equation
  connect(step.y, smoothing.u)
    annotation (Line(points={{-43,54},{4,54},{4,36.96}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=604800, __Dymola_Algorithm="Dassl"));
end testSmooth;
