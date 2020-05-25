within Covid19_modeling.Parts;
model HealthCare
  Physiolibrary.Types.RealIO.PopulationOutput cumulativePositiveTests
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-82,-2}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,0})));
  Physiolibrary.Types.RealIO.PopulationChangeInput testingPositiveRate
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={12,10}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={112,0})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput recentTestingPositive
    "smoothed seven-day recent testing positive rate" annotation (Placement(
        transformation(extent={{6,-42},{26,-22}}),    iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,-58})));
  Physiolibrary.Population.Components.Population cumulativePositiveTesting
    annotation (Placement(transformation(extent={{-84,20},{-52,48}})));
  Physiolibrary.Population.Sources.Growth testFlow(useChangeInput=true)
    annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-12,34})));
  Smoothing smoothing(HalfTime(displayUnit="d") = 419212.8)
    annotation (Placement(transformation(extent={{-32,-26},{-14,-8}})));
  Physiolibrary.Types.RealIO.PopulationInput needingHospitalisation
    annotation (Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={70,54}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,-36})));
  Physiolibrary.Types.RealIO.PopulationInput tooIllToWork annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={68,-12}),iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={110,-72})));
  Physiolibrary.Blocks.Math.Integrator int annotation (Placement(
        transformation(
        extent={{-8,8},{8,-8}},
        rotation=180,
        origin={40,54})));
  Modelica.Blocks.Math.Gain gain(k=1/86400)
    "hospital bed second to hospital bed days" annotation (Placement(
        transformation(
        extent={{-5,-5},{5,5}},
        rotation=180,
        origin={15,55})));
  Physiolibrary.Types.RealIO.PopulationOutput hospitalBedDays annotation (
      Placement(transformation(
        extent={{-8,-8},{8,8}},
        rotation=180,
        origin={-38,74}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=180,
        origin={-110,40})));
equation
  connect(cumulativePositiveTests, cumulativePositiveTesting.population)
    annotation (Line(points={{-82,-2},{-58,-2},{-58,20},{-58.4,20}},
                                                                   color={0,
          0,127}));
  connect(testFlow.port_b, cumulativePositiveTesting.port) annotation (Line(
      points={{-22,34},{-68,34}},
      color={0,127,127},
      thickness=1));
  connect(testingPositiveRate, testFlow.populationChange)
    annotation (Line(points={{12,10},{-12,10},{-12,30}}, color={0,0,127}));
  connect(smoothing.u, testFlow.populationChange) annotation (Line(points={
          {-23,-11.96},{-23,10},{-12,10},{-12,30}}, color={0,0,127}));
  connect(smoothing.y, recentTestingPositive) annotation (Line(points={{-23,
          -22.04},{-23,-32},{16,-32}}, color={0,0,127}));
  connect(needingHospitalisation, int.u)
    annotation (Line(points={{70,54},{49.6,54}}, color={0,0,127}));
  connect(int.y, gain.u) annotation (Line(points={{31.2,54},{26,54},{26,55},
          {21,55}}, color={0,0,127}));
  connect(gain.y, hospitalBedDays) annotation (Line(points={{9.5,55},{-14,
          55},{-14,74},{-38,74}}, color={0,0,127}));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-90,-56},{94,-70}},
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          pattern=LinePattern.None,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-80,28},{-36,-56}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-70,12},{-60,2}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-54,12},{-44,2}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-54,-2},{-44,-12}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-70,-2},{-60,-12}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-54,-18},{-44,-28}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{40,28},{84,-56}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-70,-18},{-60,-28}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-70,-34},{-60,-44}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-54,-34},{-44,-44}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{50,14},{60,4}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{66,14},{76,4}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{66,0},{76,-10}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{50,0},{60,-10}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{50,-16},{60,-26}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{66,-16},{76,-26}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{50,-32},{60,-42}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{66,-32},{76,-42}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-32,64},{36,-58}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-24,-10},{-14,-20}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-10,-10},{0,-20}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{4,-10},{14,-20}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{18,-10},{28,-20}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-24,2},{-14,-8}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-10,2},{0,-8}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{4,2},{14,-8}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{18,2},{28,-8}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Rectangle(
          extent={{-10,-26},{14,-56}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0}),
        Ellipse(
          extent={{-24,54},{24,6}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-4,42},{4,18}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-14,34},{14,26}},
          lineColor={0,0,0},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Text(
          extent={{-208,-106},{196,-124}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Diagram(coordinateSystem(
          preserveAspectRatio=false)));
end HealthCare;
