package Source "models for definition of boundary conditions TTcode:B"
  //wds 05.10.01 14:00
  extends Modelica.Icons.Library;

  package SIunits = Modelica.SIunits;
  //using Modelica type-definition
  package GeneralConstants = Modelica.Constants;

  package TT = TechThermo;
  package TTInterface = TT.Interface;
  package TTSource=TT.Source;


  annotation (
    Documentation(info="
content package: models describing sources for definition of boundary conditions

identification: TechThermo B
"),
    Icon(Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)), Polygon(
          points=[-13, 23; -13, 13; -24, 5; -23, -2; -13, 7; -13, -57; -23, -57
            ; -33, -55; -43, -51; -39, -45; -54, -45; -48, -60; -45, -55; -33,
            -60; -23, -64; -13, -67; -8, -67; -2, -67; 7, -65; 17, -61; 27, -55
            ; 32, -59; 39, -44; 21, -44; 25, -50; 17, -54; 7, -57; -3, -57; -3
            , 7; 8, -2; 8, 4; -3, 13; -3, 23; -13, 23], style(fillColor=0))),
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[1, 1],
      component=[20, 20]),
    Window(
      x=0.01,
      y=0.05,
      width=0.6,
      height=0.6));

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package MassFlow "definition of boundary conditions using massflow-connectors TTcode:Ba"
    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="

content package: sources for mass flow
identification: TechThermo Ba
"),
      Icon(Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)), Polygon(
            points=[-13, 23; -13, 13; -24, 5; -23, -2; -13, 7; -13, -57; -23, -
              57; -33, -55; -43, -51; -39, -45; -54, -45; -48, -60; -45, -55; -
              33, -60; -23, -64; -13, -67; -8, -67; -2, -67; 7, -65; 17, -61;
              27, -55; 32, -59; 39, -44; 21, -44; 25, -50; 17, -54; 7, -57; -3
              , -57; -3, 7; 8, -2; 8, 4; -3, 13; -3, 23; -13, 23], style(
              fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model ParameterDefined
      "mass-flow source with optional definition of flow variables by parameters"


      parameter Integer n_comp=1;
      TTInterface.MassFlow.Out MassFlowOut(n_comp=n_comp) annotation (extent=[
            10, 100; -10, 120]);

      //------------parameters--------------------------------------

      //switches for variables at connectors:
      parameter Boolean switch_m_dot_def=false
        "if switch_m_dot_def=true, MassFlowOut.m_dot is determined by parameter m_dot_para"
        ;

      parameter Boolean switch_h_def=false
        "if switch_h_def=true, MassFlowOut.h is determined by parameter h_para"
        ;

      parameter Boolean switch_p_def=false
        "if switch_p_def=true, MassFlowOut.p is determined by parameter p_para"
        ;

      parameter Boolean switch_x_i_def=false
        "if switch_x_i_def=true, MassFlowOut.x_i is determined by parameter x_para_i"
        ;

      //values for variables at outlet if corresponding switch-parameter=true
      parameter SIunits.MassFlowRate m_dot_para=-0.0
        "value for total MassFlowOut.m_dot at outlet if switch_m_dot_def=true";
      parameter SIunits.SpecificEnthalpy h_para=1000.0
        "value for spec. MassFlowOut.h at outlet if switch_h_def=true";
      parameter SIunits.Pressure p_para=1.e5
        "value for MassFlowOut.p at outlet if switch_p_def=true";
      parameter SIunits.MassFraction x_para_i[n_comp]
        "vector for MassFlowOut.x_i if switch_x_def=true";


      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model for imposing boundary condition at mass flow connector MassFlowOut,
with n_comp components (default value n_comp=1)</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:<td>if ==true then <td> Default value </b></tr>
<tr>
<td>switch_m_dot_def<td>MassFlowOut.m_dot=m_dot_para<td>false
</tr>
<tr>
<td>switch_h_def<td>MassFlowOut.h=h_para<td>false
</tr>
<tr>
<td>switch_p_def<td>MassFlowOut.p=p_para<td>false
</tr>
<tr>
<td>switch_x_i_def<td>MassFlowOut.x_i=x_para_i<td>false
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>


<hr>
<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr>
<td><b>PARAMETERS:<td>meaning<td>type<td>unit</b>
</tr>
<tr>
<td>m_dot_para<td> value for total MassFlowOut.m_dot at outlet if switch_m_dot_def=true <td>MassFlowRate<td>[kg/s]
</tr>
<tr>
<td>h_para<td> value for spec. MassFlowOut.h at outlet if switch_h_def=true<td>SpecificEnthalpy<td>[J/kg]
</tr>
<tr>
<td>p_para<td> value for MassFlowOut.p at outlet if switch_p_def=true <td>Pressure<td>[N/m2]
</tr>
<tr>
<td>x_para_i<td> value for MassFlowOut.x_i at outlet if switch_x_i_def=true <td>MassFraction<td>[-]
</tr>

</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ba1<br>
<b>Example:</b> TechThermo Gd1


</p>
</HTML>"));

      //---------End Documentation------------------------------





      //--Start Graphics-----------------------------------------

      annotation (
        Icon(Polygon(points=[-6, 99; -6, 88; -38, 79; -38, 59; -6, 70; -6, -51
                ; -28, -51; -50, -47; -70, -31; -58, -19; -92, -7; -92, -49; -
                78, -37; -54, -59; -28, -67; 2, -71; 32, -67; 58, -57; 82, -37
                ; 94, -47; 94, -7; 62, -19; 74, -31; 54, -47; 32, -51; 6, -51;
                6, 70; 42, 60; 43, 78; 6, 88; 6, 99; -6, 99], style(fillColor=
                  65)), Text(extent=[-100, -100; 100, -70], string="%name")),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));
    equation

      //--End Graphics-----------------------------------------

      if switch_m_dot_def then
        MassFlowOut.m_dot = m_dot_para;
      end if;

      if switch_h_def then
        MassFlowOut.h = h_para;
      end if;

      if switch_p_def then
        MassFlowOut.p = p_para;
      end if;

      if switch_x_i_def then
        MassFlowOut.x_i = x_para_i;
      end if;

    end ParameterDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model SignalDefined
      "mass-flow source with optional definition of flow variables by outer signal TTcode:Ba2"


      parameter Integer n_comp=1;

      // mass-flow connector:
      TTInterface.MassFlow.Out OutMassFlow(n_comp=n_comp) annotation (extent=[
            10, 100; -10, 120]);

      // input signal connector from Modelica Standard Library
      parameter Integer n=1 "dimension of signal vector";
      Modelica.Blocks.Interfaces.InPort InSignal(n=n_comp) annotation (extent=[
            -10, -100; 10, -120], rotation=-90);

      //------------parameters--------------------------------------

      //option-parameter for selection of variable defined by
      //InPort
      parameter Integer option_defsignal=-1
        "defines variable controlled by signal at connector InSignal, 1:m_dot, 2:h, 3:p, 4:x_i";

	  parameter Boolean switch_zero_m_dot=false
	  "if switch_zero_m_dot==true AND NOT option_defsignal==1 then OutMassFlow.m_dot=0.0";


      //-----Start Documentation----------------------------------------------


      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-100, -100; 100, -70], string="%name"),
          Polygon(points=[-100, -60; 0, 100; 100, -60; -100, -60]),
          Polygon(points=[-6, 101; -6, 90; -38, 81; -38, 61; -6, 72; -6, -49; -
                28, -49; -50, -45; -70, -29; -58, -17; -92, -5; -92, -47; -78,
                -35; -54, -57; -28, -65; 2, -69; 32, -65; 58, -55; 82, -35; 94
                , -45; 94, -5; 62, -17; 74, -29; 54, -45; 32, -49; 6, -49; 6,
                72; 42, 62; 43, 80; 6, 90; 6, 101; -6, 101], style(fillColor=65
              ))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="


<html>
<p>

a selected variable of connector OutMassFlow is defined by an external signal source connected to connector InSignal

<br>


<p>if selected variables is not mass flow rate m_dot, then OutMassFlow.m_dot=0.0 if switch_zero_m_dot==true


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<table border=1>
<tr><td>  <b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_zero_m_dot<td>OutMassFlow.m_dot=0.0 <b>if NOT option_defsignal==1</b>
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>




<table border=1>
<tr><td>  <b>OPTION-PARAMETERS:<td>if OPTION-PARAMETER== <td> Then </b></tr>
<tr>
<td>option_defsignal<td>1<td>OutMassFlow.m_dot=InSignal.signal[1]
</tr>
<tr>
<td><td>2<td>OutMassFlow.h=InSignal.signal[1]
</tr>
<tr>
<td><td>3<td>OutMassFlow.p=InSignal.signal[1]
</tr>
<tr>
<td><td>4<td>OutMassFlow.x_i=InSignal.signal
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>
<hr>

<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ba2<br>
<b>Example:</b> TechThermo Gd2


