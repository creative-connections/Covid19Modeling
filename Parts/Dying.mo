within Covid19_modeling.Parts;
model Dying
  outer interfaces.ModelSettings modelSettings
    annotation (Placement(transformation(extent={{62,76},{82,96}})));

  Physiolibrary.Types.RealIO.PopulationChangeOutput dyingFractionRate[4]
    annotation (Placement(transformation(extent={{-96,-6},{-76,14}}),
        iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,110})));

   //Integer i;
equation
  /*
   for i in 1:4 loop
   dyingFractionRate[i]=
     modelSettings.crudeDeathRate[i]/
      ( modelSettings.delaySymptomaticContagious[i]
       + modelSettings.delaySymptomaticNoLongerContagious[i]);
     end for
    */

  dyingFractionRate[1]=
     modelSettings.crudeDeathRate[1]/
      ( modelSettings.delaySymptomaticContagious[1]
       + modelSettings.delaySymptomaticNoLongerContagious[1]);

  dyingFractionRate[2]=
     modelSettings.crudeDeathRate[2]/
      ( modelSettings.delaySymptomaticContagious[2]
       + modelSettings.delaySymptomaticNoLongerContagious[2]);

  dyingFractionRate[3]=
     modelSettings.crudeDeathRate[3]/
      ( modelSettings.delaySymptomaticContagious[3]
       + modelSettings.delaySymptomaticNoLongerContagious[3]);

  dyingFractionRate[4]=
     modelSettings.crudeDeathRate[4]/
      ( modelSettings.delaySymptomaticContagious[4]
       + modelSettings.delaySymptomaticNoLongerContagious[4]);

  annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Rectangle(
          extent={{-100,100},{100,-100}},
          lineColor={0,0,127},
          fillColor={170,255,255},
          fillPattern=FillPattern.Solid),
        Line(
          points={{-30,60},{-40,68}},
          pattern=LinePattern.None,
          color={238,46,47},
          thickness=1),
        Line(
          points={{-60,66},{-52,74}},
          color={238,46,47},
          pattern=LinePattern.None,
          thickness=1),
        Text(
          extent={{-188,-108},{186,-124}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={238,46,47},
          textString="%name"),
        Polygon(
          points={{-94,-96},{-88,-84},{-70,-62},{-60,-56},{-44,-46},{-4,-38},
              {24,-40},{48,-48},{78,-66},{106,-96},{-94,-96}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=1,
          fillPattern=FillPattern.Sphere,
          fillColor={162,29,33},
          smooth=Smooth.Bezier),
        Rectangle(
          extent={{-4,-44},{4,92}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=1,
          fillPattern=FillPattern.Solid,
          fillColor={0,0,0}),
        Rectangle(
          extent={{-58,62},{60,52}},
          lineColor={238,46,47},
          pattern=LinePattern.None,
          lineThickness=1,
          fillColor={0,0,0},
          fillPattern=FillPattern.Solid)}),
                                 Diagram(coordinateSystem(preserveAspectRatio=false)));
end Dying;
