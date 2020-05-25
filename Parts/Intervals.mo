within Covid19_modeling.Parts;
model Intervals
  parameter Modelica.SIunits.Time delay = 10;
  /*
   Modelica.Blocks.Interfaces.RealOutput T0 "start time of
  current cardiac cycle in sec" annotation (Placement(transformation(extent={{100,
            30},{120,50}}), iconTransformation(extent={{100,70},{120,90}})));
   */

 // Real T0;
 Modelica.SIunits.Time T0( start=0);

//  Modelica.SIunits.Time HP(start=0) "heart period - duration of cardiac cycle in sec";
  Boolean b;
initial equation
 // T0=0;
equation
  b=time - pre(T0) >= delay;//pre(HP);
 when {initial(),b} then
    T0 = time;

    //HP =delay/1;
 end when;
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={28,108,200},
          fillColor={255,255,0},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-80,12},{-30,-12}},
          lineColor={28,108,200},
          fillColor={255,255,0},
          fillPattern=FillPattern.None,
          textString="delay"),
        Text(
          extent={{24,90},{92,62}},
          lineColor={28,108,200},
          fillColor={255,255,0},
          fillPattern=FillPattern.None,
          textString="T0"),
        Text(
          extent={{-100,-106},{108,-132}},
          lineColor={28,108,200},
          fillColor={255,255,0},
          fillPattern=FillPattern.None,
          textString="%name")}),                                 Diagram(
        coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=100, __Dymola_Algorithm="Dassl"));
end Intervals;
