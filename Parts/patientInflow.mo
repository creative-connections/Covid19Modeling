within Covid19Modeling.Parts;
model patientInflow

  Physiolibrary.Population.Interfaces.PopulationPort_a fromPopulation
    annotation (Placement(transformation(extent={{-110,-64},{-86,-40}}),
        iconTransformation(extent={{-106,-10},{-86,10}})));
  Physiolibrary.Population.Interfaces.PopulationPort_b toPatiens[4] annotation (
     Placement(transformation(extent={{82,-66},{112,-36}}),
                                                          iconTransformation(
          extent={{94,-10},{114,10}})));

  Physiolibrary.Types.RealIO.PopulationChangeInput contacts "persons/time"
    annotation (Placement(transformation(extent={{-32,82},{-12,102}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-48})));

  Physiolibrary.Types.RealIO.PopulationInput uninfectedPopulation
    "uninfected people"                                           annotation (
      Placement(transformation(extent={{-90,74},{-68,96}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-80,-48})));

  Physiolibrary.Types.RealIO.PopulationInput totalPopulation
    "total living population" annotation (Placement(transformation(extent={{-90,38},
            {-70,58}}),        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-40,-48})));

  Physiolibrary.Population.Components.Change change_Asymptomatic(useChangeInput=
       true) annotation (Placement(transformation(extent={{-6,-100},{26,-84}})));
  Physiolibrary.Population.Components.Change change_Mild(useChangeInput=true)
    annotation (Placement(transformation(extent={{-6,-66},{26,-50}})));
  Physiolibrary.Population.Components.Change change_Moderate(useChangeInput=true)
    annotation (Placement(transformation(extent={{-6,-32},{26,-16}})));
  Physiolibrary.Population.Components.Change change_Severe(useChangeInput=true)
    annotation (Placement(transformation(extent={{-4,4},{28,22}})));
  Modelica.Blocks.Math.Division division
    annotation (Placement(transformation(extent={{-50,70},{-36,84}})));
  Physiolibrary.Blocks.Factors.Normalization uninfectedContacts
    annotation (Placement(transformation(extent={{-20,58},{12,90}})));
  Physiolibrary.Blocks.Factors.Normalization infectedRate(enabled=true)
    annotation (Placement(transformation(extent={{-20,40},{12,72}})));
  Physiolibrary.Blocks.Factors.Normalization severeInfected(
        enabled=true)
    annotation (Placement(transformation(extent={{-4,16},{30,50}})));
  Physiolibrary.Blocks.Factors.Normalization moderateInfected(enabled=true)
    annotation (Placement(transformation(extent={{-6,-24},{26,8}})));
  Physiolibrary.Blocks.Factors.Normalization asymptomaticInfected(enabled=true)
    annotation (Placement(transformation(extent={{-6,-92},{26,-60}})));
  Physiolibrary.Blocks.Factors.Normalization mildInfected(enabled=true)
    annotation (Placement(transformation(extent={{-6,-56},{26,-24}})));

  outer interfaces.ModelSettings modelSettings
    annotation (Placement(transformation(extent={{58,74},{78,94}})));

equation
  infectedRate.u=modelSettings.infectivity;
  asymptomaticInfected.u = modelSettings.severitySpread[1];
  mildInfected.u = modelSettings.severitySpread[2];
  moderateInfected.u = modelSettings.severitySpread[3];
  severeInfected.u = modelSettings.severitySpread[4];

  connect(change_Asymptomatic.port_b, toPatiens[1]) annotation (Line(
      points={{26,-92},{48,-92},{48,-62.25},{97,-62.25}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(change_Mild.port_b, toPatiens[2]) annotation (Line(
      points={{26,-58},{38,-58},{38,-54.75},{97,-54.75}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(change_Moderate.port_b, toPatiens[3]) annotation (Line(
      points={{26,-24},{36,-24},{36,-47.25},{97,-47.25}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(change_Severe.port_b, toPatiens[4]) annotation (Line(
      points={{28,13},{46,13},{46,-39.75},{97,-39.75}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(fromPopulation, change_Severe.port_a) annotation (Line(
      points={{-98,-52},{-60,-52},{-60,13},{-4,13}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(change_Moderate.port_a, fromPopulation) annotation (Line(
      points={{-6,-24},{-56,-24},{-56,-52},{-98,-52}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(change_Mild.port_a, fromPopulation) annotation (Line(
      points={{-6,-58},{-54,-58},{-54,-52},{-98,-52}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(change_Asymptomatic.port_a, fromPopulation) annotation (Line(
      points={{-6,-92},{-54,-92},{-54,-52},{-98,-52}},
      color={0,127,127},
      thickness=1,
      smooth=Smooth.Bezier));
  connect(division.u1, uninfectedPopulation) annotation (Line(
      points={{-51.4,81.2},{-60,81.2},{-60,85},{-79,85}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(totalPopulation, division.u2) annotation (Line(
      points={{-80,48},{-64,48},{-64,72.8},{-51.4,72.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(contacts, uninfectedContacts.yBase) annotation (Line(
      points={{-22,92},{-4,92},{-4,77.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(division.y, uninfectedContacts.u) annotation (Line(
      points={{-35.3,77},{-27.65,77},{-27.65,74},{-16.8,74}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(severeInfected.yBase, infectedRate.y) annotation (Line(
      points={{13,36.4},{13,36.4},{13,42.4},{-4,42.4},{-4,49.6}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(uninfectedContacts.y, infectedRate.yBase) annotation (Line(
      points={{-4,67.6},{-4,59.2}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(severeInfected.y, change_Severe.populationChange) annotation (Line(
      points={{13,26.2},{13,20},{12,20},{12,16.6}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(change_Asymptomatic.populationChange, asymptomaticInfected.y)
    annotation (Line(points={{10,-88.8},{10,-82.4}}, color={0,0,127}));
  connect(change_Mild.populationChange, mildInfected.y)
    annotation (Line(points={{10,-54.8},{10,-46.4}}, color={0,0,127}));
  connect(asymptomaticInfected.yBase, infectedRate.y) annotation (Line(
      points={{10,-72.8},{10,-68},{-34,-68},{-34,40},{-4,40},{-4,49.6}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(mildInfected.yBase, infectedRate.y) annotation (Line(
      points={{10,-36.8},{10,-34},{-26,-34},{-26,34},{-4,34},{-4,49.6}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(moderateInfected.yBase, infectedRate.y) annotation (Line(
      points={{10,-4.8},{10,0},{-16,0},{-16,32},{-4,32},{-4,49.6}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  connect(moderateInfected.y, change_Moderate.populationChange) annotation (
      Line(
      points={{10,-14.4},{10,-20.8},{10,-20.8}},
      color={0,0,127},
      smooth=Smooth.Bezier));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,120}}),                                        graphics={
        Text(
          extent={{-174,66},{182,44}},
          lineColor={28,108,200},
          fillColor={255,255,0},
          fillPattern=FillPattern.None,
          textString="%name"),
        Rectangle(
          extent={{-100,37},{100,-37}},
          lineColor={0,0,0},
          fillColor={208,253,255},
          fillPattern=FillPattern.HorizontalCylinder,
          origin={0,-1},
          rotation=360),
        Rectangle(
          extent={{-6,66},{6,-66}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={-8,0},
          rotation=90),
        Polygon(
          points={{-21,5},{-1,-35},{19,5},{1,5},{-21,5}},
          lineColor={0,0,0},
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid,
          origin={51,1},
          rotation=90)}),                 Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}})));
end patientInflow;
