within Covid19_modeling.Parts;
model ClockedDigitalConveyor0x1
  parameter Modelica.SIunits.Time delay=10;

/*

   Modelica.Blocks.Interfaces.RealOutput T0 "start time of
  current cardiac cycle in sec" annotation (Placement(transformation(extent={{100,
            30},{120,50}}), iconTransformation(extent={{100,44},{120,64}})));

*/
  Modelica.SIunits.Time nextClock( start=0);

  Boolean b;

initial equation
 //  T0=0;
equation

  b = time - pre(nextClock) >= delay;
//  when {initial(),b} then
  when b then
    nextClock = time;

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
end ClockedDigitalConveyor0x1;
