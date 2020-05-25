within Covid19_modeling.Parts;
model ClockedDigitalConveyor0

  //  parameter Physiolibrary.Types.Population population_init=1e-8
  //    "Initial population size in compartment";

  constant Modelica.SIunits.Time day=86400;
  //86 400 sec = 1 day
  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;
  Modelica.SIunits.Time dt;

  Physiolibrary.Types.Population slot0(start=0);

  Physiolibrary.Types.Population slot[numberOfSlots];
  Integer i=0;

  Physiolibrary.Types.RealIO.PopulationChangeOutput outflow annotation (
      Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{100,-10},{120,10}})));

  Physiolibrary.Types.RealIO.PopulationChangeInput inflow annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(extent={
            {-120,-10},{-100,10}})));

equation
  der(slot0) = inflow;
  dt = delay/numberOfSlots;

  when Clock(day) then

    for i in 1:(numberOfSlots-1) loop
       slot[i+1]=previous(slot[i]);
    end for;
    slot[1]=previous(slot0);
    outflow = previous(slot[numberOfSlots])/dt;

    reinit(slot0, 0.0);

  end when;

  annotation (
    Placement(transformation(extent={{-10,30},{10,50}})),
    Placement(transformation(extent={{-8,48},{12,68}})),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-246,56},{254,90}},
          lineColor={0,0,255},
          textString="%name"),
        Rectangle(extent={{-100,40},{100,-40}}, lineColor={0,0,0}),
        Line(points={{-80,40},{-80,-40}}, color={0,0,0}),
        Line(points={{-60,40},{-60,-40}}, color={0,0,0}),
        Line(points={{-40,40},{-40,-40}}, color={0,0,0}),
        Line(points={{-20,40},{-20,-40}}, color={0,0,0}),
        Line(points={{0,40},{0,-40}}, color={0,0,0}),
        Line(points={{20,40},{20,-40}}, color={0,0,0}),
        Line(points={{40,40},{40,-40}}, color={0,0,0}),
        Line(points={{60,40},{60,-40}}, color={0,0,0}),
        Line(points={{80,40},{80,-40}}, color={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end ClockedDigitalConveyor0;
