package Component
  //wds 07.08.01 14:00
  extends Modelica.Icons.Library;

  package SIunits = Modelica.SIunits;
  //using Modelica type-definition
  package GeneralConstants = Modelica.Constants;

  package TT = TechThermo;
  package TTInterface = TT.Interface;
  package TTBasis = TT.Basis;
  package TTSource = TT.Source;
  package TTMedium = TT.Medium;
  package TTComponent = TT.Component;

  annotation (Documentation(info="
content package: models describing basic technical components

Date of last modification:27-09-01, 16:00
Description last modification: s. package info
Author last modification:wds

identification: TechThermo E
"));

  annotation (
    Icon(
      Rectangle(extent=[-90, 40; 70, -86], style(fillColor=55)),
      Line(points=[-10, 20; -10, -70; -9, -70], style(color=0)),
      Line(points=[-55, -26; 34, -26], style(color=0)),
      Line(points=[-42, 7; 22, -58], style(color=0)),
      Line(points=[-42, -57; 23, 6], style(color=0)),
      Ellipse(extent=[-55, 20; 35, -70], style(color=0))),
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[1, 1],
      component=[20, 20]),
    Window(
      x=0.01,
      y=0.05,
      width=0.6,
      height=0.6));

  package Compressor
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations single component gas

identification: TechThermo Ea
"));

    annotation (
      Icon(
        Rectangle(extent=[-90, 40; 70, -86], style(fillColor=55)),
        Line(points=[-62, 18; -62, -72; 38, -52; 38, -1; -62, 18], style(color=
                0)),
        Polygon(points=[-80, -42; -40, -42; -40, -63; -10, -26; -42, 8; -42, -12;
               -80, -12; -80, -42], style(color=0, fillColor=0)),
        Polygon(points=[-72, 28; -62, 8; -52, 28; -72, 28], style(
            color=0,
            fillColor=0,
            fillPattern=1)),
        Polygon(points=[28, -52; 38, -72; 49, -52; 28, -52], style(
            color=0,
            fillColor=0,
            fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model AirCompressor "adiabatic compressor for air (perfect gas) TTcode:Ea1"


      extends TTComponent.Compressor.Support.CompressorCIM(
        final switch_m_dot_const=false,
        final switch_h_const=false,
        final switch_p_const=false,
        final switch_x_i_const=false);

      annotation (Coordsys(
          grid=[2, 2],
          component=[40, 40],
          extent=[-100, -120; 100, 120]), Diagram);
      Support.CompressorNoProp CompressorNoProp1
        annotation (extent=[-40, -26; 40, 54]);
      Medium.Gas.AirPerfectGasCaloric State2Properties(option_h_u_correlations=
            3, option_s_correlation=2)
        "calculates thermal properties for state2, correlation between pressure, enthalpy and entropy"
        annotation (extent=[10, 66; 50, 106]);
      Medium.Gas.AirPerfectGasCaloric InletProperties(option_s_correlation=2,
          option_h_u_correlations=3)
        "calculates thermal properties at inlet, correlation between pressure, enthalpy and entropy"
        annotation (extent=[-50, 66; -10, 106]);
      Interface.ThermalState.NotUsedVariables InletNotUsed(
        switch_rho_notused=true,
        switch_u_notused=true,
        switch_x_notused=true)
        "thermal state inlet: definition of density, internal energy and steam quality by dummy-values"
        annotation (extent=[-96, 62; -56, 102]);
      Interface.ThermalState.NotUsedVariables State2NotUsed(
        switch_rho_notused=true,
        switch_u_notused=true,
        switch_x_notused=true)
        "State 2: definition of density, internal energy and steam quality by dummy-values"
        annotation (extent=[58, 62; 98, 102]);
    equation
      connect(Pmech, CompressorNoProp1.Pmech) annotation (points=[-110, 20;
            -73.3333, 20; -73.3333, 20.6667; -36.6667, 20.6667], style(color=2));
      connect(CompressorNoProp1.InMassFlow, InMassFlow) annotation (points=[
            -36.6667, -9.33333; -36.6667, -70; -110, -70], style(color=4));
      connect(CompressorNoProp1.OutMassFlow, OutMassFlow) annotation (points=[
            36.6667, -9.33333; 36.6667, -70; 110, -70], style(color=4));
      connect(InletProperties.StateCut, CompressorNoProp1.Inlet)
        annotation (points=[-30, 64; -30, 50.6667], style(color=8));
      connect(State2Properties.StateCut, CompressorNoProp1.State2)
        annotation (points=[30, 64; 30, 50.6667], style(color=8));
      connect(InletNotUsed.StateCut, CompressorNoProp1.Inlet) annotation (
          points=[-76, 60; -76, 50.6667; -30, 50.6667], style(color=8));
      connect(State2NotUsed.StateCut, CompressorNoProp1.State2) annotation (
          points=[78, 60; 78, 48; 30, 48; 30, 50.6667], style(color=8));
    end AirCompressor;

    model AirCoolCompressor
      "compressor for air (perfect gas) with optional cooling TTcode:Ea2"
      extends TTComponent.Compressor.Support.CoolCompressorCIM(
        final switch_m_dot_const=false,
        final switch_h_const=false,
        final switch_p_const=false,
        final switch_x_i_const=false);

      annotation (Coordsys(grid=[2, 2], component=[40, 40]), Diagram);
      Support.CoolCompressorNoProp CoolCompressorNoProp1
        annotation (extent=[-40, -26; 40, 54]);
      Medium.Gas.AirPerfectGasCaloric State2Properties(option_h_u_correlations=
            4, option_s_correlation=2)
        "calculates thermal properties for state2, correlation between pressure, enthalpy and entropy"
        annotation (extent=[10, 66; 50, 106]);
      Medium.Gas.AirPerfectGasCaloric InletProperties(option_s_correlation=2,
          option_h_u_correlations=4)
        "calculates thermal properties at inlet, correlation between pressure, enthalpy and entropy"
        annotation (extent=[-50, 66; -10, 106]);
      Interface.ThermalState.NotUsedVariables InletNotUsed(
        switch_rho_notused=true,
        switch_u_notused=true,
        switch_x_notused=true)
        "thermal state inlet: definition of density, internal energy and steam quality by dummy-values"
        annotation (extent=[-96, 62; -56, 102]);
      Interface.ThermalState.NotUsedVariables State2NotUsed(
        switch_rho_notused=true,
        switch_u_notused=true,
        switch_x_notused=true)
        "State 2: definition of density, internal energy and steam quality by dummy-values"
        annotation (extent=[58, 62; 98, 102]);
    equation
      connect(Pmech, CoolCompressorNoProp1.Pmech) annotation (points=[-110, 20;
             -73.3333, 20; -73.3333, 20.6667; -36.6667, 20.6667], style(color=2));
      connect(RemovedHeat, CoolCompressorNoProp1.RemovedHeat)
        annotation (points=[0, 110; 0, 50.6667], style(color=47));
      connect(CoolCompressorNoProp1.InMassFlow, InMassFlow) annotation (points=
            [-36.6667, -9.33333; -36.6667, -70; -110, -70], style(color=4));
      connect(CoolCompressorNoProp1.OutMassFlow, OutMassFlow) annotation (
          points=[36.6667, -9.33333; 36.6667, -70; 110, -70], style(color=4));
      connect(InletProperties.StateCut, CoolCompressorNoProp1.Inlet)
        annotation (points=[-30, 64; -30, 50.6667], style(color=8));
      connect(State2Properties.StateCut, CoolCompressorNoProp1.State2)
        annotation (points=[30, 64; 30, 50.6667], style(color=8));
      connect(InletNotUsed.StateCut, CoolCompressorNoProp1.Inlet) annotation (
          points=[-76, 60; -76, 50.6667; -30, 50.6667], style(color=8));
      connect(State2NotUsed.StateCut, CoolCompressorNoProp1.State2) annotation
        (points=[78, 60; 78, 48; 30, 48; 30, 50.6667], style(color=8));
    end AirCoolCompressor;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.Compressor

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EaS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model CompressorCIM "connector-icon model for compressor"
        extends TTInterface.MassFlow.TwoPort;

        //----exergy-connector mechanical power needed for compression
        TTInterface.ExergyFlow.In Pmech annotation (extent=[-100, 30; -120, 10]);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
connector-icon model for compressor
</p>

<p>includes only definitions of connectors and icon-graphics</p>

<p>extends MassFlow.TwoPort</p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>
<hr>



<b>Identification:</b> TechThermo EaS1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(Polygon(points=[-90, 100; -90, -60; 90, -20; 90, 60; -90,
                   100], style(color=0, fillColor=4)), Polygon(points=[-100, 40;
                   -60, 40; -60, 80; -0, 20; -60, -40; -60, 0; -100, 0; -100,
                  40], style(color=0, fillColor=53))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end CompressorCIM;

      model CompressorNoProp
        "adiabatic compressor without specification of working fluid"
        extends TTComponent.Compressor.Support.CompressorCIM(
          final switch_m_dot_const=true,
          final switch_x_i_const=true,
          final switch_h_const=false,
          final switch_p_const=false);

        //----exergy-connector mechanical power needed for compression
        TTInterface.ThermalState.In Inlet
          annotation (extent=[-100, 100; -80, 120]);

        TTInterface.ThermalState.Out State2
          annotation (extent=[100, 100; 80, 120]);

        parameter SIunits.Efficiency eta_const=0.8
          "const. isentropic efficiency of compressor";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const=true then eta_isentrop=eta_con";

        SIunits.Efficiency eta_isentrop "isentropic efficiency of compressor";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
model for compressor without specification of working fluid
      </p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h,.p,.s,.x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>Inlet<td>x_i,h,p,s<td>rho,t,u</tr>
<tr><td>State2<td>x_i,h,p,s<td>rho,t,u</tr>

</table>




<br>


</p>


<hr>
<p><b>correlation between connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>identical to variables of other connectors</b></tr>
<tr><td>Inlet<td>p_in, h_in, x_in_i</tr>
<tr><td>State2<td>>p_out,x_out_i</tr>

</table>




<br>


</p>
<hr>




<b> NECESSARY ADDITIONS:</b> thermophysical correlations for working fluid at ThermalState-connectors
Inlet and State2
<hr>


<b> ASSUMPTIONS:</b>
<ul>
<li>no storage of mass or energy</li>
<li>no modification of mass fraction vector x_i</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_eta_const<td>eta_isentrop=eta_const
</tr>
<tr>
<td>switch_t_const<td>t_in=t_out
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b>none <br>


<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>eta_const<td>isentropic efficiency of compressor<td>Efficiency<td>[-]
</tr>
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo EaS2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        Inlet.h = h_in;
        Inlet.p = p_in;
        Inlet.x_i = x_in_i;

        State2.p = p_out;
        State2.x_i = x_out_i;

        if switch_eta_const == true then
          eta_isentrop = eta_const;
        end if;

        Inlet.s = State2.s;

        h_out = h_in + (State2.h - h_in)/eta_isentrop;

        Pmech.exergy_dot = m_in_dot*(h_out - h_in);

      end CompressorNoProp;

      model CoolCompressorCIM "connector-icon model for cooled compressor"
        extends TTInterface.MassFlow.TwoPort;

        //----exergy-connector mechanical power needed for compression
        TTInterface.ExergyFlow.In Pmech annotation (extent=[-100, 30; -120, 10]);

        //---heat-flow connector for removed heat
        TTInterface.HeatFlow.Out RemovedHeat
          annotation (extent=[-10, 100; 10, 120]);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
connector-icon model for cooled compressor
</p>

<p>includes only definitions of connectors and icon-graphics</p>

<p>extends MassFlow.TwoPort</p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>RemovedHeat<td>HeatFlow.Out<td>.t, .q_dot </tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>
<hr>



<b>Identification:</b> TechThermo EaS3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(
            Polygon(points=[-90, 100; -90, -60; 90, -20; 90, 60; -90, 100],
                style(color=0, fillColor=4)),
            Polygon(points=[-100, 40; -60, 40; -60, 80; -0, 20; -60, -40; -60,
                  0; -100, 0; -100, 40], style(color=0, fillColor=53)),
            Polygon(points=[0, 100; -40, 60; 40, 60; 0, 100], style(color=0,
                  fillColor=45))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end CoolCompressorCIM;

      model CoolCompressorNoProp
        "compressor with optional cooling without specification of working fluid"


        extends TTComponent.Compressor.Support.CoolCompressorCIM(
          final switch_m_dot_const=true,
          final switch_x_i_const=true,
          final switch_h_const=false,
          final switch_p_const=false);

        //----exergy-connector mechanical power needed for compression
        TTInterface.ThermalState.In Inlet
          annotation (extent=[-100, 100; -80, 120]);

        TTInterface.ThermalState.Out State2
          annotation (extent=[100, 100; 80, 120]);

        parameter SIunits.Efficiency eta_const=0.8
          "const. isentropic efficiency of compressor";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const=true then eta_isentrop=eta_con";

        parameter Integer option_cooling=1
          "1: isothermal compression, 2: adiabatic compression";

        SIunits.Efficiency eta_isentrop "isentropic efficiency of compressor";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
model for compressor without specification of working fluid
      </p>

<p>
optional cooling of compressor
</p>


<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>RemovedHeat<td>HeatFlow.Out<td>.t, .q_dot </tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h,.p,.s,.x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>Inlet<td>x_i,h,p,s,t<td>rho,x,u</tr>
<tr><td>State2<td>x_i,h,p,s,t<td>rho,x,u</tr>

</table>




<br>


</p>
<hr>


<hr>
<p><b>correlation between connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>identical to variables of other connectors</b></tr>
<tr><td>Inlet<td>p_in, h_in, x_in_i</tr>
<tr><td>State2<td>p_out,x_out_i</tr>

</table>




<br>


</p>
<hr>






<b> NECESSARY ADDITIONS:</b> thermophysical correlations for working fluid at ThermalState-connectors
Inlet and State2
<hr>


<b> ASSUMPTIONS:</b>
<ul>
no storage of mass or energy
</ul>
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_eta_const<td>eta_isentrop=eta_const
</tr>
<tr>
<td>switch_t_const<td>t_in=t_out
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b><br>

<br>

<table border=1>
<tr><td>  <b>option_cooling </b></tr>
<tr>
<td>1<td>isothermal compression
</tr>
<tr>
<td>2<td>adiabatic compression
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>eta_const<td>isentropic efficiency of compressor<td>Efficiency<td>[-]
</tr>
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo EaS4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        Inlet.h = h_in;
        Inlet.p = p_in;
        Inlet.x_i = x_in_i;

        State2.p = p_out;
        State2.x_i = x_out_i;

        if switch_eta_const == true then
          eta_isentrop = eta_const;
        end if;

        if (option_cooling == 1) then
          Inlet.t = State2.t;

          RemovedHeat.q_dot = m_in_dot*(Inlet.t + 273.15)*(State2.s - Inlet.s);
          RemovedHeat.t = Inlet.t;

          State2.h = h_out;

        end if;

        if (option_cooling == 2) then

          Inlet.s = State2.s;

          RemovedHeat.q_dot = 0.0;
          RemovedHeat.t = -1;
          h_out = h_in + (State2.h - h_in)/eta_isentrop;

        end if;

        Pmech.exergy_dot = m_in_dot*(h_out - h_in) - RemovedHeat.q_dot;

      end CoolCompressorNoProp;

    end Support;

  end Compressor;

  package Turbine
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations single component gas

identification: TechThermo Eb
"));

    annotation (
      Icon(
        Rectangle(extent=[-90, 40; 70, -86], style(fillColor=55)),
        Polygon(points=[-1, -37; 39, -37; 39, -58; 69, -21; 37, 13; 37, -7; -1,
               -7; -1, -37], style(color=0, fillColor=0)),
        Polygon(points=[-83, 23; -73, 3; -63, 23; -83, 23], style(
            color=0,
            fillColor=0,
            fillPattern=1)),
        Polygon(points=[15, -61; 25, -81; 36, -61; 15, -61], style(
            color=0,
            fillColor=0,
            fillPattern=1)),
        Line(points=[26, 23; 26, -67; -74, -47; -74, 3; 26, 23], style(color=0,
               fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model AirTurbine
      extends TTComponent.Turbine.Support.TurbineCIM(
        final switch_m_dot_const=false,
        final switch_h_const=false,
        final switch_p_const=false,
        final switch_x_i_const=false);

      annotation (Coordsys(grid=[2, 2], component=[40, 40]), Diagram);
      Support.TurbineNoProp TurbineNoProp annotation (extent=[-58, -90; 42, 10]);
      Medium.Gas.AirPerfectGasCaloric InletThermalState(option_h_u_correlations
          =3, option_s_correlation=2) annotation (extent=[-66, 48; -26, 88]);
      Medium.Gas.AirPerfectGasCaloric State2Thermal(option_h_u_correlations=3,
          option_s_correlation=2) annotation (extent=[8, 48; 48, 88]);
      Interface.ThermalState.NotUsedVariables NotUsedInlet(
        switch_rho_notused=true,
        switch_t_notused=false,
        switch_x_notused=true,
        switch_u_notused=true) annotation (extent=[-98, -4; -58, 36]);
      Interface.ThermalState.NotUsedVariables NotUsedState2(
        switch_rho_notused=true,
        switch_t_notused=false,
        switch_x_notused=true,
        switch_u_notused=true) annotation (extent=[56, 44; 96, 84]);
    equation
      connect(InMassFlow, TurbineNoProp.InMassFlow) annotation (points=[-110, -70;
             -82.9167, -70; -82.9167, -69.1667; -53.8333, -69.1667], style(
            color=4));
      connect(TurbineNoProp.OutMassFlow, OutMassFlow) annotation (points=[
            37.8333, -69.1667; 67.9167, -69.1667; 67.9167, -70; 110, -70],
          style(color=4));
      connect(InletThermalState.StateCut, TurbineNoProp.Inlet) annotation (
          points=[-46, 46; -46, 5.83333; -45.5, 5.83333], style(color=8));
      connect(State2Thermal.StateCut, TurbineNoProp.State2) annotation (points=
            [28, 46; 28, 5.83333; 29.5, 5.83333], style(color=8));
      connect(TurbineNoProp.Pmech, Pmech) annotation (points=[37.8333, -31.6667;
             68.9167, -31.6667; 68.9167, 20; 110, 20], style(color=2));
      connect(NotUsedInlet.StateCut, TurbineNoProp.Inlet) annotation (points=[-78,
             -6; -74, -6; -74, -16; -54, -16; -54, 5.83333; -45.5, 5.83333],
          style(color=8));
      connect(TurbineNoProp.State2, NotUsedState2.StateCut) annotation (points=
            [29.5, 5.83333; 52, 5.83333; 52, 38; 76, 38; 76, 42], style(color=8));
    end AirTurbine;

    model H2oWetSteamTurbine
      extends TTComponent.Turbine.Support.TurbineCIM(
        final switch_m_dot_const=false,
        final switch_h_const=false,
        final switch_p_const=false,
        final switch_x_i_const=false);

      annotation (Coordsys(grid=[2, 2], component=[40, 40]), Diagram);
      Support.TurbineNoProp TurbineNoProp annotation (extent=[-58, -90; 42, 10]);
      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamV01_1
        annotation (extent=[-86, 40; -46, 80]);
      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamV01_2
        annotation (extent=[34, 40; 74, 80]);
    equation
      connect(InMassFlow, TurbineNoProp.InMassFlow) annotation (points=[-110, -70;
             -82.9167, -70; -82.9167, -69.1667; -53.8333, -69.1667], style(
            color=4));
      connect(TurbineNoProp.OutMassFlow, OutMassFlow) annotation (points=[
            37.8333, -69.1667; 67.9167, -69.1667; 67.9167, -70; 110, -70],
          style(color=4));
      connect(TurbineNoProp.Pmech, Pmech) annotation (points=[37.8333, -31.6667;
             68.9167, -31.6667; 68.9167, 20; 110, 20], style(color=2));
      connect(H2oWetSteamV01_1.StateCut, TurbineNoProp.Inlet) annotation (
          points=[-66, 38; -56, 38; -56, 5.83333; -45.5, 5.83333], style(color=
              8));
      connect(TurbineNoProp.State2, H2oWetSteamV01_2.StateCut) annotation (
          points=[29.5, 5.83333; 54, 5.83333; 54, 38], style(color=8));
    end H2oWetSteamTurbine;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.Turbine

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EbS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model TurbineCIM "connector-icon model for turbine"
        extends TTInterface.MassFlow.TwoPort;
        // no equations in CIM-models

        //----exergy-connector mechanical power provided by expansion
        TTInterface.ExergyFlow.In Pmech annotation (extent=[100, 30; 120, 10]);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
connector-icon model for turbine
</p>

<p>includes only definitions of connectors and icon-graphics</p>

<p>extends MassFlow.TwoPort</p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>
<hr>



<b>Identification:</b> TechThermo EbS1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(Polygon(points=[-90, 60; -90, -20; 90, -60; 90, 100; -90,
                   60], style(color=0, fillColor=4)), Polygon(points=[-12, 40;
                  28, 40; 28, 80; 88, 20; 28, -40; 28, 0; -12, 0; -12, 40],
                style(color=0, fillColor=53))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end TurbineCIM;

      model TurbineNoProp "compressor without specification of working fluid"
        extends TTComponent.Turbine.Support.TurbineCIM(
          final switch_m_dot_const=true,
          final switch_x_i_const=true,
          final switch_h_const=false,
          final switch_p_const=false);

        //----exergy-connector mechanical power needed for compression
        TTInterface.ThermalState.In Inlet
          annotation (extent=[-100, 100; -80, 120]);

        TTInterface.ThermalState.Out State2
          annotation (extent=[100, 100; 80, 120]);

        parameter SIunits.Efficiency eta_const=0.8
          "const. isentropic efficiency of compressor";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const=true then eta_isentrop=eta_con";

        SIunits.Efficiency eta_isentrop "isentropic efficiency of compressor";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
model for compressor without specification of working fluid
      </p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h,.p,.s,.x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>Inlet<td>x_i,h,p,s<td>rho,t,u,x</tr>
<tr><td>State2<td>x_i,h,p,s<td>rho,t,u,x</tr>

</table>




<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b> thermophysical correlations for working fluid at ThermalState-connectors
Inlet and State2
<hr>

<hr>
<p><b>correlation between connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>identical to variables of other connectors</b></tr>
<tr><td>Inlet<td>p_in, h_in, x_in_i</tr>
<tr><td>State2<td>p_out,x_out_i</tr>

</table>




<br>


</p>
<hr>






<b> ASSUMPTIONS:</b>
<ul>
<li>no storage of mass or energy</li>
<li>no modification of mass fraction vector x_i</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_eta_const<td>eta_isentrop=eta_const
</tr>
<tr>
<td>switch_t_const<td>t_in=t_out
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b>none <br>


<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>eta_const<td>isentropic efficiency of turbine<td>Efficiency<td>[-]
</tr>
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo EbS2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        Inlet.h = h_in;
        Inlet.p = p_in;
        Inlet.x_i = x_in_i;

        State2.p = p_out;
        State2.x_i = x_in_i;

        if switch_eta_const == true then
          eta_isentrop = eta_const;
        end if;

        Inlet.s = State2.s;

        h_out = h_in + (State2.h - h_in)*eta_isentrop;

        Pmech.exergy_dot = m_in_dot*(h_out - h_in);

      end TurbineNoProp;

    end Support;

  end Turbine;

  package HeatEx
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: models describing heat exchangers

identification: TechThermo Ec
"));

    annotation (
      Icon(
        Rectangle(extent=[-90, 40; 70, -86], style(fillColor=55)),
        Rectangle(extent=[-60, 23; 40, -67], style(color=0)),
        Line(points=[-10, 33; -10, 23; -40, -27; 20, -27; -10, -67; -10, -77],
            style(color=0, fillPattern=1)),
        Line(points=[-70, -27; -60, -27], style(color=0, fillPattern=1)),
        Line(points=[40, -29; 50, -29], style(color=0, fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model DirectContact

    end DirectContact;

    model H2OCondensor "condensor for H2O"
      extends TTComponent.HeatEx.Support.CondensorCIM(
        final switch_m_dot_const=false,
        final switch_h_const=false,
        final switch_p_const=false,
        final switch_x_i_const=false);

      annotation (Coordsys(grid=[2, 2], component=[50, 50]), Diagram);
      Support.CondensorNoProp CondensorNoProp1
        annotation (extent=[-24, -4; 26, 46]);
      Medium.MultiPhase.H2oWetSteamV01 H2oWetSteamV01_1
        annotation (extent=[48, 48; 98, 98]);
    equation
      connect(InMassFlow, CondensorNoProp1.InMassFlow) annotation (points=[-110,
             -70; -92, -70; -92, 3.5; -26.5, 3.5], style(color=4));
      connect(CondensorNoProp1.OutMassFlow, OutMassFlow) annotation (points=[
            28.5, 3.5; 92, 3.5; 92, -70; 110, -70], style(color=4));
      connect(RemovedHeat, CondensorNoProp1.RemovedHeat)
        annotation (points=[0, 110; 1, 110; 1, 48.5], style(color=47));
      connect(CondensorNoProp1.ThermalStateOutlet, H2oWetSteamV01_1.StateCut)
        annotation (points=[23.5, 48.5; 23.5, 74; 42, 74; 42, 20; 73, 20; 73,
            45.5], style(color=8));
    end H2OCondensor;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.HeatEx

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EcS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model TwoFlowHeatExCIM

        //------------parameters----------------------
        parameter Integer n_comp_hot=1 "number of components in hot fluid";
        parameter Integer n_comp_cold=1 "number of components in cold fluid";

        //------------connectors-------------------------

        TTInterface.MassFlow.In HotIn(n_comp=n_comp_hot)
          "connector for inlet hot mass flow"
          annotation (extent=[10, 100; -10, 120]);
        TTInterface.MassFlow.Out HotOut(n_comp=n_comp_hot)
          "connector for outlet hot mass flow"
          annotation (extent=[10, -100; -10, -120]);
        TTInterface.MassFlow.In ColdIn(n_comp=n_comp_hot)
          "connector for inlet cold mass flow"
          annotation (extent=[-120, 10; -100, -10]);
        TTInterface.MassFlow.Out ColdOut(n_comp=n_comp_hot)
          "connector for outlet cold mass flow"
          annotation (extent=[120, 10; 100, -10]);

        annotation (Icon(
            Line(points=[0, 120; -60, 0; 60, 0; 0, -120], style(color=1,
                  fillPattern=1)),
            Line(points=[-120, 0; -60, 0], style(color=71, fillPattern=1)),
            Line(points=[60, 0; 120, 0], style(color=71, fillPattern=1)),
            Polygon(points=[-120, 20; -80, 0; -120, -20; -120, 20], style(color
                  =71, fillPattern=1)),
            Polygon(points=[0, -120; -20, -80; 20, -80; 0, -120], style(
                color=1,
                fillColor=1,
                fillPattern=1)),
            Rectangle(extent=[-120, 120; 120, -120], style(color=0))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end TwoFlowHeatExCIM;

      model CondensorCIM "connector-icon model for condensor"
        extends TTInterface.MassFlow.TwoPort;
        // no equations in CIM-models

        TTInterface.HeatFlow.Out RemovedHeat
          annotation (extent=[-10, 100; 10, 120]);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
connector-icon model for condensor
</p>

<p>includes only definitions of connectors and icon-graphics</p>

<p>extends MassFlow.TwoPort</p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>
<hr>



<b>Identification:</b> TechThermo EbS1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (
          Icon(
            Rectangle(extent=[-80, 100; 80, -40], style(color=0)),
            Line(points=[-40, 100; -40, -20; 0, 60; 40, -20; 40, 100], style(
                  color=0)),
            Polygon(points=[-100, 40; -60, 20; -100, 0; -100, 40], style(color=
                    67, fillColor=67)),
            Polygon(points=[60, 40; 60, 0; 100, 20; 60, 40], style(color=67))),

          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[2, 2],
            component=[20, 20]),
          Window(
            x=0.25,
            y=0.11,
            width=0.6,
            height=0.6),
          Diagram);

      end CondensorCIM;

      model CondensorNoProp "condensor without specification of working fluid"
        extends TTComponent.HeatEx.Support.CondensorCIM(
          final switch_m_dot_const=true,
          final switch_x_i_const=true,
          final switch_h_const=false,
          switch_p_const=true);

        //thermal state at outlet of condensor
        TTInterface.ThermalState.Out ThermalStateOutlet
          annotation (extent=[100, 100; 80, 120]);

        parameter Boolean switch_temp_diff_const=true
          "if switch_temp_diff_const==true then temp_diff=temp_diff_const";

        parameter SIunits.CelsiusTemperature temp_diff_const=5
          "if switch_temp_diff_const==true then temp_diff=temp_diff_const";

        SIunits.CelsiusTemperature temp_diff
          "temperature difference between working fluid and environment at outlet";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
model for compressor without specification of working fluid
      </p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h,.p,.s,.x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>Inlet<td>x_i,h,p,s<td>rho,t,u,x</tr>
<tr><td>State2<td>x_i,h,p,s<td>rho,t,u,x</tr>

</table>




<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b> thermophysical correlations for working fluid at ThermalState-connectors
Inlet and State2
<hr>

<hr>
<p><b>correlation between connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>identical to variables of other connectors</b></tr>
<tr><td>Inlet<td>p_in, h_in, x_in_i</tr>
<tr><td>State2<td>p_out,x_out_i</tr>

</table>




<br>


</p>
<hr>






<b> ASSUMPTIONS:</b>
<ul>
<li>no storage of mass or energy</li>
<li>no modification of mass fraction vector x_i</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_eta_const<td>eta_isentrop=eta_const
</tr>
<tr>
<td>switch_t_const<td>t_in=t_out
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b>none <br>


<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>eta_const<td>isentropic efficiency of turbine<td>Efficiency<td>[-]
</tr>
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo EbS2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"), Diagram);
        Interface.MassFlow.MassFlowAdaptThermalState MassFlowAdaptThermalState1
          (switch_m_dot_set_to_zero=false) annotation (extent=[42, 18; 62, 38]);
        Source.ThermalState.ParameterDefined OutletSteamQuality(switch_x_def=
              true, x_const=0.0) "defines steam quality at outlet of condensor"
          annotation (extent=[38, 56; 58, 76]);
      equation

        temp_diff = ThermalStateOutlet.t - RemovedHeat.t;

        if switch_temp_diff_const == true then
          temp_diff = temp_diff_const;
        end if;

        // if switch_complete_condensation == true then
        //complete condensation at outlet of condensor
        //ThermalStateOutlet.x = 0.0;
        //end if;

        //change in enthalpy is heat transferred to environment
        0.0 = RemovedHeat.q_dot + m_in_dot*(h_in - h_out);

        connect(MassFlowAdaptThermalState1.InMassFlow, OutMassFlow) annotation
          (points=[41, 21; -8, 21; -8, -20; 92, -20; 92, -70; 110, -70], style(
              color=4));
        connect(ThermalStateOutlet, MassFlowAdaptThermalState1.InThermalState)
          annotation (points=[90, 110; 88, 110; 88, 18; 63, 18; 63, 21], style(
              color=8));
        connect(OutletSteamQuality.OutThermalState, MassFlowAdaptThermalState1.
          InThermalState) annotation (points=[48, 77; 62, 77; 62, 78; 74, 78;
              74, 21; 63, 21], style(color=8));
      end CondensorNoProp;

      model HeatExTwoFlowEtaNtuNoProp

      end HeatExTwoFlowEtaNtuNoProp;

    end Support;

  end HeatEx;

  package Vessel
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: models for vessels

identification: TechThermo Ed
"));

    annotation (
      Icon(
        Rectangle(extent=[-90, 40; 70, -86], style(fillColor=55)),
        Ellipse(extent=[-58, 18; -35, -60], style(
            color=0,
            fillColor=55,
            fillPattern=1)),
        Ellipse(extent=[23, 18; 46, -60], style(
            color=0,
            fillColor=55,
            fillPattern=1)),
        Rectangle(extent=[-47, 18; 36, -60], style(
            color=55,
            fillColor=55,
            fillPattern=1)),
        Line(points=[-47, 18; 36, 18], style(
            color=0,
            fillColor=55,
            fillPattern=1)),
        Line(points=[-47, -60; 37, -60; 36, -60], style(
            color=0,
            fillColor=55,
            fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model H2oSeparatorDrum
      extends TTComponent.Vessel.Support.SeparatorDrumCIM;

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram);
      Support.SeparatorDrumNoProp SeparatorDrumNoProp1
        annotation (extent=[-36, -36; 34, 34]);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal1
        annotation (extent=[-20, 56; 0, 76], rotation=90);
      Interface.MassFlow.TwoPortThermalStateTerminal
        TwoPortThermalStateTerminal2
        annotation (extent=[-18, -78; 2, -58], rotation=90);
      Medium.MultiPhase.H2oTwoPhaseCalVol SatSteam
        annotation (extent=[-62, 76; -42, 96]);
      Medium.MultiPhase.H2oTwoPhaseCalVol SatLiquid
        annotation (extent=[-62, -60; -42, -40]);
      Medium.MultiPhase.H2oTwoPhaseCalVol H2oTwoPhaseCalVol1
        annotation (extent=[-86, -24; -66, -4]);
      Source.ThermalState.ParameterDefined ParameterDefined1(switch_x_def=true,
           x_const=1.0) annotation (extent=[-92, 32; -72, 52]);
      Source.ThermalState.ParameterDefined ParameterDefined2(x_const=0.0)
        annotation (extent=[-74, -98; -54, -78]);

      parameter SIunits.Density rho_start=1.0
        "density of medium in volume at start of simulation";
      parameter SIunits.SpecificInternalEnergy u_start=1.0
        "Internal Energy  of medium in volume at start of simulation";
    equation

      connect(SeparatorDrumNoProp1.InHeatFlow, InHeatFlow)
        annotation (points=[40, 0; 102, 0], style(color=47));
      connect(SeparatorDrumNoProp1.InMix, InMix)
        annotation (points=[-42, -2; -102, -2], style(color=4));
      connect(TwoPortThermalStateTerminal1.InMassFlow, SeparatorDrumNoProp1.
        OutPhase1) annotation (points=[-3, 55; -2, 40], style(color=4));
      connect(TwoPortThermalStateTerminal1.OutMassFlow, OutPhase1)
        annotation (points=[-3, 77; -4, 100], style(color=4));
      connect(SeparatorDrumNoProp1.OutPhase2, TwoPortThermalStateTerminal2.
        OutMassFlow) annotation (points=[-2, -39.5; -1, -56], style(color=4));
      connect(TwoPortThermalStateTerminal2.InMassFlow, OutPhase2)
        annotation (points=[-2, -80; -2, -100], style(color=4));
      connect(SatSteam.StateCut, TwoPortThermalStateTerminal1.StateCut)
        annotation (points=[-52, 75; -52, 60; -22, 66], style(color=8));
      connect(SatLiquid.StateCut, TwoPortThermalStateTerminal2.StateCut)
        annotation (points=[-52, -62; -52, -70; -19, -68], style(color=8));
      connect(H2oTwoPhaseCalVol1.StateCut, SeparatorDrumNoProp1.StateVolume)
        annotation (points=[-76, -24; -76, -34; -38, -34; -38, -22], style(
            color=8));
      connect(ParameterDefined1.OutThermalState, TwoPortThermalStateTerminal1.
        StateCut)
        annotation (points=[-82, 54; -38, 48; -22, 66], style(color=8));
      connect(ParameterDefined2.OutThermalState, TwoPortThermalStateTerminal2.
        StateCut)
        annotation (points=[-64, -78; -36, -84; -19, -68], style(color=8));
    end H2oSeparatorDrum;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.Vessel

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EdS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model VesselCIM

        //------------parameters----------------------
        parameter Integer n_comp=1 "number of components in vessel";

        //------------connectors-------------------------

        TTInterface.MassFlow.In MassIn(n_comp=n_comp_hot)
          "connector for inflow mass" annotation (extent=[-100, 10; -120, -10]);
        TTInterface.MassFlow.Out MassOut(n_comp=n_comp_hot)
          "connector for outflow mass" annotation (extent=[10, -100; -10, -120]);

        TTInterface.HeatFlow.In Heat
          "connector for transfer of heat to or from vessel"
          annotation (extent=[100, 10; 120, -10]);
        TTInterface.ThermalState.In StateVolume
          "thermal state medium in volume"
          annotation (extent=[10, 100; -10, 120]);

        annotation (Icon(
            Ellipse(extent=[-60, 100; 60, 60], style(gradient=3, fillColor=67)),

            Ellipse(extent=[-60, -60; 60, -100], style(gradient=3, fillColor=67)),

            Rectangle(extent=[-60, 80; 60, -78], style(gradient=1, fillColor=67)),

            Polygon(points=[-100, 40; -40, 0; -100, -40; -100, 40], style(
                  gradient=1, fillColor=67)),
            Polygon(points=[-40, -40; 0, -100; 40, -40; -40, -40], style(
                color=67,
                gradient=1,
                fillColor=7))), Diagram(Polygon(points=[-100, 40; -40, 0; -100,
                   -40; -100, 40], style(gradient=1, fillColor=67)), Polygon(
                points=[-40, -40; 0, -100; 40, -40; -40, -40], style(
                color=67,
                gradient=1,
                fillColor=7))));

      end VesselCIM;

      model VesselSinglePortCIM
        "connector and icon model for vessel with a single mass flow connector"


        //------------parameters----------------------
        parameter Integer n_comp=1 "number of components in vessel";

        //------------connectors-------------------------

        TTInterface.MassFlow.In MassInOut(n_comp=n_comp_hot)
          "connector for in/outflow mass"
          annotation (extent=[10, -100; -10, -120]);
        TTInterface.HeatFlow.In Heat
          "connector for transfer of heat to or from vessel"
          annotation (extent=[10, 100; -10, 120]);
        TTInterface.ThermalState.In StateVolume
          "thermal state medium in volume"
          annotation (extent=[120, 10; 100, -10]);

        annotation (Icon(
            Line(points=[-120, 0; -60, 0], style(color=71, fillPattern=1)),
            Line(points=[60, 0; 120, 0], style(color=71, fillPattern=1)),
            Rectangle(extent=[-120, 120; 120, -120], style(color=0)),
            Ellipse(extent=[-122, 122; 118, -14], style(
                color=0,
                gradient=3,
                fillColor=8)),
            Ellipse(extent=[-124, 14; 116, -122], style(
                color=0,
                gradient=3,
                fillColor=8)),
            Rectangle(extent=[-124, 52; 118, -58], style(
                color=0,
                gradient=1,
                fillColor=8))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));
      end VesselSinglePortCIM;

      model VesselTwoPortCIM
        "connector and icon model for vessel with two mass flow connectors"

        //------------parameters----------------------
        parameter Integer n_comp=1 "number of components in vessel";
        extends TTInterface.MassFlow.TwoPort(n_comp=n_comp);

        //------------connectors-------------------------

        TTInterface.HeatFlow.In Heat
          "connector for transfer of heat to or from vessel"
          annotation (extent=[10, 100; -10, 120]);
        TTInterface.ThermalState.In StateVolume(n_comp=n_comp)
          "thermal state medium in volume"
          annotation (extent=[10, -100; -10, -120]);

        annotation (Icon(
            Line(points=[-120, 0; -60, 0], style(color=71, fillPattern=1)),
            Line(points=[60, 0; 120, 0], style(color=71, fillPattern=1)),
            Rectangle(extent=[-120, 120; 120, -120], style(color=0)),
            Ellipse(extent=[-120, 60; -60, -60], style(gradient=3, fillColor=9)),

            Ellipse(extent=[60, 60; 120, -60], style(gradient=3, fillColor=9)),

            Rectangle(extent=[-90, 60; 90, -60], style(gradient=2, fillColor=9))),
             Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end VesselTwoPortCIM;

      model SeparatorDrumCIM "CIM for separator vessel"
        parameter Integer n_comp=1;

        TTInterface.MassFlow.In InMix(n_comp=n_comp)
          "connector for inlet mass flow"
          annotation (extent=[-120, -10; -100, 10]);
        TTInterface.MassFlow.Out OutPhase1(n_comp=n_comp)
          "connector for phase1 outlet" annotation (extent=[-10, 120; 10, 100]);
        TTInterface.MassFlow.Out OutPhase2(n_comp=n_comp)
          "connector for phase2 outlet"
          annotation (extent=[-10, -120; 10, -100]);
        TTInterface.HeatFlow.In InHeatFlow
          "heat-flow transferred to fluid in volume"
          annotation (extent=[100, -10; 120, 10]);

        annotation (
          Icon(
            Ellipse(extent=[-50, 99; 50, 59], style(color=10, fillColor=7)),
            Rectangle(extent=[-50, 80; 50, 0], style(
                color=10,
                fillColor=7,
                fillPattern=1)),
            Ellipse(extent=[-50, -80; 50, -100], style(color=4, fillColor=4)),
            Rectangle(extent=[-50, 0; 50, -90], style(
                color=10,
                fillColor=4,
                fillPattern=1)),
            Polygon(points=[-100, 70; 4, 0; -100, -80; -100, 70], style(
                color=4,
                fillColor=7,
                fillPattern=8))),
          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[1, 1],
            component=[20, 20]),
          Window(
            x=0.01,
            y=0.05,
            width=0.6,
            height=0.6),
          Diagram);

      end SeparatorDrumCIM;

      model SeparatorDrumNoProp
        "vessel with finite volume to separate incoming massflow into two massflows with different thermal states"


        extends SeparatorDrumCIM;

        TTInterface.ThermalState.In StateVolume
          annotation (extent=[-100, -40; -120, -60]);

        parameter SIunits.Volume v_control=1;

        parameter SIunits.Density rho_start=1.0
          "density of medium in volume at start of simulation";
        parameter SIunits.SpecificInternalEnergy u_start=1.0
          "Internal Energy  of medium in volume at start of simulation";

        SIunits.Density rhodummy(start=rho_start, fixed=true);
        parameter Boolean switch_x_i_const=true
          "if switch_x_i_const==true then x_i is identical at all connectors";

      protected
        SIunits.Energy energy_in_volume(start=rho_start*u_start*v_control);
      equation

        StateVolume.rho = rhodummy;

        InMix.p = OutPhase1.p;
        InMix.p = OutPhase2.p;
        InMix.p = StateVolume.p;

        InHeatFlow.t = StateVolume.t;

        if switch_x_i_const == true then
          InMix.x_i = OutPhase1.x_i;
          InMix.x_i = OutPhase2.x_i;
          InMix.x_i = StateVolume.x_i;
        end if;

        energy_in_volume = v_control*StateVolume.u*StateVolume.rho;

        der(energy_in_volume) = InMix.m_dot*InMix.h + InHeatFlow.q_dot +
          OutPhase1.m_dot*OutPhase1.h + OutPhase2.m_dot*OutPhase2.h;

        v_control*der(StateVolume.rho) = InMix.m_dot + OutPhase1.m_dot +
          OutPhase2.m_dot;

      end SeparatorDrumNoProp;

    end Support;

  end Vessel;

  package FluidFlow
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: models for vessels

identification: TechThermo Ed
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 40; 69, -88], style(
            color=0,
            fillColor=55,
            fillPattern=1)),
        Rectangle(extent=[-91, 40; 69, -88]),
        Ellipse(extent=[16, 16; 51, -52], style(color=0, fillColor=30)),
        Rectangle(extent=[34, 16; -73, -52], style(
            color=0,
            fillColor=30,
            fillPattern=1)),
        Ellipse(extent=[25, 7; 44, -42], style(
            color=0,
            fillColor=67,
            fillPattern=1)),
        Rectangle(extent=[34, 7; -74, -43], style(
            color=0,
            fillColor=67,
            fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6),
      Diagram);

    model H2oLiquidCylinderFlow
      "1-D flow of H2O in circular cross section with wall"

      extends TTComponent.FluidFlow.Support.CylinderFlowNoProp(
        NotUsedVariables1(switch_s_notused=true, switch_x_notused=true),
        eta_const=890e-6,
        cp_fluid_const=4180,
        lambda_fluid_const=607e-3);

      TTMedium.Liquid.H2oVariableRhoCalVol H2oVariableRhoCalVol1(
        option_rho_correlation=2,
        option_h_u_correlations=3,
        option_s_correlation=0) annotation (extent=[12, 66; 32, 86]);
    equation
      connect(MassCrtlVolumeTwoPortNoProp1.StateCut, H2oVariableRhoCalVol1.
        StateCut)
        annotation (points=[0, 42; 0, 60; 22, 60; 22, 65], style(color=8));
    end H2oLiquidCylinderFlow;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.Compressor

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EaS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model CylinderFlowNoProp
        "fluid flow in cylinder geometry with external heat transfer"

        extends CylinderFlowCIM;

        parameter Integer option_flow_direction=1 "defines direction of flow 1: from In to Out,
\t\tt2: from Out to In, 3 defined by FlowDirection.signal[1]";

        parameter SIunits.Length dz_pipe=1.0 "Length of pipe";
        parameter SIunits.Diameter di_pipe=0.01 "Inner Diameter of pipe";
        parameter SIunits.Area across_pipe=di_pipe^2.0*3.14159/4.0
          "cross-sectional area of pipe";
        parameter SIunits.Area area_heat_transfer=di_pipe*3.14159*dz_pipe
          "relevant area for convective heat transfer";

        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
        parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
          "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

        // pipe material
        parameter SIunits.ThermalConductivity k_thermal_wall_const=30
          "const. value thermal conductivity";
        parameter SIunits.SpecificHeatCapacity c_heat_wall_const=500
          "const. value heat-capacity";
        parameter SIunits.Density rho_wall_material=7800
          "density of cylinder material";

        //  pipe-geometry

        parameter SIunits.Thickness t_wall=0.01 "thickness of pipe wall";
        parameter SIunits.Diameter d_outer_wall=di_pipe + 2*t_wall
          "outer diameter pipe ";
        parameter Integer n_radial_wall=1
          "number of segments of pipe wall in radial direction";

        parameter Boolean switch_t_wall_steady=true
          "if switch_t_steady==true and switch_zero_mass=false then for wall initial equation der(t_segment_i)=0.0";

        //control volume
        parameter Boolean switch_energy_steady_volume=true
          "if switch_energy_steady_volume==true then initial equation: der(energy_volume)=0.0";

        parameter Boolean switch_mass_steady_volume=true
          "if switch_mass_steady_volume==true then initial equation: der(mass_volume)=0.0";

        annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram);

        Basis.Compartment.Support.MassCrtlVolumeTwoPortNoProp
          MassCrtlVolumeTwoPortNoProp1(
          dz=dz_pipe,
          cross_area=across_pipe,
          switch_energy_steady=switch_energy_steady_volume,
          switch_mass_steady=switch_mass_steady_volume,
          option_flow_direction=option_flow_direction)
          annotation (extent=[-20, 0; 20, 40]);

        Basis.MassTransport.Support.PressureLossPipeNoProp
          PressureLossPipeNoProp1(
          dz_pipe=dz_pipe,
          di_pipe=di_pipe,
          eta_const=eta_const) annotation (extent=[-78, 0; -38, 40]);

        Basis.HeatTransport.Support.ForcedConvectionPipeNoProp
          ForcedConvectionPipeNoProp1(
          dz_pipe=dz_pipe,
          di_pipe=di_pipe,
          eta_const=eta_const,
          cp_fluid_const=cp_fluid_const,
          lambda_fluid_const=lambda_fluid_const,
          switch_mean_temperature=false) annotation (extent=[38, -28; 78, 12]);

        Basis.HeatTransport.CylinderHeatConducting CylinderHeatConducting1(
          n_radial=n_radial_wall,
          d_inner=di_pipe,
          d_outer=d_outer_wall,
          k_thermal_const=k_thermal_wall_const,
          c_heat_const=c_heat_wall_const,
          rho_material=rho_wall_material,
          dz_zylinder=dz_pipe,
          switch_t_steady=switch_t_wall_steady,
          switch_zero_mass=false)
          annotation (extent=[-10, -74; 10, -54], rotation=270);

        Interface.ThermalState.NotUsedVariables NotUsedVariables1
          annotation (extent=[50, 66; 70, 86]);
      equation
        connect(MassCrtlVolumeTwoPortNoProp1.HeatCut,
          ForcedConvectionPipeNoProp1.InHeatFlow) annotation (points=[0, -2; 0,
               -18; 20, -18; 20, -8; 36, -8], style(color=47));
        connect(ForcedConvectionPipeNoProp1.OutletMass, OutMassFlow)
          annotation (points=[80, 6; 90, 6; 90, -70; 110, -70], style(color=4));
        connect(MassCrtlVolumeTwoPortNoProp1.OutMassFlow,
          ForcedConvectionPipeNoProp1.InletMass)
          annotation (points=[22, 6; 28, 6; 28, 6; 36, 6], style(color=4));
        connect(PressureLossPipeNoProp1.OutMassFlow,
          MassCrtlVolumeTwoPortNoProp1.InMassFlow)
          annotation (points=[-36, 6; -22, 6], style(color=4));
        connect(InMassFlow, PressureLossPipeNoProp1.InMassFlow) annotation (
            points=[-110, -70; -92, -70; -92, 6; -80, 6], style(color=4));
        connect(CylinderHeatConducting1.OutHeatFlow, HeatCut) annotation (
            points=[-2.0206e-015, -75; -2.0206e-015, -88.5; 0, -88.5; 0, -110],
             style(color=47));
        connect(ForcedConvectionPipeNoProp1.OutHeatFlow,
          CylinderHeatConducting1.InHeatFlow) annotation (points=[80, -8; 84, -8;
               84, -34; 2.0206e-015, -34; 2.0206e-015, -53], style(color=47));
        connect(NotUsedVariables1.StateCut, MassCrtlVolumeTwoPortNoProp1.
          StateCut)
          annotation (points=[60, 65; 60, 44; 0, 44; 0, 42], style(color=8));
        connect(FlowDirection, MassCrtlVolumeTwoPortNoProp1.FlowDirection)
          annotation (points=[-90, 110; -92, 110; -92, 60; -18, 60; -18, 42],
            style(color=3));
        connect(PressureLossPipeNoProp1.StateCut, MassCrtlVolumeTwoPortNoProp1.
          StateCut)
          annotation (points=[-58, 42; -58, 78; 0, 78; 0, 42], style(color=8));
      end CylinderFlowNoProp;

      model CylinderFlowNoPropTest
        "fluid flow in cylinder geometry with external heat transfer"

        extends CylinderFlowCIM;

        parameter Integer option_flow_direction=1 "defines direction of flow 1: from In to Out,
\t\tt2: from Out to In, 3 defined by FlowDirection.signal[1]";

        parameter SIunits.Length dz_pipe=1.0 "Length of pipe";
        parameter SIunits.Diameter di_pipe=0.01 "Inner Diameter of pipe";
        parameter SIunits.Area across_pipe=di_pipe^2.0*3.14159/4.0
          "cross-sectional area of pipe";
        parameter SIunits.Area area_heat_transfer=di_pipe*3.14159*dz_pipe
          "relevant area for convective heat transfer";

        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
        parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
          "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

        // pipe material
        parameter SIunits.ThermalConductivity k_thermal_wall_const=1.5
          "const. value thermal conductivity";
        parameter SIunits.SpecificHeatCapacity c_heat_wall_const=1100
          "const. value heat-capacity";
        parameter SIunits.Density rho_wall_material=2200
          "density of cylinder material";

        //  pipe-geometry

        parameter SIunits.Thickness t_wall=0.01 "thickness of pipe wall";
        parameter SIunits.Diameter d_outer_wall=di_pipe + 2*t_wall
          "outer diameter pipe ";
        parameter Integer n_radial_wall=5
          "number of segments of pipe wall in radial direction";

        parameter Boolean switch_t_wall_steady=true
          "if switch_t_steady==true and switch_zero_mass=false then for wall initial equation der(t_segment_i)=0.0";

        //control volume
        parameter Boolean switch_energy_steady_volume=true
          "if switch_energy_steady_volume==true then initial equation: der(energy_volume)=0.0";

        parameter Boolean switch_mass_steady_volume=true
          "if switch_mass_steady_volume==true then initial equation: der(mass_volume)=0.0";

        annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram);

        Basis.Compartment.Support.MassCrtlVolumeTwoPortNoProp
          MassCrtlVolumeTwoPortNoProp1(
          dz=dz_pipe,
          cross_area=across_pipe,
          switch_energy_steady=switch_energy_steady_volume,
          switch_mass_steady=switch_mass_steady_volume,
          option_flow_direction=option_flow_direction)
          annotation (extent=[-20, 0; 20, 40]);

        Basis.MassTransport.Support.PressureLossPipeNoProp
          PressureLossPipeNoProp1(
          dz_pipe=dz_pipe,
          di_pipe=di_pipe,
          eta_const=eta_const) annotation (extent=[-78, 0; -38, 40]);

        Basis.HeatTransport.Support.ForcedConvectionPipeNoProp
          ForcedConvectionPipeNoProp1(
          dz_pipe=dz_pipe,
          di_pipe=di_pipe,
          eta_const=eta_const,
          cp_fluid_const=cp_fluid_const,
          lambda_fluid_const=lambda_fluid_const,
          switch_mean_temperature=false) annotation (extent=[38, -28; 78, 12]);

        Basis.HeatTransport.CylinderHeatConducting CylinderHeatConducting1(
          n_radial=n_radial_wall,
          d_inner=di_pipe,
          d_outer=d_outer_wall,
          k_thermal_const=k_thermal_wall_const,
          c_heat_const=c_heat_wall_const,
          rho_material=rho_wall_material,
          dz=dz_pipe,
          switch_t_steady=switch_t_wall_steady)
          annotation (extent=[-10, -74; 10, -54], rotation=270);

        Interface.ThermalState.NotUsedVariables NotUsedVariables1
          annotation (extent=[50, 66; 70, 86]);
      equation
        connect(MassCrtlVolumeTwoPortNoProp1.HeatCut,
          ForcedConvectionPipeNoProp1.InHeatFlow) annotation (points=[0, -2; 0,
               -18; 20, -18; 20, -8; 36, -8], style(color=47));
        connect(ForcedConvectionPipeNoProp1.OutletMass, OutMassFlow)
          annotation (points=[80, 6; 90, 6; 90, -70; 110, -70], style(color=4));
        connect(MassCrtlVolumeTwoPortNoProp1.OutMassFlow,
          ForcedConvectionPipeNoProp1.InletMass)
          annotation (points=[22, 6; 28, 6; 28, 6; 36, 6], style(color=4));
        connect(PressureLossPipeNoProp1.OutMassFlow,
          MassCrtlVolumeTwoPortNoProp1.InMassFlow)
          annotation (points=[-36, 6; -22, 6], style(color=4));
        connect(InMassFlow, PressureLossPipeNoProp1.InMassFlow) annotation (
            points=[-110, -70; -92, -70; -92, 6; -80, 6], style(color=4));
        connect(CylinderHeatConducting1.OutHeatFlow, HeatCut) annotation (
            points=[-2.0206e-015, -75; -2.0206e-015, -88.5; 0, -88.5; 0, -110],
             style(color=47));
        connect(ForcedConvectionPipeNoProp1.OutHeatFlow,
          CylinderHeatConducting1.InHeatFlow) annotation (points=[80, -8; 84, -8;
               84, -34; 2.0206e-015, -34; 2.0206e-015, -53], style(color=47));
        connect(NotUsedVariables1.StateCut, MassCrtlVolumeTwoPortNoProp1.
          StateCut)
          annotation (points=[60, 65; 60, 44; 0, 44; 0, 42], style(color=8));
        connect(FlowDirection, MassCrtlVolumeTwoPortNoProp1.FlowDirection)
          annotation (points=[-90, 110; -92, 110; -92, 60; -18, 60; -18, 42],
            style(color=3));
        connect(PressureLossPipeNoProp1.StateCut, MassCrtlVolumeTwoPortNoProp1.
          StateCut)
          annotation (points=[-58, 42; -58, 78; 0, 78; 0, 42], style(color=8));
        connect(MassCrtlVolumeTwoPortNoProp1.StateCut,
          ForcedConvectionPipeNoProp1.StateCut) annotation (points=[0, 42; 22,
              42; 22, 58; 46, 58; 46, 30; 58, 30; 58, 14], style(color=8));
      end CylinderFlowNoPropTest;

      model CylinderFlowCIM
        "connector-icon model for flow in cylinder geometry"

        extends TTInterface.MassFlow.TwoPort(
          final switch_m_dot_const=false,
          final switch_h_const=false,
          final switch_p_const=false,
          final switch_x_i_const=false);

        // connector to define flow direction
        Modelica.Blocks.Interfaces.InPort FlowDirection(n=1)
          annotation (extent=[-80, 100; -100, 120], rotation=-90);

        // connector for heat transfer to or from control volume
        TTInterface.HeatFlow.In HeatCut
          annotation (extent=[10, -100; -10, -120]);

      end CylinderFlowCIM;

    end Support;

  end FluidFlow;

  package FlowCRTL
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: components used to control flows

identification: TechThermo Ea
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 40; 69, -88], style(
            color=6,
            fillColor=55,
            fillPattern=1)),
        Rectangle(extent=[-91, 40; 69, -88]),
        Ellipse(extent=[-52, 17; 31, -65], style(
            color=0,
            fillColor=67,
            fillPattern=1)),
        Rectangle(extent=[30, -15; 61, -35], style(
            color=0,
            fillColor=67,
            fillPattern=1)),
        Rectangle(extent=[-85, -15; -51, -36], style(
            color=0,
            fillColor=67,
            fillPattern=1)),
        Rectangle(extent=[-15, 17; -7, -65], style(
            color=0,
            fillColor=0,
            fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6),
      Diagram);

    model H2oPhaseSeparator "phase separator for H2O"

      extends TTComponent.FlowCRTL.Support.PhaseSeparatorCIM;

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram(
          Text(
            extent=[-38, 96; 34, 84],
            string="saturated steam",
            style(color=0)),
          Text(
            extent=[-42, -86; 30, -98],
            style(color=0),
            string="saturated liquid"),
          Text(
            extent=[-106, -8; -34, -20],
            style(color=0),
            string="two phase")));
      Support.PhaseSeparatorNoProp PhaseSeparatorNoProp1
        annotation (extent=[-44, -20; -4, 20]);
      Medium.MultiPhase.H2oWetSteamV01 TwoPhaseProperty
        "thermal state at Inlet" annotation (extent=[-66, 34; -26, 74]);
      Medium.MultiPhase.H2oWetSteamV01 SatSteamProperty
        "properties of saturated steam" annotation (extent=[0, 34; 40, 74]);
      Medium.MultiPhase.H2oWetSteamV01 SatLiquidProperty
        "properties of saturated liquid" annotation (extent=[12, -56; 52, -16]);
      Source.ThermalState.ParameterDefined DefSatSteamSteamQuality(switch_x_def
          =true, x_const=1.0)
        "defines steam quality x=1.0 at connector SaturatedSteam"
        annotation (extent=[62, 32; 82, 52]);
      Source.ThermalState.ParameterDefined DefSatLiquidSteamQuality(
          switch_x_def=true, x_const=0.0)
        "defines steam quality x=0.0 for saturated liquid at outlet"
        annotation (extent=[62, -80; 82, -60]);
    equation
      connect(TwoPhaseIn, PhaseSeparatorNoProp1.TwoPhaseIn)
        annotation (points=[-110, 0; -46, 0], style(color=4));
      connect(TwoPhaseProperty.StateCut, PhaseSeparatorNoProp1.TwoPhase)
        annotation (points=[-46, 32; -46, 12], style(color=8));
      connect(PhaseSeparatorNoProp1.GasOut, GasOut) annotation (points=[-14, 22;
             -14, 80; 50, 80; 50, 110], style(color=4));
      connect(PhaseSeparatorNoProp1.LiquidOut, LiquidOut) annotation (points=[-14,
             -22; -10, -22; -10, -80; 50, -80; 50, -110], style(color=4));
      connect(PhaseSeparatorNoProp1.SaturatedSteam, SatSteamProperty.StateCut)
        annotation (points=[-6, 22; 20, 22; 20, 32], style(color=8));
      connect(PhaseSeparatorNoProp1.SaturatedLiquid, SatLiquidProperty.StateCut)
         annotation (points=[-6, -22; 2, -22; 2, -70; 34, -70; 34, -58; 32, -58],
           style(color=8));
      connect(SatSteamProperty.StateCut, DefSatSteamSteamQuality.
        OutThermalState)
        annotation (points=[20, 32; 54, 32; 54, 53; 72, 53], style(color=8));
      connect(SatLiquidProperty.StateCut, DefSatLiquidSteamQuality.
        OutThermalState) annotation (points=[32, -58; 51, -58; 51, -59; 72, -59],
           style(color=8));
    end H2oPhaseSeparator;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.Compressor

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EaS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model PhaseSeparatorNoProp
        "model for separator without definition of Medium"
        extends TTComponent.FlowCRTL.Support.PhaseSeparatorCIM;

        //------------parameters----------------------
        parameter Integer n_comp=1 "number of components in vessel";

        Real x "steam quality at connector TwoPhaseIn";
        //Real h_evaporate;

        TTInterface.ThermalState.In SaturatedSteam(n_comp=n_comp)
          "thermal state saturated steam"
          annotation (extent=[100, 100; 80, 120]);
        TTInterface.ThermalState.In SaturatedLiquid(n_comp=n_comp)
          "thermal state saturated liquid"
          annotation (extent=[100, -100; 80, -120]);
        TTInterface.ThermalState.In TwoPhase(n_comp=n_comp)
          "thermal state two phase flow at inlet"
          annotation (extent=[-120, 50; -100, 70]);
      equation

        //pressure identical at all connectors
        TwoPhaseIn.p = GasOut.p;
        TwoPhaseIn.p = LiquidOut.p;
        TwoPhaseIn.p = TwoPhase.p;
        GasOut.p = SaturatedSteam.p;
        LiquidOut.p = SaturatedLiquid.p;

        //composition identical at all connectors
        TwoPhaseIn.x_i = GasOut.x_i;
        TwoPhaseIn.x_i = LiquidOut.x_i;
        TwoPhaseIn.x_i = TwoPhase.x_i;
        GasOut.x_i = SaturatedSteam.x_i;
        LiquidOut.x_i = SaturatedLiquid.x_i;

        //conservation of mass
        0.0 = TwoPhaseIn.m_dot + GasOut.m_dot + LiquidOut.m_dot;

        //steam quality at inlet
        //h_evaporate=SaturatedLiquid.h-SaturatedLiquid.h;


          //x=noEvent(if h_evaporate>0.0 then (TwoPhaseIn.h-SaturatedLiquid.h)/(SaturatedLiquid.h-SaturatedLiquid.h)	else 1.0);
        TwoPhaseIn.h = TwoPhase.h;
        x = TwoPhase.x;

        //mass flow saturated steam
        if x > 0.0 then
          if x < 1.0 then
            GasOut.m_dot = -TwoPhaseIn.m_dot*x;
          else
            GasOut.m_dot = -TwoPhaseIn.m_dot;
          end if;
        else
          GasOut.m_dot = 0.0;
        end if;

        //enthapies at outlet:
        GasOut.h = SaturatedSteam.h;
        LiquidOut.h = SaturatedLiquid.h;

      end PhaseSeparatorNoProp;

      model PhaseSeparatorCIM "connector-icon model for separator"
        parameter Integer n_comp=1 "number of components in fluid";

        TTInterface.MassFlow.In TwoPhaseIn(n_comp=n_comp)
          "connector for inlet two phase flow"
          annotation (extent=[-120, -10; -100, 10]);
        TTInterface.MassFlow.Out GasOut(n_comp=n_comp)
          "connector for outlet gas phase"
          annotation (extent=[40, 100; 60, 120]);
        TTInterface.MassFlow.Out LiquidOut(n_comp=n_comp)
          "connector for outlet liquid phase"
          annotation (extent=[40, -100; 60, -120]);

        annotation (
          Icon(
            Polygon(points=[48, 100; 20, 40; 80, 40; 48, 100], style(
                color=1,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[20, -40; 50, -100; 80, -40; 20, -40], style(
                color=69,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[-100, 40; -20, 0; -100, -40; -100, 40], style(
                color=69,
                fillColor=1,
                fillPattern=10)),
            Rectangle(extent=[40, 40; 60, 0], style(
                color=1,
                fillColor=7,
                fillPattern=8)),
            Rectangle(extent=[40, 0; 60, -40], style(
                color=69,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[-20, 0; 40, 20; 40, 0; -20, 0], style(
                color=1,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[-20, 0; 40, 0; 40, -20; -20, 0], style(
                color=69,
                fillColor=7,
                fillPattern=8))),
          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[2, 2],
            component=[20, 20]),
          Window(
            x=0.25,
            y=0.11,
            width=0.6,
            height=0.6),
          Diagram);

      end PhaseSeparatorCIM;

    end Support;

  end FlowCRTL;

  package Heater
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: models providing (thermal) energy

identification: TechThermo Ed
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 40; 69, -88], style(
            color=6,
            fillColor=55,
            fillPattern=1)),
        Rectangle(extent=[-91, 40; 69, -88]),
        Polygon(points=[-79, -78; -36, -9; -25, -29; -10, 30; 6, -30; 14, -10;
              49, -78; -79, -78], style(color=1, fillColor=1)),
        Polygon(points=[-52, -68; -35, -27; -22, -52; -10, 9; 3, -51; 13, -21;
              24, -68; -52, -68], style(
            color=6,
            fillColor=6,
            fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6),
      Diagram);

    model SimpleHeater "transfer of thermal energy to fluid flow"
      extends TTComponent.Heater.Support.HeaterCIM(
        final switch_m_dot_const=true,
        final switch_h_const=false,
        final switch_p_const=true,
        final switch_x_i_const=true);
    equation

      0.0 = Pthermal.q_dot + m_in_dot*(h_in - h_out);

    end SimpleHeater;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.Burner
Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EaS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model HeaterCIM "connector-icon model for burner"
        extends TTInterface.MassFlow.TwoPort;

        //----exergy-connector mechanical power needed for compression
        TTInterface.HeatFlow.In Pthermal annotation (extent=[-10, 100; 10, 120]);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
connector-icon model for compressor
</p>

<p>includes only definitions of connectors and icon-graphics</p>

<p>extends MassFlow.TwoPort</p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>
<hr>



<b>Identification:</b> TechThermo EaS1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (
          Icon(Polygon(points=[-100, 80; 40, 80; 100, 20; 40, -40; -100, -40; -40,
                   20; -100, 80], style(color=67, fillColor=67)), Polygon(
                points=[-40, 100; 0, 0; 40, 100; -40, 100], style(
                color=45,
                fillColor=45,
                fillPattern=1))),
          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[2, 2],
            component=[20, 20]),
          Window(
            x=0.25,
            y=0.11,
            width=0.6,
            height=0.6));

      end HeaterCIM;

    end Support;

  end Heater;

  package Pump
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: models providing (thermal) energy

identification: TechThermo Ed
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 40; 69, -88], style(
            color=0,
            fillColor=55,
            fillPattern=1)),
        Rectangle(extent=[-91, 40; 69, -88]),
        Ellipse(extent=[-56, 19; 28, -65], style(color=0, fillColor=7)),
        Line(points=[-20, 18; 28, -22; -21, -64], style(
            color=0,
            fillColor=7,
            fillPattern=1))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6),
      Diagram);

    model H2oLiquidPump
      extends TTComponent.Pump.Support.PumpCIM(
        final switch_m_dot_const=false,
        final switch_h_const=false,
        final switch_p_const=false,
        final switch_x_i_const=false);

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram);
      Support.PumpNoProp PumpNoProp1 annotation (extent=[-28, 6; 22, 56]);
      Medium.Liquid.H2oVariableRhoCalVol H2oVariableRhoCalVol1
        annotation (extent=[50, 48; 100, 98]);
      Source.ThermalState.ParameterDefined ParameterDefined1(switch_x_def=true)
        annotation (extent=[-36, 72; -16, 92]);
    equation
      connect(InMassFlow, PumpNoProp1.InMassFlow) annotation (points=[-110, -70;
             -102, -70; -102, -68; -92, -68; -92, 13.5; -30.5, 13.5], style(
            color=4));
      connect(PumpNoProp1.OutMassFlow, OutMassFlow) annotation (points=[24.5,
            13.5; 90, 13.5; 90, -70; 110, -70], style(color=4));
      connect(Pmech, PumpNoProp1.Pmech)
        annotation (points=[-90, 110; -90, 58.5; -25.5, 58.5], style(color=2));
      connect(PumpNoProp1.StateCut, H2oVariableRhoCalVol1.StateCut) annotation
        (points=[19.5, 58.5; 19.5, 76; 38, 76; 38, 32; 75, 32; 75, 45.5], style(
            color=8));
      connect(ParameterDefined1.OutThermalState, PumpNoProp1.StateCut)
        annotation (points=[-26, 93; -26, 98; 19.5, 98; 19.5, 58.5], style(
            color=8));
    end H2oLiquidPump;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Component.Burner
Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo EaS
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Polygon(points=[-81, -26; -10, 30; 61, -26; -10, -82; -81, -26],
              style(fillColor=41)),
          Polygon(points=[5, -10; 14, -10; 11, 1; 0, 9; -20, 9; -30, 3; -34, -7;
                 -34, -15; -22, -25; 0, -30; 6, -35; 7, -41; 0, -49; -20, -49;
                -26, -43; -28, -35; -36, -35; -33, -48; -20, -58; -1, -58; 11,
                -51; 16, -41; 14, -30; 5, -22; -21, -15; -25, -10; -24, -4; -18,
                 0; -1, 0; 3, -4; 5, -10], style(color=0, fillColor=0))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.01,
          y=0.05,
          width=0.6,
          height=0.6),
        Diagram);

      model PumpCIM "connector-icon model for pump"
        extends TTInterface.MassFlow.TwoPort;

        //----exergy-connector mechanical power needed for compression
        TTInterface.ExergyFlow.In Pmech
          annotation (extent=[-100, 100; -80, 120]);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
connector-icon model for compressor
</p>

<p>includes only definitions of connectors and icon-graphics</p>

<p>extends MassFlow.TwoPort</p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h, .p, .rho, .s, .t, .u, .x, .x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>
<hr>



<b>Identification:</b> TechThermo EaS1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (
          Icon(
            Ellipse(extent=[-60, 80; 58, -40], style(color=0)),
            Line(points=[-30, 72; 58, 20], style(color=0)),
            Line(points=[58, 20; -28, -32; -28, -34], style(color=0))),
          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[2, 2],
            component=[20, 20]),
          Window(
            x=0.25,
            y=0.11,
            width=0.6,
            height=0.6),
          Diagram);

      end PumpCIM;

      model PumpNoProp "pump without specification of working fluid"
        extends TTComponent.Pump.Support.PumpCIM(
          final switch_m_dot_const=true,
          final switch_x_i_const=true,
          final switch_h_const=false,
          final switch_p_const=false);

        TTInterface.ThermalState.In StateCut "used for density calculation"
          annotation (extent=[100, 100; 80, 120]);

        parameter SIunits.Efficiency eta_const=0.8 "const. efficiency of pump";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const=true then eta_pump=eta_pump_const";

        SIunits.Efficiency eta_pump "efficiency of pump";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
model for compressor without specification of working fluid
      </p>

<hr>
<p><b>connectors</b></p>

<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Pmech<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>Inlet<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
<tr><td>State2<td>ThermalState.Out<td>.h,.p,.s,.x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>Inlet<td>x_i,h,p,s<td>rho,t,u</tr>
<tr><td>State2<td>x_i,h,p,s<td>rho,t,u</tr>

</table>




<br>


</p>


<hr>
<p><b>correlation between connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>identical to variables of other connectors</b></tr>
<tr><td>Inlet<td>p_in, h_in, x_in_i</tr>
<tr><td>State2<td>>p_out,x_out_i</tr>

</table>




<br>


</p>
<hr>




<b> NECESSARY ADDITIONS:</b> thermophysical correlations for working fluid at ThermalState-connectors
Inlet and State2
<hr>


<b> ASSUMPTIONS:</b>
<ul>
<li>no storage of mass or energy</li>
<li>no modification of mass fraction vector x_i</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_eta_const<td>eta_isentrop=eta_const
</tr>
<tr>
<td>switch_t_const<td>t_in=t_out
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b>none <br>


<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>eta_const<td>isentropic efficiency of compressor<td>Efficiency<td>[-]
</tr>
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo EaS2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        StateCut.h = (h_in + h_out)/2.0;
        StateCut.p = (p_in + p_out)/2.0;
        StateCut.x_i = x_in_i;

        if switch_eta_const == true then
          eta_pump = eta_const;
        end if;

        0.0 = Pmech.exergy_dot*eta_pump*StateCut.rho + m_in_dot*(p_in - p_out);

        Pmech.exergy_dot = m_in_dot*(h_out - h_in);

      end PumpNoProp;

    end Support;

  end Pump;

end Component;
