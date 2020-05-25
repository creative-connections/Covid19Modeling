within Covid19Modeling.Parts;
model DoubleLeakDigitalConveyor

  //neodpovídá modelu STELLA!!!

  constant Modelica.SIunits.Time day=86400;

  parameter Integer numberOfSlots=4;
  parameter Modelica.SIunits.Time delay=day;
  //parameter Physiolibrary.Types.Fraction fractionLeak=0;
  Modelica.SIunits.Time dt;

  Physiolibrary.Types.Population slotInUntested(start=0);
  Physiolibrary.Types.Population slotInTested(start=0);

  Physiolibrary.Types.Population slotUntested[numberOfSlots];
  Physiolibrary.Types.Population slotTested[numberOfSlots];
  Integer i=0;

  Physiolibrary.Types.RealIO.PopulationChangeOutput outflowUntested annotation (
     Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{100,50},{120,70}})));

  Physiolibrary.Types.RealIO.PopulationChangeInput inflowUntested annotation (
      Placement(transformation(extent={{-124,48},{-84,88}}), iconTransformation(
          extent={{-120,50},{-100,70}})));

  Physiolibrary.Types.Population leakSlotUntested[numberOfSlots];
  Physiolibrary.Types.Population leakSlotTested[numberOfSlots];

  Physiolibrary.Types.RealIO.PopulationChangeOutput deathUntestedRate(start=0)
    annotation (Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{100,22},{120,42}})));

  Physiolibrary.Types.RealIO.PopulationOutput populationUntested annotation (
      Placement(transformation(extent={{-102,-18},{-82,2}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,10})));

  Physiolibrary.Types.Population leakSlotSumUntested(start=0);
  Physiolibrary.Types.Population leakSlotSumTested(start=0);

  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionUntestedRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,28})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput outflowTested annotation (
      Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{100,-70},{120,-50}})));
  Physiolibrary.Types.RealIO.PopulationChangeInput inflowTested annotation (
      Placement(transformation(extent={{-124,48},{-84,88}}), iconTransformation(
          extent={{-120,-70},{-100,-50}})));
  Physiolibrary.Types.RealIO.PopulationChangeOutput deathTestedRate(start=0)
    annotation (Placement(transformation(extent={{96,24},{116,44}}),
        iconTransformation(extent={{100,-98},{120,-78}})));
  Physiolibrary.Types.RealIO.PopulationOutput populationTested annotation (
      Placement(transformation(extent={{-102,-18},{-82,2}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={90,-110})));
  Physiolibrary.Types.RealIO.PopulationChangeInput deathFractionTestedRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-110,-90})));
  Physiolibrary.Types.RealIO.PopulationChangeInput testedFractionRate
    "leak fraction (relative number) /time" annotation (Placement(
        transformation(extent={{-124,48},{-84,88}}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=0,
        origin={-30,0})));
  Physiolibrary.Types.Population transferSlot[numberOfSlots];
  Physiolibrary.Types.Population transferSlotSum(start=0);

  Physiolibrary.Types.RealIO.PopulationChangeOutput testedRate annotation (
      Placement(transformation(extent={{96,24},{116,44}}), iconTransformation(
          extent={{20,-10},{40,10}})));
initial equation
  for i in 1:(numberOfSlots) loop
    slotUntested[i] = 0;
    slotTested[i] = 0;
    leakSlotUntested[i] = 0;
    leakSlotTested[i] = 0;
    transferSlot[i] = 0;
  end for;

equation
  der(slotInUntested) = inflowUntested;
  der(slotInTested) = inflowTested;
  dt = delay/numberOfSlots;

  when sample(0, dt) then

    for i in 1:(numberOfSlots - 1) loop
      slotUntested[i + 1] = pre(slotUntested[i])*(1 - deathFractionUntestedRate*
        dt - testedFractionRate*dt);
      leakSlotUntested[i + 1] = pre(slotUntested[i])*deathFractionUntestedRate*
        dt;
      //leakSlotUntested[i] = pre(slotUntested[i])*deathFractionUntestedRate*dt;
      transferSlot[i + 1] = pre(slotUntested[i])*testedFractionRate*dt;
      //transferSlot[i] = pre(slotUntested[i])*testedFractionRate*dt;

      slotTested[i + 1] = (pre(slotTested[i]) + (transferSlot[i + 1]))*(1 -
        deathFractionTestedRate*dt);
      leakSlotTested[i + 1] = (pre(slotTested[i]) + (transferSlot[i + 1]))*
        deathFractionTestedRate*dt;
      // leakSlotTested[i] = (pre(slotTested[i]) + (transferSlot[i+1]))*
      // deathFractionTestedRate*dt;

    end for;

    slotUntested[1] = pre(slotInUntested)*(1 - deathFractionUntestedRate*dt -
      testedFractionRate*dt);
    transferSlot[1] = pre(slotInUntested)*testedFractionRate*dt;

    slotTested[1] = (pre(slotInTested) + (transferSlot[1]))*(1 -
      deathFractionTestedRate*dt);

    leakSlotUntested[1] = pre(slotInUntested)*deathFractionUntestedRate*dt;
    leakSlotTested[1] = (pre(slotInTested) + (transferSlot[1]))*
      deathFractionTestedRate*dt;

    outflowUntested = (slotUntested[numberOfSlots])/dt;
    outflowTested = (slotTested[numberOfSlots])/dt;

    // outflowUntested = (slotUntested[numberOfSlots])*(1 - deathFractionUntestedRate*dt - testedFractionRate*dt)/dt;
    // outflowTested = (slotTested[numberOfSlots])*(1 - deathFractionUntestedRate*dt + testedFractionRate*dt)/dt;

    leakSlotSumUntested = sum(leakSlotUntested[i] for i in 1:numberOfSlots);
    leakSlotSumTested = sum(leakSlotTested[i] for i in 1:numberOfSlots);
    transferSlotSum = sum(transferSlot[i] for i in 1:numberOfSlots);

    deathUntestedRate = leakSlotSumUntested/dt;
    deathTestedRate = leakSlotSumTested/dt;

    testedRate = transferSlotSum/dt;

    //there will be not used (a different way will calculate the population)
    populationUntested = sum(slotUntested[i] for i in 1:numberOfSlots);
    populationTested = sum(slotTested[i] for i in 1:numberOfSlots);

    reinit(slotInUntested, 0.0);
    reinit(slotInTested, 0.0);

  end when;

  annotation (
    Placement(transformation(extent={{-10,30},{10,50}})),
    Placement(transformation(extent={{-8,48},{12,68}})),
    Icon(coordinateSystem(preserveAspectRatio=false), graphics={
        Text(
          extent={{-250,112},{250,146}},
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
        Line(points={{-38,-20},{-38,-100}}, color={0,0,0}),
        Line(points={{-20,-20},{-20,-100}}, color={0,0,0}),
        Line(points={{0,-20},{0,-100}}, color={0,0,0}),
        Line(points={{20,-20},{20,-100}}, color={0,0,0}),
        Line(points={{40,-20},{40,-100}}, color={0,0,0}),
        Line(points={{60,-20},{60,-100}}, color={0,0,0}),
        Line(points={{82,-20},{82,-100}}, color={0,0,0}),
        Rectangle(extent={{-20,20},{20,-20}}, lineColor={0,0,0})}),
    Diagram(coordinateSystem(preserveAspectRatio=false)));
end DoubleLeakDigitalConveyor;
