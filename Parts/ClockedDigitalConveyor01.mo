within Covid19_modeling.Parts;
model ClockedDigitalConveyor01

  parameter Modelica.SIunits.Time delay=10;
  Modelica.SIunits.Time dt;

  Physiolibrary.Types.Population slotIn(start=0);
  Physiolibrary.Types.Population slotOut(start=0);
  Physiolibrary.Types.Population slot( start=0);
  Modelica.SIunits.Time nextClock( start=0);
  Boolean b;

  Physiolibrary.Types.RealIO.PopulationChangeInput inflow annotation (Placement(
        transformation(extent={{-126,-20},{-86,20}}), iconTransformation(extent=
           {{-120,-10},{-100,10}})));

  Physiolibrary.Types.RealIO.PopulationChangeOutput outflow annotation (
      Placement(transformation(extent={{100,-10},{120,10}}), iconTransformation(
          extent={{100,-10},{120,10}})));
initial equation

  dt=delay;

equation
  der(slotIn) = inflow;
  dt = delay;
  outflow = slotOut/dt;

  b = time - pre(nextClock) >= delay;
  when {initial(),b} then

    nextClock = time;

    slotOut = pre(slotIn);
    slot = pre(slotIn);

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
end ClockedDigitalConveyor01;
