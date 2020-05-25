within Covid19Modeling.interfaces;
model PopulationChangeMeasure
    extends Modelica.Icons.RotationalSensor;

  Physiolibrary.Population.Interfaces.PopulationPort_a port_a annotation (
      Placement(transformation(extent={{-178,-2},{-158,18}}),
        iconTransformation(extent={{-100,-10},{-80,10}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b port_b annotation (
      Placement(transformation(extent={{-170,-2},{-150,18}}),
        iconTransformation(extent={{80,-10},{100,10}})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput populationChange
    annotation (Placement(transformation(extent={{-176,-8},{-156,12}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,90})));

equation
   populationChange  = port_a.change;
   port_a.change + port_b.change = 0;
   port_b.population = port_a.population;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end PopulationChangeMeasure;
