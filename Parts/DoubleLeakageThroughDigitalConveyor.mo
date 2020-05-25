within Covid19Modeling.Parts;
model DoubleLeakageThroughDigitalConveyor
  //********************************
  //This component models the flow compartment of untested patients
  //where patients continuously fall into the lower flow compartment
  //of the tested patients
  //
  //*********************************
  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;
  //parameter Physiolibrary.Types.Fraction fractionLeak=0;
  Modelica.SIunits.Time dt;
  Physiolibrary.Types.Population deathSlotUntested[numberOfSlots];
  Physiolibrary.Types.Population deathSlotTested[numberOfSlots];

  Physiolibrary.Types.Population deathSlotsUntestedSum(start=0);
  Physiolibrary.Types.Population deathSlotsTestedSum(start=0);

  Physiolibrary.Types.Population testLeakSlot[numberOfSlots];

  Physiolibrary.Types.Population testLeakSlotsSum(start=0);

  Physiolibrary.Types.Population slotInUntested(start=0);
  Physiolibrary.Types.Population slotInTested(start=0);

  Physiolibrary.Types.Population slotUntested[numberOfSlots];
  Physiolibrary.Types.Population slotTested[numberOfSlots];

  Integer i=0;

  Physiolibrary.Types.RealIO.PopulationChangeOutput outflowUntested annotation (
     Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{100,60},{120,80}})));

  Physiolibrary.Types.RealIO.PopulationChangeInput inflowUntested annotation (
      Placement(transformation(extent={{-124,48},{-84,88}}), iconTransformation(
          extent={{-120,64},{-100,84}})));

  Physiolibrary.Types.RealIO.PopulationChangeOutput deathOutflowUntested(start=0)
    annotation (Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{100,34},{120,54}})));

  Physiolibrary.Types.RealIO.PopulationOutput populationUntested annotation (
      Placement(transformation(extent={{-102,-18},{-82,2}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={82,10})));

  Physiolibrary.Types.RealIO.PopulationChangeInput deathUntestedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,42})));

  Physiolibrary.Types.RealIO.PopulationChangeInput testFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,-4})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput testThroughFlow(start=0)
    annotation (Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{20,-14},{40,6}})));
  Physiolibrary.Types.RealIO.PopulationChangeInput inflowTested annotation (
      Placement(transformation(extent={{-124,48},{-84,88}}), iconTransformation(
          extent={{-120,-52},{-100,-32}})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathTestedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-78})));
  Physiolibrary.Types.RealIO.PopulationOutput populationTested annotation (
      Placement(transformation(extent={{-102,-18},{-82,2}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={28,-110})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput outflowTested annotation (
      Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{100,-56},{120,-36}})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput deathOutflowTested(start=0)
    annotation (Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{100,-88},{120,-68}})));

initial equation
  for i in 1:(numberOfSlots) loop
    slotUntested[i] = 0;
    deathSlotUntested[i] = 0;
    slotTested[i] = 0;
    deathSlotTested[i] = 0;
    testLeakSlot[i] = 0;
  end for;
equation
  der(slotInUntested) = inflowUntested;
  der(slotInTested) = inflowTested;
  dt = delay/numberOfSlots;
  when sample(0, dt) then
    for i in 1:(numberOfSlots - 1) loop
      slotUntested[i + 1] = pre(slotUntested[i])*(1 - deathUntestedFractionRate*
        dt - testFractionRate*dt);

      testLeakSlot[i + 1] = pre(slotUntested[i])*testFractionRate*dt;

      deathSlotUntested[i + 1] = pre(slotUntested[i])*deathUntestedFractionRate*
        dt;

      slotTested[i + 1] = (pre(slotTested[i]) + testLeakSlot[i + 1])*(1 -
        deathTestedFractionRate*dt);

      deathSlotTested[i + 1] = (pre(slotTested[i]) + testLeakSlot[i + 1])*
        deathTestedFractionRate*dt;

    end for;

    slotUntested[1] = pre(slotInUntested)*(1 - deathUntestedFractionRate*dt -
      testFractionRate*dt);

    deathSlotUntested[1] = pre(slotInUntested)*deathUntestedFractionRate*dt;

    testLeakSlot[1] = pre(slotInUntested)*testFractionRate*dt;

    slotTested[1] = (pre(slotInTested) + testLeakSlot[1])*(1 -
      deathTestedFractionRate*dt);

    deathSlotTested[1] = (pre(slotInTested) + testLeakSlot[1])*
      deathTestedFractionRate*dt;

    outflowUntested = (slotUntested[numberOfSlots])/dt;
    outflowTested = (slotTested[numberOfSlots])/dt;

    deathSlotsUntestedSum = sum(deathSlotUntested[i] for i in 1:numberOfSlots);
    deathSlotsTestedSum = sum(deathSlotTested[i] for i in 1:numberOfSlots);

    testLeakSlotsSum = sum(testLeakSlot[i] for i in 1:numberOfSlots);

    deathOutflowUntested = deathSlotsUntestedSum/dt;
    deathOutflowTested = deathSlotsTestedSum/dt;

    testThroughFlow = testLeakSlotsSum/dt;

    populationUntested = sum((slotUntested[i]) for i in 1:numberOfSlots) +
      deathSlotsUntestedSum;

    populationTested = sum((slotTested[i]) for i in 1:numberOfSlots) +
      deathSlotsTestedSum + testLeakSlotsSum;

    reinit(slotInUntested, 0.0);
    reinit(slotInTested, 0.0);

  end when;

  annotation (
    Placement(transformation(extent={{-10,30},{10,50}})),
    Placement(transformation(extent={{-8,48},{12,68}})),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-262,108},{238,142}},
          lineColor={0,0,255},
          textString="%name"),
        Rectangle(extent={{-100,100},{100,20}}, lineColor={0,0,0}),
        Line(points={{-80,100},{-80,20}}, color={0,0,0}),
        Line(points={{-60,100},{-60,20}}, color={0,0,0}),
        Line(points={{-40,100},{-40,20}}, color={0,0,0}),
        Line(points={{-20,100},{-20,20}}, color={0,0,0}),
        Line(points={{0,100},{0,20}}, color={0,0,0}),
        Line(points={{20,100},{20,20}}, color={0,0,0}),
        Line(points={{40,100},{40,20}}, color={0,0,0}),
        Line(points={{60,100},{60,20}}, color={0,0,0}),
        Line(points={{80,100},{80,20}}, color={0,0,0}),
        Rectangle(extent={{-100,-20},{100,-100}}, lineColor={0,0,0}),
        Line(points={{-80,-20},{-80,-100}}, color={0,0,0}),
        Line(points={{-60,-20},{-60,-100}}, color={0,0,0}),
        Line(points={{-40,-20},{-40,-100}}, color={0,0,0}),
        Line(points={{-20,-20},{-20,-100}}, color={0,0,0}),
        Line(points={{0,-20},{0,-100}}, color={0,0,0}),
        Line(points={{20,-20},{20,-100}}, color={0,0,0}),
        Line(points={{40,-20},{40,-100}}, color={0,0,0}),
        Line(points={{60,-20},{60,-100}}, color={0,0,0}),
        Line(points={{80,-20},{80,-100}}, color={0,0,0}),
        Rectangle(
          extent={{-20,20},{20,-20}},
          lineColor={0,0,0},
          lineThickness=0.5)}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end DoubleLeakageThroughDigitalConveyor;
