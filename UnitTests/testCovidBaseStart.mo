within Covid19_modeling.UnitTests;
model testCovidBaseStart
  Physiolibrary.Population.Components.Population uninfectedAtRisk(
      population_start=1e6)
    annotation (Placement(transformation(extent={{-178,-4},{-148,26}})));
  Physiolibrary.Population.Components.Population recovered
    annotation (Placement(transformation(extent={{-16,-12},{24,22}})));
  Physiolibrary.Population.Components.Change newInfectious[Severity](
      PopulationChange=0.0011574074074074)
    annotation (Placement(transformation(extent={{-146,0},{-120,22}})));
  Physiolibrary.Population.Sources.Growth arrivingAsyptomatic[Severity]
    annotation (Placement(transformation(extent={{-140,50},{-120,70}})));
  Parts.FirstDoubleLeakageConveyor infectedNotContagious[Severity]
    annotation (Placement(transformation(extent={{-96,-18},{-60,18}})));

  type Severity = enumeration(
      Asymptomatic,
      Mild,
      Moderate,
      Severe);

  Physiolibrary.Types.Constants.PopulationChangeConst UntestedDeathRateFraction[
    Severity](k=1.1574074074074e-07)
    annotation (Placement(transformation(extent={{-178,-14},{-170,-6}})));
  Physiolibrary.Types.Constants.PopulationChangeConst TestedDeathRateFraction[Severity](k=
        1.1574074074074e-07)
    annotation (Placement(transformation(extent={{-172,-56},{-164,-48}})));
  Physiolibrary.Types.Constants.PopulationChangeConst TestedRateFraction[Severity](k=
        4.6296296296296e-07)
    annotation (Placement(transformation(extent={{-144,-26},{-136,-18}})));
equation

  connect(newInfectious.port_b, infectedNotContagious.inflowUntested)
    annotation (Line(
      points={{-120,11},{-108,11},{-108,10.8},{-96,10.8}},
      color={0,127,127},
      thickness=1));
  connect(arrivingAsyptomatic.port_b, infectedNotContagious.inflowUntested)
    annotation (Line(
      points={{-120,60},{-108,60},{-108,10.8},{-96,10.8}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious[1].outflowUntested, recovered.port) annotation (
     Line(
      points={{-60,10.8},{-28,10.8},{-28,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious[2].outflowUntested, recovered.port) annotation (
     Line(
      points={{-60,10.8},{-28,10.8},{-28,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious[3].outflowUntested, recovered.port) annotation (
     Line(
      points={{-60,10.8},{-28,10.8},{-28,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious[4].outflowUntested, recovered.port) annotation (
     Line(
      points={{-60,10.8},{-28,10.8},{-28,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(UntestedDeathRateFraction.y, infectedNotContagious.deathFractionUntestedRate)
    annotation (Line(points={{-169,-10},{-114,-10},{-114,5.76},{-97.8,5.76}},
        color={0,0,127}));
  connect(TestedDeathRateFraction.y, infectedNotContagious.deathFractionTestedRate)
    annotation (Line(points={{-163,-52},{-102,-52},{-102,-15.12},{-97.8,-15.12}},
        color={0,0,127}));
  connect(TestedRateFraction.y, infectedNotContagious.testedFractionRate)
    annotation (Line(points={{-135,-22},{-110,-22},{-110,-1.26},{-83.58,-1.26}},
        color={0,0,127}));
  connect(infectedNotContagious[1].outflowTested, recovered.port) annotation (
      Line(
      points={{-60,-10.8},{-33,-10.8},{-33,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious[2].outflowTested, recovered.port) annotation (
      Line(
      points={{-60,-10.8},{-33,-10.8},{-33,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious[3].outflowTested, recovered.port) annotation (
      Line(
      points={{-60,-10.8},{-32,-10.8},{-32,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(infectedNotContagious[4].outflowTested, recovered.port) annotation (
      Line(
      points={{-60,-10.8},{-28,-10.8},{-28,5},{4,5}},
      color={0,127,127},
      thickness=1));
  connect(uninfectedAtRisk.port, newInfectious[1].port_a) annotation (Line(
      points={{-163,11},{-154.5,11},{-154.5,11},{-146,11}},
      color={0,127,127},
      thickness=1));
  connect(uninfectedAtRisk.port, newInfectious[2].port_a) annotation (Line(
      points={{-163,11},{-154.5,11},{-154.5,11},{-146,11}},
      color={0,127,127},
      thickness=1));
  connect(uninfectedAtRisk.port, newInfectious[3].port_a) annotation (Line(
      points={{-163,11},{-153.5,11},{-153.5,11},{-146,11}},
      color={0,127,127},
      thickness=1));
  connect(uninfectedAtRisk.port, newInfectious[4].port_a) annotation (Line(
      points={{-163,11},{-154.5,11},{-154.5,11},{-146,11}},
      color={0,127,127},
      thickness=1));
end testCovidBaseStart;
