within Covid19Modeling.Parts;
model LeakDigitalConveyor

  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;
  parameter Physiolibrary.Types.Fraction fractionLeak=0;
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

  Physiolibrary.Types.Population leakSlot[numberOfSlots];

  Physiolibrary.Types.RealIO.PopulationChangeOutput leakOutflow( start=0) annotation (
      Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{100,-38},{120,-18}})));

  Physiolibrary.Types.RealIO.PopulationOutput population annotation (Placement(
        transformation(extent={{-102,-18},{-82,2}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={26,-50})));

  Physiolibrary.Types.Population leakSlotsSum( start=0);

initial equation
    for i in 1:(numberOfSlots) loop
      slot[i]=0;
      leakSlot[i]=0;
    end for;
equation
  der(slotIn) = inflow;
  dt = delay/numberOfSlots;
  when sample(0,dt) then

    for i in 1:(numberOfSlots - 1) loop
      slot[i + 1] = pre(slot[i])*(1-fractionLeak/delay*dt);
      leakSlot[i+1] = pre(slot[i])*fractionLeak/delay*dt;
    end for;
    slot[1] = pre(slotIn)*(1-fractionLeak/delay*dt);
    leakSlot[1]=pre(slotIn)*fractionLeak/delay*dt;
    outflow=(slot[numberOfSlots])/dt;
    leakSlotsSum = sum(pre(leakSlot[i]) for i in 1:numberOfSlots);
    leakOutflow = leakSlotsSum/dt;
    population = sum(slot[i] for i in 1:numberOfSlots);
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
end LeakDigitalConveyor;