</p>
</HTML>"));

      //---------End Documentation------------------------------







    equation

      //--End Graphics-----------------------------------------

      //      definition of a single variable by an external
      //      signal source connected to InPort depending on
      //      parameter option_defsignal:

      if option_defsignal == 1 then
        OutMassFlow.m_dot = InSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        OutMassFlow.h = InSignal.signal[1];
		if switch_zero_m_dot==true then
			OutMassFlow.m_dot=0.0;
		end if;
      end if;

      if option_defsignal == 3 then
        OutMassFlow.p = InSignal.signal[1];
		if switch_zero_m_dot==true then
			OutMassFlow.m_dot=0.0;
		end if;
	  end if;

      if option_defsignal == 4 then
        OutMassFlow.x_i = InSignal.signal;
		if switch_zero_m_dot==true then
			OutMassFlow.m_dot=0.0;
		end if;
	  end if;

    end SignalDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model FlowRateCrtl
      "controls mass-flow rate between two connectors by parameter or external signal TTcode:Ba3"


      extends TTInterface.MassFlow.TwoPort(
        switch_m_dot_const=true,
        switch_p_const=true,
        switch_h_const=true,
        switch_x_i_const=true);

      // input signal connector from Modelica Standard Library for
      // definition mass-flow rate by external signal
      parameter Integer n=1 "dimension of signal vector";
      Modelica.Blocks.Interfaces.InPort InSignal(n=n) annotation (extent=[-10,
            100; 10, 120], rotation=-90);

      // Boolean switches
      parameter Boolean switch_para_def=false
        "if switch_para_def==true m_in_dot=m_dot_const";

      parameter Boolean switch_signal_def=false
        "if switch_signal_def==true m_in_dot=InSignal.signal[1]";

      parameter SIunits.MassFlowRate m_dot_const=1.0
        "m_in_dot=m_dot_const if switch_para_def==true";


      //--Start Graphics-----------------------------------------

      annotation (Icon(Polygon(points=[-100, 100; -40, 40; -100, -20; 40, -20;
                100, 40; 40, 100; -100, 100], style(fillColor=4)), Polygon(
              points=[-1, 89; -1, 79; -11, 79; -11, 73; -1, 73; -1, 9; -11, 9;
                -21, 11; -31, 15; -27, 21; -42, 21; -36, 6; -33, 11; -21, 6; -
                11, 2; -1, -1; 4, -1; 10, -1; 19, 1; 29, 5; 39, 11; 44, 7; 51,
                22; 33, 22; 37, 16; 29, 12; 19, 9; 9, 9; 9, 73; 19, 73; 19, 79
                ; 9, 79; 9, 89; -1, 89], style(fillColor=0))));


          //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to control mass flow rate between two connectors
      for flow with {n_comp} components:<p>

<p>includes two connectors<p>
<p><b>InMassFlow </b>[h, m_dot, p, x_i{n_comp}]<p>
<p><b>OutMassFlow </b>[h, m_dot, p, x_i{n_comp}]<p>

        element to control mass-flow rate by parameter or external signal
        depending on settings of switch-parameters<p>

        only variable m_in_dot (m_out_dot=-m_in_dot) can be controlled,
        other connector-variables remain constant<p>

        h_in=h_out<p>
        p_in=p_out<p>
        x_in_i=x_out_i<p>

        control of mass-flow rate:
        by parameter if switch_para_def==true and switch_signal_def==false<p>

        by external signal source if switch_signal_def==true switch_para_def==false
           m_in_dot=InSignal.signal[1]<p>

<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_para_def<td>(switch_signal_def == false) m_in_dot=m_dot_const InSignal.signal[1] = m_dot_const
</tr>
<tr>
<td>switch_signal_def<td>(switch_para_def == false) m_in_dot = InSignal.signal[1]
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>m_dot_const<td>m_in_dot=m_dot_const if switch_para_def==true<td>MassFlowRate<td>[kg/s]
</tr>



</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ba3<br>
<b>Example:</b> TechThermo Gd1


</p>
</HTML>"));

      //---------End Documentation------------------------------



    equation

      //--End Graphics-----------------------------------------

      if switch_para_def == true and switch_signal_def == false then
        m_in_dot = m_dot_const;
        InSignal.signal[1] = m_dot_const;
      end if;

      if switch_para_def == false and switch_signal_def == true then
        m_in_dot = InSignal.signal[1];
      end if;

    end FlowRateCrtl;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model Counter "provides energy flowing through the element or integrals of energy or mass flow TTcode:Ba4"
      extends TTInterface.MassFlow.TwoPort(
        final switch_m_dot_const=true,
        final switch_p_const=true,
        final switch_h_const=true,
        final switch_x_i_const=true);

      SIunits.Mass m_total(start=0.0, fixed=true)"integral mass flow through element";
      SIunits.Energy energy_total(start=0.0, fixed=true)"integral energy flow through element";
      SIunits.Power energy_flow "energy flwo through element";


      // output signal connector from Modelica Standard Library for
      // mass and energy
      parameter Integer option_info_select "type of provided information: 1-energy flow,
      2-integral energy flow 3-integral mass flow";
      Modelica.Blocks.Interfaces.OutPort OutSignal(n=1) annotation (extent=[-10
            , 100; 10, 120], rotation=90);


      //--Start Graphics-----------------------------------------

      annotation (Icon(
          Rectangle(extent=[-100, 40; 50, -60], style(fillColor=9)),
          Polygon(points=[50, 40; 80, 80; 80, -20; 50, -60; 50, 40], style(
                fillColor=10)),
          Polygon(points=[-100, 40; -60, 80; 80, 80; 50, 40; -100, 40], style(
                fillColor=8)),
          Rectangle(extent=[-85, 15; -45, -45], style(fillColor=7)),
          Rectangle(extent=[-45, 15; -5, -45], style(fillColor=7)),
          Rectangle(extent=[-5, 15; 35, -45], style(fillColor=7)),
          Text(extent=[-0, 10; 30, -40], string="2"),
          Text(extent=[-40, 10; -10, -40], string="4"),
          Text(extent=[-80, 10; -50, -40], string="0")));

          //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
provides selected information about mass flow through element to connector
OutSignal (Modelica.Blocks.Interfaces.OutPort(n=1))
</p>
available information:
<ul>
<li>energy flow: h_in*m_in_dot</li>
<li>integral mass flow: der(m_total)=m_in_dot</li>
<li>integral energy flow: der(energy_total)=(h_in*m_in_dot)</li>
</ul>

<p>

<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b> SWITCH-PARAMETERS:</b>-none-
<hr>

<p>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_info_select</b><td> type of provided information</tr>
<tr>
<td>1<td>energy flow
</tr>
<tr>
<td>2<td>integral energy flow
</tr>
<tr>
<td>3<td>integral mass flow
</tr>
</table>
</p>
<hr>




<table border=1>
<tr><td><b>PARAMETERS:<td>meaning<td>type<td>unit</b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ba4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------







    equation

      //--End Graphics-----------------------------------------


      energy_flow=h_in*m_in_dot;
      der(m_total) = m_in_dot;
      der(energy_total) = (h_in*m_in_dot);


      if option_info_select==1 then
      	OutSignal.signal[1]=energy_flow;
      end if;
      if option_info_select==2 then
      	OutSignal.signal[1]=energy_total;
      end if;
      if option_info_select==3 then
      	OutSignal.signal[1]=m_total;
      end if;

    end Counter;

    model SwitchCrtl "model to switch between two mass flow sources: TTcode:Ba5"

    Modelica.Blocks.Interfaces.InPort DirectionSignal(n=1) annotation (extent=[-10
            , 100; 10, 120], rotation=-90);



        //------------parameters----------------------
    parameter Integer n_comp=1 "number of components in fluid";

	parameter Integer option_m_dot_dummy=2 "definition of variable m_dot at not used connectors, s. info";
	parameter Integer option_h_dummy=2 "definition of variable h at not used connectors, s. info";
	parameter Integer option_p_dummy=2 "definition of variable p not used connectors, s. info";
    parameter Integer option_x_i_dummy=2 "definition of variable x_i at not used connectors, s. info";



    TTInterface.MassFlow.Out SourceA(n_comp=n_comp)
       annotation (extent=[-100, 100; -80, 120]);
    TTInterface.MassFlow.In SinkA(n_comp=n_comp)
       annotation (extent=[100, 100; 80, 120]);
    TTInterface.MassFlow.In BiDirection1(n_comp=n_comp)
      "1. connector for optional bidirectional mass flow"
      annotation (extent=[-100, -10; -120, 10]);
    TTInterface.MassFlow.Out BiDirection2(n_comp=n_comp)
      "2. connector for optional bidirectional mass flow"
      annotation (extent=[120, -10; 100, 10]);
    TTInterface.MassFlow.Out SourceB(n_comp=n_comp)
       annotation (extent=[-100, -100; -80, -120]);
    TTInterface.MassFlow.In SinkB(n_comp=n_comp)
       annotation (extent=[100, -100; 80, -120]);


        annotation (Icon(
        Rectangle(extent=[-100, 98; 100, -100], style(color=0, fillColor=8)),
        Rectangle(extent=[-100, 16; -40, -14], style(color=0, fillColor=67)),
        Rectangle(extent=[40, 16; 100, -14], style(color=0, fillColor=67)),
        Polygon(points=[-40, 98; -80, -20; -60, -20; -20, 98; -40, 98], style(
            color=0,
            fillColor=67,
            fillPattern=1)),
        Polygon(points=[20, 98; 60, -20; 80, -20; 40, 98; 20, 98], style(
            color=0,
            fillColor=67,
            fillPattern=1)),
        Polygon(points=[-80, 20; -40, -100; -20, -100; -60, 20; -80, 20], style(
              color=67, pattern=2)),
        Polygon(points=[60, 20; 20, -100; 40, -100; 80, 20; 60, 20], style(
              color=67, pattern=2)),
        Line(points=[0, 76; 0, 26], style(color=0)),
        Line(points=[-24, 54; 24, 54], style(color=0)),
        Line(points=[-24, -42; 24, -42], style(color=0))), Diagram(
        Line(points=[-90, 100; -90, 60; -40, 60; -40, 8; -100, 8], style(
            color=0,
            pattern=2,
            thickness=2)),
        Line(points=[90, 100; 90, 60; 40, 60; 40, 8; 100, 8], style(
            color=0,
            pattern=2,
            thickness=2)),
        Line(points=[-100, -10; -40, -10; -40, -60; -90, -60; -90, -100], style(
            color=45,
            pattern=2,
            thickness=2)),
        Line(points=[100, -10; 40, -10; 40, -60; 90, -60; 90, -100], style(
            color=45,
            pattern=2,
            thickness=2)),
        Text(
          extent=[-76, 74; 88, 62],
          string="DirectionSignal.signal[1] >= 0.0",
          style(color=0)),
        Text(
          extent=[-82, -74; 82, -86],
          string="DirectionSignal.signal[1] >= 0.0",
          style(color=1))));


