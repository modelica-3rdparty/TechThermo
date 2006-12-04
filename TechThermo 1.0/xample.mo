

package Xample "examples for application of TechThermo-models"
  //wds 27.09.01 16:00
  extends Modelica.Icons.Library;

  package SIunits = Modelica.SIunits;
  //using Modelica type-definition

  package TT = TechThermo;
  package TTInterface = TT.Interface;
  package TTBasis = TT.Basis;
  package TTSource = TT.Source;
  package TTMedium = TT.Medium;
  package TTComponent = TT.Component;
  package TTXample = TT.Xample;

  annotation (Documentation(info="
content package: examples for application of library TechThermo

Date of last modification:27-09-01, 16:00
Description last modification: s. package info
Author last modification:wds

identification: TechThermo G

"));

  annotation (
    Icon(
      Rectangle(extent=[-91, 38; 69, -90]),
      Rectangle(extent=[-91, 38; 69, -90], style(
          color=0,
          fillColor=55,
          fillPattern=1)),
      Polygon(points=[-65, 33; -45, 33; -15, -18; 15, 33; 36, 33; -9, -28; 35,
            -87; 15, -87; -15, -38; -45, -88; -65, -88; -20, -27; -65, 33],
          style(color=0, fillColor=0))),
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[1, 1],
      component=[20, 20]),
    Window(
      x=0.01,
      y=0.05,
      width=0.6,
      height=0.6),
    Diagram(Polygon(points=[-80, 50; -60, 50; -30, -1; 0, 50; 21, 50; -24, -11;
             20, -70; 0, -70; -30, -21; -60, -71; -80, -71; -35, -10; -80, 50],
           style(color=0, fillColor=0))));

  package Chapter3_2 "models used in chapter 3.2 of Introduction of TechThermo"


    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: Examples for gas-turbines


Date of last modification:10-10-01, 14:00
Description last modification: s. package info
Author last modification:wds
identification: TechThermo g1
"));

    model description_example_3_2_1

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram(Rectangle(
              extent=[-78, -16; 6, -78], style(color=0, pattern=2))));
      Component.Compressor.AirCoolCompressor AirCoolCompressor1
        annotation (extent=[-26, -6; 24, 44]);
      Source.HeatFlow.ParameterDefined Waste_Heat_Sink
        annotation (extent=[-40, 58; -20, 78]);
      Source.MassFlow.ParameterDefined Inlet_Air_Source(
        switch_p_def=true,
        switch_x_i_def=true,
        x_para_i={1},
        switch_m_dot_def=true,
        m_dot_para=-1) annotation (extent=[-96, -98; -76, -78]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[-50, -72; -30, -52]);
      Source.ThermalState.ParameterDefined Temperature_Inlet(switch_t_def=true,
           t_const=20) annotation (extent=[-20, -62; 0, -42]);
      Source.ExergyFlow.ParameterDefined Mechanical_Power_Source(
          exergy_dot_para=-1000, switch_exergy_dot_def=false)
        annotation (extent=[-76, 20; -56, 40]);
      Source.MassFlow.ParameterDefined Out_Air_Source(switch_p_def=true, p_para
          =15.e5) annotation (extent=[44, -46; 64, -26]);
      Medium.Gas.AirPerfectGasCaloric AirPerfectGasCaloric1(
          option_h_u_correlations=4, option_s_correlation=0)
        annotation (extent=[-74, -38; -54, -18]);
      Interface.ThermalState.NotUsedVariables NotUsedVariables1(
        switch_rho_notused=true,
        switch_s_notused=true,
        switch_u_notused=true,
        switch_x_notused=true) annotation (extent=[-50, -40; -30, -20]);
    equation
      connect(Waste_Heat_Sink.OutHeatFlow, AirCoolCompressor1.RemovedHeat)
        annotation (points=[-30, 79; -10, 79; -10, 78; -1, 78; -1, 46.5], style(
            color=47));
      connect(Inlet_Air_Source.MassFlowOut, TwoPortThermalStateTerminal1.
        InMassFlow)
        annotation (points=[-86, -77; -86, -69; -51, -69], style(color=4));
      connect(Mechanical_Power_Source.ExergyFlowOut, AirCoolCompressor1.Pmech)
        annotation (points=[-66, 41; -54, 41; -54, 40; -42, 40; -42, 24; -28.5,
             24], style(color=2));
      connect(AirCoolCompressor1.OutMassFlow, Out_Air_Source.MassFlowOut)
        annotation (points=[26.5, 1.5; 54, 1.5; 54, -25], style(color=4));
      connect(AirPerfectGasCaloric1.StateCut, TwoPortThermalStateTerminal1.
        StateCut)
        annotation (points=[-64, -39; -64, -51; -40, -51], style(color=8));
      connect(TwoPortThermalStateTerminal1.StateCut, NotUsedVariables1.StateCut)
        annotation (points=[-40, -51; -40, -41], style(color=8));
      connect(NotUsedVariables1.StateCut, Temperature_Inlet.OutThermalState)
        annotation (points=[-40, -41; -10, -41], style(color=8));
      connect(TwoPortThermalStateTerminal1.OutMassFlow, AirCoolCompressor1.
        InMassFlow) annotation (points=[-29, -69; 22, -69; 22, -14; -38, -14; -38,
             1.5; -28.5, 1.5], style(color=4));
    end description_example_3_2_1;

    model description_example_3_2_2

      annotation (Coordsys(
          grid=[2, 2],
          component=[20, 20],
          extent=[-100, -150; 100, 100]), Diagram(Rectangle(extent=[-78, -16; 6,
                 -78], style(color=0, pattern=2))));
      Component.Compressor.AirCoolCompressor AirCoolCompressor1
        annotation (extent=[-26, -6; 24, 44]);
      Source.HeatFlow.ParameterDefined Waste_Heat_Sink
        annotation (extent=[-40, 58; -20, 78]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[-50, -72; -30, -52]);
      Source.ThermalState.ParameterDefined Temperature_Inlet(switch_t_def=true,
           t_const=20) annotation (extent=[-20, -62; 0, -42]);
      Source.ExergyFlow.ParameterDefined Mechanical_Power_Source(
          exergy_dot_para=-2.3e5, switch_exergy_dot_def=true)
        annotation (extent=[-92, 12; -72, 32]);
      Source.MassFlow.ParameterDefined Out_Air_Sink(switch_p_def=true, p_para=
            15.e5) annotation (extent=[44, -46; 64, -26]);
      Medium.Gas.AirPerfectGasCaloric AirPerfectGasCaloric1(
          option_h_u_correlations=4, option_s_correlation=0)
        annotation (extent=[-74, -38; -54, -18]);
      Interface.ThermalState.NotUsedVariables NotUsedVariables1(
        switch_rho_notused=true,
        switch_s_notused=true,
        switch_u_notused=true,
        switch_x_notused=true) annotation (extent=[-50, -40; -30, -20]);
      Source.MassFlow.ParameterDefined In_Air_Source(
        switch_p_def=true,
        switch_x_i_def=true,
        switch_m_dot_def=false) annotation (extent=[-66, -112; -46, -92]);
    equation
      connect(Waste_Heat_Sink.OutHeatFlow, AirCoolCompressor1.RemovedHeat)
        annotation (points=[-30, 79; -10, 79; -10, 78; -1, 78; -1, 46.5], style(
            color=47));
      connect(AirCoolCompressor1.OutMassFlow, Out_Air_Sink.MassFlowOut)
        annotation (points=[26.5, 1.5; 54, 1.5; 54, -25], style(color=4));
      connect(AirPerfectGasCaloric1.StateCut, TwoPortThermalStateTerminal1.
        StateCut)
        annotation (points=[-64, -39; -64, -51; -40, -51], style(color=8));
      connect(TwoPortThermalStateTerminal1.StateCut, NotUsedVariables1.StateCut)
        annotation (points=[-40, -51; -40, -41], style(color=8));
      connect(NotUsedVariables1.StateCut, Temperature_Inlet.OutThermalState)
        annotation (points=[-40, -41; -10, -41], style(color=8));
      connect(Mechanical_Power_Source.ExergyFlowOut, AirCoolCompressor1.Pmech)
        annotation (points=[-82, 33; -58, 33; -58, 24; -28.5, 24], style(color=
              2));
      connect(AirCoolCompressor1.InMassFlow, TwoPortThermalStateTerminal1.
        OutMassFlow) annotation (points=[-28.5, 1.5; -50, 1.5; -50, -12; 18, -12;
             18, -69; -29, -69], style(color=4));
      connect(TwoPortThermalStateTerminal1.InMassFlow, In_Air_Source.
        MassFlowOut) annotation (points=[-51, -69; -92, -69; -92, -91; -56, -91],
           style(color=4));
    end description_example_3_2_2;

    model description_example_3_2_3

      annotation (Coordsys(
          grid=[2, 2],
          component=[20, 20],
          extent=[-100, -150; 100, 100]), Diagram(Rectangle(extent=[-78, -16; 6,
                 -78], style(color=0, pattern=2))));
      Component.Compressor.AirCoolCompressor AirCoolCompressor1
        annotation (extent=[-26, -6; 24, 44]);
      Source.HeatFlow.ParameterDefined Waste_Heat_Sink
        annotation (extent=[-40, 58; -20, 78]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[-50, -72; -30, -52]);
      Source.ThermalState.ParameterDefined Temperature_Inlet(switch_t_def=true,
           t_const=20) annotation (extent=[-20, -62; 0, -42]);
      Source.ExergyFlow.ParameterDefined Mechanical_Power_Source(
          exergy_dot_para=-2.3e5, switch_exergy_dot_def=false)
        annotation (extent=[-92, 12; -72, 32]);
      Source.MassFlow.ParameterDefined Out_Air_Sink(switch_p_def=true, p_para=
            15.e5) annotation (extent=[44, -46; 64, -26]);
      Medium.Gas.AirPerfectGasCaloric AirPerfectGasCaloric1(
          option_h_u_correlations=4, option_s_correlation=0)
        annotation (extent=[-74, -38; -54, -18]);
      Interface.ThermalState.NotUsedVariables NotUsedVariables1(
        switch_rho_notused=true,
        switch_s_notused=true,
        switch_u_notused=true,
        switch_x_notused=true) annotation (extent=[-50, -40; -30, -20]);
      Source.MassFlow.ParameterDefined ParameterDefined1(
        switch_p_def=true,
        switch_x_i_def=true,
        switch_m_dot_def=false) annotation (extent=[-22, -146; -2, -126]);
      Modelica.Blocks.Sources.Ramp Ramp1
        annotation (extent=[-84, -134; -64, -114]);
      Source.MassFlow.FlowRateCrtl FlowRateCrtl1(switch_signal_def=true)
        annotation (extent=[-36, -114; -16, -94], rotation=90);
    equation
      connect(Waste_Heat_Sink.OutHeatFlow, AirCoolCompressor1.RemovedHeat)
        annotation (points=[-30, 79; -10, 79; -10, 78; -1, 78; -1, 46.5], style(
            color=47));
      connect(AirCoolCompressor1.OutMassFlow, Out_Air_Sink.MassFlowOut)
        annotation (points=[26.5, 1.5; 54, 1.5; 54, -25], style(color=4));
      connect(AirPerfectGasCaloric1.StateCut, TwoPortThermalStateTerminal1.
        StateCut)
        annotation (points=[-64, -39; -64, -51; -40, -51], style(color=8));
      connect(TwoPortThermalStateTerminal1.StateCut, NotUsedVariables1.StateCut)
        annotation (points=[-40, -51; -40, -41], style(color=8));
      connect(NotUsedVariables1.StateCut, Temperature_Inlet.OutThermalState)
        annotation (points=[-40, -41; -10, -41], style(color=8));
      connect(Mechanical_Power_Source.ExergyFlowOut, AirCoolCompressor1.Pmech)
        annotation (points=[-82, 33; -58, 33; -58, 24; -28.5, 24], style(color=
              2));
      connect(AirCoolCompressor1.InMassFlow, TwoPortThermalStateTerminal1.
        OutMassFlow) annotation (points=[-28.5, 1.5; -50, 1.5; -50, -12; 18, -12;
             18, -69; -29, -69], style(color=4));
      connect(TwoPortThermalStateTerminal1.InMassFlow, FlowRateCrtl1.
        OutMassFlow) annotation (points=[-51, -69; -86, -69; -86, -90; -19, -90;
             -19, -93], style(color=4));
      connect(FlowRateCrtl1.InMassFlow, ParameterDefined1.MassFlowOut)
        annotation (points=[-19, -115; -19, -125; -12, -125], style(color=4));
      connect(Ramp1.outPort, FlowRateCrtl1.InSignal) annotation (points=[-63, -124;
             -52, -124; -52, -104; -37, -104], style(color=3));
    end description_example_3_2_3;

    model description_example_3_2_4

      annotation (Coordsys(
          grid=[2, 2],
          component=[20, 20],
          extent=[-100, -150; 100, 100]), Diagram(Rectangle(extent=[-78, -16; 6,
                 -78], style(color=0, pattern=2))));
      Component.Compressor.AirCoolCompressor AirCoolCompressor1
        annotation (extent=[-26, -6; 24, 44]);
      Source.HeatFlow.ParameterDefined Waste_Heat_Sink
        annotation (extent=[-40, 58; -20, 78]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[-50, -72; -30, -52]);
      Source.ThermalState.ParameterDefined Temperature_Inlet(switch_t_def=true,
           t_const=20) annotation (extent=[-20, -62; 0, -42]);
      Source.ExergyFlow.ParameterDefined Mechanical_Power_Source(
          exergy_dot_para=-2.3e5, switch_exergy_dot_def=false)
        annotation (extent=[-92, 12; -72, 32]);
      Source.MassFlow.ParameterDefined Out_Air_Sink(switch_p_def=true, p_para=
            15.e5) annotation (extent=[44, -46; 64, -26]);
      Medium.Gas.AirPerfectGasCaloric AirPerfectGasCaloric1(
          option_h_u_correlations=4, option_s_correlation=0)
        annotation (extent=[-74, -38; -54, -18]);
      Interface.ThermalState.NotUsedVariables NotUsedVariables1(
        switch_rho_notused=true,
        switch_s_notused=true,
        switch_u_notused=true,
        switch_x_notused=true) annotation (extent=[-50, -40; -30, -20]);
      Source.MassFlow.ParameterDefined ParameterDefined1(
        switch_x_i_def=true,
        switch_m_dot_def=false,
        switch_p_def=false) annotation (extent=[-22, -146; -2, -126]);
      Modelica.Blocks.Sources.Ramp Ramp1
        annotation (extent=[-82, -138; -62, -118]);
      Source.MassFlow.FlowRateCrtl FlowRateCrtl1(switch_signal_def=true)
        annotation (extent=[-40, -116; -20, -96], rotation=90);
      Source.MassFlow.SignalDefined SignalDefined1(option_defsignal=3)
        annotation (extent=[12, -128; 32, -108]);
      Modelica.Blocks.Sources.Sine Sine1(amplitude={0.2e5}, offset={1.e5})
        annotation (extent=[42, -122; 62, -102]);
    equation
      connect(Waste_Heat_Sink.OutHeatFlow, AirCoolCompressor1.RemovedHeat)
        annotation (points=[-30, 79; -10, 79; -10, 78; -1, 78; -1, 46.5], style(
            color=47));
      connect(AirCoolCompressor1.OutMassFlow, Out_Air_Sink.MassFlowOut)
        annotation (points=[26.5, 1.5; 54, 1.5; 54, -25], style(color=4));
      connect(AirPerfectGasCaloric1.StateCut, TwoPortThermalStateTerminal1.
        StateCut)
        annotation (points=[-64, -39; -64, -51; -40, -51], style(color=8));
      connect(TwoPortThermalStateTerminal1.StateCut, NotUsedVariables1.StateCut)
        annotation (points=[-40, -51; -40, -41], style(color=8));
      connect(NotUsedVariables1.StateCut, Temperature_Inlet.OutThermalState)
        annotation (points=[-40, -41; -10, -41], style(color=8));
      connect(Mechanical_Power_Source.ExergyFlowOut, AirCoolCompressor1.Pmech)
        annotation (points=[-82, 33; -58, 33; -58, 24; -28.5, 24], style(color=
              2));
      connect(AirCoolCompressor1.InMassFlow, TwoPortThermalStateTerminal1.
        OutMassFlow) annotation (points=[-28.5, 1.5; -50, 1.5; -50, -12; 18, -12;
             18, -69; -29, -69], style(color=4));
      connect(TwoPortThermalStateTerminal1.InMassFlow, FlowRateCrtl1.
        OutMassFlow) annotation (points=[-51, -69; -86, -69; -86, -90; -23, -90;
             -23, -95], style(color=4));
      connect(FlowRateCrtl1.InMassFlow, ParameterDefined1.MassFlowOut)
        annotation (points=[-23, -117; -23, -125; -12, -125], style(color=4));
      connect(Ramp1.outPort, FlowRateCrtl1.InSignal) annotation (points=[-61, -128;
             -60, -128; -60, -106; -41, -106], style(color=3));
      connect(FlowRateCrtl1.InMassFlow, SignalDefined1.OutMassFlow) annotation
        (points=[-23, -117; -8, -117; -8, -98; 24, -98; 24, -107; 22, -107],
          style(color=4));
      connect(SignalDefined1.InSignal, Sine1.outPort) annotation (points=[22, -129;
             22, -138; 80, -138; 80, -110; 68, -110; 68, -112; 63, -112], style(
            color=3));
    end description_example_3_2_4;

    model description_example_3_2_5

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram(Rectangle(
              extent=[-78, -16; 6, -78], style(color=0, pattern=2))));
      Component.Compressor.AirCoolCompressor AirCoolCompressor1
        annotation (extent=[-26, -6; 24, 44]);
      Source.HeatFlow.ParameterDefined Waste_Heat_Sink
        annotation (extent=[-40, 58; -20, 78]);
      Source.MassFlow.ParameterDefined Inlet_Air_Source(
        switch_p_def=true,
        switch_x_i_def=true,
        x_para_i={1},
        m_dot_para=-1,
        switch_m_dot_def=false) annotation (extent=[-96, -98; -76, -78]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[-50, -72; -30, -52]);
      Source.ThermalState.ParameterDefined Temperature_Inlet(switch_t_def=true,
           t_const=20) annotation (extent=[-20, -62; 0, -42]);
      Source.ExergyFlow.ParameterDefined Mechanical_Power_Source(
          exergy_dot_para=-1000, switch_exergy_dot_def=false)
        annotation (extent=[-76, 20; -56, 40]);
      Source.MassFlow.ParameterDefined Out_Air_Source(switch_p_def=true, p_para
          =15.e5) annotation (extent=[74, -42; 94, -22]);
      Medium.Gas.AirPerfectGasCaloric AirPerfectGasCaloric1(
          option_h_u_correlations=4, option_s_correlation=0)
        annotation (extent=[-74, -38; -54, -18]);
      Interface.ThermalState.NotUsedVariables NotUsedVariables1(
        switch_rho_notused=true,
        switch_s_notused=true,
        switch_u_notused=true,
        switch_x_notused=true) annotation (extent=[-50, -40; -30, -20]);
      Source.MassFlow.FlowVelocity FlowVelocity1(option_geometry=2)
        annotation (extent=[44, -2; 64, 18]);
      Modelica.Blocks.Sources.Ramp Ramp1(height={10}, offset={5})
        annotation (extent=[28, -36; 48, -16]);
      Interface.ThermalState.NotUsedVariables NotUsedVariables2(
        switch_s_notused=true,
        switch_u_notused=true,
        switch_x_notused=true) annotation (extent=[72, 34; 92, 54]);
      Medium.Gas.AirPerfectGasCalVol AirPerfectGasCalVol1(
          option_h_u_correlations=4, option_s_correlation=0)
        annotation (extent=[44, 34; 64, 54]);
    equation
      connect(Waste_Heat_Sink.OutHeatFlow, AirCoolCompressor1.RemovedHeat)
        annotation (points=[-30, 79; -10, 79; -10, 78; -1, 78; -1, 46.5], style(
            color=47));
      connect(Inlet_Air_Source.MassFlowOut, TwoPortThermalStateTerminal1.
        InMassFlow)
        annotation (points=[-86, -77; -86, -69; -51, -69], style(color=4));
      connect(Mechanical_Power_Source.ExergyFlowOut, AirCoolCompressor1.Pmech)
        annotation (points=[-66, 41; -54, 41; -54, 40; -42, 40; -42, 24; -28.5,
             24], style(color=2));
      connect(AirPerfectGasCaloric1.StateCut, TwoPortThermalStateTerminal1.
        StateCut)
        annotation (points=[-64, -39; -64, -51; -40, -51], style(color=8));
      connect(TwoPortThermalStateTerminal1.StateCut, NotUsedVariables1.StateCut)
        annotation (points=[-40, -51; -40, -41], style(color=8));
      connect(NotUsedVariables1.StateCut, Temperature_Inlet.OutThermalState)
        annotation (points=[-40, -41; -10, -41], style(color=8));
      connect(TwoPortThermalStateTerminal1.OutMassFlow, AirCoolCompressor1.
        InMassFlow) annotation (points=[-29, -69; 22, -69; 22, -14; -38, -14; -38,
             1.5; -28.5, 1.5], style(color=4));
      connect(AirCoolCompressor1.OutMassFlow, FlowVelocity1.InMassFlow)
        annotation (points=[26.5, 1.5; 34.25, 1.5; 34.25, 1; 43, 1], style(
            color=4));
      connect(FlowVelocity1.OutMassFlow, Out_Air_Source.MassFlowOut)
        annotation (points=[65, 1; 84, 1; 84, -21], style(color=4));
      connect(FlowVelocity1.Velocity, Ramp1.outPort)
        annotation (points=[54, -3; 54, -26; 49, -26], style(color=3));
      connect(FlowVelocity1.StateCut, NotUsedVariables2.StateCut) annotation (
          points=[54, 19; 68, 19; 68, 18; 82, 18; 82, 33], style(color=8));
      connect(AirPerfectGasCalVol1.StateCut, FlowVelocity1.StateCut)
        annotation (points=[54, 33; 54, 19], style(color=8));
    end description_example_3_2_5;

  end Chapter3_2;

  package Ex1 "examples: heat conduction in infinite wall"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: examples for application of library TechThermo


