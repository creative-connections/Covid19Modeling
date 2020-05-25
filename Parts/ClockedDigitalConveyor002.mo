within Covid19_modeling.Parts;
model ClockedDigitalConveyor002

  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;
  Modelica.SIunits.Time dt;

  Physiolibrary.Types.Population slotIn(start=0);

  Physiolibrary.Types.Population slot[numberOfSlots];
  Integer i=0;

  Physiolibrary.Types.RealIO.PopulationChangeOutput outflow annotation (
      Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{100,-10},{120,10}})));

  Physiolibrary.Types.RealIO.PopulationChangeInput inflow annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(extent={
            {-120,-10},{-100,10}})));

initial equation
    for i in 1:(numberOfSlots) loop
      slot[i]=0;
    end for;
equation
  der(slotIn) = inflow;
  dt = delay/numberOfSlots;
  when sample(0,dt) then

    for i in 1:(numberOfSlots - 1) loop
      slot[i + 1] = pre(slot[i]);
    end for;
    slot[1] = pre(slotIn);
    outflow=(slot[numberOfSlots])/dt;

    reinit(slotIn, 0.0);

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
end ClockedDigitalConveyor002;
