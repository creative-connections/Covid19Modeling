within Covid19Modeling.UnitTests;
model TestLeakageConveyor
  Physiolibrary.Population.Sources.Growth growth(PopulationChange(
        displayUnit="1/d") = 0.00011574074074074)
    annotation (Placement(transformation(extent={{-90,-4},{-70,16}})));
  Physiolibrary.Population.Components.Population population1
    annotation (Placement(transformation(extent={{68,12},{88,32}})));
  Parts.TestedConveyor leakageConveyor(numberOfSlots=4, delay(displayUnit=
          "d") = 86400)
    annotation (Placement(transformation(extent={{-16,-10},{22,20}})));
  Physiolibrary.Types.Constants.PopulationChangeConst leakFractionRate(k=
        1.1574074074074e-06) "leakRaction/time"
    annotation (Placement(transformation(extent={{-76,-44},{-58,-30}})));
equation
  connect(population1.port, leakageConveyor.outflow) annotation (Line(
      points={{78,22},{48,22},{48,5},{22.76,5}},
      color={0,127,127},
      thickness=1));
  connect(growth.port_b, leakageConveyor.inflow) annotation (Line(
      points={{-70,6},{-42,6},{-42,5.3},{-15.62,5.3}},
      color={0,127,127},
      thickness=1));
  connect(leakFractionRate.y, leakageConveyor.deathFractionRate)
    annotation (Line(points={{-55.75,-37},{4.9,-37},{4.9,-1.9}}, color={0,0,
          127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(
      StopTime=259200,
      __Dymola_NumberOfIntervals=5000,
      __Dymola_Algorithm="Dassl"));
end TestLeakageConveyor;