identification: TechThermo Gb

"));

    model Ex1a

      annotation (Coordsys(grid=[2, 2], component=[50, 50]), Diagram(
          Rectangle(extent=[-28, 90; 24, -98], style(color=0, fillColor=8)),
          Text(
            extent=[38, 60; 82, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Inner Side"),
          Text(
            extent=[-92, 60; -48, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Environment")));
      Basis.HeatTransport.PlateHeatConducting Wall(
        n_segment=1,
        rho_material_const=2000,
        dz_plate=0.05) annotation (extent=[-28, -26; 24, 26]);
      Source.HeatFlow.ParameterDefined InnerSide(switch_t_def=true, t_para=15)
        "boundary conditions at the inner side of the wall"
        annotation (extent=[40, -48; 90, 2]);
      Source.HeatFlow.SignalDefined Air(option_defsignal=2)
        "Boundary conditions imposed by environment"
        annotation (extent=[-96, -20; -46, 30]);
      Modelica.Blocks.Sources.Ramp Ramp1(height={20}, offset={15})
        annotation (extent=[-94, -94; -44, -44]);
    equation
      connect(Wall.OutHeatFlow, InnerSide.OutHeatFlow) annotation (points=[26.6,
             0; 45.8, 0; 45.8, 4.5; 65, 4.5], style(color=47));
      connect(Air.OutHeatFlow, Wall.InHeatFlow) annotation (points=[-71, 32.5;
            -48.5, 32.5; -48.5, 0; -30.6, 0], style(
          color=47,
          fillColor=8,
          fillPattern=1));
      connect(Air.InSignal, Ramp1.outPort) annotation (points=[-71, -22.5; -71,
             -32; -34, -32; -34, -69; -41.5, -69], style(
          color=3,
          fillColor=8,
          fillPattern=1));
    end Ex1a;

    model Ex1aa

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram(
          Rectangle(extent=[-28, 90; 24, -98], style(color=0, fillColor=8)),
          Text(
            extent=[38, 60; 82, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Inner Side"),
          Text(
            extent=[-94, 94; -50, 82],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Environment")));
      Basis.HeatTransport.PlateHeatConducting Wall(
        n_segment=1,
        rho_material_const=2000,
        dz_plate=0.05) annotation (extent=[-28, -26; 24, 26]);
      Source.HeatFlow.ParameterDefined InnerSide(switch_t_def=false, t_para=-1)
         "sink for heat flow at inner side of wall"
        annotation (extent=[40, -48; 90, 2]);
      Source.HeatFlow.SignalDefined AirTemperature(option_defsignal=2,
          switch_zero_q_dot=true)
        "definition of air temperature by external signal source"
        annotation (extent=[-80, -30; -60, -10]);
      Source.HeatFlow.SignalDefined AirHeatFlow(option_defsignal=1)
        "defines heat flow rate from air to wall "
        annotation (extent=[-80, 14; -60, 34]);
      Modelica.Blocks.Sources.Ramp HeatFlowSignal(height={-150})
        "provides signal defining heat flow rate"
        annotation (extent=[-96, 54; -76, 74]);
      Modelica.Blocks.Sources.Ramp TemperatureSignalSource(height={20}, offset=
            {15}) "provides signal defining temperature at surface of wall"
        annotation (extent=[-98, -62; -78, -42]);
    equation
      connect(Wall.OutHeatFlow, InnerSide.OutHeatFlow) annotation (points=[26.6,
             0; 45.8, 0; 45.8, 4.5; 65, 4.5], style(color=47));
      connect(AirHeatFlow.OutHeatFlow, Wall.InHeatFlow) annotation (points=[-70,
             35; -70, 40; -40, 40; -40, 0; -30.6, 0], style(color=47));
      connect(AirTemperature.OutHeatFlow, Wall.InHeatFlow)
        annotation (points=[-70, -9; -70, 0; -30.6, 0], style(color=47));
      connect(HeatFlowSignal.outPort, AirHeatFlow.InSignal) annotation (points=
            [-75, 64; -60, 64; -60, 44; -90, 44; -90, 6; -70, 6; -70, 13],
          style(color=3));
      connect(AirTemperature.InSignal, TemperatureSignalSource.outPort)
        annotation (points=[-70, -31; -77, -52], style(color=3));
    end Ex1aa;

    model Ex1b

      annotation (Coordsys(grid=[2, 2], component=[50, 50]), Diagram(
          Rectangle(extent=[-28, 90; 24, -98], style(color=0, fillColor=8)),
          Text(
            extent=[38, 60; 82, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Inner Side"),
          Text(
            extent=[-92, 60; -48, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Environment")));
      Basis.HeatTransport.PlateHeatConducting Wall(
        rho_material_const=2000,
        switch_zero_mass=false,
        k_thermal_const=1.0,
        dz_plate=0.072,
        n_segment=1) annotation (extent=[-28, -26; 24, 26]);
      Source.HeatFlow.ParameterDefined InnerSide(
        t_para=15,
        switch_q_dot_def=true,
        switch_t_def=false,
        q_dot_para=0.0) "boundary conditions at the inner side of the wall"
        annotation (extent=[40, -48; 90, 2]);
      Source.HeatFlow.SignalDefined Air(option_defsignal=2)
        "Boundary conditions imposed by environment"
        annotation (extent=[-96, -20; -46, 30]);
      Modelica.Blocks.Sources.Ramp Ramp1(offset={15}, height={5})
        annotation (extent=[-94, -94; -44, -44]);
    equation
      connect(Wall.OutHeatFlow, InnerSide.OutHeatFlow) annotation (points=[26.6,
             0; 45.8, 0; 45.8, 4.5; 65, 4.5], style(color=47));
      connect(Air.OutHeatFlow, Wall.InHeatFlow) annotation (points=[-71, 32.5;
            -48.5, 32.5; -48.5, 0; -30.6, 0], style(
          color=47,
          fillColor=8,
          fillPattern=1));
      connect(Air.InSignal, Ramp1.outPort) annotation (points=[-71, -22.5; -71,
             -32; -34, -32; -34, -69; -41.5, -69], style(
          color=3,
          fillColor=8,
          fillPattern=1));
    end Ex1b;

    model Ex1c

      annotation (Coordsys(grid=[2, 2], component=[50, 50]), Diagram(
          Rectangle(extent=[-28, 90; 24, -98], style(color=0, fillColor=8)),
          Text(
            extent=[38, 60; 82, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Inner Side"),
          Text(
            extent=[-92, 60; -48, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Environment")));
      Basis.HeatTransport.PlateHeatConducting Wall(
        rho_material_const=2000,
        switch_zero_mass=false,
        k_thermal_const=1.0,
        n_segment=2,
        dz_plate=0.072) annotation (extent=[-28, -26; 24, 26]);
      Source.HeatFlow.ParameterDefined InnerSide(
        t_para=15,
        switch_q_dot_def=true,
        switch_t_def=false,
        q_dot_para=0.0) "boundary conditions at the inner side of the wall"
        annotation (extent=[40, -48; 90, 2]);
      Source.HeatFlow.SignalDefined Air(option_defsignal=2)
        "Boundary conditions imposed by environment"
        annotation (extent=[-96, -20; -46, 30]);
      Modelica.Blocks.Sources.Ramp Ramp1(offset={15}, height={5})
        annotation (extent=[-94, -94; -44, -44]);
    equation
      connect(Wall.OutHeatFlow, InnerSide.OutHeatFlow) annotation (points=[26.6,
             0; 45.8, 0; 45.8, 4.5; 65, 4.5], style(color=47));
      connect(Air.OutHeatFlow, Wall.InHeatFlow) annotation (points=[-71, 32.5;
            -48.5, 32.5; -48.5, 0; -30.6, 0], style(
          color=47,
          fillColor=8,
          fillPattern=1));
      connect(Air.InSignal, Ramp1.outPort) annotation (points=[-71, -22.5; -71,
             -32; -34, -32; -34, -69; -41.5, -69], style(
          color=3,
          fillColor=8,
          fillPattern=1));
    end Ex1c;

    model Ex1d

      annotation (Coordsys(grid=[2, 2], component=[50, 50]), Diagram(
          Rectangle(extent=[-28, 90; 24, -98], style(color=0, fillColor=8)),
          Text(
            extent=[38, 60; 82, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Inner Side"),
          Text(
            extent=[-92, 60; -48, 48],
            style(
              color=0,
              fillColor=8,
              fillPattern=1),
            string="Environment")));
      Basis.HeatTransport.PlateHeatConducting Wall(
        switch_zero_mass=false,
        option_initial=2,
        cross_area=1,
        n_segment=10,
        k_thermal_const=1.0,
        c_heat_const=1100,
        rho_material_const=2000,
        t_initial=15,
        dz_plate=3) annotation (extent=[-28, -26; 24, 26]);
      Source.HeatFlow.ParameterDefined InnerSide(
        t_para=15,
        q_dot_para=0.0,
        switch_q_dot_def=true,
        switch_t_def=false) "boundary conditions at the inner side of the wall"
        annotation (extent=[40, -48; 90, 2]);
      Source.HeatFlow.SignalDefined Air(option_defsignal=1)
        "Boundary conditions imposed by environment"
        annotation (extent=[-96, -20; -46, 30]);
      Modelica.Blocks.Sources.Ramp Ramp1(
        offset={0},
        height={-100},
        duration={1}) annotation (extent=[-94, -94; -44, -44]);
    equation
      connect(Wall.OutHeatFlow, InnerSide.OutHeatFlow) annotation (points=[26.6,
             0; 45.8, 0; 45.8, 4.5; 65, 4.5], style(color=47));
      connect(Air.OutHeatFlow, Wall.InHeatFlow) annotation (points=[-71, 32.5;
            -48.5, 32.5; -48.5, 0; -30.6, 0], style(
          color=47,
          fillColor=8,
          fillPattern=1));
      connect(Air.InSignal, Ramp1.outPort) annotation (points=[-71, -22.5; -71,
             -32; -34, -32; -34, -69; -41.5, -69], style(
          color=3,
          fillColor=8,
          fillPattern=1));
    end Ex1d;

    model Ex1e
      "wall with convective boundary condition, sudden variation of fluid temperature"


      annotation (Coordsys(grid=[2, 2], component=[40, 40]), Diagram(Rectangle(
              extent=[0, 100; 40, -100], style(color=0, fillColor=8))));
      Basis.HeatTransport.PlateHeatConducting Wall(
        k_thermal_const=1.0,
        t_initial=15,
        switch_zero_mass=false,
        option_initial=2,
        rho_material_const=2000,
        n_segment=10,
        dz_plate=3) annotation (extent=[0, -24; 40, 16]);
      Source.HeatFlow.ParameterDefined ParameterDefined1(switch_q_dot_def=true,
           q_dot_para=0.0) annotation (extent=[50, -48; 90, -8]);
      Basis.HeatTransport.ForcedConvectionFlatPlateParaProp
        ForcedConvectionFlatPlateParaProp1(option_convective_model=-1,
          alpha_const=10) annotation (extent=[-66, -24; -26, 16]);
      Source.HeatFlow.SignalDefined FluidTemperature(option_defsignal=2)
        "definition of fluid temperature by signal from Ramp1"
        annotation (extent=[-102, -56; -62, -16]);
      Source.MassFlow.ParameterDefined FluidSource(
        switch_m_dot_def=true,
        switch_h_def=true,
        switch_p_def=true,
        switch_x_i_def=true,
        m_dot_para=-1,
        x_para_i={1}) "defines flow conditions for convective mass flow"
        annotation (extent=[-104, 34; -64, 74]);
      Source.MassFlow.ParameterDefined FluidSink
        "sink for convective mass flow" annotation (extent=[-52, 34; -12, 74]);
      Modelica.Blocks.Sources.Ramp Ramp1(height={5}, offset={15})
        annotation (extent=[-46, -98; -6, -58], rotation=90);
    equation
      connect(Wall.OutHeatFlow, ParameterDefined1.OutHeatFlow) annotation (
          points=[42, -4; 60, -4; 60, -6; 70, -6], style(
          color=47,
          fillColor=8,
          fillPattern=1));
      connect(ForcedConvectionFlatPlateParaProp1.OutHeatFlow, Wall.InHeatFlow)
        annotation (points=[-24, -4; -2, -4], style(color=47));
      connect(ForcedConvectionFlatPlateParaProp1.InHeatFlow, FluidTemperature.
        OutHeatFlow)
        annotation (points=[-68, -4; -82, -4; -82, -14], style(color=47));
      connect(FluidSink.MassFlowOut, ForcedConvectionFlatPlateParaProp1.
        OutletMass)
        annotation (points=[-32, 76; -8, 76; -8, 10; -24, 10], style(color=4));
      connect(FluidSource.MassFlowOut, ForcedConvectionFlatPlateParaProp1.
        InletMass) annotation (points=[-84, 76; -76, 76; -76, 72; -62, 72; -62,
             28; -80, 28; -80, 10; -68, 10], style(color=4));
      connect(FluidTemperature.InSignal, Ramp1.outPort) annotation (points=[-82,
             -58; -82, -70; -56, -70; -56, -40; -26, -40; -26, -56], style(
            color=3));
    end Ex1e;

  end Ex1;

  package Ex2
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    model Ex2a

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram(
          Rectangle(extent=[-100, -74; 100, -98], style(color=3, fillColor=46)),

          Rectangle(extent=[-96, -34; 34, -74], style(
              color=0,
              pattern=2,
              fillColor=30,
              fillPattern=1)),
          Rectangle(extent=[-14, 58; 34, -34], style(
              color=0,
              pattern=2,
              fillColor=30)),
          Rectangle(extent=[-96, 58; -14, -34], style(
              color=0,
              pattern=2,
              fillColor=0)),
          Text(
            extent=[-64, 56; -32, 42],
            string="coffee",
            style(
              color=7,
              pattern=2,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-10, 54; 28, 40],
            style(
              color=0,
              pattern=2,
              fillColor=0,
              fillPattern=1),
            string="side wall"),
          Text(
            extent=[-84, -44; -52, -56],
            style(
              color=0,
              pattern=2,
              fillColor=0,
              fillPattern=1),
            string="bottom"),
          Text(
            extent=[-94, -82; -62, -92],
            string="table",
            style(
              color=7,
              fillColor=46,
              fillPattern=1)),
          Text(
            extent=[-42, 90; 26, 78],
            string="Air",
            style(
              color=0,
              fillColor=46,
              fillPattern=1))));

      Basis.HeatTransport.CylinderHeatConducting SideWallHeatConduct(
        switch_zero_mass=false,
        k_thermal_const=1.2,
        c_heat_const=900,
        rho_material_const=1500,
        d_outer=0.075,
        d_inner=0.07,
        dz_zylinder=0.08,
        t_initial=20,
        option_initial=2) "heat transfer by conduction in side walls of cup"
        annotation (extent=[-8, -10; 32, 30]);
      Basis.HeatTransport.PlateHeatConducting BottomHeatConduct(
        k_thermal_const=1.2,
        c_heat_const=900,
        rho_material_const=1500,
        dz_plate=0.005,
        t_initial=20,
        switch_c_const=true,
        switch_zero_mass=false,
        option_initial=2,
        cross_area=0.0038) "heat conduction through the bottom of the cup"
        annotation (extent=[-44, -80; -4, -40], rotation=-90);
      Basis.Compartment.ThermalCapacity CoffeeVolume(
        option_initial=2,
        t_initial=90,
        c_heat_const=4200,
        m_const=0.2785) "energy balance for coffee"
        annotation (extent=[-108, -30; -28, 50], rotation=-90);
      Source.HeatFlow.ParameterDefined Environment(switch_t_def=true, t_para=20)

        "definition of temperature of environment; sink for thermal energy lost by coffee"
        annotation (extent=[60, -68; 80, -48]);

      Source.HeatFlow.ParameterDefined Isolation(switch_q_dot_def=true,
          q_dot_para=0.0) "no heat flow from side walls to environment"
        annotation (extent=[60, -12; 80, 8]);
    equation

      connect(CoffeeVolume.HeatCut, BottomHeatConduct.InHeatFlow)
        annotation (points=[-24, 10; -24, -38], style(color=47));
      connect(CoffeeVolume.HeatCut, SideWallHeatConduct.InHeatFlow) annotation
        (points=[-24, 10; -17, 10; -17, 10; -10, 10], style(color=47));
      connect(BottomHeatConduct.OutHeatFlow, Environment.OutHeatFlow)
        annotation (points=[-24, -82; -24, -78; 30, -78; 30, -47; 70, -47],
          style(color=47));
      connect(SideWallHeatConduct.OutHeatFlow, Isolation.OutHeatFlow)
        annotation (points=[34, 10; 54, 10; 54, 9; 70, 9], style(color=47));
    end Ex2a;

    model Ex2b

      annotation (Coordsys(grid=[2, 2], component=[30, 30]), Diagram(
          Rectangle(extent=[-100, -74; 100, -98], style(color=3, fillColor=46)),

          Rectangle(extent=[-96, -34; 34, -74], style(
              color=0,
              pattern=2,
              fillColor=30,
              fillPattern=1)),
          Rectangle(extent=[-14, 58; 34, -34], style(
              color=0,
              pattern=2,
              fillColor=30)),
          Rectangle(extent=[-96, 58; -14, -34], style(
              color=0,
              pattern=2,
              fillColor=0)),
          Text(
            extent=[-64, 56; -32, 42],
            string="coffee",
            style(
              color=7,
              pattern=2,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-10, 54; 28, 40],
            style(
              color=0,
              pattern=2,
              fillColor=0,
              fillPattern=1),
            string="side wall"),
          Text(
            extent=[-84, -44; -52, -56],
            style(
              color=0,
              pattern=2,
              fillColor=0,
              fillPattern=1),
            string="bottom"),
          Text(
            extent=[-94, -82; -62, -92],
            string="table",
            style(
              color=7,
              fillColor=46,
              fillPattern=1)),
          Text(
            extent=[26, 84; 94, 72],
            string="Air",
            style(
              color=0,
              fillColor=46,
              fillPattern=1))));

      Basis.HeatTransport.CylinderHeatConducting SideWallHeatConduct(
        switch_zero_mass=false,
        k_thermal_const=1.2,
        c_heat_const=900,
        rho_material_const=1500,
        d_outer=0.075,
        d_inner=0.07,
        dz_zylinder=0.08,
        t_initial=20,
        option_initial=2) "heat transfer by conduction in side walls of cup"
        annotation (extent=[-8, -10; 32, 30]);
      Basis.HeatTransport.PlateHeatConducting BottomHeatConduct(
        k_thermal_const=1.2,
        c_heat_const=900,
        rho_material_const=1500,
        dz_plate=0.005,
        t_initial=20,
        switch_c_const=true,
        switch_zero_mass=false,
        option_initial=2,
        cross_area=0.0038) "heat conduction through the bottom of the cup"
        annotation (extent=[-44, -80; -4, -40], rotation=-90);
      Basis.Compartment.ThermalCapacity CoffeeVolume(
        option_initial=2,
        t_initial=90,
        c_heat_const=4200,
        m_const=0.2785) "energy balance for coffee"
        annotation (extent=[-108, -30; -28, 50], rotation=-90);
      Source.HeatFlow.ParameterDefined Environment(switch_t_def=true, t_para=20)

        "definition of temperature of environment; sink for thermal energy lost by coffee"
        annotation (extent=[60, -66; 80, -46]);

      Basis.HeatTransport.NaturalConvectionExternalFlowParaProp
        SideWallNaturalConvection(
        option_geometry=2,
        d_body=0.075,
        lambda_fluid_const=0.0257,
        pr_const=0.713,
        l_parallel_flow_direction=0.08)
        "heat transfer due to natural convection along the outside of the side walls of the cup"
        annotation (extent=[50, -6; 80, 26], rotation=180);
      Basis.HeatTransport.NaturalConvectionHorizontalSurfaceParaProp
        SurfaceCoffeeNaturalConvection(
        a_surface=0.0038,
        lambda_fluid_const=0.0257,
        pr_const=0.713,
        p_surface=0.22)
        "Heat transfer from surface of coffee due to natural convection"
        annotation (extent=[-40, 64; -10, 94], rotation=270);
    equation

      connect(CoffeeVolume.HeatCut, BottomHeatConduct.InHeatFlow)
        annotation (points=[-24, 10; -24, -38], style(color=47));
      connect(CoffeeVolume.HeatCut, SideWallHeatConduct.InHeatFlow) annotation
        (points=[-24, 10; -17, 10; -17, 10; -10, 10], style(color=47));
      connect(BottomHeatConduct.OutHeatFlow, Environment.OutHeatFlow)
        annotation (points=[-24, -82; -24, -78; 30, -78; 30, -45; 70, -45],
          style(color=47));
      connect(SideWallHeatConduct.OutHeatFlow, SideWallNaturalConvection.
        OutHeatFlow) annotation (points=[34, 10; 41.25, 10; 41.25, 10; 48.5, 10],
           style(color=47));
      connect(SideWallNaturalConvection.InHeatFlow, Environment.OutHeatFlow)
        annotation (points=[81.5, 10; 90, 10; 90, -45; 70, -45], style(color=47));
      connect(SurfaceCoffeeNaturalConvection.OutHeatFlow, CoffeeVolume.HeatCut)
         annotation (points=[-25, 62.5; -25, 36.25; -24, 36.25; -24, 10], style(
            color=47));
      connect(SurfaceCoffeeNaturalConvection.InHeatFlow,
        SideWallNaturalConvection.InHeatFlow) annotation (points=[-25, 95.5; -25,
             100; 81.5, 100; 81.5, 10], style(color=47));
    end Ex2b;

    model Ex2c

      annotation (Coordsys(grid=[2, 2], component=[30, 30]), Diagram(
          Rectangle(extent=[-100, -74; 100, -98], style(color=3, fillColor=46)),

          Rectangle(extent=[-96, -34; 34, -74], style(
              color=0,
              pattern=2,
              fillColor=30,
              fillPattern=1)),
          Rectangle(extent=[-14, 58; 34, -34], style(
              color=0,
              pattern=2,
              fillColor=30)),
          Rectangle(extent=[-96, 58; -14, -34], style(
              color=0,
              pattern=2,
              fillColor=0)),
          Text(
            extent=[-64, 56; -32, 42],
            string="coffee",
            style(
              color=7,
              pattern=2,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-10, 54; 28, 40],
            style(
              color=0,
              pattern=2,
              fillColor=0,
              fillPattern=1),
            string="side wall"),
          Text(
            extent=[-84, -44; -52, -56],
            style(
              color=0,
              pattern=2,
              fillColor=0,
              fillPattern=1),
            string="bottom"),
          Text(
            extent=[-94, -82; -62, -92],
            string="table",
            style(
              color=7,
              fillColor=46,
              fillPattern=1)),
          Text(
            extent=[26, 84; 94, 72],
            string="Air",
            style(
              color=0,
              fillColor=46,
              fillPattern=1))));

      Basis.HeatTransport.CylinderHeatConducting SideWallHeatConduct(
        switch_zero_mass=false,
        k_thermal_const=1.2,
        c_heat_const=900,
        rho_material_const=1500,
        d_outer=0.075,
        d_inner=0.07,
        dz_zylinder=0.08,
        t_initial=20,
        option_initial=2) "heat transfer by conduction in side walls of cup"
        annotation (extent=[-8, -10; 32, 30]);
      Basis.HeatTransport.PlateHeatConducting BottomHeatConduct(
        k_thermal_const=1.2,
        c_heat_const=900,
        rho_material_const=1500,
        dz_plate=0.005,
        t_initial=20,
        switch_c_const=true,
        switch_zero_mass=false,
        option_initial=2,
        cross_area=0.0038) "heat conduction through the bottom of the cup"
        annotation (extent=[-44, -80; -4, -40], rotation=-90);
      Basis.Compartment.ThermalCapacity CoffeeVolume(
        option_initial=2,
        t_initial=90,
        c_heat_const=4200,
        m_const=0.2785) "energy balance for coffee"
        annotation (extent=[-108, -30; -28, 50], rotation=-90);
      Source.HeatFlow.ParameterDefined Environment(switch_t_def=true, t_para=20)

        "definition of temperature of environment; sink for thermal energy lost by coffee"
        annotation (extent=[60, -66; 80, -46]);

      Basis.HeatTransport.NaturalConvectionExternalFlowParaProp
        SideWallNaturalConvection(
        option_geometry=2,
        d_body=0.075,
        lambda_fluid_const=0.0257,
        pr_const=0.713,
        l_parallel_flow_direction=0.08)
        "heat transfer due to natural convection along the outside of the side walls of the cup"
        annotation (extent=[50, -6; 80, 26], rotation=180);
      Basis.HeatTransport.NaturalConvectionHorizontalSurfaceParaProp
        SurfaceCoffeeNaturalConvection(
        a_surface=0.0038,
        p_surface=0.2199,
        lambda_fluid_const=0.0257,
        pr_const=0.713)
        "Heat transfer from surface of coffee due to natural convection"
        annotation (extent=[-40, 64; -10, 94], rotation=270);
      Basis.HeatTransport.RadiationHeatEmission RadiationSurfaceCoffee(
          epsilon_const=0.96, surface_area_const=0.0038)
        "calculates heat transferred from surface of coffee to environment by radiation"
        annotation (extent=[-78, 68; -48, 98], rotation=90);
      Basis.HeatTransport.RadiationHeatEmission RadiationSideWall(epsilon_const
          =0.96, surface_area_const=0.0188)
        "calculates heat transmitted to environment by side walls of cup"
        annotation (extent=[50, 32; 80, 62]);
    equation

      connect(CoffeeVolume.HeatCut, BottomHeatConduct.InHeatFlow)
        annotation (points=[-24, 10; -24, -38], style(color=47));
      connect(CoffeeVolume.HeatCut, SideWallHeatConduct.InHeatFlow) annotation
        (points=[-24, 10; -17, 10; -17, 10; -10, 10], style(color=47));
      connect(BottomHeatConduct.OutHeatFlow, Environment.OutHeatFlow)
        annotation (points=[-24, -82; -24, -78; 30, -78; 30, -45; 70, -45],
          style(color=47));
      connect(SideWallHeatConduct.OutHeatFlow, SideWallNaturalConvection.
        OutHeatFlow) annotation (points=[34, 10; 41.25, 10; 41.25, 10; 48.5, 10],
           style(color=47));
      connect(SideWallNaturalConvection.InHeatFlow, Environment.OutHeatFlow)
        annotation (points=[81.5, 10; 90, 10; 90, -45; 70, -45], style(color=47));
      connect(SurfaceCoffeeNaturalConvection.OutHeatFlow, CoffeeVolume.HeatCut)
         annotation (points=[-25, 62.5; -25, 36.25; -24, 36.25; -24, 10], style(
            color=47));
      connect(SurfaceCoffeeNaturalConvection.InHeatFlow,
        SideWallNaturalConvection.InHeatFlow) annotation (points=[-25, 95.5; -25,
             100; 96, 100; 96, 10; 81.5, 10], style(color=47));
      connect(RadiationSurfaceCoffee.OutHeatFlow,
        SurfaceCoffeeNaturalConvection.InHeatFlow) annotation (points=[-63,
            99.5; -42.5, 99.5; -42.5, 95.5; -25, 95.5], style(color=47));
      connect(RadiationSurfaceCoffee.InHeatFlow, SurfaceCoffeeNaturalConvection
        .OutHeatFlow) annotation (points=[-63, 66.5; -43.5, 66.5; -43.5, 62.5;
            -25, 62.5], style(color=47));
      connect(RadiationSideWall.InHeatFlow, SideWallHeatConduct.OutHeatFlow)
        annotation (points=[48.5, 47; 34, 47; 34, 10], style(color=47));
      connect(RadiationSideWall.OutHeatFlow, SideWallNaturalConvection.
        InHeatFlow) annotation (points=[81.5, 47; 81.5, 28.5; 81.5, 10; 81.5,
            10], style(color=47));
    end Ex2c;

  end Ex2;

  package Ex3
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    model Ex3a

      annotation (Coordsys(
          grid=[2, 2],
          component=[20, 20],
          extent=[-150, -150; 150, 150]), Diagram(Rectangle(extent=[-98, 138; -26,
                 46], style(color=0, pattern=2)), Text(
            extent=[-118, 152; -8, 138],
            style(color=0, pattern=2),
            string="Defintion steam quality at inlet of turbine")));
      Component.Turbine.H2oWetSteamTurbine Turbine
        annotation (extent=[-16, 46; 24, 86]);
      Component.HeatEx.H2OCondensor Condensor
        "condensation of wet steam from turbine"
        annotation (extent=[20, -16; 60, 24], rotation=-90);
      Component.Pump.H2oLiquidPump Pump
        "compression of water from condensation pressure to turbine inlet pressure"
        annotation (extent=[-34, -86; 6, -46], rotation=180);
      Component.Heater.SimpleHeater Boiler "generates steam from liquid water"
        annotation (extent=[-138, -36; -98, 4], rotation=90);
      Source.MassFlow.FlowRateCrtl FlowRate(
        switch_h_const=true,
        switch_p_const=true,
        switch_para_def=true,
        switch_m_dot_const=false,
        switch_x_i_const=false) "defines mass flow rate for steam in cycle"
        annotation (extent=[-120, 22; -100, 42], rotation=90);
      Interface.MassFlow.TwoPortThermalStateTerminal TwoPortThermalStateInlet
        annotation (extent=[-70, 50; -50, 70]);
      Source.ThermalState.ParameterDefined SteamQualityPressureInletTurbine(
        switch_x_def=true,
        x_const=1.0,
        p_const=60.e5,
        switch_p_def=false,
        switch_x_i_def=false)
        "definition of steam quality x=1.0 at inlet of steam turbine"
        annotation (extent=[-90, 82; -70, 102]);
      Source.HeatFlow.ParameterDefined HeatSinkEnvironment(switch_t_def=true,
          t_para=120)
        "defines temperature of environment, sink for heat from condensor"
        annotation (extent=[74, -38; 94, -18]);
      Source.ExergyFlow.ParameterDefined Generator
        "exergy from steam cycle to environment"
        annotation (extent=[92, 48; 112, 68]);
      Source.HeatFlow.ParameterDefined HeatSource(switch_t_def=true, t_para=500)

        "provides heat to generate steam; definition of temperature meaningless, required to complete set of equations"
        annotation (extent=[-130, -112; -110, -92]);

      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamInlet
        "calculates enthalpy of saturated steam at inlet of turbine"
        annotation (extent=[-56, 106; -36, 126]);
      Source.ExergyFlow.ParameterDefined PowerToPump
        "provides exergy needed by pump to compress feedwater"
        annotation (extent=[50, -126; 70, -106]);
      Source.MassFlow.ParameterDefined ParameterTurbineInlet(
        switch_p_def=true,
        switch_x_i_def=true,
        p_para=60.e5,
        x_para_i={1.0},
        switch_m_dot_def=true,
        m_dot_para=0.0) "defines pressure and composition at inlet of turbine"
        annotation (extent=[-34, 2; -14, 22]);
    equation
      connect(Turbine.OutMassFlow, Condensor.InMassFlow)
        annotation (points=[26, 52; 26, 26], style(color=4));
      connect(Condensor.OutMassFlow, Pump.InMassFlow)
        annotation (points=[26, -18; 26, -54; 8, -54; 8, -52], style(color=4));
      connect(FlowRate.InMassFlow, Boiler.OutMassFlow) annotation (points=[-103,
             21; -103, 16.5; -104, 16.5; -104, 6], style(color=4));
      connect(TwoPortThermalStateInlet.OutMassFlow, Turbine.InMassFlow)
        annotation (points=[-49, 53; -32.5, 53; -32.5, 52; -18, 52], style(
            color=4));
      connect(FlowRate.OutMassFlow, TwoPortThermalStateInlet.InMassFlow)
        annotation (points=[-103, 43; -103, 53; -71, 53], style(color=4));
      connect(SteamQualityPressureInletTurbine.OutThermalState,
        TwoPortThermalStateInlet.StateCut) annotation (points=[-80, 103; -80,
            116; -60, 116; -60, 71], style(color=8));
      connect(Condensor.RemovedHeat, HeatSinkEnvironment.OutHeatFlow)
        annotation (points=[62, 4; 84, 4; 84, -17], style(color=47));
      connect(Turbine.Pmech, Generator.ExergyFlowOut)
        annotation (points=[26, 70; 64, 70; 64, 69; 102, 69], style(color=2));
      connect(Boiler.Pthermal, HeatSource.OutHeatFlow) annotation (points=[-140,
             -16; -148, -16; -148, -82; -120, -82; -120, -91], style(color=47));
      connect(H2oWetSteamInlet.StateCut, TwoPortThermalStateInlet.StateCut)
        annotation (points=[-46, 105; -40, 105; -40, 71; -60, 71], style(color=
              8));
      connect(Pump.Pmech, PowerToPump.ExergyFlowOut) annotation (points=[4, -88;
             4, -98; 60, -98; 60, -105], style(color=2));
      connect(Turbine.InMassFlow, ParameterTurbineInlet.MassFlowOut)
        annotation (points=[-18, 52; -18, 32; -26, 32; -26, 23; -24, 23], style(
            color=4));
      connect(Boiler.InMassFlow, Pump.OutMassFlow)
        annotation (points=[-104, -38; -104, -52; -36, -52], style(color=4));
    end Ex3a;

    model Ex3b

      annotation (Coordsys(
          grid=[2, 2],
          component=[20, 20],
          extent=[-150, -150; 150, 150]), Diagram);
      Component.Turbine.H2oWetSteamTurbine Turbine
        annotation (extent=[-16, 46; 24, 86]);
      Component.HeatEx.H2OCondensor Condensor
        annotation (extent=[70, -44; 110, -4], rotation=-90);
      Component.Pump.H2oLiquidPump H2oLiquidPump1
        annotation (extent=[-34, -86; 6, -46], rotation=180);
      Component.Heater.SimpleHeater Boiler
        annotation (extent=[-138, -36; -98, 4], rotation=90);
      Source.MassFlow.FlowRateCrtl FlowRate(
        switch_h_const=true,
        switch_p_const=true,
        switch_para_def=true,
        switch_m_dot_const=false,
        switch_x_i_const=false) "defines mass flow rate for steam in cycle"
        annotation (extent=[-120, 22; -100, 42], rotation=90);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[-70, 50; -50, 70]);
      Source.ThermalState.ParameterDefined SteamQualityPressureInletTurbine(
        switch_x_def=true,
        x_const=1.0,
        p_const=60.e5,
        switch_p_def=false,
        switch_x_i_def=false)
        "definition of steam quality x=1.0 at inlet of steam turbine"
        annotation (extent=[-106, 82; -86, 102]);
      Source.HeatFlow.ParameterDefined HeatSinkEnvironment(t_para=40,
          switch_t_def=false)
        "defines temperature of environment, sink for heat from condensor"
        annotation (extent=[108, -78; 128, -58]);
      Source.ExergyFlow.ParameterDefined Generator
        "exergy from steam cycle to environment"
        annotation (extent=[114, 60; 134, 80]);
      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamV01_1
        annotation (extent=[-48, 100; -28, 120]);
      Source.MassFlow.ParameterDefined CompositionDefinition(
        switch_x_i_def=true,
        x_para_i={1.0},
        switch_m_dot_def=true,
        m_dot_para=0.0,
        p_para=30.e5,
        switch_p_def=false) "defines composition vector"
        annotation (extent=[-34, 2; -14, 22]);
      Basis.Junction.ExergyFlowDouble ExergyFlowDouble1
        annotation (extent=[64, 84; 84, 104]);
      Basis.Junction.HeatFlowDouble HeatFlowDouble1
        annotation (extent=[-128, -108; -108, -88]);
      Source.HeatFlow.ParameterDefined ParameterDefined1(switch_t_def=true,
          t_para=400) annotation (extent=[-150, -146; -130, -126]);
      Basis.BasicProcess.ThermalEfficiency ThermalEfficiency
        "calculates thermal efficiency of process"
        annotation (extent=[-68, -124; -48, -104]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal2 annotation (extent=[50, 20; 70, 40]);
      Source.ThermalState.ParameterDefined ParameterDefined2(switch_x_def=true,
           x_const=0.8) annotation (extent=[88, 16; 108, 36]);
      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamV01_2
        annotation (extent=[36, 48; 56, 68]);
      Source.MassFlow.SignalDefined PressureInletDefinition(option_defsignal=3,
           switch_zero_m_dot=true) "defines pressure at inlet of turbine"
        annotation (extent=[-68, 2; -48, 22]);
      Modelica.Blocks.Sources.Ramp PressureInletSignal(
        height={50e5},
        duration={1},
        offset={50.e5}) "provides signal for pressure at inlet of turbine"
        annotation (extent=[-86, -28; -66, -8]);
    equation
      connect(Condensor.OutMassFlow, H2oLiquidPump1.InMassFlow)
        annotation (points=[76, -46; 76, -54; 8, -54; 8, -52], style(color=4));
      connect(FlowRate.InMassFlow, Boiler.OutMassFlow) annotation (points=[-103,
             21; -103, 16.5; -104, 16.5; -104, 6], style(color=4));
      connect(TwoPortThermalStateTerminal1.OutMassFlow, Turbine.InMassFlow)
        annotation (points=[-49, 53; -32.5, 53; -32.5, 52; -18, 52], style(
            color=4));
      connect(FlowRate.OutMassFlow, TwoPortThermalStateTerminal1.InMassFlow)
        annotation (points=[-103, 43; -103, 53; -71, 53], style(color=4));
      connect(SteamQualityPressureInletTurbine.OutThermalState,
        TwoPortThermalStateTerminal1.StateCut) annotation (points=[-96, 103; -96,
             116; -60, 116; -60, 71], style(color=8));
      connect(Condensor.RemovedHeat, HeatSinkEnvironment.OutHeatFlow)
        annotation (points=[112, -24; 118, -24; 118, -57], style(color=47));
      connect(H2oWetSteamV01_1.StateCut, TwoPortThermalStateTerminal1.StateCut)
         annotation (points=[-38, 99; -40, 99; -40, 71; -60, 71], style(color=8));
      connect(Turbine.InMassFlow, CompositionDefinition.MassFlowOut)
        annotation (points=[-18, 52; -18, 32; -26, 32; -26, 23; -24, 23], style(
            color=4));
      connect(Boiler.InMassFlow, H2oLiquidPump1.OutMassFlow)
        annotation (points=[-104, -38; -104, -52; -36, -52], style(color=4));
      connect(Turbine.Pmech, ExergyFlowDouble1.Inlet)
        annotation (points=[26, 70; 63, 70; 63, 94], style(color=2));
      connect(ExergyFlowDouble1.Inlet, H2oLiquidPump1.Pmech) annotation (points
          =[63, 94; 64, 94; 64, 128; 140, 128; 140, -104; 4, -104; 4, -88],
          style(color=2));
      connect(ExergyFlowDouble1.Outlet2, Generator.ExergyFlowOut)
        annotation (points=[85, 85; 124, 85; 124, 81], style(color=2));
      connect(Boiler.Pthermal, HeatFlowDouble1.Outlet1) annotation (points=[-140,
             -16; -146, -16; -146, -18; -148, -18; -148, -78; -98, -78; -98, -89;
             -107, -89], style(color=47));
      connect(HeatFlowDouble1.Inlet, ParameterDefined1.OutHeatFlow) annotation
        (points=[-129, -98; -140, -98; -140, -125], style(color=47));
      connect(HeatFlowDouble1.Outlet2, ThermalEfficiency.Heat) annotation (
          points=[-107, -107; -90, -107; -90, -142; -54, -142; -54, -125; -58,
            -125], style(color=47));
      connect(ThermalEfficiency.Work, ExergyFlowDouble1.Outlet1) annotation (
          points=[-58, -103; -58, -96; -12, -96; -12, -140; 134, -140; 134, 103;
             85, 103], style(color=2));
      connect(Turbine.OutMassFlow, TwoPortThermalStateTerminal2.InMassFlow)
        annotation (points=[26, 52; 26, 23; 49, 23], style(color=4));
      connect(TwoPortThermalStateTerminal2.OutMassFlow, Condensor.InMassFlow)
        annotation (points=[71, 23; 76, 23; 76, -2], style(color=4));
      connect(TwoPortThermalStateTerminal2.StateCut, ParameterDefined2.
        OutThermalState)
        annotation (points=[60, 41; 60, 52; 98, 52; 98, 37], style(color=8));
      connect(H2oWetSteamV01_2.StateCut, TwoPortThermalStateTerminal2.StateCut)
        annotation (points=[46, 47; 46, 41; 60, 41], style(color=8));
      connect(PressureInletDefinition.OutMassFlow, Turbine.InMassFlow)
        annotation (points=[-58, 23; -58, 38; -18, 38; -18, 52], style(color=4));
      connect(PressureInletDefinition.InSignal, PressureInletSignal.outPort)
        annotation (points=[-58, 1; -58, -18; -65, -18], style(color=3));
    end Ex3b;

    model Ex3c

      annotation (Coordsys(extent=[-150, -100; 150, 100]), Diagram);
      Component.Turbine.H2oWetSteamTurbine Stage1Turbine
        "turbine for first expansion step"
        annotation (extent=[-68, 20; -48, 40]);
      Component.Turbine.H2oWetSteamTurbine Stage2Turbine
        "turbine for expansion to end pressure"
        annotation (extent=[18, 20; 38, 40]);
      Component.FlowCRTL.H2oPhaseSeparator H2oPhaseSeparator
        "separates liquid and gas phase after first expansion step"
        annotation (extent=[-14, 2; 6, 22]);
      Component.HeatEx.H2OCondensor Condensor
        "transfer of waste heat to environment"
        annotation (extent=[80, -20; 100, 0], rotation=270);
      Component.Pump.H2oLiquidPump Pump
        annotation (extent=[40, -56; 60, -36], rotation=180);
      Basis.Junction.MassFlow3PortParaCrtl MixingMassFlows
        "mixing of mass flow from separator and mass flow from condensor"
        annotation (extent=[-4, -52; 16, -32], rotation=180);
      Interface.MassFlow.TwoPort PressureAdaptor(
        switch_m_dot_const=true,
        switch_h_const=true,
        switch_p_const=false)
        "adaptation of pressure, avoids additional equation for composition vector due to closed loop"
        annotation (extent=[-2, -28; 18, -8], rotation=270);
      Source.HeatFlow.ParameterDefined Environment(t_para=40, switch_t_def=
            false)
        "sink for heat from condensor and definition of temperature of environment"
        annotation (extent=[114, -32; 134, -12]);
      Component.Heater.SimpleHeater Boiler
        annotation (extent=[-134, -30; -114, -10], rotation=90);
      Interface.MassFlow.TwoPortThermalStateTerminal ThermalStateInletTurbine1
        "used to define steam quality at inlet of turbine 1"
        annotation (extent=[-108, 20; -88, 40]);
      Source.ThermalState.ParameterDefined ParameterDefined1(
        switch_x_def=true,
        p_const=60.e5,
        x_const=1.0,
        switch_p_def=false,
        switch_x_i_def=false) annotation (extent=[-136, 42; -116, 62]);
      Source.HeatFlow.ParameterDefined HeatSource(switch_t_def=true, t_para=400)

        "provides thermal energy to process, definition of temperature meaningless"
        annotation (extent=[-152, -44; -132, -24]);

      Interface.MassFlow.TwoPort InterruptComposition2(
        switch_m_dot_const=true,
        switch_h_const=true,
        switch_p_const=true) annotation (extent=[-78, -40; -58, -20]);
      Source.ExergyFlow.ParameterDefined ParameterDefined2
        annotation (extent=[94, -92; 114, -72]);
      Source.MassFlow.ParameterDefined ExitPressureTurbine1(
        switch_p_def=true,
        m_dot_para=0.0,
        switch_m_dot_def=false,
        p_para=20.e5) "defines pressure at exit of turbine stage 1"
        annotation (extent=[-34, -22; -14, -2]);
      Source.MassFlow.FlowRateCrtl FlowRateCrtl(switch_signal_def=true)
        "definition of mass flow rate"
        annotation (extent=[-134, -2; -114, 18], rotation=-270);
      Modelica.Blocks.Sources.Constant ConstantValueMassFlowRate
        "defines mass flow rate of steam"
        annotation (extent=[-156, 16; -136, 36], rotation=270);
      Source.MassFlow.ParameterDefined InletPressureTurbine1(
        switch_m_dot_def=true,
        switch_p_def=true,
        m_dot_para=0.0,
        p_para=60.e5,
        switch_x_i_def=true) "defines pressure at inlet of turbine stage 1"
        annotation (extent=[-88, -6; -68, 14]);
      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamV01_1
        annotation (extent=[-82, 58; -62, 78]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[56, 20; 76, 40]);
      Medium.MultiPhase.H2oWetSteamV01 ThermalStateExit
        "calculates steam quality at exit of turbine stage 2"
        annotation (extent=[86, 44; 106, 64]);
      Source.ThermalState.ParameterDefined ParameterDefined3(switch_x_def=true,
           x_const=0.8) annotation (extent=[110, 14; 130, 34]);
    equation
      connect(Stage1Turbine.OutMassFlow, H2oPhaseSeparator.TwoPhaseIn)
        annotation (points=[-47, 23; -35.5, 23; -35.5, 12; -15, 12], style(
            color=4));
      connect(H2oPhaseSeparator.GasOut, Stage2Turbine.InMassFlow)
        annotation (points=[1, 23; 17, 23], style(color=4));
      connect(Condensor.OutMassFlow, Pump.InMassFlow)
        annotation (points=[83, -21; 83, -39; 61, -39], style(color=4));
      connect(MixingMassFlows.In, Pump.OutMassFlow) annotation (points=[17, -38.75;
             27.5, -38.75; 27.5, -39; 39, -39], style(color=4));
      connect(H2oPhaseSeparator.LiquidOut, PressureAdaptor.InMassFlow)
        annotation (points=[1, 1; 1, -3; 1, -7; 1, -7], style(color=4));
      connect(PressureAdaptor.OutMassFlow, MixingMassFlows.InOrOut) annotation
        (points=[1, -29; 1, -34; -22, -34; -22, -70; 6, -70; 6, -53], style(
            color=4));
      connect(Condensor.RemovedHeat, Environment.OutHeatFlow) annotation (
          points=[101, -10; 112, -10; 112, -11; 124, -11], style(color=47));
      connect(ThermalStateInletTurbine1.OutMassFlow, Stage1Turbine.InMassFlow)
        annotation (points=[-87, 23; -77.5, 23; -77.5, 23; -69, 23], style(
            color=4));
      connect(ParameterDefined1.OutThermalState, ThermalStateInletTurbine1.
        StateCut) annotation (points=[-126, 63; -126, 72; -98, 72; -98, 41],
          style(color=8));
      connect(Boiler.Pthermal, HeatSource.OutHeatFlow)
        annotation (points=[-135, -20; -142, -20; -142, -23], style(color=47));
      connect(Boiler.InMassFlow, InterruptComposition2.InMassFlow)
        annotation (points=[-117, -31; -117, -37; -79, -37], style(color=4));
      connect(InterruptComposition2.OutMassFlow, MixingMassFlows.Out)
        annotation (points=[-57, -37; -30.5, -37; -30.5, -38.75; -5, -38.75],
          style(color=4));
      connect(Pump.Pmech, ParameterDefined2.ExergyFlowOut)
        annotation (points=[59, -57; 59, -71; 104, -71], style(color=2));
      connect(Stage1Turbine.Pmech, ParameterDefined2.ExergyFlowOut) annotation
        (points=[-47, 32; -6, 32; -6, 92; 146, 92; 146, -71; 104, -71], style(
            color=2));
      connect(Stage2Turbine.Pmech, ParameterDefined2.ExergyFlowOut) annotation
        (points=[39, 32; 50, 32; 50, 82; 140, 82; 140, -60; 104, -60; 104, -71],
           style(color=2));
      connect(H2oPhaseSeparator.TwoPhaseIn, ExitPressureTurbine1.MassFlowOut)
        annotation (points=[-15, 12; -14, 12; -14, -1; -24, -1], style(color=4));
      connect(FlowRateCrtl.InMassFlow, Boiler.OutMassFlow) annotation (points=[
            -117, -3; -117, -5.5; -117, -5.5; -117, -9], style(color=4));
      connect(FlowRateCrtl.OutMassFlow, ThermalStateInletTurbine1.InMassFlow)
        annotation (points=[-117, 19; -117, 23; -109, 23], style(color=4));
      connect(ConstantValueMassFlowRate.outPort, FlowRateCrtl.InSignal)
        annotation (points=[-146, 15; -146, 8; -135, 8], style(color=3));
      connect(Stage1Turbine.InMassFlow, InletPressureTurbine1.MassFlowOut)
        annotation (points=[-69, 23; -69, 15; -78, 15], style(color=4));
      connect(H2oWetSteamV01_1.StateCut, ThermalStateInletTurbine1.StateCut)
        annotation (points=[-72, 57; -72, 41; -98, 41], style(color=8));
      connect(Stage2Turbine.OutMassFlow, TwoPortThermalStateTerminal1.
        InMassFlow) annotation (points=[39, 23; 55, 23], style(color=4));
      connect(TwoPortThermalStateTerminal1.OutMassFlow, Condensor.InMassFlow)
        annotation (points=[77, 23; 83, 23; 83, 1], style(color=4));
      connect(TwoPortThermalStateTerminal1.StateCut, ThermalStateExit.StateCut)
        annotation (points=[66, 41; 66, 43; 96, 43], style(color=8));
      connect(ThermalStateExit.StateCut, ParameterDefined3.OutThermalState)
        annotation (points=[96, 43; 96, 35; 120, 35], style(color=8));
    end Ex3c;

    model Ex3d

      annotation (Coordsys(extent=[-150, -100; 150, 100]), Diagram);
      Component.Turbine.H2oWetSteamTurbine Stage1Turbine
        "turbine for first expansion step"
        annotation (extent=[-68, 20; -48, 40]);
      Component.Turbine.H2oWetSteamTurbine Stage2Turbine
        "turbine for expansion to end pressure"
        annotation (extent=[18, 20; 38, 40]);
      Component.FlowCRTL.H2oPhaseSeparator H2oPhaseSeparator
        "separates liquid and gas phase after first expansion step"
        annotation (extent=[-14, 2; 6, 22]);
      Component.HeatEx.H2OCondensor H2OCondensor
        "transfer of waste heat to environment"
        annotation (extent=[80, -20; 100, 0], rotation=270);
      Component.Pump.H2oLiquidPump H2oLiquidPump1
        annotation (extent=[40, -56; 60, -36], rotation=180);
      Basis.Junction.MassFlow3PortParaCrtl MixingMassFlows
        annotation (extent=[-4, -52; 16, -32], rotation=180);
      Interface.MassFlow.TwoPort PressureAdaptor(
        switch_h_const=true,
        switch_p_const=false,
        switch_m_dot_const=true)
        "adaptation of pressure, avoids additional equation for composition vector due to closed loop"
        annotation (extent=[-2, -28; 18, -8], rotation=270);
      Source.HeatFlow.ParameterDefined Environment(t_para=40, switch_t_def=
            false)
        "sink for heat from condensor and definition of temperature of environment"
        annotation (extent=[114, -32; 134, -12]);
      Component.Heater.SimpleHeater SimpleHeater1
        annotation (extent=[-134, -30; -114, -10], rotation=90);
      Interface.MassFlow.TwoPortThermalStateTerminal ThermalStateInletTurbine1
        "used to define steam quality at inlet of turbine 1"
        annotation (extent=[-108, 20; -88, 40]);
      Source.ThermalState.ParameterDefined ParameterDefined1(
        switch_x_def=true,
        p_const=60.e5,
        x_const=1.0,
        switch_p_def=false,
        switch_x_i_def=false) annotation (extent=[-136, 42; -116, 62]);
      Source.HeatFlow.ParameterDefined HeatSource(switch_t_def=true, t_para=400)

        "provides thermal energy to process, definition of temperature meaningless"
        annotation (extent=[-144, -100; -124, -80]);

      Interface.MassFlow.TwoPort InterruptComposition2(
        switch_m_dot_const=true,
        switch_h_const=true,
        switch_p_const=true) annotation (extent=[-102, -40; -82, -20]);
      Source.ExergyFlow.ParameterDefined ExergySink
        "netto output of the power plant"
        annotation (extent=[100, -98; 120, -78]);
      Source.MassFlow.FlowRateCrtl FlowRateCrtl(switch_signal_def=true)
        "definition of mass flow rate"
        annotation (extent=[-134, -2; -114, 18], rotation=-270);
      Modelica.Blocks.Sources.Constant ConstantValueMassFlowRate
        "defines mass flow rate of steam"
        annotation (extent=[-156, 16; -136, 36], rotation=270);
      Source.MassFlow.ParameterDefined InletPressureTurbine1(
        switch_m_dot_def=true,
        m_dot_para=0.0,
        p_para=60.e5,
        switch_x_i_def=true,
        switch_p_def=false) "defines pressure at inlet of turbine stage 1"
        annotation (extent=[-60, -6; -40, 14]);
      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamV01_1
        annotation (extent=[-82, 58; -62, 78]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1 annotation (extent=[56, 20; 76, 40]);
      Medium.MultiPhase.H2oWetSteamV01 ThermalStateExit
        "calculates steam quality at exit of turbine stage 2"
        annotation (extent=[86, 44; 106, 64]);
      Source.ThermalState.ParameterDefined ParameterDefined3(switch_x_def=true,
           x_const=0.8) annotation (extent=[110, 14; 130, 34]);
      Basis.Junction.ExergyFlowDouble ExergyFlowDouble1
        annotation (extent=[90, -68; 110, -48], rotation=270);
      Basis.BasicProcess.ThermalEfficiency ThermalEfficiency
        "calculates thermal efficiency of process"
        annotation (extent=[-76, -88; -56, -68]);
      Basis.Junction.HeatFlowDouble HeatFlowDouble1
        annotation (extent=[-144, -72; -124, -52], rotation=90);
      Source.MassFlow.ParameterDefined ExitPressureTurbine1(switch_p_def=true,
          p_para=20.e5) "defines pressure at exit of turbine stage 1"
        annotation (extent=[-34, -28; -14, -8]);
      Source.MassFlow.SignalDefined PressureInletDefinition(option_defsignal=3,
           switch_zero_m_dot=true) "defines pressure at inlet of turbine"
        annotation (extent=[-90, -6; -70, 14]);
      Modelica.Blocks.Sources.Ramp PressurInletSignal(
        height={50.e5},
        duration={1},
        offset={50e5}) "provides signal for pressure at inlet of turbine"
        annotation (extent=[-72, -36; -52, -16], rotation=90);
    equation
      connect(Stage1Turbine.OutMassFlow, H2oPhaseSeparator.TwoPhaseIn)
        annotation (points=[-47, 23; -35.5, 23; -35.5, 12; -15, 12], style(
            color=4));
      connect(H2oPhaseSeparator.GasOut, Stage2Turbine.InMassFlow)
        annotation (points=[1, 23; 17, 23], style(color=4));
      connect(H2OCondensor.OutMassFlow, H2oLiquidPump1.InMassFlow)
        annotation (points=[83, -21; 83, -39; 61, -39], style(color=4));
      connect(MixingMassFlows.In, H2oLiquidPump1.OutMassFlow) annotation (
          points=[17, -38.75; 27.5, -38.75; 27.5, -39; 39, -39], style(color=4));
      connect(H2oPhaseSeparator.LiquidOut, PressureAdaptor.InMassFlow)
        annotation (points=[1, 1; 1, -3; 1, -7; 1, -7], style(color=4));
      connect(PressureAdaptor.OutMassFlow, MixingMassFlows.InOrOut) annotation
        (points=[1, -29; 1, -34; -22, -34; -22, -70; 6, -70; 6, -53], style(
            color=4));
      connect(H2OCondensor.RemovedHeat, Environment.OutHeatFlow) annotation (
          points=[101, -10; 112, -10; 112, -11; 124, -11], style(color=47));
      connect(ThermalStateInletTurbine1.OutMassFlow, Stage1Turbine.InMassFlow)
        annotation (points=[-87, 23; -77.5, 23; -77.5, 23; -69, 23], style(
            color=4));
      connect(ParameterDefined1.OutThermalState, ThermalStateInletTurbine1.
        StateCut) annotation (points=[-126, 63; -126, 72; -98, 72; -98, 41],
          style(color=8));
      connect(SimpleHeater1.InMassFlow, InterruptComposition2.InMassFlow)
        annotation (points=[-117, -31; -117, -37; -103, -37], style(color=4));
      connect(InterruptComposition2.OutMassFlow, MixingMassFlows.Out)
        annotation (points=[-81, -37; -30.5, -37; -30.5, -38.75; -5, -38.75],
          style(color=4));
      connect(FlowRateCrtl.InMassFlow, SimpleHeater1.OutMassFlow) annotation (
          points=[-117, -3; -117, -5.5; -117, -5.5; -117, -9], style(color=4));
      connect(FlowRateCrtl.OutMassFlow, ThermalStateInletTurbine1.InMassFlow)
        annotation (points=[-117, 19; -117, 23; -109, 23], style(color=4));
      connect(ConstantValueMassFlowRate.outPort, FlowRateCrtl.InSignal)
        annotation (points=[-146, 15; -146, 8; -135, 8], style(color=3));
      connect(Stage1Turbine.InMassFlow, InletPressureTurbine1.MassFlowOut)
        annotation (points=[-69, 23; -69, 15; -50, 15], style(color=4));
      connect(H2oWetSteamV01_1.StateCut, ThermalStateInletTurbine1.StateCut)
        annotation (points=[-72, 57; -72, 41; -98, 41], style(color=8));
      connect(Stage2Turbine.OutMassFlow, TwoPortThermalStateTerminal1.
        InMassFlow) annotation (points=[39, 23; 55, 23], style(color=4));
      connect(TwoPortThermalStateTerminal1.OutMassFlow, H2OCondensor.InMassFlow)
        annotation (points=[77, 23; 83, 23; 83, 1], style(color=4));
      connect(TwoPortThermalStateTerminal1.StateCut, ThermalStateExit.StateCut)
        annotation (points=[66, 41; 66, 43; 96, 43], style(color=8));
      connect(ThermalStateExit.StateCut, ParameterDefined3.OutThermalState)
        annotation (points=[96, 43; 96, 35; 120, 35], style(color=8));
      connect(ExergyFlowDouble1.Outlet1, ExergySink.ExergyFlowOut) annotation (
          points=[109, -69; 109, -72.5; 110, -72.5; 110, -77], style(color=2));
      connect(H2oLiquidPump1.Pmech, ExergyFlowDouble1.Inlet) annotation (points
          =[59, -57; 59, -64; 82, -64; 82, -47; 100, -47], style(color=2));
      connect(ExergyFlowDouble1.Inlet, Stage1Turbine.Pmech) annotation (points=
            [100, -47; 120, -47; 120, -68; 148, -68; 148, 96; -34, 96; -34, 30;
             -47, 30; -47, 32], style(color=2));
      connect(Stage2Turbine.Pmech, ExergyFlowDouble1.Inlet) annotation (points=
            [39, 32; 44, 32; 44, 88; 140, 88; 140, -38; 100, -38; 100, -47; 100,
             -47], style(color=2));
      connect(ThermalEfficiency.Work, ExergyFlowDouble1.Outlet2) annotation (
          points=[-66, -67; -66, -58; -38, -58; -38, -92; 91, -92; 91, -69],
          style(color=2));
      connect(HeatFlowDouble1.Inlet, HeatSource.OutHeatFlow)
        annotation (points=[-134, -73; -134, -79], style(color=47));
      connect(HeatFlowDouble1.Outlet2, ThermalEfficiency.Heat) annotation (
          points=[-125, -51; -125, -44; -82, -44; -82, -94; -66, -94; -66, -89],
           style(color=47));
      connect(HeatFlowDouble1.Outlet1, SimpleHeater1.Pthermal)
        annotation (points=[-143, -51; -135, -20], style(color=47));
      connect(H2oPhaseSeparator.TwoPhaseIn, ExitPressureTurbine1.MassFlowOut)
        annotation (points=[-15, 12; -14, 12; -14, -7; -24, -7], style(color=4));
      connect(Stage1Turbine.InMassFlow, PressureInletDefinition.OutMassFlow)
        annotation (points=[-69, 23; -69, 15; -80, 15], style(color=4));
      connect(PressureInletDefinition.InSignal, PressurInletSignal.outPort)
        annotation (points=[-80, -7; -72, -7; -72, -12; -62, -12; -62, -15],
          style(color=3));
    end Ex3d;

  end Ex3;

  package Ex4
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    model Ex4a

      Component.Compressor.AirCompressor AirCompressor
        "provides compressed air during charging process"
        annotation (extent=[-16, 50; 4, 70]);
      Source.ExergyFlow.SignalDefined MechanicalPowerCharging
        "mechanical power for compression of air during charging period"
        annotation (extent=[-82, -14; -62, 6]);
      annotation (Diagram(
          Rectangle(extent=[-110, 114; 38, -104], style(color=0, pattern=2)),
          Rectangle(extent=[44, 114; 108, -104], style(color=0, pattern=2)),
          Rectangle(extent=[112, 114; 320, -104], style(color=0, pattern=2)),
          Text(
            extent=[-80, 96; 2, 98],
            style(color=0, pattern=2),
            string="charging"),
          Text(
            extent=[33, 96; 115, 98],
            style(color=0, pattern=2),
            string="storage"),
          Text(
            extent=[181, 96; 263, 98],
            style(color=0, pattern=2),
            string="discharging")), Coordsys(extent=[-130, -120; 330, 120]));
      Source.MassFlow.ParameterDefined AmbientPressure(
        switch_p_def=true,
        switch_x_i_def=true,
        p_para=1.e5,
        x_para_i={1.0}) "defines pressure at inlet of compressor"
        annotation (extent=[-96, -88; -76, -68]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        InletTwoPortThermalStateTerminal
        "spec. enthalpy of inlet mass flow defined by temperature"
        annotation (extent=[-70, -58; -50, -38]);
      Source.ThermalState.ParameterDefined AmbientTemperature(
        switch_t_def=true,
        t_const=20,
        switch_x_def=true)
        "defines temperature at inlet of compressor, provides value for steam quality x=1"
        annotation (extent=[-98, -52; -78, -32]);
      Medium.Gas.AirPerfectGasCalVol InletAirPerfectGasCalVol
        "correlation physical properties for air at inlet"
        annotation (extent=[-56, -28; -36, -8]);
      Modelica.Blocks.Sources.Pulse SignalMechanicalPower(period={7200},
          amplitude={-20.e6}) "defines mechanical power during charging"
        annotation (extent=[-82, 52; -62, 72]);
      Source.HeatFlow.ParameterDefined ZeroHeatFlowStorageVessel(
          switch_q_dot_def=true, switch_t_def=true)
        "defines heat losses storage vessel = 0.0"
        annotation (extent=[48, 32; 68, 52]);
      Medium.Gas.AirPerfectGasCalVol StorageVesselAirPerfectGasCalVol
        "thermophysical properties in storage vessel"
        annotation (extent=[60, -64; 80, -44]);
      Source.ThermalState.ParameterDefined SteamQualityStorageVessel(
          switch_x_def=true, x_const=1.0)
        "defines steam quality = 1.0 in storage vessel"
        annotation (extent=[60, -94; 80, -74]);
      Basis.BasicProcess.AirChangeState CoolDownAir(ChangeStateNoProp1(
            option_state_change=2), OutletParameter(switch_t_def=true, t_const=
              700)) "air is cooled down after compression"
        annotation (extent=[-12, -40; 8, -20]);
      Source.HeatFlow.ParameterDefined HeatCooling
        "heat from cooling of air after compression"
        annotation (extent=[0, -6; 20, 14]);
      Source.ExergyFlow.ParameterDefined DefinitonZeroExergyDuringCooling(
          switch_exergy_dot_def=true)
        "exergy_dot = 0.0 during cooling of air after compression"
        annotation (extent=[-2, -90; 18, -70]);
      Basis.Compartment.Support.TwoPortMassControlVolumeNoProp
        TwoPortMassControlVolumeNoProp1(
        p_start=50.e5,
        t_start=70,
        switch_x_i_const=true,
        v_control=10000) annotation (extent=[62, 0; 82, 20]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TransferThermalStateToOutflow(switch_p_transfer=false,
          switch_x_i_transfer=false)
        "transfers thermal state in storage vessel to outflowing mass"
        annotation (extent=[120, -62; 140, -42]);
      Source.MassFlow.SignalDefined DefinitionMassFlowTurbine(option_defsignal=
            1) "defines mass flow rate "
        annotation (extent=[224, -96; 244, -76]);
      Modelica.Blocks.Sources.Pulse SignalMassFlow(
        amplitude={25},
        period={7200},
        startTime={3600}) "defines mass flow rate during discharge"
        annotation (extent=[168, -94; 188, -74]);
      Component.Turbine.AirTurbine AirTurbine1
        annotation (extent=[242, -62; 262, -42]);
      Source.MassFlow.ParameterDefined PressureTurbineOutlet(
        switch_m_dot_def=true,
        switch_p_def=true,
        m_dot_para=0.0)
        "defines pressure at outlet of turbine during discharge"
        annotation (extent=[256, -98; 276, -78]);
      Source.ExergyFlow.ParameterDefined SinkExergyFromTurbine
        "sink for mechanical power provided by turbine during discharge"
        annotation (extent=[282, -76; 302, -56]);
      Component.Heater.SimpleHeater SimpleHeater
        "heating of air during discharging cycle"
        annotation (extent=[152, -62; 172, -42]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TransferThermalStateInletTurbine
        "defines spec. enthalpy at inlet of turbine"
        annotation (extent=[194, -62; 214, -42]);
      Medium.Gas.AirPerfectGasCalVol AirPerfectGasCalVol3
        annotation (extent=[216, -26; 236, -6]);
      Source.HeatFlow.ParameterDefined HeatAirDischarge(t_para=800,
          switch_t_def=true)
        "source for thermal power during discharge process"
        annotation (extent=[128, 22; 148, 42]);
      Source.ThermalState.ParameterDefined TemperatureAirDischarge(
        switch_t_def=true,
        switch_x_def=true,
        t_const=800,
        x_const=1.0) "definition temperature air during"
        annotation (extent=[172, -36; 192, -16]);
      Basis.BasicProcess.ThermalEfficiency ThermalEfficiencyDischarge
        "calculates thermal efficiency discharge process"
        annotation (extent=[222, 20; 242, 40]);
      Basis.Junction.HeatFlowDouble HeatFlowDouble
        "doubles heat flow for efficiency calculation"
        annotation (extent=[128, -14; 148, 6]);
      Basis.Junction.ExergyFlowDouble ExergyFlowDouble
        "doubles exergy flow from turbine for efficiency calculation"
        annotation (extent=[270, -34; 290, -14]);
    equation
      connect(MechanicalPowerCharging.OutExergyFlow, AirCompressor.Pmech)
        annotation (points=[-72, 7; -72, 16; -68, 16; -68, 26; -42, 26; -42, 62;
             -17, 62], style(color=2));
      connect(AmbientPressure.MassFlowOut, InletTwoPortThermalStateTerminal.
        InMassFlow)
        annotation (points=[-86, -67; -86, -55; -71, -55], style(color=4));
      connect(AmbientTemperature.OutThermalState,
        InletTwoPortThermalStateTerminal.StateCut) annotation (points=[-88, -31;
             -88, -24; -60, -24; -60, -37], style(color=8));
      connect(InletTwoPortThermalStateTerminal.StateCut,
        InletAirPerfectGasCalVol.StateCut) annotation (points=[-60, -37; -60, -34;
             -46, -34; -46, -29], style(color=8));
      connect(CoolDownAir.InHeatFlow, HeatCooling.OutHeatFlow)
        annotation (points=[-2, -19; -2, 15; 10, 15], style(color=47));
      connect(DefinitonZeroExergyDuringCooling.ExergyFlowOut, CoolDownAir.
        InExergyFlow) annotation (points=[8, -69; -8, -69; -8, -50; -2, -50; -2,
             -41], style(color=2));
      connect(CoolDownAir.OutMassFlow, TwoPortMassControlVolumeNoProp1.
        InMassFlow)
        annotation (points=[9, -37; 61, -37; 61, 3], style(color=4));
      connect(StorageVesselAirPerfectGasCalVol.StateCut,
        TwoPortMassControlVolumeNoProp1.StateCut) annotation (points=[70, -65;
            84, -65; 84, -8; 72, -8; 72, -1], style(color=8));
      connect(AirPerfectGasCalVol3.StateCut, TransferThermalStateInletTurbine.
        StateCut)
        annotation (points=[226, -27; 226, -41; 204, -41], style(color=8));
      connect(AirTurbine1.Pmech, ExergyFlowDouble.Inlet)
        annotation (points=[263, -50; 269, -50; 269, -24], style(color=2));
      connect(ExergyFlowDouble.Outlet2, SinkExergyFromTurbine.ExergyFlowOut)
        annotation (points=[291, -33; 298, -33; 298, -55; 292, -55], style(
            color=2));
      connect(AirTurbine1.OutMassFlow, PressureTurbineOutlet.MassFlowOut)
        annotation (points=[263, -59; 276, -59; 276, -77; 266, -77], style(
            color=4));
      connect(AirTurbine1.OutMassFlow, DefinitionMassFlowTurbine.OutMassFlow)
        annotation (points=[263, -59; 263, -70; 234, -70; 234, -75], style(
            color=4));
      connect(SignalMassFlow.outPort, DefinitionMassFlowTurbine.InSignal)
        annotation (points=[189, -84; 204, -84; 204, -102; 234, -102; 234, -97],
           style(color=3));
      connect(ThermalEfficiencyDischarge.Work, ExergyFlowDouble.Outlet1)
        annotation (points=[232, 41; 232, 58; 294, 58; 294, -15; 291, -15],
          style(color=2));
      connect(HeatFlowDouble.Outlet1, ThermalEfficiencyDischarge.Heat)
        annotation (points=[149, 5; 232, 5; 232, 19], style(color=47));
      connect(TransferThermalStateInletTurbine.OutMassFlow, AirTurbine1.
        InMassFlow) annotation (points=[215, -59; 227.5, -59; 227.5, -59; 241,
            -59], style(color=4));
      connect(TemperatureAirDischarge.OutThermalState,
        TransferThermalStateInletTurbine.StateCut) annotation (points=[182, -15;
             182, -2; 202, -2; 202, -41; 204, -41], style(color=8));
      connect(SimpleHeater.OutMassFlow, TransferThermalStateInletTurbine.
        InMassFlow) annotation (points=[173, -59; 193, -59], style(color=4));
      connect(HeatFlowDouble.Outlet2, SimpleHeater.Pthermal) annotation (points
          =[149, -13; 156, -13; 156, -34; 162, -34; 162, -41], style(color=47));
      connect(HeatFlowDouble.Inlet, HeatAirDischarge.OutHeatFlow) annotation (
          points=[127, -4; 116, -4; 116, 56; 138, 56; 138, 43], style(color=47));
      connect(StorageVesselAirPerfectGasCalVol.StateCut,
        SteamQualityStorageVessel.OutThermalState)
        annotation (points=[70, -65; 70, -73], style(color=8));
      connect(ZeroHeatFlowStorageVessel.OutHeatFlow,
        TwoPortMassControlVolumeNoProp1.HeatFlow) annotation (points=[58, 53;
            58, 62; 72, 62; 72, 21; 72, 21], style(color=47));
      connect(InletTwoPortThermalStateTerminal.OutMassFlow, AirCompressor.
        InMassFlow) annotation (points=[-49, -55; -30, -55; -30, 53; -17, 53],
          style(color=4));
      connect(AirCompressor.OutMassFlow, CoolDownAir.InMassFlow) annotation (
          points=[5, 53; 18, 53; 18, 26; -22, 26; -22, -37; -13, -37], style(
            color=4));
      connect(TwoPortMassControlVolumeNoProp1.OutMassFlow,
        TransferThermalStateToOutflow.InMassFlow)
        annotation (points=[83, 3; 94, 3; 94, -59; 119, -59], style(color=4));
      connect(TwoPortMassControlVolumeNoProp1.StateCut,
        TransferThermalStateToOutflow.StateCut) annotation (points=[72, -1; 88,
             -1; 88, -12; 130, -12; 130, -41], style(color=8));
      connect(TransferThermalStateToOutflow.OutMassFlow, SimpleHeater.
        InMassFlow) annotation (points=[141, -59; 146.5, -59; 146.5, -59; 151,
            -59], style(color=4));
      connect(SignalMechanicalPower.outPort, MechanicalPowerCharging.InSignal)
        annotation (points=[-61, 62; -50, 62; -50, 32; -88, 32; -88, -20; -72,
            -20; -72, -15], style(color=3));
    end Ex4a;

  end Ex4;

end Xample;
