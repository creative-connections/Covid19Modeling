within Covid19_modeling.Parts;
model Arriving
  constant Modelica.SIunits.Time day=86400;
  parameter Modelica.SIunits.Time timeOfArrival=1*day;
  parameter Physiolibrary.Types.Population numberOfArrivingPerson=1;

  Physiolibrary.Population.Interfaces.PopulationPort_b arriversFlow annotation (
     Placement(transformation(extent={{26,34},{50,58}}), iconTransformation(
          extent={{40,-56},{60,-36}})));
  Modelica.Blocks.Sources.Pulse pulse(
    amplitude=numberOfArrivingPerson/(durationOdArrival),
    width=100,
    period=durationOdArrival,
    nperiod=1,
    startTime=timeOfArrival)
    annotation (Placement(transformation(extent={{-48,68},{-28,88}})));
  Physiolibrary.Population.Sources.Growth growth(useChangeInput=true)
    annotation (Placement(transformation(extent={{-14,36},{6,56}})));
  constant Modelica.SIunits.Time durationOdArrival=day/4; //constant simulation parameter
  outer interfaces.ModelSettings modelSettings
    annotation (Placement(transformation(extent={{76,-100},{96,-80}})));
initial equation

equation

  connect(growth.port_b, arriversFlow) annotation (Line(
      points={{6,46},{22,46},{38,46}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(pulse.y, growth.populationChange) annotation (Line(
      points={{-27,78},{-4,78},{-4,50}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Ellipse(
          extent={{-18,100},{24,64}},
          lineColor={255,255,255},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{36,-2},{36,6},{36,6},{36,10},{36,18},{36,36},{36,46},{32,58},
              {18,62},{-4,60},{-20,66},{-58,100},{-66,100},{-68,94},{-66,88},{-58,
              78},{-30,54},{-24,42},{-23.3965,29.9297},{-22,2},{-22,-82},{-24,-98},
              {-14,-100},{-8,-100},{-6,-96},{-6,-22},{-4,-14},{0,-16},{2,-84},{2,
              -100},{18,-100},{17.7227,-94.117},{18,-76},{18,-72},{20,-72},{34,-72},
              {58,-72},{74,-72},{78,-66},{78,-59.83},{78,-48},{78,-24},{78,-14},
              {64.2419,-13.1401},{51.0625,-12.3164},{46,-12},{46,-8},{46,-2},{36,
              -2}},
          lineColor={255,255,255},
          lineThickness=0.5,
          smooth=Smooth.Bezier,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{32,-12},{42,-6}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          radius=2),
        Rectangle(
          extent={{18,-14},{24,40}},
          pattern=LinePattern.None,
          lineThickness=0.5,
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          lineColor={0,0,0},
          radius=1),
        Text(
          extent={{-440,136},{420,110}},
          lineColor={28,108,200},
          lineThickness=0.5,
          fillColor={238,46,47},
          fillPattern=FillPattern.Solid,
          textString="%name")}), Diagram(coordinateSystem(preserveAspectRatio=false)));
end Arriving;