//-----Start Documentation----------------------------------------------
      annotation (Documentation(info="


<html>
<p>

Element to define boundary conditions at inlet and outlet of a system. Depending on value of signal provided to
signal connector, selection between two differents sets of boundary conditions is possible. Element can be used
for imposing boundary conditions in reversing flows.

<p>First set of variables defining boundary conditions is introduced at connectors SourceA, SinkA; second set
is introduced at connectors SourceB, SinkB. Selection of boundary conditions depends on signal[1] at
connector DirectionSignal:</p>
<p>if DirectionSignal.signal[1]>=0.0 then <p>
<p>BiDirection1=SourceA</p>
<p>BiDirection2=SinkA</p>
<p>SourceB internally connected to SinkB</p>
<p>
<p>if DirectionSignal.signal[1] &lt 0.0 then <p>
<p>BiDirection1=SourceB</p>
<p>BiDirection2=SinkB</p>
<p>SourceA internally connected to SinkA</p>
<p>

<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>:none
<hr>



<table border=1>
<tr><td>  <b>OPTION-PARAMETERS:<td>if OPTION-PARAMETER== <td> then </b></tr>
<tr>
<td>option_m_dot_dummy<td>1<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								<p>SinkB.m_dot=0.0</p>
								<p>SourceB.m_dot=0.0</p>
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>SinkA.m_dot=0.0</p>
								<p>SourceA.m_dot=0.0</p>
</tr>

<tr>
<td><td>2<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								<p>0.0=SinkB.m_dot+SourceB.m_dot</p>
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>0.0=SinkB.m_dot+SourceB.m_dot</p>

</tr>
<tr>
<td>option_h_dummy<td>1<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								<p>SinkB.h=-42.0;</p>
								<p>SourceB.h=-42.0</p>
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>SinkA.h=-42.0</p>
								<p>SourceA.h=-42.0</p>
</tr>

<tr>
<td><td>2<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								<p>SinkB.h=SourceB.h</p>
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>SinkA.h=SourceA.h</p>

</tr>

<tr>
<td>option_p_dummy<td>1<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								<p>SinkB.p=-42.0;</p>
								<p>SourceB.p=-42.0</p>
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>SinkA.p=-42.0</p>
								<p>SourceA.p=-42.0</p>
</tr>

<tr>
<td><td>2<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								SinkB.p =SourceB.p
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>SinkA.p=SourceA.p</p>

</tr>


<tr>
<td>option_x_i_dummy<td>1<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								<p>SinkB.x_i=zeros(n_comp);</p>
								<p>SourceB.x_i=zeros(n_comp)</p>
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>SinkA.x_i=zeros(n_comp)</p>
								<p>SourceA.x_i=zeros(n_comp)</p>
</tr>

<tr>
<td><td>2<td><p><b>if DirectionSignal.signal[1]>=0.0 then</p></b>
								<p>SinkB.x_i =SourceB.x_i </p>
								<p></p>
								<p><b>if DirectionSignal.signal[1] &lt 0.0 then</p></b>
								<p>SinkA.x_i=SourceA.x_i</p>

</tr>




</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>
<hr>

<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ba5<br>
<b>Example:</b> TechThermo

</p>
</HTML>"));

      //---------End Documentation------------------------------



    equation


   if DirectionSignal.signal[1]>=0.0 then

	   // variables at connector BiDirection1 are identical to variables of connector SourceA
	   0.0=SourceA.m_dot+BiDirection1.m_dot;
       BiDirection1.h=SourceA.h;
       BiDirection1.p=SourceA.p;
       BiDirection1.x_i=SourceA.x_i;

	   // variables at connector BiDirection2 are identical to variables of connector SinkA
       0.0=SinkA.m_dot+BiDirection2.m_dot;
       BiDirection2.h=SinkA.h;
       BiDirection2.p=SinkA.p;
       BiDirection2.x_i=SinkA.x_i;


       0.0=SourceB.m_dot+SinkB.m_dot;
       SourceB.h=SinkB.h;
       SourceB.p=SinkB.p;
       SourceB.x_i=SinkB.x_i;




    else


	   // variables at connector BiDirection1 are identical to variables of connector SourceB
       0.0=SourceB.m_dot+BiDirection1.m_dot;
       BiDirection1.h=SourceB.h;
       BiDirection1.p=SourceB.p;
       BiDirection1.x_i=SourceB.x_i;


//	   // variables at connector BiDirection1 are identical to variables of connector SinkB
       0.0=SinkB.m_dot+BiDirection2.m_dot;
       BiDirection2.h=SinkB.h;
       BiDirection2.p=SinkB.p;
       BiDirection2.x_i=SinkB.x_i;


	   0.0=SourceA.m_dot+SinkA.m_dot;
       SourceA.h=SinkA.h;
       SourceA.p=SinkA.p;
       SourceA.x_i=SinkA.x_i;



    end if;


    end SwitchCrtl;


    model FlowVelocity
      "correlation between mass flow rate and velocity depending on density and flow geometry  TTcode:Ba6"
      extends TTInterface.MassFlow.TwoPort(
        final switch_m_dot_const=true,
        final switch_h_const=true,
        final switch_p_const=true,
        final switch_x_i_const=true);


        //-----------------connector for thermal state------------------------------
      TTInterface.ThermalState.In StateCut(n_comp=n_comp) annotation (extent=[-10, 100; 10
            , 120]);

      // signal connector for velocity from Modelica Standard Library
            Modelica.Blocks.Interfaces.InPort Velocity(n=n_comp) annotation (extent=[
            -10, -100; 10, -120], rotation=-90);

       SIunits.Area area_cross "cross-sectional area";


       parameter Boolean switch_identical_connectors=true
       "if switch_identical_connectors==true then variables h,p,x_i of connector
       StateCut are equal to h,p,x_i of connector InMassFlow";

       parameter Integer option_geometry=1
       "cross-sectional area of flow channel; 1: =area_const, 2: =di_pipe^2*pi/4, 3: =s_quadratic^2, 4:=s_a_rectangle*s_b_rectangle";

       parameter SIunits.Area area_const=1.0 "cross sectional area, used if option_geometry==1";

       parameter SIunits.Diameter di_pipe=0.1 "diameter of pipe, used for calculation of cross-sectional
       area if option_geometry==2";

       parameter SIunits.Distance s_quadratic=0.1 "side length of quadratic cross section, used for calculation of cross-sectional
       area if option_geometry==3";

       parameter SIunits.Distance s_a_rectangle=0.05 "first side length of rectangular cross section, used for calculation of cross-sectional
       area if option_geometry==4";

       parameter SIunits.Distance s_b_rectangle=0.3 "second side length of rectangular cross section, used for calculation of cross-sectional
       area if option_geometry==4";





      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>model including correlation between mass flow rate and flow velocity. Density of flowing medium
is provided to thermal state connector StateCut. Connector Velocity transfers value of velocity
</p>

<p>Flow geometry is defined by parameter option_geometry:
<ul>
<li>1-geometry defined by area of cross section</li>
<li>2-pipe-geometry</li>
<li>3-quadratic geometry</li>
<li>4-rectangular geometry</li>
</ul></p>

<p>includes four connectors:</p>
<ul>
<li><b>InMassFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>OutMassFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>StateCut </b>[h,p,rho,s,t,u,x,x_i{n_comp}]</li>
<li><b>Velocity </b>[signal{n_comp}]</li>
</ul>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>density of fluid must be provided to connector StateCut,
no correlation between connector StateCut and connectors InMassFlow,OutMassFlow
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>




<p><b>SWITCH-PARAMETERS:</b>:none</p>

<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td>  <b>option_geometry </b><td>shape of flow channel
</tr>

<tr>
<td>1<td>area_cross=area_const
</tr>

<tr>
<td>2<td>area_cross=di_pipe^2*pi/4
</tr>

<tr>
<td>3<td>area_cross=s_quadratic^2
</tr>


<tr>
<td>4<td>area_cross=s_a_rectangle*s_b_rectangle
</tr>

</table>

<hr>


<p><b>PARAMETERS:</b></p>
<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>

<tr>
<td>area_const<td> cross sectional area, used if option_geometry==1 <td>Area<td>[m^2]
</tr>

<tr>
<td>di_pipe<td> diameter of tube, used if option_geometry==2 <td>Diameter<td>[m]
</tr>

<tr>
<td>s_quadratic<td> side length of quadratic flow channel, used if option_geometry==3 <td>Distance<td>[m]
</tr>

<tr>
<td>s_a_rectangle<td> first side length of rectangular flow channel, used if option_geometry==4 <td>Distance<td>[m]
</tr>

<tr>
<td>s_b_rectangle<td> second side length of rectangular flow channel, used if option_geometry==4 <td>Distance<td>[m]
</tr>



</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ba5<br>
<b>Example:</b> TechThermo Ga5


</p>
</HTML>"));

    annotation (Icon(
        Rectangle(extent=[-100, 98; 100, -100], style(
            color=0,
            fillColor=4,
            fillPattern=1)),
        Ellipse(extent=[-80, 80; 80, -80], style(
            color=7,
            fillColor=0,
            fillPattern=1)),
        Line(points=[-80, 0; -60, 0], style(color=7, fillPattern=1)),
        Line(points=[60, 0; 80, 0], style(color=7, fillPattern=1)),
        Line(points=[0, 80; 0, 60], style(color=7, fillPattern=1)),
        Line(points=[-42, -42; -58, -56], style(color=7, fillPattern=1)),
        Line(points=[-56, 56; -42, 42], style(color=7, fillPattern=1)),
        Line(points=[56, 56; 42, 42], style(color=7, fillPattern=1)),
        Line(points=[42, -44; 56, -58], style(color=7, fillPattern=1)),
        Polygon(points=[-38, 60; -38, 50; 2, -6; 12, 2; -28, 58; -38, 60],
            style(
            color=7,
            fillColor=7,
            fillPattern=1))));

        annotation (Diagram(
        Text(
          extent=[-26, 92; 24, 84],
          style(color=0, pattern=2),
          string="connector StateCut"),
        Rectangle(extent=[-60, 96; 60, 80], style(color=0, pattern=2)),
        Text(
          extent=[-74, 36; -26, 28],
          style(color=0, pattern=2),
          string="h_in = StateCut.h"),
        Text(
          extent=[-74, 28; -26, 20],
          style(color=0, pattern=2),
          string="p_in = StateCut.p"),
        Text(
          extent=[-76, 20; -16, 12],
          style(color=0, pattern=2),
          string="x_in_i = StateCut.x_i"),
        Text(
          extent=[-74, 14; 2, 2],
          style(color=0, pattern=2),
          string="m_in_dot = StateCut.m_dot"),
        Text(
          extent=[4, 34; 52, 8],
          style(color=0, pattern=2),
          string="%switch_identical_connectors"),
        Rectangle(extent=[-80, 44; 60, -2], style(color=0, pattern=2)),
        Line(points=[-10, 44; -10, 60; 0, 60; 0, 80], style(color=0, arrow=1)),

        Line(points=[-10, -2; -10, -20; -58, -20; -58, -46], style(color=0,
              arrow=1))));



    equation


        //--------------------------end documentation------------------------------

      if option_geometry==1 then
        area_cross=area_const;
      end if;

      if option_geometry==2 then
        area_cross=di_pipe^2*GeneralConstants.pi/4.0;
      end if;

      if option_geometry==3 then
        area_cross=s_quadratic^2;
      end if;

      if option_geometry==4 then
        area_cross=s_a_rectangle*s_b_rectangle;
      end if;

      if switch_identical_connectors==true then
        StateCut.p=InMassFlow.p;
        StateCut.x_i=InMassFlow.x_i;
        StateCut.h=InMassFlow.h;
      end if;

      //correlation mass flow rate, density and flow velocity:
      Velocity.signal[1]=m_in_dot/area_cross/StateCut.rho;

    end FlowVelocity;

    model ReynoldsNumber
      "correlation Reynolds number / mass flow rate TTcode:Ba7"
      extends TTInterface.MassFlow.TwoPort(
        switch_m_dot_const=true,
        switch_h_const=true,
        switch_p_const=true,
        switch_x_i_const=true);


        //-----------------connector for thermal state------------------------------
      TTInterface.ThermalState.In StateCut(n_comp=n_comp) annotation (extent=[-10, 100; 10
            , 120]);

      // signal connector for velocity from Modelica Standard Library
            Modelica.Blocks.Interfaces.InPort Velocity(n=n_comp) annotation (extent=[
            -10, -100; 10, -120], rotation=-90);


       parameter SIunits.Area area_cross "cross-sectional area, used if option_geometry==1";
       parameter SIunits.Lenth l_characteristic "characteristic length, used if option_geometry==1";


       parameter Integer option_geometry=1
       "cross-sectional area of flow channel; 1: =area_const, 2: =di_pipe^2*pi/4, 3: =s_quadratic^2, 4:=s_a_rectangle*s_b_rectangle";


       parameter SIunits.Diameter di_pipe=0.1 "diameter of pipe, used for calculation of cross-sectional
       area if option_geometry==2";

       parameter SIunits.Distance s_quadratic=0.1 "side length of quadratic cross section, used for calculation of cross-sectional
       area if option_geometry==3";

       parameter SIunits.Distance s_a_rectangle=0.05 "first side length of rectangular cross section, used for calculation of cross-sectional
       area if option_geometry==4";

       parameter SIunits.Distance s_b_rectangle=0.3 "second side length of rectangular cross section, used for calculation of cross-sectional
       area if option_geometry==4";

       parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";

       parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";


       SIunits.DynamicViscosity eta "dynamic viscosity flow medium";



      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>model including correlation between mass flow rate and Reynolds number. Density of flowing medium
is provided to thermal state connector StateCut. Connector ReNumber transfers value of Reynolds number
</p>

<p>Flow geometry is defined by parameter option_geometry:
<ul>
<li>1-geometry defined by area of cross section and characteristic dimension</li>
<li>2-pipe-geometry</li>
</ul></p>

<p>includes four connectors:</p>
<ul>
<li><b>InMassFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>OutMassFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>StateCut </b>[h,p,rho,s,t,u,x,x_i{n_comp}]</li>
<li><b>ReNumber </b>[signal{n_comp}]</li>
</ul>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>density of fluid must be provided to connector StateCut,
no correlation between connector StateCut and connectors InMassFlow,OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.

</ul>

<hr>



<p>




<p><b>SWITCH-PARAMETERS:</b>:none</p>

<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td>  <b>option_geometry </b><td>shape of flow channel
</tr>

<tr>
<td>1<td>general; defined by cross sectional area and characteristic dimension
</tr>

<tr>
<td>2<td>pipe; defined by diameter
</tr>



</table>

<hr>


<p><b>PARAMETERS:</b></p>
<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>

<tr>
<td>cross_area<td> cross-sectional area , used if option_geometry==1 <td>Area<td>[m2]
</tr>

<tr>
<td>l_characteristic<td>characteristic length dimension, used if option_geometry==1 <td>Length<td>[m]
</tr>

<tr>
<td>di_pipe<td> diameter of tube, used if option_geometry==2 <td>Diameter<td>[m]
</tr>


</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ba7<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

    annotation (Icon(
        Rectangle(extent=[-100, 100; 100, -98], style(
            color=0,
            fillColor=4,
            fillPattern=1)),
        Rectangle(extent=[-92, 90; 92, 24], style(color=0, fillColor=7)),
        Text(
          extent=[-76, 86; 78, 30],
          style(color=0),
          string="Reynolds"),
        Ellipse(extent=[-92, 18; 90, -92], style(
            color=4,
            fillColor=7,
            fillPattern=1)),
        Rectangle(extent=[-92, -36; 92, -92], style(
            color=4,
            fillColor=4,
            fillPattern=1)),
        Line(points=[-4, -36; 32, 4], style(
            color=0,
            fillColor=4,
            fillPattern=1))), Diagram(
        Text(
          extent=[-80, 80; 74, 24],
          style(color=0),
          string="Reynolds"),
        Rectangle(extent=[-88, -20; -48, -80], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Rectangle(extent=[-42, -20; -2, -80], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-76, -26; -76, -48; -58, -48], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-58, -26; -58, -72], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-30, -26; -10, -26; -10, -48; -30, -48; -30, -72; -12, -72],
             style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Rectangle(extent=[4, -20; 44, -80], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Rectangle(extent=[50, -20; 90, -80], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[16, -26; 16, -48; 34, -48], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[34, -26; 34, -72], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[62, -26; 82, -26; 82, -48; 62, -48; 62, -72; 80, -72],
            style(
            color=0,
            fillColor=7,
            fillPattern=1))));


    equation


        //--------------------------end documentation------------------------------


        if switch_eta_const == true then
          eta = eta_const;
        end if;


      if option_geometry==1 then
        re_positive = InletMass.m_dot/eta/area_cross/l_characteristic;
      end if;


      if option_geometry==2 then
        re_positive = InletMass.m_dot*4.0/eta/di_pipe/GeneralConstants.pi;
      end if;




      //correlation mass flow rate, density and flow velocity:
      Velocity.signal[1]=re_positive;

    end ReynoldsNumber;


	model StateSwitchCrtl
	"transfers information about thermal state from selected state connector to mass-flow connector"

	extends TTInterface.MassFlow.TwoPort
        (final switch_m_dot_const=true,
        final switch_p_const=true,
        final switch_h_const=true,
        final switch_x_i_const=true);

      Modelica.Blocks.Interfaces.InPort DirectionSignal(n=1) annotation (extent=[-10
            , 100; 10, 120], rotation=90);


     TTInterface.ThermalState.In PositiveState(n_comp=n_comp) annotation (extent=[-100, 100; -80
            , 120]);

     TTInterface.ThermalState.Out NegativeState(n_comp=n_comp) annotation (extent=[100, 100; 80
            ,120]);

     parameter Boolean switch_h_tranfer=true
     "if switch_h_tranfer==true then spec. enthalpy h is transferred from selected thermal state
     connector to mass flow connectors";

     parameter Boolean switch_x_i_tranfer=true
     "if switch_x_i_tranfer==true then composition vector x_i is transferred from selected thermal state
     connector to mass flow connectors";




    //-----Start Documentation----------------------------------------------
    annotation (Documentation(info="

<html>
<p>
transfer of information from thermal state connector to mass flow connector. Depending on the value of
connector DirectionSignal values for spec. enthalpy and composition are either taken from
connector PositiveState(DirectionSignal.signal[1]>=0.0) or from connector NegativeState
(DirectionSignal.signal[1]<0.0)
</p>
model is intended to define spec. enthalpy and composition for mass flows with alternating flow direction
<p>

<hr>
<p><b>connectors</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>PositiveState<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
<tr><td>NegativeState<td>ThermalState.Out<td>.h,.p,.s,.x_i</tr>
<tr><td>InMassFlow<td>MassFlow.In<td>p_in, h_in, m_in_dot, x_in_i</tr>
<tr><td>OutMassFlow<td>MassFlow.Out<td>p_out, h_out, m_out_dot, x_out_i</tr>
<tr><td>DirectionSignal<td>Modelica.Blocks.Interfaces.InPort<td>signal[1]</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>PositiveState<td>x_i,h<td>p,s,rho,t,u,x</tr>
<tr><td>NegativeState<td>x_i,h<td>p,s,rho,t,u,x</tr>

</table>




<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b> SWITCH-PARAMETERS:</b>-none-
<hr>

<b> OPTION-PARAMETERS:</b>-none-
<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ba8<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));




    annotation (
      Icon(
        Polygon(points=[-100, 100; -20, 100; -20, 20; -60, -40; -100, 20; -100,
               100], style(color=8, fillColor=9)),
        Rectangle(extent=[-70, 90; -50, 30], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Rectangle(extent=[-90, 70; -30, 50], style(
            color=7,
            fillColor=7,
            fillPattern=1)),
        Polygon(points=[20, 100; 100, 100; 100, 20; 60, -40; 20, 20; 20, 100],
            style(color=8, fillColor=9)),
        Rectangle(extent=[30, 70; 90, 50], style(
            color=7,
            fillColor=7,
            fillPattern=1))),
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



	equation



   if DirectionSignal.signal[1]>=0.0 then

		if switch_h_transfer==true then
                	h_in=PositiveState.h;
                end if;

                if switch_x_i_transfer==true then
			x_in_i=PositiveState.x_i;
                end if;

	else

		if switch_h_transfer==true then
                	h_in=NegativeState.h;
                end if;

                if switch_x_i_transfer==true then
			x_in_i=NegativeState.x_i;
                end if;

	end if;




	end StateSwitchCrtl;



  end MassFlow;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package HeatFlow "models to define boundary conditions at heat flow connectors TTcode:Bb"
    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="
Date of last modification:
Description last modification:

identification: TechThermo Bb
"),
      Icon(Rectangle(extent=[-91, 37; 69, -89], style(fillColor=47)), Polygon(
            points=[-13, 23; -13, 13; -24, 5; -23, -2; -13, 7; -13, -57; -23, -
              57; -33, -55; -43, -51; -39, -45; -54, -45; -48, -60; -45, -55; -
              33, -60; -23, -64; -13, -67; -8, -67; -2, -67; 7, -65; 17, -61;
              27, -55; 32, -59; 39, -44; 21, -44; 25, -50; 17, -54; 7, -57; -3
              , -57; -3, 7; 8, -2; 8, 4; -3, 13; -3, 23; -13, 23], style(
              fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model ParameterDefined
      "heat-flow source with optional definition of heat-flow variables by parameters TTcode:Bb1"


      TTInterface.HeatFlow.Out OutHeatFlow annotation (extent=[10, 100; -10,
            120]);

      //------------parameters--------------------------------------

      //switches for variables at connectors:
      parameter Boolean switch_q_dot_def=false
        "if switch_q_dot_def=true, OutHeatFlow.q_dot is determined by parameter q_dot_para"
        ;

      parameter Boolean switch_t_def=false
        "if switch_t_def=true, OutHeatFlow.t is determined by parameter t_para"
        ;

      //values for variables at outlet if corresponding switch-parameter=true
      parameter SIunits.HeatFlowRate q_dot_para=-0.0
        "value for heat-flow rate HeatFlowOut.q_dot at outlet if switch_q_dot_def=true"
        ;
      parameter SIunits.CelsiusTemperature t_para=25.0
        "value for temperature at HeatFlowOut.t at outlet if switch_t_def=true"
        ;


      //--Start Graphics-----------------------------------------

      annotation (
        Icon(Polygon(points=[-6, 99; -6, 88; -38, 79; -38, 59; -6, 70; -6, -51
                ; -28, -51; -50, -47; -70, -31; -58, -19; -92, -7; -92, -49; -
                78, -37; -54, -59; -28, -67; 2, -71; 32, -67; 58, -57; 82, -37
                ; 94, -47; 94, -7; 62, -19; 74, -31; 54, -47; 32, -51; 6, -51;
                6, 70; 42, 60; 43, 78; 6, 88; 6, 99; -6, 99], style(fillColor=
                  47)), Text(extent=[-100, -100; 100, -70], string="%name")),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model for imposing boundary condition at heat flow connector OutHeatFlow,

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:<td>if ==true then <td> Default value </b></tr>
<tr>
<td>switch_q_dot_def<td>OutHeatFlow.q_dot=q_dot_para<td>false
</tr>
<tr>
<td>switch_t_def<td>OutHeatFlow.t=t_para<td>false
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>


<hr>
<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr>
<td><b>PARAMETERS:<td>meaning<td>type<td>unit</b>
</tr>
<tr>
<td>q_dot_para<td> value for OutHeatFlow.q_dot if switch_q_dot_def=true <td>HeatFlowRate<td>[kg/s]
</tr>
<tr>
<td>t_para<td> value for temperature OutHeatFlow.t if switch_t_def=true<td>CelsiusTemperature<td>[°C]
</tr>

</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Bb1<br>
<b>Example:</b> TechThermo Gb1


</p>
</HTML>"));

      //---------End Documentation------------------------------





    equation

      //--End Graphics-----------------------------------------

      if switch_q_dot_def then
        OutHeatFlow.q_dot = q_dot_para;
      end if;

      if switch_t_def then
        OutHeatFlow.t = t_para;
      end if;

    end ParameterDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model SignalDefined
      "heat-flow source with optional definition of flow variables by parameters or outer signal TTcode:Bb2"


      // heat flow connector
      TTInterface.HeatFlow.Out OutHeatFlow annotation (extent=[10, 100; -10,
            120]);

      // input signal connector from Modelica Standard Library
      Modelica.Blocks.Interfaces.InPort InSignal annotation (extent=[
            -10, -100; 10, -120], rotation=-90);

      //option-parameter for selection of variable defined by
      //InPort
      parameter Integer option_defsignal=-1
        "defines variable controlled by InPort, 1:q_dot, 2:t";

	  parameter Boolean switch_zero_q_dot=false
	  "if switch_zero_q_dot==true AND NOT option_defsignal==1 then OutHeatFlow.q_dot=0.0";



      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-100, -100; 100, -70], string="%name"),
          Polygon(points=[-100, -60; 0, 100; 100, -60; -100, -60]),
          Polygon(points=[-6, 101; -6, 90; -38, 81; -38, 61; -6, 72; -6, -49; -
                28, -49; -50, -45; -70, -29; -58, -17; -92, -5; -92, -47; -78,
                -35; -54, -57; -28, -65; 2, -69; 32, -65; 58, -55; 82, -35; 94
                , -45; 94, -5; 62, -17; 74, -29; 54, -45; 32, -49; 6, -49; 6,
                72; 42, 62; 43, 80; 6, 90; 6, 101; -6, 101], style(fillColor=47
              ))),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));

//-----Start Documentation----------------------------------------------
      annotation (Documentation(info="


<html>
<p>

a selected variable of connector OutHeatFlow is defined by an external signal source connected to connector InSignal

<br>

<p>if selected variables is not heat flow rate q_dot, then OutHeatFlow.q_dot=0.0 if switch_zero_q_dot==true


</p>

</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<table border=1>
<tr><td>  <b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_zero_q_dot<td>OutHeatFlow.q_dot=0.0 <b>if NOT option_defsignal==1</b>
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>




<table border=1>
<tr><td>  <b>OPTION-PARAMETERS:<td>if OPTION-PARAMETER== <td> Then </b></tr>
<tr>
<td>option_defsignal<td>1<td>OutHeatFlow.q_dot=InSignal.signal[1]
</tr>
<tr>
<td><td>2<td> OutHeatFlow.t=InSignal.signal[1]
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>
<hr>


<b> PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Bb2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------






    equation

      //--End Graphics-----------------------------------------

      //      definition of a single variable depending on value of
      //      parameter option_defsignal:

      if option_defsignal == 1 then
        OutHeatFlow.q_dot = InSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        OutHeatFlow.t = InSignal.signal[1];
   		if switch_zero_q_dot==true then
			OutHeatFlow.q_dot=0.0;
		end if;
	  end if;

    end SignalDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model FlowRateCrtl
      "controls heat-flow rate between two models by parameter or external signal TTcode:Bb3"


      extends TTInterface.HeatFlow.TwoPort(switch_q_dot_const=true,
          switch_t_const=true);

      // input signal connector from Modelica Standard Library for
      // definition heat-flow rate by external signal
      parameter Integer n=1 "dimension of signal vector";
      Modelica.Blocks.Interfaces.InPort InSignal(n=n) annotation (extent=[-10,
            100; 10, 120], rotation=-90);

      // Boolean switches
      parameter Boolean switch_para_def=false
        "if switch_para_def==true q_in_dot=q_dot_const";

      parameter Boolean switch_signal_def=false
        "if switch_signal_def==true q_in_dot=InSignal.signal[1]";

      parameter SIunits.HeatFlowRate q_dot_const=1.0
        "q_in_dot=q_dot_const if switch_para_def==true";


      //--Start Graphics-----------------------------------------

      annotation (Icon(Polygon(points=[-100, 100; -40, 40; -100, -20; 40, -20;
                100, 40; 40, 100; -100, 100], style(fillColor=47)), Polygon(
              points=[-1, 89; -1, 79; -11, 79; -11, 73; -1, 73; -1, 9; -11, 9;
                -21, 11; -31, 15; -27, 21; -42, 21; -36, 6; -33, 11; -21, 6; -
                11, 2; -1, -1; 4, -1; 10, -1; 19, 1; 29, 5; 39, 11; 44, 7; 51,
                22; 33, 22; 37, 16; 29, 12; 19, 9; 9, 9; 9, 73; 19, 73; 19, 79
                ; 9, 79; 9, 89; -1, 89], style(fillColor=0))));


          //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to control heat flow rate between two connectors by parameter or external signal
        depending on settings of switch-parameters<p>

<p>includes two connectors<p>
<p><b>InHeatFlow </b>[q_dot, t]<p>
<p><b>OutHeatFlow </b>[q_dot, t]<p>


        only variable q_in_dot (q_out_dot=-q_in_dot) can be controlled,
        temperature is not changed in element<p>


        control of heat-flow rate:
        by parameter if switch_para_def==true and switch_signal_def==false<p>

        by external signal source if switch_signal_def==true switch_para_def==false
           q_in_dot=InSignal.signal[1]<p>

<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_para_def<td>(switch_signal_def == false) q_in_dot=q_dot_const InSignal.signal[1] = q_dot_const
</tr>
<tr>
<td>switch_signal_def<td>(switch_para_def == false) q_in_dot = InSignal.signal[1]
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>


<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>q_dot_const<td>q_in_dot=q_dot_const if switch_para_def==true<td>HeatFlowRate<td>[kg/s]
</tr>
</table>
</p>
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Bb3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------





    equation

      //--End Graphics-----------------------------------------

      if switch_para_def == true and switch_signal_def == false then
        q_in_dot = q_dot_const;
        InSignal.signal[1] = q_dot_const;
      end if;

      if switch_para_def == false and switch_signal_def == true then
        q_in_dot = InSignal.signal[1];
      end if;

    end FlowRateCrtl;

    model Counter "integrates heat flowing through the element"
      extends TTInterface.HeatFlow.TwoPort(final switch_q_dot_const=true,
          final switch_t_const=true);

      SIunits.Energy q_total(start=0.0, fixed=true);

      // output signal connector from Modelica Standard Library for
      // integrated heat
      parameter Integer n=1 "dimension of signal vector";
      Modelica.Blocks.Interfaces.OutPort OutSignal(n=n) annotation (extent=[-10
            , 100; 10, 120], rotation=90);


      //--Start Graphics-----------------------------------------

      annotation (Icon(
          Rectangle(extent=[-100, 40; 50, -60], style(fillColor=9)),
          Polygon(points=[50, 40; 80, 80; 80, -20; 50, -60; 50, 40], style(
                fillColor=10)),
          Polygon(points=[-100, 40; -60, 80; 80, 80; 50, 40; -100, 40], style(
                fillColor=8)),
          Rectangle(extent=[-85, 15; -45, -45], style(fillColor=7)),
          Rectangle(extent=[-45, 15; -5, -45], style(fillColor=7)),
          Rectangle(extent=[-5, 15; 35, -45], style(fillColor=7)),
          Text(extent=[-0, 10; 30, -40], string="2"),
          Text(extent=[-40, 10; -10, -40], string="4"),
          Text(extent=[-80, 10; -50, -40], string="0")));

          //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
integrates heat flowing trough element
</p>

der(q_total)=q_in_dot<p>


        q_total is exported by signal-connector
        OutSignal(n=1):<p>
        q_total=OutSignal.signal[1]<p>



<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b> SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>


<b>PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Bb4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------






    equation

      //--End Graphics-----------------------------------------

      der(q_total) = q_in_dot;
      q_total = OutSignal.signal[1];

    end Counter;


    model AreaSpecificFlow
      "correlates area specific heat flow rate and absolute heat flow rate TTcode:Bb5"


      extends TTInterface.HeatFlow.TwoPort(switch_q_dot_const=true,
          switch_t_const=true);



      // input signal connector from Modelica Standard Library for
      // definition heat-flow rate by external signal
      parameter Integer n=1 "dimension of signal vector";
      parameter SIunits.Area surface_area=5 "surface for heat transfer";

	  Modelica.Blocks.Interfaces.InPort AreaSpecificHeatFlowRate(n=n) annotation (extent=[-10,
            100; 10, 120], rotation=-90);




          //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to control heat flow rate between two connectors by external signal
        representing area specific heat flow rate <p>

<p>includes three connectors:<p>
<p><b>InHeatFlow </b>[q_dot, t]<p>
<p><b>OutHeatFlow </b>[q_dot, t]<p>
<p><b>AreaSpecificHeatFlowRate</b>[signal[1]]<p>

correlation absolute heat flow rate at connectors InHeatFlow/OutHeatFlow and area-specific heat flow
rate at connector AreaSpecificHeatFlowRate:<p>
q_in_dot = InSignal.signal[1]*surface_area<p>


<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<b> SWITCH-PARAMETERS:</b>-none-
<hr>


<b>OPTION-PARAMETERS:</b>-none-
<hr>


<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>surface_area<td>relevant surface area for heat transfer<td>Area<td>[m^2]
</tr>
</table>
</p>
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Bb5<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------


    annotation (
      Icon(
        Rectangle(extent=[-50, 50; 50, -52], style(color=0, pattern=2)),
        Polygon(points=[-100, 40; -60, 40; -60, -40; -100, -40; -80, 0; -100,
              40], style(
            color=45,
            fillColor=45,
            fillPattern=1)),
        Polygon(points=[60, 40; 100, 0; 60, -40; 60, 40], style(
            color=45,
            fillColor=45,
            fillPattern=1)),
        Polygon(points=[-20, 100; -20, 40; 0, 0; 20, 40; 20, 100; -20, 100],
            style(
            color=69,
            fillColor=69,
            fillPattern=1))),
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



    equation

      //--End Graphics-----------------------------------------

        q_in_dot = AreaSpecificHeatFlowRate.signal[1]*surface_area;


    end AreaSpecificFlow;





  end HeatFlow;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package ExergyFlow "models to define boundary conditions at exergy flow connectors TTcode:Bc"
    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="

content package: sources for exergy-flow
identification: TechThermo b3
"),
      Icon(Rectangle(extent=[-91, 37; 69, -89], style(fillColor=2)), Polygon(
            points=[-13, 23; -13, 13; -24, 5; -23, -2; -13, 7; -13, -57; -23, -
              57; -33, -55; -43, -51; -39, -45; -54, -45; -48, -60; -45, -55; -
              33, -60; -23, -64; -13, -67; -8, -67; -2, -67; 7, -65; 17, -61;
              27, -55; 32, -59; 39, -44; 21, -44; 25, -50; 17, -54; 7, -57; -3
              , -57; -3, 7; 8, -2; 8, 4; -3, 13; -3, 23; -13, 23], style(
              fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model ParameterDefined
      "exergy-flow source with optional definition of exergy-flow by parameters TTcode:Bc1"


      TTInterface.ExergyFlow.Out ExergyFlowOut annotation (extent=[10, 100; -10
            , 120]);

      //------------parameters--------------------------------------

      //switches for variables at connectors:
      parameter Boolean switch_exergy_dot_def=false
        "if switch_exergy_dot_def=true, ExergyFlowOut.exergy_dot is determined by parameter exergy_dot_para"
        ;

      //values for variables at outlet if corresponding switch-parameter=true
      parameter SIunits.Power exergy_dot_para=0.0
        "value for exergy-flow rate ExergyFlowOut.exergy_dot at outlet if switch_exergy_dot_def=true"
        ;


      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model for imposing boundary condition at exergy flow connector ExergyFlowOut,

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:<td>if ==true then <td> Default value </b></tr>
<tr>
<td>switch_exergy_dot_def<td>ExergyFlowOut.exergy_dot=exergy_dot_para<td>false
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>


<hr>
<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr>
<td><b>PARAMETERS:<td>meaning<td>type<td>unit</b>
</tr>
<tr>
<td>exergy_dot_para<td> value for ExergyFlowOut.exergy_dot if switch_exergy_dot_def=true <td>Power<td>[W]
</tr>

</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Bc1<br>
<b>Example:</b> TechThermo Ga2


</p>
</HTML>"));

      //---------End Documentation------------------------------





      //--Start Graphics-----------------------------------------

      annotation (
        Icon(Polygon(points=[-6, 99; -6, 88; -38, 79; -38, 59; -6, 70; -6, -51
                ; -28, -51; -50, -47; -70, -31; -58, -19; -92, -7; -92, -49; -
                78, -37; -54, -59; -28, -67; 2, -71; 32, -67; 58, -57; 82, -37
                ; 94, -47; 94, -7; 62, -19; 74, -31; 54, -47; 32, -51; 6, -51;
                6, 70; 42, 60; 43, 78; 6, 88; 6, 99; -6, 99], style(fillColor=2
              )), Text(extent=[-100, -100; 100, -70], string="%name")),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));
    equation

      //--End Graphics-----------------------------------------

      if switch_exergy_dot_def then
        ExergyFlowOut.exergy_dot = exergy_dot_para;
      end if;

    end ParameterDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model SignalDefined
      "exergy-flow source with optional definition of exergy flow rate by outer signal TTcode:Bc2"


      // exergy flow connector
      TTInterface.ExergyFlow.Out OutExergyFlow annotation (extent=[10, 100; -10
            , 120]);

      // input signal connector from Modelica Standard Library
      Modelica.Blocks.Interfaces.InPort InSignal annotation (extent=[
            -10, -100; 10, -120], rotation=-90);


      //------------parameters--------------------------------------

      //switches for variables at connectors:
      parameter Boolean switch_signal_def=true
        "if switch_signal_def==true, OutExergyFlow.exergy_dot is determined by InSignal.signal[1]"
        ;

      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-100, -100; 100, -70], string="%name"),
          Polygon(points=[-100, -60; 0, 100; 100, -60; -100, -60]),
          Polygon(points=[-6, 101; -6, 90; -38, 81; -38, 61; -6, 72; -6, -49; -
                28, -49; -50, -45; -70, -29; -58, -17; -92, -5; -92, -47; -78,
                -35; -54, -57; -28, -65; 2, -69; 32, -65; 58, -55; 82, -35; 94
                , -45; 94, -5; 62, -17; 74, -29; 54, -45; 32, -49; 6, -49; 6,
                72; 42, 62; 43, 80; 6, 90; 6, 101; -6, 101], style(fillColor=2)
            )),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));


//-----Start Documentation----------------------------------------------
      annotation (Documentation(info="


<html>
<p>

Optional definition of connector OutExergyFlow.exergy_dot by an external signal source connected to connector InSignal

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:<td>if ==true then <td> Default value </b></tr>
<tr>
<td>switch_signal_def<td>OutExergyFlow.exergy_dot = InSignal.signal[1]
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>


<hr>

<hr>
<b>OPTION-PARAMETERS:</b>-none-
<hr>


<b> PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Bc2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------






    equation

      if switch_signal_def==true then
	      OutExergyFlow.exergy_dot = InSignal.signal[1];
      end if;

    end SignalDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model FlowRateCrtl
      "controls exergy-flow rate through element by parameter or external signal TTcode:Bc3"


      extends TTInterface.ExergyFlow.TwoPort(switch_exergy_dot_const=true);

      // input signal connector from Modelica Standard Library for
      // definition exergy-flow rate by external signal
      parameter Integer n=1 "dimension of signal vector";
      Modelica.Blocks.Interfaces.InPort InSignal(n=n) annotation (extent=[-10,
            100; 10, 120], rotation=-90);

      // Boolean switches
      parameter Boolean switch_para_def=false
        "if switch_para_def==true exergy_in_dot=exergy_dot_const";

      parameter Boolean switch_signal_def=false
        "if switch_signal_def==true exergy_in_dot=InSignal.signal[1]";

      parameter SIunits.HeatFlowRate exergy_dot_const=1.0
        "exergy_in_dot=exergy_dot_const if switch_para_def==true";


      //--Start Graphics-----------------------------------------

      annotation (Icon(Polygon(points=[-100, 100; -40, 40; -100, -20; 40, -20;
                100, 40; 40, 100; -100, 100], style(fillColor=2)), Polygon(
              points=[-1, 89; -1, 79; -11, 79; -11, 73; -1, 73; -1, 9; -11, 9;
                -21, 11; -31, 15; -27, 21; -42, 21; -36, 6; -33, 11; -21, 6; -
                11, 2; -1, -1; 4, -1; 10, -1; 19, 1; 29, 5; 39, 11; 44, 7; 51,
                22; 33, 22; 37, 16; 29, 12; 19, 9; 9, 9; 9, 73; 19, 73; 19, 79
                ; 9, 79; 9, 89; -1, 89], style(fillColor=0))));


          //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
element to control exergy-flow rate by parameter or external signal
depending on settings of switch-parameters<p>



<p>includes two connectors<p>
<p><b>InExergyFlow </b>[exergy_dot]<p>
<p><b>OutExergyFlow</b>[exergy_dot]<p>



        control of exergy-flow rate:
        by parameter if switch_para_def==true and switch_signal_def==false<p>

        by external signal source if switch_signal_def==true and switch_para_def==false
           exergy_in_dot=InSignal.signal[1]<p>

<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_para_def<td>(switch_signal_def == false) exergy_in_dot=exergy_dot_const InSignal.signal[1] = exergy_dot_const
</tr>
<tr>
<td>switch_signal_def<td>(switch_para_def == false) exergy_in_dot = InSignal.signal[1]
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>exergy_dot_const<td>exergy_in_dot=m_dot_const if switch_para_def==true<td>Power<td>[W]
</tr>

</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Bc3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------






    equation

      //--End Graphics-----------------------------------------

      if switch_para_def == true and switch_signal_def == false then
        exergy_in_dot = exergy_dot_const;
        InSignal.signal[1] = exergy_dot_const;
      end if;

      if switch_para_def == false and switch_signal_def == true then
        exergy_in_dot = InSignal.signal[1];
      end if;

    end FlowRateCrtl;

    model Counter "integrates exergy flowing through the element TTcode:Bc4"
      extends TTInterface.ExergyFlow.TwoPort(final switch_exergy_dot_const=true
        );

      SIunits.Energy exergy_total(start=0.0, fixed=true);

      // output signal connector from Modelica Standard Library for
      // integrated exergy
      parameter Integer n=1 "dimension of signal vector";
      Modelica.Blocks.Interfaces.OutPort OutSignal(n=n) annotation (extent=[-10
            , 100; 10, 120], rotation=90);


      //--Start Graphics-----------------------------------------

      annotation (Icon(
          Rectangle(extent=[-100, 40; 50, -60], style(fillColor=9)),
          Polygon(points=[50, 40; 80, 80; 80, -20; 50, -60; 50, 40], style(
                fillColor=10)),
          Polygon(points=[-100, 40; -60, 80; 80, 80; 50, 40; -100, 40], style(
                fillColor=8)),
          Rectangle(extent=[-85, 15; -45, -45], style(fillColor=7)),
          Rectangle(extent=[-45, 15; -5, -45], style(fillColor=7)),
          Rectangle(extent=[-5, 15; 35, -45], style(fillColor=7)),
          Text(extent=[-0, 10; 30, -40], string="2"),
          Text(extent=[-40, 10; -10, -40], string="4"),
          Text(extent=[-80, 10; -50, -40], string="0")));

          //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
integrates exergy flowing trough element
</p>

der(exergy_total)=exergy_in_dot<p>


        exergy_total is exported by signal-connector
        OutSignal(n=1):<p>
        exergy_total=OutSignal.signal[1]<p>

<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b> SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>


<b>PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Bc4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------


    equation

      //--End Graphics-----------------------------------------

      der(exergy_total) = exergy_in_dot;
      exergy_total = OutSignal.signal[1];

    end Counter;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

  end ExergyFlow;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package ThermalState "models to define boundary conditions at thermal state connectors TTcode:Bd"
    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="
Date of last modification:
Description last modification:
Author last modification:wds
content package: sources for thermal state information
identification: TechThermo Bd
"),
      Icon(Rectangle(extent=[-91, 37; 69, -89], style(fillColor=8)), Polygon(
            points=[-13, 23; -13, 13; -24, 5; -23, -2; -13, 7; -13, -57; -23, -
              57; -33, -55; -43, -51; -39, -45; -54, -45; -48, -60; -45, -55; -
              33, -60; -23, -64; -13, -67; -8, -67; -2, -67; 7, -65; 17, -61;
              27, -55; 32, -59; 39, -44; 21, -44; 25, -50; 17, -54; 7, -57; -3
              , -57; -3, 7; 8, -2; 8, 4; -3, 13; -3, 23; -13, 23], style(
              fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model ParameterDefined
      "thermal state connector with optional definition of variables by parameters TTcode:Bd1"


      parameter Integer n_comp=1;
      TTInterface.ThermalState.Out OutThermalState(n_comp=n_comp) annotation (
          extent=[10, 100; -10, 120]);

      //------------parameters--------------------------------------

      //switches for variables at connectors:

      parameter Boolean switch_h_def=false
        "if switch_h_def=true, OutThermalState.h is determined by parameter h_para"
        ;

      parameter Boolean switch_p_def=false
        "if switch_p_def=true,  OutThermalState.p is determined by parameter p_const"
        ;

      parameter Boolean switch_rho_def=false
        "if switch_rho_def=true, OutThermalState.rho is determined by parameter rho_const"
        ;

      parameter Boolean switch_s_def=false
        "if switch_s_def=true, OutThermalState.s is determined by parameter s_const"
        ;

      parameter Boolean switch_t_def=false
        "if switch_t_def=true, OutThermalState.t is determined by parameter t_const"
        ;

      parameter Boolean switch_u_def=false
        "if switch_u_def=true, OutThermalState.u is determined by parameter u_const"
        ;

      parameter Boolean switch_x_def=false
        "if switch_x_def=true, OutThermalState.x is determined by parameter x_const"
        ;

      parameter Boolean switch_x_i_def=false
        "if switch_x_i_def=true, OutThermalState.x_i is determined by parameter x_i_const"
        ;

      //values for variables at outlet if corresponding switch-parameter=true

      //-------------values of parameters for defining state-variables if
      //corresponding switch_parameter = true
      parameter SIunits.SpecificEnthalpy h_const=-1.0;
      parameter SIunits.Pressure p_const=-1.0;
      parameter SIunits.Density rho_const=-1.0;
      parameter SIunits.SpecificEntropy s_const=-1.0;
      parameter SIunits.CelsiusTemperature t_const=-1.0;
      parameter SIunits.SpecificInternalEnergy u_const=-1.0;
      //        parameter SIunits.SpecificVolume v_const=-1.0;
      parameter Real x_const=-1.0;
      //steam quality
      parameter SIunits.MassFraction x_const_i[n_comp]=fill(1.0/n_comp, n_comp)
        ;


      //--Start Graphics-----------------------------------------

      annotation (
        Icon(Polygon(points=[-6, 99; -6, 88; -38, 79; -38, 59; -6, 70; -6, -51
                ; -28, -51; -50, -47; -70, -31; -58, -19; -92, -7; -92, -49; -
                78, -37; -54, -59; -28, -67; 2, -71; 32, -67; 58, -57; 82, -37
                ; 94, -47; 94, -7; 62, -19; 74, -31; 54, -47; 32, -51; 6, -51;
                6, 70; 42, 60; 43, 78; 6, 88; 6, 99; -6, 99], style(fillColor=8
              )), Text(extent=[-100, -100; 100, -70], string="%name")),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));
      //--End Graphics-----------------------------------------


//-----Start Documentation----------------------------------------------
annotation (Documentation(info="

<html>
<p>
model for imposing boundary condition at thermal state connector OutThermalState,
with n_comp components (default value n_comp=1)</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:<td>if ==true then <td> Default value </b></tr>
<tr>
<td>switch_h_def<td>OutThermalState.h=h_const<td>false
</tr>
<tr>
<td>switch_p_def<td>OutThermalState.p=p_const<td>false
</tr>
<tr>
<td>switch_x_i_def<td>OutThermalState.x_i=x_const_i<td>false
</tr>
<tr>
<td>switch_rho_def<td>OutThermalState.rho=rho_const<td>false
</tr>
<tr>
<td>switch_s_def<td>OutThermalState.s=s_const<td>false
</tr>
<tr>
<td>switch_t_def<td>OutThermalState.t=t_const<td>false
</tr>
<tr>
<td>switch_u_def<td>OutThermalState.u=u_const<td>false
</tr>
<tr>
<td>switch_x_def<td>OutThermalState.x=x_const<td>false
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>


<hr>
<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr>
<td><b>PARAMETERS:<td>meaning<td>type<td>unit</b>
</tr>
<tr>
<td>h_const<td> value for OutThermalState.h if switch_h_def==true <td>SpecificEnthalpy<td>[J/kg]
</tr>
<tr>
<td>p_const<td> value for OutThermalState.p if switch_p_def==true <td>Pressure<td>[N/m2]
</tr>
<tr>
<td>rho_const<td> value for OutThermalState.rho if switch_rho_def==true <td>Density<td>[kg/m3]
</tr>
<tr>
<td>s_const<td> value for OutThermalState.s if switch_s_def==true <td>SpecificEntropy<td>[J/kg/K]
</tr>
<tr>
<td>t_const<td> value for OutThermalState.t if switch_t_def==true <td>CelsiusTemperature<td>[°C]
</tr>
<tr>
<td>u_const<td> value for OutThermalState.u if switch_u_def==true <td>SpecificInternalEnergy<td>[J/kg]
</tr>
<tr>
<td>x_const<td> value for OutThermalState.x if switch_x_def==true <td>Real<td>[-]
</tr>
<tr>
<td>x_const_i<td> value for OutThermalState.x_i if switch_x_i_def==true <td>Real<td>[-]
</tr>



</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Bd1<br>
<b>Example:</b> TechThermo Ga1, Gd1


</p>
</HTML>"));

      //---------End Documentation------------------------------





    equation



      if switch_h_def == true then
        OutThermalState.h = h_const;
      end if;

      if switch_p_def == true then
        OutThermalState.p = p_const;
      end if;

      if switch_rho_def == true then
        OutThermalState.rho = rho_const;
      end if;

      if switch_s_def == true then
        OutThermalState.s = s_const;
      end if;

      if switch_t_def == true then
        OutThermalState.t = t_const;
      end if;

      if switch_u_def == true then
        OutThermalState.u = u_const;
      end if;

      if switch_x_def == true then
        OutThermalState.x = x_const;
      end if;

      if switch_x_i_def == true then
        OutThermalState.x_i = x_const_i;
      end if;

    end ParameterDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model SignalDefined
      "state connector with definition of connector variables by parameters or outer signal TTcode:Bd2"


      parameter Integer n_comp=1;

      // thermal state connector
      TTInterface.ThermalState.Out OutThermalState(n_comp=n_comp) annotation (
          extent=[10, 100; -10, 120]);

      // input signal connector from Modelica Standard Library
      parameter Integer n=1 "dimension of signal vector";
      Modelica.Blocks.Interfaces.InPort InSignal(n=n) annotation (extent=[-10,
            -100; 10, -120], rotation=-90);

      //------------parameters--------------------------------------

      //option-parameter for selection of variable defined by
      //InPort
      parameter Integer option_defsignal=-1
        "defines variable controlled by InPort, 1:h, 2:p 3:rho, 4:s, 5:t, 6:x 7:x_i";


      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-100, -100; 100, -70], string="%name"),
          Polygon(points=[-100, -60; 0, 100; 100, -60; -100, -60]),
          Polygon(points=[-6, 101; -6, 90; -38, 81; -38, 61; -6, 72; -6, -49; -
                28, -49; -50, -45; -70, -29; -58, -17; -92, -5; -92, -47; -78,
                -35; -54, -57; -28, -65; 2, -69; 32, -65; 58, -55; 82, -35; 94
                , -45; 94, -5; 62, -17; 74, -29; 54, -45; 32, -49; 6, -49; 6,
                72; 42, 62; 43, 80; 6, 90; 6, 101; -6, 101], style(fillColor=8)
            )),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));


      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="


<html>
<p>

a selected variable of connector OutThermalState is defined by an external signal source connected to connector InSignal

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b> SWITCH-PARAMETERS:</b>-none-
<hr>




<table border=1>
<tr><td>  <b>OPTION-PARAMETERS:<td>if OPTION-PARAMETER== <td> Then </b></tr>
<tr>
<td>option_defsignal<td>1<td>OutThermalState.h = InSignal.signal[1];
</tr>
<tr>
<td><td>2<td>OutThermalState.p = InSignal.signal[1]
</tr>
<tr>
<td><td>3<td>OutThermalState.rho = InSignal.signal[1]
</tr>
<tr>
<td><td>4<td>OutThermalState.s = InSignal.signal[1]
</tr>
<tr>
<td><td>5<td>OutThermalState.t= InSignal.signal[1]
</tr>
 <tr>
<td><td>6<td>OutThermalState.u = InSignal.signal[1]
</tr>
<tr>
<td><td>7<td>OutThermalState.x = InSignal.signal[1]
</tr>
<tr>
<td><td>8<td>OutThermalState.x_i = InSignal.signal
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>
<hr>

<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Bd2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------




    equation

      //--End Graphics-----------------------------------------

      //      definition of a single variable by an external
      //      signal source connected to InPort depending on
      //      parameter option_defsignal:

      if option_defsignal == 1 then
        OutThermalState.h = InSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        OutThermalState.p = InSignal.signal[1];
      end if;

      if option_defsignal == 3 then
        OutThermalState.rho = InSignal.signal[1];
      end if;

      if option_defsignal == 4 then
        OutThermalState.s = InSignal.signal[1];
      end if;

      if option_defsignal == 5 then
        OutThermalState.t = InSignal.signal[1];
      end if;

      if option_defsignal == 6 then
        OutThermalState.x = InSignal.signal[1];
      end if;

      if option_defsignal == 7 then
        OutThermalState.x_i = InSignal.signal;
      end if;

      if option_defsignal == 8 then
        OutThermalState.x_i = InSignal.signal;
      end if;


    end SignalDefined;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

  end ThermalState;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

end Source;
