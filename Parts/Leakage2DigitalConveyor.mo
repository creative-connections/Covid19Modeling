within Covid19Modeling.Parts;
model Leakage2DigitalConveyor

  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;
  //parameter Physiolibrary.Types.Fraction fractionLeak=0;
  Modelica.SIunits.Time dt;
  Physiolibrary.Types.Population deathSlot[numberOfSlots];

  Physiolibrary.Types.Population deathSlotsSum(start=0);

  Physiolibrary.Types.Population testSlot[numberOfSlots];

  Physiolibrary.Types.Population testSlotsSum(start=0);

  Physiolibrary.Types.Population slotIn(start=0);

  Physiolibrary.Types.Population slot[numberOfSlots];
  Integer i=0;

  Physiolibrary.Types.RealIO.PopulationChangeOutput outflow annotation (
      Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{100,12},{120,32}})));

  Physiolibrary.Types.RealIO.PopulationChangeInput inflow annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(extent={
            {-120,-10},{-100,10}})));

  Physiolibrary.Types.RealIO.PopulationChangeOutput deathOutflow(start=0)
    annotation (Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{100,-12},{120,8}})));

  Physiolibrary.Types.RealIO.PopulationOutput population annotation (Placement(
        transformation(extent={{-102,-18},{-82,2}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={26,-50})));

  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-60,-50})));

  Physiolibrary.Types.RealIO.PopulationChangeInput testFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={-20,-50})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput testOutflow(start=0)
    annotation (Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{100,-36},{120,-16}})));
initial equation
  for i in 1:(numberOfSlots) loop
    slot[i] = 0;
    deathSlot[i] = 0;
  end for;
equation
  der(slotIn) = inflow;
  dt = delay/numberOfSlots;
  when sample(0, dt) then
    for i in 1:(numberOfSlots - 1) loop
      slot[i + 1] = pre(slot[i])*(1 - deathFractionRate*dt-testFractionRate*dt);
      deathSlot[i + 1] = pre(slot[i])*deathFractionRate*dt;
      testSlot[i + 1] = pre(slot[i])*testFractionRate*dt;
    end for;
    slot[1] = pre(slotIn)*(1 - deathFractionRate*dt-testFractionRate*dt);
    deathSlot[1] = pre(slotIn)*deathFractionRate*dt;
    testSlot[1] = pre(slotIn)*testFractionRate*dt;
    outflow = (slot[numberOfSlots])/dt;
    deathSlotsSum = sum(deathSlot[i] for i in 1:numberOfSlots);
    testSlotsSum = sum(testSlot[i] for i in 1:numberOfSlots);
    deathOutflow = deathSlotsSum/dt;
    testOutflow = testSlotsSum/dt;
    population = sum((slot[i]) for i in 1:numberOfSlots) + deathSlotsSum + testSlotsSum;

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
end Leakage2DigitalConveyor;
