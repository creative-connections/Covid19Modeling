within Covid19Modeling.Parts;
model Smoothing "effect = u/NormalValue"

constant Modelica.SIunits.Time day=86400;

parameter Modelica.SIunits.Time HalfTime = 3.5*day;

  Physiolibrary.Blocks.Math.Integrator
                         integrator(
    k=(Modelica.Math.log(2)/HalfTime),
    y_start=0,
    NominalValue=0)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={8,0})));
  Modelica.Blocks.Math.Feedback feedback annotation (Placement(
        transformation(
        extent={{-12,-12},{12,12}},
        rotation=0,
        origin={-42,0})));
  Modelica.Blocks.Interfaces.RealInput u annotation (Placement(transformation(
          extent={{-102,-20},{-62,20}}), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={0,56})));
  Modelica.Blocks.Interfaces.RealOutput y annotation (Placement(transformation(
          extent={{80,-12},{110,18}}), iconTransformation(
        extent={{-16,-16},{16,16}},
        rotation=270,
        origin={0,-56})));
equation

  connect(integrator.y,feedback. u2) annotation (Line(
      points={{19,0},{54,0},{54,-34},{-42,-34},{-42,-9.6}},
      color={0,0,127}));
  connect(feedback.y, integrator.u)
    annotation (Line(points={{-31.2,0},{-4,0}}, color={0,0,127}));
  connect(feedback.u1, u)
    annotation (Line(points={{-51.6,0},{-82,0}}, color={0,0,127}));
  connect(integrator.y, y)
    annotation (Line(points={{19,0},{54,0},{54,3},{95,3}}, color={0,0,127}));
  annotation ( Documentation(revisions="<html>
<p><i>2009-2010</i></p>
<p>Marek Matejak, Charles University, Prague, Czech Republic </p>
</html>",
    info="<html>
<p><h4>y = yBase * u</h4></p>
</html>"), Icon(graphics={Rectangle(
          extent={{-100,42},{100,-38}},
          lineColor={135,135,135},
          fillColor={215,215,215},
          fillPattern=FillPattern.HorizontalCylinder), Text(
          extent={{-100,22},{100,-12}},
          lineColor={28,108,200},
          fillPattern=FillPattern.HorizontalCylinder,
          fillColor={215,215,215},
          textString="Smoothing")}));
end Smoothing;
