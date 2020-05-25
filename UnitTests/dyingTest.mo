within Covid19_modeling.UnitTests;
model dyingTest
  Parts.Dying dying
    annotation (Placement(transformation(extent={{-20,4},{0,24}})));
  inner interfaces.ModelSettings modelSettings
    annotation (Placement(transformation(extent={{46,72},{66,92}})));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=432000, __Dymola_Algorithm="Dassl"));
end dyingTest;
