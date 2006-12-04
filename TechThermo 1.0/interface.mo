package Interface "definition of connectors TTcode:A"
  extends Modelica.Icons.Library;

  package SIunits = Modelica.SIunits;
  package GeneralConstants = Modelica.Constants;
  //using Modelica type-definition

  package TT = TechThermo;
  package TTInterface = TT.Interface;

  annotation (
    Documentation(info="
content package: connectors and interface classes


identification: TechThermo A
"),
    Icon(
      Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)),
      Rectangle(extent=[-70, 5; -11, -55], style(fillColor=0)),
      Ellipse(extent=[6, 5; 58, -53], style(fillColor=0))),
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

  package MassFlow "connectors for combined heat and mass transfer TTcode:Aa"
    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="

content package: connectors for mass flow
identification: TechThermo Aa
"),
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
        Rectangle(extent=[-70, 5; -11, -55], style(fillColor=0)),
        Ellipse(extent=[6, 5; 58, -53], style(fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector In
      "connector for mass flow with n_comp components: m_dot,h,p,x_i  TTcode:Aa1"


      // connector-variables
      parameter Integer n_comp=1 "number of components";
      flow SIunits.MassFlowRate m_dot;
      SIunits.SpecificEnthalpy h;
      SIunits.Pressure p;
      SIunits.MassFraction x_i[n_comp];


        //--Start Graphic: Closed Rectangle, light blue-----------------------------------------

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Rectangle(extent=[-100, 100; 100, -100], style(color=4,
                fillColor=4)), Text(extent=[-100, 120; 100, 100], string=
                "%name")),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(color=4, fillColor=
                  4))),
        Terminal(Rectangle(extent=[-100, 100; 100, -100], style(color=4,
                fillColor=4))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----End Graphics-----------------------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for mass flow,
with n_comp components (default value n_comp=1)</p>

<p>graphical symbol is closed rectangle, light blue, usually used as inlet</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>m_dot<td>MassFlowRate<td>[kg/s]
</tr>
<tr>
<td>h<td> SpecificEnthalpy<td>[J/kg]
</tr>
<tr>
<td>p<td> Pressure<td>[Pa]
</tr>
<tr>
<td>x_i[n_comp]<td> MassFraction vector <td>[-]
</tr>
</table>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
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

<b>Identification:</b> TechThermo Aa1<br>
<b>Example:</b> TechThermo EaS2, CbS1,


</p>
</HTML>"));

      //---------End Documentation------------------------------

    end In;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector Out
      "connector for mass flow with n_comp components: m_dot,h,p,x_i  TTcode:Aa2"

      // connector-variables

      parameter Integer n_comp=1 "number of components";
      flow SIunits.MassFlowRate m_dot;
      SIunits.SpecificEnthalpy h;
      SIunits.Pressure p;
      SIunits.MassFraction x_i[n_comp];


        //--Start Graphic: open Rectangle, light blue-----------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Rectangle(extent=[-100, 100; 100, -100], style(color=4)), Text(
              extent=[-100, 120; 100, 100], string="%name")),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(color=4))),
        Terminal(Rectangle(extent=[-100, 100; 100, -100], style(color=4))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----End Graphics-----------------------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for mass flow,
with n_comp components (default value n_comp=1)</p>

<p>graphical symbol is open Rectangle, light blue, usually used as outlet</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>m_dot<td>MassFlowRate<td>[kg/s]
</tr>
<tr>
<td>h<td> SpecificEnthalpy<td>[J/kg]
</tr>
<tr>
<td>p<td> Pressure<td>[Pa]
</tr>
<tr>
<td>x_i[n_comp]<td> MassFraction vector <td>[-]
</tr>
</table>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
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

<b>Identification:</b> TechThermo Aa2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------

    end Out;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model TwoPort "  model mass flow element with two connectors  TTcode:Aa3"

      //------------parameters----------------------
      parameter Integer n_comp=1 "number of components in fluid";

      //------------connectors-------------------------

      In InMassFlow(n_comp=n_comp) "connector for inlet mass flow"
        annotation (extent=[-120, -60; -100, -80]);
      Out OutMassFlow(n_comp=n_comp) "connector for outlet mass flow"
        annotation (extent=[100, -60; 120, -80]);

      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-75, -100; 75, -50], string="%name"),
          Rectangle(extent=[-100, 100; 100, -100], style(color=4, pattern=3)),
          Text(extent=[-100, -20; -130, -50], string="in"),
          Text(extent=[100, -20; 130, -50], string="out")),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));

      annotation (Diagram(
          Text(
            extent=[-84, -48; -28, -60],
            string="connector InMassFlow",
            style(color=0)),
          Text(
            extent=[-84, -58; -66, -66],
            string="h_in",
            style(color=0)),
          Text(
            extent=[-50, -58; -30, -66],
            string="%switch_h_const",
            style(color=0)),
          Text(
            extent=[-84, -66; -66, -74],
            string="p_in",
            style(color=0)),
          Text(
            extent=[-50, -66; -30, -74],
            string="%switch_p_const",
            style(color=0)),
          Text(
            extent=[-82, -76; -60, -84],
            string="x_in_i",
            style(color=0)),
          Text(
            extent=[-50, -76; -30, -84],
            string="%switch_x_i_const",
            style(color=0)),
          Text(
            extent=[-80, -86; -58, -94],
            string="m_in_dot",
            style(color=0)),
          Text(
            extent=[-50, -86; -30, -94],
            string="%switch_m_dot_const",
            style(color=0)),
          Rectangle(extent=[-88, -46; -24, -96], style(color=0, pattern=2)),
          Text(
            extent=[28, -48; 84, -60],
            style(color=0),
            string="connector OutMassFlow"),
          Text(
            extent=[28, -58; 46, -66],
            style(color=0),
            string="h_out"),
          Text(
            extent=[28, -66; 46, -74],
            style(color=0),
            string="p_out"),
          Text(
            extent=[30, -74; 52, -82],
            style(color=0),
            string="x_out_i"),
          Text(
            extent=[32, -86; 54, -94],
            style(color=0),
            string="m_out_dot"),
          Rectangle(extent=[24, -46; 88, -96], style(color=0, pattern=2))));

      //--End Graphics-----------------------------------------

      //------------boolean switches for additional equations---------
      parameter Boolean switch_m_dot_const=false
        "if switch_m_dot_const=true then m_in_dot+m_out_dot=0";
      parameter Boolean switch_h_const=false
        "if switch_h_const=true then h_in=h_out";
      parameter Boolean switch_p_const=false
        "if switch_p_const=true then p_in=p_out";
      parameter Boolean switch_x_i_const=false
        "if switch_x_i_const=true then x_in_i=x_out_i";

      //------------Internal variables:--------------

      flow SIunits.MassFlowRate m_in_dot
        "mass flow rate at connector InMassFlow";
      SIunits.SpecificEnthalpy h_in "spec. enthalpy at connector InMassFlow";
      SIunits.Pressure p_in "pressure at connector InMassFlow";
      SIunits.MassFraction x_in_i[n_comp]
        "vector with mass-fractions at connector InMassFlow";

      flow SIunits.MassFlowRate m_out_dot;
      SIunits.SpecificEnthalpy h_out;
      SIunits.Pressure p_out;
      SIunits.MassFraction x_out_i[n_comp];

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model mass flow element with two connectors
      for flow with {n_comp} components:</p>

<p>includes two connectors</p>
<p><b>InMassFlow </b>[h, m_dot, p, x_i{n_comp}]</p>
<p><b>OutMassFlow </b>[h, m_dot, p, x_i{n_comp}]</p>


   <p>connector-variables are attributed to local variables:</p>

<table border=1>
<tr><td> internal Variable<td>corresponding connector variable </tr>
<tr>
<td>h_in<td>InMassFlow.h
</tr>
<tr>
<td>m_in_dot<td>InMassFlow.m_in_dot
</tr>
<tr>
<td>p_in<td>InMassFlow.p
</tr>
<tr>
<td>x_in_i<td>InMassFlow.x_i
</tr>
<tr>
<td>h_out<td>OutMassFlow.h
</tr>
<tr>
<td>m_out_dot<td>OutMassFlow.m_in_dot
</tr>
<tr>
<td>p_out<td>OutMassFlow.p
</tr>
<tr>
<td>x_out_i<td>OutMassFlow.x_i
</tr>






</table>






<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_m_dot_const<td>m_in_dot+m_out_dot=0
</tr>
<tr>
<td>switch_h_const<td>h_in=h_out
</tr>
<tr>
<td>switch_p_const<td>p_in=p_out
</tr>
<tr>
<td>switch_x_i_const<td>x_in_i=x_out_i
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
</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Aa3 <br>
<b>Example:</b> TechThermo EbS1, Gd3


</p>
</HTML>"));

      //---------End Documentation------------------------------

      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6));
    equation

      h_in = InMassFlow.h;
      m_in_dot = InMassFlow.m_dot;
      p_in = InMassFlow.p;
      x_in_i = InMassFlow.x_i;

      h_out = OutMassFlow.h;
      m_out_dot = OutMassFlow.m_dot;
      p_out = OutMassFlow.p;
      x_out_i = OutMassFlow.x_i;


        //relations between connector variables at MassFlowIn and MassFlowOut dependant on boolean parameters:
      if switch_m_dot_const then
        0.0 = m_in_dot + m_out_dot;
        //mass-conservation
      end if;

      if switch_h_const then
        h_in = h_out;
        //spec. enthalpy remains constant
      end if;

      if switch_p_const then
        p_in = p_out;
        //pressure remains constant
      end if;

      if switch_x_i_const then
        x_in_i = x_out_i;
        //composition remains constant
      end if;

    end TwoPort;

    model TwoPortThermalStateTerminal
      "stationary mass flow element with state connector TTcode:Aa4"
      extends MassFlow.TwoPort(
        switch_m_dot_const=true,
        switch_h_const=true,
        switch_p_const=true,
        switch_x_i_const=true);


        //-----------------connector for thermal state------------------------------
      ThermalState.In StateCut(n_comp=n_comp)
        annotation (extent=[-10, 100; 10, 120]);

      //------------boolean switches for additional equations---------

      parameter Boolean switch_h_transfer=true
        "if switch_h_const=true then StateCut.h = (h_in + h_out)/2.0";
      parameter Boolean switch_p_transfer=true
        "if switch_p_const=true then StateCut.p = (p_in + p_out)/2.0";
      parameter Boolean switch_x_i_transfer=true
        "if switch_x_i_const=true then StateCut.x_i = (x_in_i + x_out_i)/2.0";

      //--Start Graphics-----------------------------------------

      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Rectangle(extent=[-100, -40; 100, -102], style(fillColor=67)),
          Polygon(points=[-20, 0; -20, -40; 0, -74; 20, -40; 20, 2; -20, 0],
              style(fillColor=8)),
          Ellipse(extent=[-60, 100; 60, -20], style(
              color=69,
              pattern=0,
              fillColor=8)),
          Line(points=[-60, 40; -30, 40], style(color=0)),
          Line(points=[60, 40; 28, 40], style(color=0)),
          Line(points=[0, 100; 0, 72], style(color=0)),
          Line(points=[-42, -4; -30, 8], style(color=0)),
          Line(points=[-42, 82; -26, 70], style(color=0, pattern=0)),
          Line(points=[42, 82; 28, 68], style(color=0)),
          Line(points=[44, 0; 24, 12], style(pattern=0)),
          Line(points=[42, -4; 26, 8], style(color=0)),
          Line(points=[-42, 84; -26, 66], style(color=0)),
          Polygon(points=[-2, 38; 36, 64; 54, 68; 42, 56; 2, 34; -2, 38], style(
                fillColor=0))));

      annotation (Diagram(
          Text(
            extent=[-28, 92; 55, 84],
            style(color=0, pattern=2),
            string="connector StateCut"),
          Text(
            extent=[-28, 80; 55, 72],
            style(color=0, pattern=2),
            string="StateCut.h=( h_in + h_out ) / 2 %switch_h_transfer"),
          Text(
            extent=[-28, 70; 55, 62],
            style(color=0, pattern=2),
            string="StateCut.p=( p_in + p_out ) / 2 %switch_p_transfer"),
          Text(
            extent=[-28, 64; 55, 48],
            style(color=0, pattern=2),
            string="StateCut.x_i=( x_in_i + x_out_i ) / 2 %switch_x_i_transfer"),

          Rectangle(extent=[-32, 96; 70, 48], style(color=0, pattern=2))));

      //--End Graphics-----------------------------------------

      //--End Graphics-----------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
TwoPort mass-flow element with additional state connector StateCut
for flow with {n_comp} components, transfer of selected values of corresponding
connector variables between thermal state connector and mass flow connector</p>


<p>includes three connectors:</p>
<ul>
<li><b>InMassFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>OutMassFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>StateCut </b>[h,p,rho,s,t,u,x,x_i{n_comp}]</li>
</ul>
<p>

<p>depending on switch parameters connector-variables are attributed to local variables:(s.model TwoPort)

<table border=1>
<tr><td> internal Variable<td>corresponding connector variable </tr>
<tr>
<td>h_in<td>InMassFlow.h
</tr>
<tr>
<td>m_in_dot<td>InMassFlow.m_dot
</tr>
<tr>
<td>p_in<td>InMassFlow.p
</tr>
<tr>
<td>x_in_i<td>InMassFlow.x_i
</tr>
<tr>
<td>h_out<td>OutMassFlow.h
</tr>
<tr>
<td>m_out_dot<td>OutMassFlow.m_dot
</tr>
<tr>
<td>p_out<td>OutMassFlow.p
</tr>
<tr>
<td>x_out_i<td>OutMassFlow.x_i
</tr>
</table>
</p>

<p>
<table border=1>
<tr><td>Variable at StateCut<td>Definition</tr>
<tr>
<td>h<td>(h_in + h_out)/2.0 (if switch_h_transfer==true)
</tr>
<tr>
<td>p<td>(p_in + p_out)/2.0 (if switch_p_transfer==true)
</tr>
<tr>
<td>x_i<td>(x_in_i + x_out_i)/2.0 (if switch_x_i_transfer==true)
</tr>
<tr>
<td>rho<td>not defined
</tr>
<tr>
<td>s<td>not defined
</tr>
<tr>
<td>t<td>not defined
</tr>
<tr>
<td>u<td>not defined
</tr>
<tr>
<td>x<td>not defined
</tr>



</table>
</p>





<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_m_dot_const<td>m_in_dot+m_out_dot=0
</tr>
<tr>
<td>switch_h_const<td>StateCut.h = (h_in + h_out)/2.0
</tr>
<tr>
<td>switch_p_const<td>StateCut.p = (p_in + p_out)/2.0
</tr>
<tr>
<td>switch_x_i_const<td>StateCut.x_i = (x_in_i + x_out_i)/2.0
</tr>
<td>switch_h_transfer<td>h_in=h_out
</tr>
<tr>
<td>switch_p_transfer<td>p_in=p_out
</tr>
<tr>
<td>switch_x_i_transfer<td>x_in_i=x_out_i
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
</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Aa4<br>
<b>Example:</b> TechThermo Ga1,Gd1


</p>
</HTML>"));
    equation


        //--------------------------end documentation------------------------------
      if switch_h_transfer == true then
        StateCut.h = (h_in + h_out)/2.0;
      end if;

      if switch_p_transfer == true then
        StateCut.p = (p_in + p_out)/2.0;
      end if;

      if switch_x_i_transfer == true then
        StateCut.x_i = (x_in_i + x_out_i)/2.0;
      end if;

    end TwoPortThermalStateTerminal;

    model MassFlowAdaptThermalState
      "  transfer of enthalpy, pressure, composition between mass flow connector (zero mass flow) and thermal state connector TTcode:Aa5"


      //------------parameters----------------------
      parameter Integer n_comp=1 "number of components in fluid";

      //------------connectors-------------------------

      In InMassFlow(n_comp=n_comp) "connector for inlet mass flow"
        annotation (extent=[-120, -60; -100, -80]);
      TTInterface.ThermalState.In InThermalState(n_comp=n_comp)
        "connector for outlet mass flow"
        annotation (extent=[100, -60; 120, -80]);

      //------------boolean switches for additional equations---------
      parameter Boolean switch_h_transfer=true
        "if switch_h_transfer=true then h_in=h_out";
      parameter Boolean switch_p_transfer=true
        "if switch_p_transfer=true then p_in=p_out";
      parameter Boolean switch_x_i_transfer=true
        "if switch_x_i_transfer=true then x_in_i=x_out_i";
      parameter Boolean switch_m_dot_set_to_zero=true
        "if switch_m_dot_set_to_zero=true then 0.0 = InMassFlow.m_dot";

      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-75, -100; 75, -50], string="%name"),
          Rectangle(extent=[-100, 100; 100, -100], style(color=4, pattern=3)),
          Text(extent=[-100, -20; -130, -50], string="in"),
          Text(extent=[100, -20; 130, -50], string="out"),
          Rectangle(extent=[-100, 40; -18, -40], style(color=67, fillColor=67)),

          Ellipse(extent=[20, 40; 100, -40], style(
              color=8,
              fillColor=8,
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
        Diagram(
          Text(
            extent=[-64, 102; 64, 26],
            style(color=0),
            string="InMassFlow.m_dot=0.0"),
          Text(
            extent=[-66, -4; 72, -22],
            style(color=0),
            string="InMassFlow.h == InThermalState.h  %switch_h_transfer"),
          Text(
            extent=[-66, -24; 72, -42],
            style(color=0),
            string="InMassFlow.p == InThermalState.p  %switch_p_transfer"),
          Text(
            extent=[-66, -42; 72, -60],
            style(color=0),
            string="InMassFlow.x_i == InThermalState.x_i  %switch_x_i_transfer")));

      //--End Graphics-----------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to transfer values of corresponding (selected) connector variables  between a mass flow connector InMassFlow
and a thermal state connector InThermalState. Selection of transferred connector variables depends on switch-parameters.
</p>

<p>includes two connectors</p>
<p><b>InMassFlow </b>[h, m_dot, p, x_i{n_comp}]</p>
<p><b>InThermalState </b>[h,p,rho,s,t,u,x,x_i{n_comp}]</p>


<br>



<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_m_dot_set_to_zero<td>0.0 = InMassFlow.m_dot
</tr>
<tr>
<td>switch_h_transfer<td>InMassFlow.h = InThermalState.h
</tr>
<tr>
<td>switch_p_transfer<td>InMassFlow.p = InThermalState.p
</tr>
<tr>
<td>switch_x_i_transfer<td>InMassFlow.x_i = InThermalState.x_i
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
</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Aa5 <br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------

      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6));
    equation

      if switch_m_dot_set_to_zero then
        //mass flow at connector InMassFlow is set to zero by the element
        0.0 = InMassFlow.m_dot;
      end if;


        //relations between connector variables at MassFlowIn and MassFlowOut dependant on boolean parameters:
      if switch_h_transfer then
        InMassFlow.h = InThermalState.h;


          //values for enthalpy are identical at mass flow connector and enthalpy connector
      end if;

      if switch_p_transfer then
        InMassFlow.p = InThermalState.p;


          //values for pressure are identical at mass flow connector and enthalpy connector
      end if;

      if switch_x_i_transfer then
        InMassFlow.x_i = InThermalState.x_i;


          //values for composition are identical at mass flow connector and enthalpy connector
      end if;

    end MassFlowAdaptThermalState;

  end MassFlow;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package HeatFlow "connectors for heat flow without mass transfer TTcode:Ab"
    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="

 Library with basic connectors for heat flow
 identification: TechThermo Ab

"),
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=47)),
        Rectangle(extent=[-70, 5; -11, -55], style(fillColor=0)),
        Ellipse(extent=[6, 5; 58, -53], style(fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector In "connector for single heat flow: q_dot,t TTcode:Ab1"
      // connector-variables
      flow SIunits.HeatFlowRate q_dot;
      SIunits.CelsiusTemperature t;


        //--Start Graphic: Closed Rectangle, light orange-----------------------------------------

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Rectangle(extent=[-100, 100; 100, -100], style(color=47,
                fillColor=47)), Text(extent=[-100, 120; -100, 100], string=
                "%name")),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(color=47, fillColor
                =47))),
        Terminal(Rectangle(extent=[-100, 100; 100, -100], style(color=47,
                fillColor=47))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));
      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for heat flow,
</p>

<p>graphical symbol is closed Rectangle, orange, usually used as inlet</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>q_dot<td>HeatFlowRate<td>[W]
</tr>
<tr>
<td>t<td> CelsiusTemperature<td>[°C]
</tr>
</table>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>

<b>PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ab1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------

    end In;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector Out "connector for single heatflow: q_dot,t TTcode:Ab2"
      // connector-variables
      flow SIunits.HeatFlowRate q_dot;
      SIunits.CelsiusTemperature t;


        //--Start Graphic: Open Rectangle, light orange-----------------------------------------

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Rectangle(extent=[-100, 100; 100, -100], style(color=47)), Text(
              extent=[-92, 152; 86, 100], string="%name")),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(color=47))),
        Terminal(Rectangle(extent=[-100, 100; 100, -100], style(color=47))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for heat flow,
</p>

<p>graphical symbol is open Rectangle, orange, usually used as outlet</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>q_dot<td>HeatFlowRate<td>[W]
</tr>
<tr>
<td>t<td> CelsiusTemperature<td>[°C]
</tr>
</table>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>

<b>PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ab2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------

      //-----End Graphics-----------------------------------------------------

      //-----Start Documentation----------------------------------------------

      //---------End Documentation------------------------------

    end Out;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model TwoPort "  model heat flow element with two connectors TTcode:Ab3"

      //------------connectors-------------------------

      In InHeatFlow annotation (extent=[-120, -10; -100, 10]);
      Out OutHeatFlow annotation (extent=[100, -10; 120, 10]);

      //------------boolean switches for additional equations---------
      parameter Boolean switch_q_dot_const=false
        "if switch_q_dot_const=true then q_in_dot+q_out_dot=0";
      parameter Boolean switch_t_const=false
        "if switch_t_const=true then t_in=t_out";

      //Internal variables

      flow SIunits.HeatFlowRate q_in_dot;
      SIunits.CelsiusTemperature t_in;
      flow SIunits.HeatFlowRate q_out_dot;
      SIunits.CelsiusTemperature t_out;

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model heat flow element with two connectors
      </p>

<p>includes two connectors</p>
<p><b>InHeatFlow </b>[q_dot,t]</p>
<p><b>OutHeatFlow </b>[q_dot,t]</p>


   <p>connector-variables are attributed to local variables:</p>

<table border=1>
<tr><td> internal Variable<td>corresponding connector variable </tr>
<tr>
<td>q_in_dot<td>InHeatFlow.q_dot
</tr>
<tr>
<td>t_in<td>InHeatFlow.t
</tr>
<tr>
<td>q_out_dot<td>OutHeatFlow.q_dot
</tr>
<tr>
<td>t_out<td>OutHeatFlow.t
</tr>
</table>






<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_q_dot_const<td>q_in_dot+q_out_dot=0
</tr>
<tr>
<td>switch_t_const<td>t_in=t_out
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>


<b>PARAMETERS:</b>-none-
<hr>

</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ab3<br>
<b>Example:</b> TechThermo Da1


</p>
</HTML>"));
      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-75, -100; 75, -50], string="%name"),
          Rectangle(extent=[-100, 100; 100, -100], style(color=47, pattern=3)),

          Text(extent=[-100, -20; -130, -50], string="in"),
          Text(extent=[100, -20; 130, -50], string="out")),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));

      annotation (Diagram(
          Text(
            extent=[-84, -66; -28, -78],
            string="connector InHeatFlow",
            style(color=0)),
          Text(
            extent=[-86, -76; -52, -84],
            string="q_in_dot",
            style(color=0)),
          Text(
            extent=[-50, -76; -30, -84],
            string="%switch_q_dot_const",
            style(color=0)),
          Text(
            extent=[-84, -84; -66, -92],
            string="t_in",
            style(color=0)),
          Text(
            extent=[-50, -84; -30, -92],
            string="%switch_t_const",
            style(color=0)),
          Rectangle(extent=[-86, -60; -24, -96], style(color=0, pattern=2)),
          Text(
            extent=[30, -64; 86, -76],
            style(color=0),
            string="connector OutHeatFlow"),
          Text(
            extent=[28, -74; 62, -82],
            style(color=0),
            string="q_out_dot"),
          Text(
            extent=[30, -84; 48, -92],
            style(color=0),
            string="t_out"),
          Rectangle(extent=[26, -60; 90, -96], style(color=0, pattern=2))));
    equation

      //--End Graphics-----------------------------------------

      q_in_dot = InHeatFlow.q_dot;
      t_in = InHeatFlow.t;

      q_out_dot = OutHeatFlow.q_dot;
      t_out = OutHeatFlow.t;

      //relations between connector variables at InHeatFlow and
      //OutHeatFlow dependant on boolean parameters:
      if switch_q_dot_const then
        0.0 = q_in_dot + q_out_dot;
        //heat flow remains constant
      end if;

      if switch_t_const then
        t_in = t_out;
        //temperature remains constant
      end if;

    end TwoPort;

    model TwoPortThermalStateTerminal
      "stationary heat flow element with state connector TTcode:Ab4"
      extends TTInterface.HeatFlow.TwoPort(switch_q_dot_const=true,
          switch_t_const=true);

      parameter Integer n_comp=1
        "number of components in fluid related to thermal state connector";


        //-----------------connector for thermal state------------------------------
      ThermalState.In StateCut(n_comp=n_comp)
        annotation (extent=[-10, 100; 10, 120]);

      //--Start Graphics-----------------------------------------

      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Rectangle(extent=[-100, -40; 100, -102], style(fillColor=47)),
          Polygon(points=[-20, 0; -20, -40; 0, -74; 20, -40; 20, 2; -20, 0],
              style(fillColor=8)),
          Ellipse(extent=[-60, 100; 60, -20], style(
              color=69,
              pattern=0,
              fillColor=8)),
          Line(points=[-60, 40; -30, 40], style(color=0)),
          Line(points=[60, 40; 28, 40], style(color=0)),
          Line(points=[0, 100; 0, 72], style(color=0)),
          Line(points=[-42, -4; -30, 8], style(color=0)),
          Line(points=[-42, 82; -26, 70], style(color=0, pattern=0)),
          Line(points=[42, 82; 28, 68], style(color=0)),
          Line(points=[44, 0; 24, 12], style(pattern=0)),
          Line(points=[42, -4; 26, 8], style(color=0)),
          Line(points=[-42, 84; -26, 66], style(color=0)),
          Polygon(points=[-2, 38; 36, 64; 54, 68; 42, 56; 2, 34; -2, 38], style(
                fillColor=0))));

      annotation (Diagram(
          Text(
            extent=[-28, 92; 32, 84],
            style(color=0, pattern=2),
            string="connector StateCut"),
          Text(
            extent=[-28, 80; 44, 72],
            style(color=0, pattern=2),
            string="StateCut.t= t_in = t_out"),
          Rectangle(extent=[-32, 96; 56, 48], style(color=0, pattern=2))));

      //--End Graphics-----------------------------------------

      //--End Graphics-----------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
TwoPort heat-flow element with additional state connector StateCut
for fluid with {n_comp} components. Transfer of connector variable temperature between
thermal state connectors and heat flow connectors</p>


<p>includes three connectors:</p>
<ul>
<li><b>InHeatFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>OutHeatFlow </b>[h, m_dot, p, x_i{n_comp}]</li>
<li><b>StateCut </b>[h,p,rho,s,t,u,x,x_i{n_comp}]</li>
</ul>
<p>

<p>connector-variables are attributed to local variables:(s.model TwoPort)

<table border=1>
<tr><td> internal Variable<td>corresponding connector variable </tr>
<tr>
<td>t_in<td>InHeatFlow.t
</tr>
<tr>
<td>q_in_dot<td>InHeatFlow.q_dot
</tr>
<td>t_out<td>OutHeatFlow.t
</tr>
<tr>
<td>q_out_dot<td>OutHeatFlow.q_dot
</tr>
</table>
</p>

<p>
<table border=1>
<tr><td>Variable at StateCut<td>Definition</tr>
<tr>
<td>t<td>t_in = t_out
</tr>
<tr>
<td>p<td>not defined
</tr>
<tr>
<td>x_i<td>not defined
</tr>
<tr>
<td>rho<td>not defined
</tr>
<tr>
<td>s<td>not defined
</tr>
<tr>
<td>u<td>not defined
</tr>
<tr>
<td>x<td>not defined
</tr>



</table>
</p>





<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>



<b>OPTION-PARAMETERS:</b>-none-
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

<b>Identification:</b> TechThermo Ab4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation


        //--------------------------end documentation------------------------------

      StateCut.t = t_in;

    end TwoPortThermalStateTerminal;

  end HeatFlow;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package ExergyFlow "connectors for exergy flow TTcode:Ac"
    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="

 Library with basic connectors for exergy flow
 identification: TechThermo Ac

"),
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=2)),
        Rectangle(extent=[-70, 5; -11, -55], style(fillColor=0)),
        Ellipse(extent=[6, 5; 58, -53], style(fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector In "connector for exergy flow: exergy_dot TTcode:Ac1"
      // connector-variables
      flow SIunits.Power exergy_dot;


        //--Start Graphic: Closed Rectangle, light green -----------------------------------------

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Rectangle(extent=[-100, 100; 100, -100], style(color=2,
                fillColor=2)), Text(extent=[-100, 120; 100, 100], string=
                "%name")),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(color=2, fillColor=
                  2))),
        Terminal(Rectangle(extent=[-100, 100; 100, -100], style(color=2,
                fillColor=2))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for exergy flow,
</p>

<p>graphical symbol is closed Rectangle, green, usually used as inlet</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>exergy_dot<td>Power<td>[W]
</tr>
</table>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>

<b>PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ac1<br>
<b>Example:</b> TechThermo EaS1


</p>
</HTML>"));

    end In;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector Out "connector for exergy flow: exergy_dot TTcode:Ac2"
      // connector-variables
      flow SIunits.Power exergy_dot;


        //--Start Graphic: open Rectangle, light green -----------------------------------------

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Rectangle(extent=[-100, 100; 100, -100], style(color=2)), Text(
              extent=[-100, 120; 100, 100], string="%name")),
        Icon(Rectangle(extent=[-100, 100; 100, -100], style(color=2))),
        Terminal(Rectangle(extent=[-100, 100; 100, -100], style(color=2))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for exergy flow,
</p>

<p>graphical symbol is open Rectangle, green, usually used as outlet</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>exergy_dot<td>Power<td>[W]
</tr>
</table>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>

<b>PARAMETERS:</b>-none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ac2<br>
<b>Example:</b> TechThermo EbS1, Ca1


</p>
</HTML>"));

    end Out;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model TwoPort "  model exergy flow element with two connectors TTcode:Ac3"
      //------------connectors-------------------------

      In InExergyFlow annotation (extent=[-120, -10; -100, 10]);
      Out OutExergyFlow annotation (extent=[100, -10; 120, 10]);

      //------------boolean switches for additional equations---------
      parameter Boolean switch_exergy_dot_const=false
        "if switch_exergy_dot_const=true then exergy_in_dot+exergy_out_dot=0";

      //Internal variables

      flow SIunits.Power exergy_in_dot "exergy flow at connector InExergyFlow";
      flow SIunits.Power exergy_out_dot
        "exergy flow at connector OutExergyFlow";

      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-75, -100; 75, -50], string="%name"),
          Rectangle(extent=[-100, 100; 100, -100], style(color=2, pattern=3)),
          Text(extent=[-100, -20; -130, -50], string="in"),
          Text(extent=[100, -20; 130, -50], string="out")),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Window(
          x=0.25,
          y=0.11,
          width=0.6,
          height=0.6));

      annotation (Diagram(
          Text(
            extent=[-84, -48; -28, -60],
            string="connector InExergyFlow",
            style(color=0)),
          Text(
            extent=[-84, -58; -50, -66],
            string="exergy_in_dot",
            style(color=0)),
          Text(
            extent=[-50, -58; -30, -66],
            string="%switch_exergy_dot_const",
            style(color=0)),
          Rectangle(extent=[-88, -46; -24, -96], style(color=0, pattern=2)),
          Text(
            extent=[28, -48; 84, -60],
            style(color=0),
            string="connector OutExergyFlow"),
          Text(
            extent=[28, -58; 62, -66],
            style(color=0),
            string="exergy_out_dot"),
          Rectangle(extent=[24, -46; 88, -96], style(color=0, pattern=2))));

      //--End Graphics-----------------------------------------

      //-----Start Documentation----------------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model exergy flow element with two connectors
      </p>

<p>includes two connectors</p>
<p><b>InExergyFlow </b>[exergy_dot]</p>
<p><b>OutExergyFlow </b>[exergy_dot]</p>


   <p>connector-variables are attributed to local variables:</p>

<table border=1>
<tr><td> internal Variable<td>corresponding connector variable </tr>
<tr>
<td>exergy_in_dot<td>InExergyFlow.exergy_dot
</tr>
<tr>
<td>exergy_out_dot<td>InExergyFlow.exergy_dot
</tr>
</table>






<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_exergy_dot_const<td>exergy_in_dot+exergy_out_dot=0
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>


<b>PARAMETERS:</b>-none-
<hr>

</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ac3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------

      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6));
    equation

      exergy_in_dot = InExergyFlow.exergy_dot;
      exergy_out_dot = OutExergyFlow.exergy_dot;


        //relations between connector variables at InExergyFlow and OutExergyFlow dependant on boolean parameters:
      if switch_exergy_dot_const then
        0.0 = exergy_in_dot + exergy_out_dot;
        //exergy flow remains constant
      end if;

    end TwoPort;

  end ExergyFlow;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package ThermalState "connectors for thermal state information TTcode:Ad"

    extends Modelica.Icons.Library;

    annotation (
      Documentation(info="

Library with basic connectors for thermal state information
identification: TechThermo a4

"),
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=8)),
        Rectangle(extent=[-70, 5; -11, -55], style(fillColor=0)),
        Ellipse(extent=[6, 5; 58, -53], style(fillColor=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector In
      "connector for thermal state of fluid: h,p,rho,s,t,u,x,x_i TTcode:Ad1"

      parameter Integer n_comp=1 "number of components";

      SIunits.SpecificEnthalpy h;
      SIunits.Pressure p;
      SIunits.Density rho;
      SIunits.SpecificEntropy s;
      SIunits.CelsiusTemperature t;
      SIunits.SpecificInternalEnergy u;
      //        SIunits.SpecificVolume v;
      SIunits.MassFraction x_i[n_comp];
      Real x;
      //steam quality


        //--Start Graphic: Closed Cycle, light grey-----------------------------------------

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Ellipse(extent=[-100, 100; 100, -100], style(color=8, fillColor
                =8)), Text(extent=[-100, 120; 100, 100], string="%name")),
        Icon(Ellipse(extent=[-100, 100; 100, -100], style(color=8, fillColor=8))),

        Terminal(Ellipse(extent=[-100, 100; 100, -100], style(color=8,
                fillColor=8))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for thermal state,
</p>

<p>graphical symbol is closed circle, light grey, usually used as inlet</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>h<td> SpecificEnthalpy<td>[J/kg]
</tr>
<tr>
<td>p<td> Pressure<td>[N/m2]
</tr>
<tr>
<td>rho<td> Density<td>[kg/m3]
</tr>
<tr>
<td>s<td> SpecificEntropy<td>[J/K/kg]
</tr>
<tr>
<td>t<td> CelsiusTemperature<td>[degree Celsius]
</tr>
<tr>
<td>u<td> SpecificInternalEnergy<td>[J/kg]
</tr>
<tr>
<td>x<td> steam quality<td>[-]
</tr>
<tr>
<td>x_i[n_comp]<td> MassFraction vector <td>[-]
</tr>
</table>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
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

<b>Identification:</b> TechThermo Ad1<br>
<b>Example:</b> TechThermo EbS2


</p>
</HTML>"));

      //---------End Documentation------------------------------

      //-----End Graphics-----------------------------------------------------
    end In;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    connector Out
      "connector for thermal state of fluid: h,p,rho,s,t,u,x,x_i TTcode:Ad2"

      parameter Integer n_comp=1 "number of components";

      SIunits.SpecificEnthalpy h;
      SIunits.Pressure p;
      SIunits.Density rho;
      SIunits.SpecificEntropy s;
      SIunits.CelsiusTemperature t;
      SIunits.SpecificInternalEnergy u;
      //        SIunits.SpecificVolume v;
      SIunits.MassFraction x_i[n_comp];
      Real x;
      //steam quality


        //--Start Graphic: Closed Cycle, light grey-----------------------------------------

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Ellipse(extent=[-100, 100; 100, -100], style(color=8)), Text(
              extent=[-100, 120; 100, 100], string="%name")),
        Icon(Ellipse(extent=[-100, 100; 100, -100], style(color=8))),
        Terminal(Ellipse(extent=[-100, 100; 100, -100], style(color=8))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));


        //--Start Graphic: Closed Cycle, light grey-----------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
general connector for thermal state,
</p>

<p>graphical symbol is open circle, light grey</p>


<table border=1>
<tr><td>  <b>connector-variables:<td>type<td>unit</b></tr>
<tr>
<td>h<td> SpecificEnthalpy<td>[J/kg]
</tr>
<tr>
<td>p<td> Pressure<td>[N/m2]
</tr>
<tr>
<td>rho<td> Density<td>[kg/m3]
</tr>
<tr>
<td>s<td> SpecificEntropy<td>[J/K/kg]
</tr>
<tr>
<td>t<td> CelsiusTemperature<td>[degree Celsius]
</tr>
<tr>
<td>u<td> SpecificInternalEnergy<td>[J/kg]
</tr>
<tr>
<td>x<td> steam quality<td>[-]
</tr>
<tr>
<td>x_i[n_comp]<td> MassFraction vector <td>[-]
</tr>
</table>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
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

<b>Identification:</b> TechThermo Ad2<br>
<b>Example:</b> TechThermo EbS1


</p>
</HTML>"));

      //---------End Documentation------------------------------

      //-----End Graphics-----------------------------------------------------

      //-----Start Documentation----------------------------------------------

      //---------End Documentation------------------------------

    end Out;

    model TwoPort
      "model thermal state with two connectors, no definition of internal variables TTcode:Ad3"


      parameter Integer n_comp=1 "number of components";


        //-----------------connector for thermal state------------------------------
      ThermalState.In InThermalState(n_comp=n_comp)
        annotation (extent=[-120, -10; -100, 10]);

      ThermalState.Out OutThermalState(n_comp=n_comp)
        annotation (extent=[100, -10; 120, 10]);

      //------------boolean switches for additional equations---------
      parameter Boolean switch_h_const=false
        "if switch_h_const==true then InThermalState.h=OutThermalState.h";
      parameter Boolean switch_p_const=false
        "if switch_p_const==true then InThermalState.p=OutThermalState.p";
      parameter Boolean switch_rho_const=false
        "if switch_rho_const==true then InThermalState.rho=OutThermalState.rho";
      parameter Boolean switch_s_const=false
        "if switch_s_const==true then InThermalState.s=OutThermalState.s";
      parameter Boolean switch_t_const=false
        "if switch_t_const==true then InThermalState.t=OutThermalState.t";
      parameter Boolean switch_u_const=false
        "if switch_u_const==true then InThermalState.u=OutThermalState.u";
      parameter Boolean switch_x_i_const=false
        "if switch_x_i_const==true then InThermalState.x_i=OutThermalState.x_i";
      parameter Boolean switch_x_const=false
        "if switch_x_const==true then InThermalState.x=OutThermalState.x";

      //--Start Graphics-----------------------------------------

      annotation (
        Icon(
          Text(extent=[-75, -100; 75, -50], string="%name"),
          Rectangle(extent=[-100, 100; 100, -100], style(color=8, pattern=3)),
          Text(extent=[-100, -20; -130, -50], string="in"),
          Text(extent=[100, -20; 130, -50], string="out")),
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
model thermal state element with two connectors
      </p>


<p>includes two connectors</p>
<p><b>InThermalState </b>[h,p,rho,s,t,u,x,x_i]</p>
<p><b>OutThermalState </b>[h,p,rho,s,t,u,x,x_i]</p>
Main application: transfer of values from connector InThermalState to connector OutThermalState



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_h_const<td>InThermalState.h=OutThermalState.h
</tr>
<tr>
<td>switch_p_const<td>InThermalState.p=OutThermalState.p
</tr>
<tr>
<td>switch_rho_const<td>InThermalState.rho=OutThermalState.rho
</tr>
<tr>
<td>switch_s_const<td>InThermalState.s=OutThermalState.s
</tr>
<tr>
<td>switch_t_const<td>InThermalState.t=OutThermalState.t
</tr>
<tr>
<td>switch_u_const<td>InThermalState.u=OutThermalState.u
</tr>
<tr>
<td>switch_x_const<td>InThermalState.x=OutThermalState.x
</tr>
<tr>
<td>switch_x_i_const<td>InThermalState.x_i=OutThermalState.x_i
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>


<b>PARAMETERS:</b>-none-
<hr>

</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ad3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      if switch_h_const == true then
        InThermalState.h = OutThermalState.h;
      end if;

      if switch_p_const == true then
        InThermalState.p = OutThermalState.p;
      end if;

      if switch_rho_const == true then
        InThermalState.p = OutThermalState.p;
      end if;

      if switch_s_const == true then
        InThermalState.s = OutThermalState.s;
      end if;

      if switch_t_const == true then
        InThermalState.t = OutThermalState.t;
      end if;

      if switch_u_const == true then
        InThermalState.u = OutThermalState.u;
      end if;

      if switch_x_const == true then
        InThermalState.x = OutThermalState.x;
      end if;

      if switch_x_i_const == true then
        InThermalState.x_i = OutThermalState.x_i;
      end if;

    end TwoPort;

    model PropertyPort "base model property model TTcode:Ad4"

      parameter Integer n_comp=1 "number of components";


        //-----------------connector for thermal state------------------------------
      ThermalState.In StateCut(n_comp=n_comp)
        annotation (extent=[-10, -100; 10, -120]);

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[40, 40]),
        Icon(
          Polygon(points=[-66, -60; -100, -100; 100, -100; 66, -60], style(
                color=0)),
          Polygon(points=[-32, -20; -66, -60; 66, -60; 32, -20; -32, -20],
              style(color=69)),
          Polygon(points=[0, 20; -32, -20; 32, -20; 0, 20], style(color=41)),
          Text(
            extent=[-70, 98; 70, 62],
            string="%name",
            style(color=45))),
        Diagram(
          Text(
            extent=[-28, -86; 30, -96],
            string="p, h, t, rho, s, u, x, x_i",
            style(color=0)),
          Text(
            extent=[-29, -80; 31, -88],
            style(color=0, pattern=2),
            string="connector StateCut"),
          Rectangle(extent=[-34, -78; 35, -98], style(color=0, pattern=2))));


        // if model PropertyPort is extended the region for which the correlations are valid should


        // also be indicated in the icon graphics. Add one or more of the following annotations.
      // These annotations should be integrated between
      //	'annotation (Icon('
      //      and
      //      '));'


        // if an annotation is not the last one in the icon graphics definition add ',' after the annotation


        //	correlation includes or is related to at least one of the volumetric variables: p,t,rho


        //	add this annotation and REPLACE fillColor=8 BY fillColor=(color representing medium)


        //       Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,60], style(
      //          color=0,
      //          fillColor=8,
      //          fillPattern=1)),


        //	  Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1))


        //	correlation includes or is related to at least one of the caloric variables: u,h,s


        //	add this annotation and REPLACE fillColor=8 BY fillColor=(color representing medium)


        //        Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
      //            color=0,
      //            fillColor=8,
      //            fillPattern=1)),
      //          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5],
      //          style(color=7, fillPattern=1))


        // correlations for saturated steam included: add this annotation for saturated steam in icon:
      //    Polygon(points=[0, 20; -32, -20; 32, -20;  0, 20],
      //            style(
      //            color=41,
      //            fillColor=7,
      //            fillPattern=8))


        // correlations for superheated steam included: add this annotation for superheated steam in icon:
      //    Polygon(points=[0, 20; -32, -20; 32, -20;  0, 20],
      //            style(
      //            color=41,
      //            fillColor=41,
      //            fillPattern=1))


        // correlations for saturated liquid included: add this annotation for saturated liquid in icon:
      //      Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32
      //              , -20],
      //              style(color=69,fillColor=7, fillPattern=7))


        // correlations for complete liquid region included: add this annotation for liquid region in icon:
      //      Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32
      //              , -20],
      //              style(color=69,fillColor=69, fillPattern=1))


        // correlations for melting solid included: add this annotation for melting solid in icon:
      //    Polygon(points=[-66, -60; -100, -100; 100, -100; 68, -60;
      //            -66, -60], style(
      //            color=0,
      //            fillColor=7,
      //            fillPattern=8))


        // correlations for melting solid included: add this annotation for melting solid in icon:
      //    Polygon(points=[-66, -60; -100, -100; 100, -100; 68, -60;
      //            -66, -60], style(
      //            color=0,
      //            fillColor=0,
      //            fillPattern=1))

      //     multi-component medium


        //          Polygon(points=[0, 20; -10, 8; -10, -100; 10, -100; 10, 8; 0, 20],
      //            style(color=0, fillColor=7))

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
base-model for calculation of thermophysical properties
      for a substance with {n_comp} components:</p>

<p>includes state connector and graphics</p>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>
model is intended as container for property calculation models
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>


<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
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

<b>Identification:</b> TechThermo Ad4<br>
<b>Example:</b> TechThermo Ca1


</p>
</HTML>"));

      //---------End Documentation------------------------------

    end PropertyPort;

    model NotUsedVariables
      "state connector defining not used state variables TTcode:Ad5"

      parameter Integer n_comp=1 "number of components";
      parameter Real dummy_value=232323 "value for not-used variables";


        //-----------------connector for thermal state------------------------------
      ThermalState.In StateCut(n_comp=n_comp)
        annotation (extent=[-10, -100; 10, -120]);

      //-----switch-parameters------------------------------------------------
      parameter Boolean switch_h_notused=false
        "if  switch_h_notused==true then StateCut.h=dummy_value (switch_h_notused=false)";
      parameter Boolean switch_p_notused=false
        "if  switch_p_notused==true then StateCut.p=dummy_value (switch_p_notused=false)";
      parameter Boolean switch_rho_notused=false
        "if  switch_rho_notused==true then StateCut.rho=dummy_value (switch_rho_notused=false)";
      parameter Boolean switch_s_notused=false
        "if  switch_s_notused==true then StateCut.s=dummy_value (switch_s_notused=false)";
      parameter Boolean switch_t_notused=false
        "if  switch_t_notused==true then StateCut.t=dummy_value (switch_t_notused=false)";
      parameter Boolean switch_u_notused=false
        "if  switch_u_notused==true then StateCut.u=dummy_value (switch_u_notused=false)";
      parameter Boolean switch_x_notused=false
        "if  switch_x_notused==true then StateCut.x=dummy_value (switch_x_notused=false)";
      parameter Boolean switch_x_i_notused=false
        "if  switch_x_i_notused==true then StateCut.x_i=dummy_i (switch_x_i_notused=false)";

      parameter Real dummy_i[n_comp]=zeros(n_comp);

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model for defining selected state variables by parameters. Model is intended to reduce the
number of equations for calculation of state variables.
</p>

<p>includes a single state connector StateCut</p>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_h_notused<td>StateCut.h=dummy_value
</tr>
<tr>
<td>switch_p_notused<td>StateCut.p=dummy_value
</tr>
<tr>
<td>switch_rho_notused<td>StateCut.rho=dummy_value
</tr>
<tr>
<td>switch_s_notused<td>StateCut.s=dummy_value
</tr>
<tr>
<td>switch_t_notused<td>StateCut.t=dummy_value
</tr>
<tr>
<td>switch_u_notused<td>StateCut.u=dummy_value
</tr>
<tr>
<td>switch_x_notused<td>StateCut.x=dummy_value
</tr>
<tr>
<td>switch_x_i_notused<td>StateCut.x_i=dummy_i
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
<td>dummy_value<td>parameter-value scalar state variable <td>Real<td>[-]
</tr>
<tr>
<td>dummy_i<td> parameter-value composition vector <td>Real<td>[-]
</tr>
</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ad5<br>
<b>Example:</b> TechThermo Ga1, Gd1


</p>
</HTML>"));

      //---------End Documentation------------------------------


        //-------------------------start Icon graphics-----------------------------------
      annotation (
        Icon(
          Rectangle(extent=[-60, -20; 60, -100], style(color=41, pattern=0)),
          Rectangle(extent=[-100, 80; 100, -80], style(pattern=0, fillColor=8)),

          Rectangle(extent=[-80, 60; 80, -60], style(color=8, fillColor=7)),
          Polygon(points=[-100, -50; 70, 80; 100, 80; 100, 50; -70, -80; -100,
                -80; -100, -50], style(pattern=0, fillColor=8)),
          Text(
            extent=[-74, 24; -16, 54],
            string="not",
            style(pattern=0)),
          Text(extent=[-4, -30; 80, -58], string="used")),
        Window(
          x=0.14,
          y=0.12,
          width=0.6,
          height=0.6),
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram);
    equation


        //--------------------------end graphics--------------------------------------

      if switch_h_notused == true then
        StateCut.h = dummy_value;
      end if;

      if switch_p_notused == true then
        StateCut.p = dummy_value;
      end if;

      if switch_rho_notused == true then
        StateCut.rho = dummy_value;
      end if;

      if switch_s_notused == true then
        StateCut.s = dummy_value;
      end if;

      if switch_t_notused == true then
        StateCut.t = dummy_value;
      end if;

      if switch_u_notused == true then
        StateCut.u = dummy_value;
      end if;

      if switch_x_notused == true then
        StateCut.x = dummy_value;
      end if;

      if switch_x_i_notused == true then
        StateCut.x_i = dummy_i;
      end if;

    end NotUsedVariables;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

  end ThermalState;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package Adapter
    "Adapters between connectors from TechThermo and connectors from external libraries TTcode:Ae"

    extends Modelica.Icons.Library;

    annotation (
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=4)),
        Rectangle(extent=[-15, 10; 55, -60], style(color=0)),
        Polygon(points=[-15, -25; -85, -60; -85, 10; -15, -25], style(fillColor
              =0))),
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

    annotation (Documentation(info="

content package:
models for joining connectors from
TechThermo to connectors defined in external libraries

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo Ae
"));

    model OutMassFlowInSignal
      "model to join connector MassFlow.Out to connector Modelica.Blocks.Interfaces.InPort TTcode:Ae1"


      extends Support.InSignalPortCIM;

      MassFlow.Out OutMassFlow annotation (extent=[100, -10; 120, 10]);


        //--------------option-parameter-------------------------------------------
      parameter Integer option_defsignal=1
        "selects variable of connector OutMassFlow defined by connector InSignal";

      parameter Boolean switch_zero_m_dot=true
        "if switch_zero_m_dot==true AND NOT option_defsignal==1 then OutMassFlow.m_dot=0.0";

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a mass-flow
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.InPort is set equal to a selected variable of
TechThermo connector MassFlow.Out
</p>
if mass flow rate is not defined by connector InPort, Out.m_dot=0.0
</p>


<br>


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


<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_defsignal </b><td>selects connector variable defined by InSignal.signal[1]</tr>
<tr>
<td>1<td> OutMassFlow.m_dot = InSignal.signal[1]
</tr>
<tr>
<td>2<td> OutMassFlow.h = InSignal.signal[1]
</tr>
<tr>
<td>3<td> OutMassFlow.p = InSignal.signal[1]
</tr>
<tr>
<td>4<td> OutMassFlow.x_i = InSignal.signal
</tr>

</table>
</p>
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

<b>Identification:</b> TechThermo Ae1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------


        //-----------------start graphics--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=4))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));
    equation

      if option_defsignal == 1 then
        OutMassFlow.m_dot = InSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        OutMassFlow.h = InSignal.signal[1];
      end if;

      if option_defsignal == 3 then
        OutMassFlow.p = InSignal.signal[1];
      end if;

      if option_defsignal == 4 then
        OutMassFlow.x_i = InSignal.signal;
      end if;

      if (switch_zero_m_dot == true) and (option_defsignal <> 1) then


          //   if InSignal.signal[1] does not define the mass flow rate, then m_dot=0.0 at the
        //   mass flow connector
        OutMassFlow.m_dot = 0.0;
      end if;

    end OutMassFlowInSignal;

    model InMassFlowOutSignal
      "model to join connector MassFlow.In to connector Modelica.Blocks.Interfaces.InPort TTcode:Ae2"


      extends Support.OutSignalPortCIM;

      MassFlow.In InMassFlow annotation (extent=[100, -10; 120, 10]);


        //--------------option-parameter-------------------------------------------
      parameter Integer option_defsignal=1
        "selects variable of connector InMassFlow defined by connector OutSignal";


        //-----------------start graphic s--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=4, fillColor=4))),

        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a mass-flow
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.OutPort is set equal to a selected variable of
TechThermo connector MassFlow.In
</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b> -none-

<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_defsignal </b><td>selects connector variable defined by InSignal.signal[1]</tr>
<tr>
<td>1<td> InMassFlow.m_dot = OutSignal.signal[1]
</tr>
<tr>
<td>2<td> InMassFlow.h = OutSignal.signal[1]
</tr>
<tr>
<td>3<td> InMassFlow.p = OutSignal.signal[1]
</tr>
<tr>
<td>4<td> InMassFlow.x_i = OutSignal.signal
</tr>

</table>
</p>
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

<b>Identification:</b> TechThermo Ae2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      //---------End Documentation------------------------------

      if option_defsignal == 1 then
        0.0 = InMassFlow.m_dot + OutSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        InMassFlow.h = OutSignal.signal[1];
      end if;

      if option_defsignal == 3 then
        InMassFlow.p = OutSignal.signal[1];
      end if;

      if option_defsignal == 4 then
        InMassFlow.x_i = OutSignal.signal;
      end if;

    end InMassFlowOutSignal;

    model OutHeatFlowInSignal
      "model to join connector HeatFlow.Out to connector Modelica.Blocks.Interfaces.InPort TTcode:Ae3"


      extends Support.InSignalPortCIM;

      HeatFlow.Out OutHeatFlow annotation (extent=[100, -10; 120, 10]);


        //--------------option-parameter-------------------------------------------
      parameter Integer option_defsignal=1
        "selects variable of connector OutMassFlow defined by connector InSignal";


        //-----------------start graphics--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=47))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a heat-flow
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.InPort is set equal to a selected variable of
TechThermo connector HeatFlow.Out
</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>


<b>SWITCH-PARAMETERS:</b> -none-
<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_defsignal </b><td>selects connector variable defined by InSignal.signal[1]</tr>
<tr>
<td>1<td> OutHeatFlow.q_dot = InSignal.signal[1]
</tr>
<tr>
<td>2<td> OutHeatFlow.t = InSignal.signal[1]
</tr>

</table>
</p>
<hr>

<b>PARAMETERS:</b>none
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ae3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      if option_defsignal == 1 then
        0.0 = OutHeatFlow.q_dot + InSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        OutHeatFlow.t = InSignal.signal[1];
      end if;

    end OutHeatFlowInSignal;

    model InHeatFlowOutSignal
      "model to join connector HeatFlow.In to connector Modelica.Blocks.Interfaces.OutPort TTcode:Ae4"


      extends Support.OutSignalPortCIM;

      HeatFlow.In InHeatFlow annotation (extent=[100, -10; 120, 10]);


        //--------------option-parameter-------------------------------------------
      parameter Integer option_defsignal=1
        "selects variable of connector InHeatFlow defined by connector OutSignal";


        //-----------------start graphics--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=47, fillColor=47))),

        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a heat-flow
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.OutPort is set equal to a selected variable of
TechThermo connector HeatFlow.In
</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>


<b>SWITCH-PARAMETERS:</b> -none-
<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_defsignal </b><td>selects connector variable defined by InSignal.signal[1]</tr>
<tr>
<td>1<td> OutHeatFlow.q_dot = InSignal.signal[1]
</tr>
<tr>
<td>2<td> OutHeatFlow.t = InSignal.signal[1]
</tr>

</table>
</p>
<hr>

<b>PARAMETERS:</b>none
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ae4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      if option_defsignal == 1 then
        0.0 = InHeatFlow.q_dot + OutSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        InHeatFlow.t = OutSignal.signal[1];
      end if;

    end InHeatFlowOutSignal;

    model OutExergyFlowInSignal
      "model to join connector ExergyFlow.Out to connector Modelica.Blocks.Interfaces.InPort TTcode:Ae5"


      extends Support.InSignalPortCIM;

      ExergyFlow.Out OutExergyFlow annotation (extent=[100, -10; 120, 10]);


        //-----------------start graphics--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=2))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a exergy-flow
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.InPort is set equal to variable exergy_dot of
TechThermo connector ExergyFlow.Out
</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b> -none-
<hr>

<b>OPTION-PARAMETERS: </b> -none-
<hr>


<tr><td>PARAMETERS:</b> -none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ae5<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      0.0 = OutExergyFlow.exergy_dot + InSignal.signal[1];

    end OutExergyFlowInSignal;

    model InExergyFlowOutSignal
      "model to join connector ExergyFlow.In to connector Modelica.Blocks.Interfaces.OutPort TTcode:Ae6"


      extends Support.OutSignalPortCIM;

      ExergyFlow.In OutExergyFlow annotation (extent=[100, -10; 120, 10]);


        //-----------------start graphics--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=2, fillColor=2))),

        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a exergy-flow
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.OutPort is set equal to variable exergy_dot of
TechThermo connector ExergyFlow.In
</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b> -none-
<hr>

<b>OPTION-PARAMETERS: </b> -none-
<hr>


<tr><td>PARAMETERS:</b> -none-
<hr>


</pre>
</p>

<b>Identification:</b> TechThermo Ae6<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      0.0 = InExergyFlow.exergy_dot + OutSignal.signal[1];

    end InExergyFlowOutSignal;

    model OutThermalStateInSignal
      "model to join connector ThermalState.Out to connector Modelica.Blocks.Interfaces.InPort TTcode:Ae7"


      extends Support.InSignalPortCIM;

      ThermalState.Out OutThermalState annotation (extent=[100, -10; 120, 10]);


        //--------------option-parameter-------------------------------------------
      parameter Integer option_defsignal=1
        "selects variable of connector OutThermalState defining connector InSignal";


        //-----------------start graphics--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=8))),
        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a thermal state
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.InPort is set equal to a selected variable of
TechThermo connector ThermalState.Out
</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b> -none-

<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_defsignal </b><td>selects connector variable defined by InSignal.signal[1]</tr>
<tr>
<td>1<td> OutThermalState.h = InSignal.signal[1]
</tr>
<tr>
<td>2<td> OutThermalState.p = InSignal.signal[1]
</tr>
<tr>
<td>3<td> OutThermalState.rho = InSignal.signal[1]
</tr>
<tr>
<td>4<td> OutThermalState.s = InSignal.signal[1]
</tr>
<tr>
<td>5<td> OutThermalState.t = InSignal.signal[1]
</tr>
<tr>
<td>6<td> OutThermalState.u = InSignal.signal[1]
</tr>
<tr>
<td>7<td> OutThermalState.x_i = InSignal.signal
</tr>
<tr>
<td>8<td> OutThermalState.x = InSignal.signal[1]
</tr>





</table>
</p>
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

<b>Identification:</b> TechThermo Ae7<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      //---------End Documentation------------------------------

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
        OutThermalState.u = InSignal.signal[1];
      end if;

      if option_defsignal == 7 then
        OutThermalState.x_i = InSignal.signal;
      end if;

      if option_defsignal == 8 then
        OutThermalState.x = InSignal.signal[1];
      end if;

    end OutThermalStateInSignal;

    model InThermalStateOutSignal
      "model to join connector ThermalState.In to connector Modelica.Blocks.Interfaces.OutPort TTcode:Ae8"


      extends Support.OutSignalPortCIM;

      ThermalState.In InThermalState annotation (extent=[100, -10; 120, 10]);


        //--------------option-parameter-------------------------------------------
      parameter Integer option_defsignal=1
        "selects variable of connector InThermalState defining connector OutSignal";


        //-----------------start graphics--------------------------------------------
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Rectangle(extent=[0, 50; 100, -50], style(color=8, fillColor=8))),

        Window(
          x=0.4,
          y=0.32,
          width=0.6,
          height=0.6));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to adapt a connector from the general modelica library to a thermal state
connector from TechThermo. The connector variable of the connector
Modelica.Blocks.Interfaces.OutPort is set equal to a selected variable of
TechThermo connector ThermalState.In
</p>

<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b> -none-

<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_defsignal </b><td>selects connector variable defined by OutSignal.signal[1]</tr>
<tr>
<td>1<td> InThermalState.h = OutSignal.signal[1]
</tr>
<tr>
<td>2<td> InThermalState.p = OutSignal.signal[1]
</tr>
<tr>
<td>3<td> InThermalState.rho = OutSignal.signal[1]
</tr>
<tr>
<td>4<td> InThermalState.s = OutSignal.signal[1]
</tr>
<tr>
<td>5<td> InThermalState.t = OutSignal.signal[1]
</tr>
<tr>
<td>6<td> InThermalState.u = OutSignal.signal[1]
</tr>
<tr>
<td>7<td> InThermalState.x_i = OutSignal.signal
</tr>
<tr>
<td>8<td> InThermalState.x = OutSignal.signal[1]
</tr>


</table>
</p>
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

<b>Identification:</b> TechThermo Ae8<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      //---------End Documentation------------------------------

      if option_defsignal == 1 then
        InThermalState.h = OutSignal.signal[1];
      end if;

      if option_defsignal == 2 then
        InThermalState.p = OutSignal.signal[1];
      end if;

      if option_defsignal == 3 then
        InThermalState.rho = OutSignal.signal[1];
      end if;

      if option_defsignal == 4 then
        InThermalState.s = OutSignal.signal[1];
      end if;

      if option_defsignal == 5 then
        InThermalState.t = OutSignal.signal[1];
      end if;

      if option_defsignal == 6 then
        InThermalState.u = OutSignal.signal[1];
      end if;

      if option_defsignal == 7 then
        InThermalState.x_i = OutSignal.signal;
      end if;

      if option_defsignal == 8 then
        InThermalState.x = OutSignal.signal[1];
      end if;

    end InThermalStateOutSignal;

    //ppppppppppppppppppppppppppppppppppppppppppppppppp

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Interface.Adapter

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo a5i
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

      partial model InSignalPortCIM
        "partial model connector Modelica.Blocks.Interfaces.InPort with graphics"


        parameter Integer n=1 "dimension of signal vector";
        Modelica.Blocks.Interfaces.InPort InSignal(n=n)
          annotation (extent=[-120, 10; -100, -10]);

        annotation (
          Icon(Polygon(points=[-100, 50; -100, -50; 0, 0; -100, 50], style(
                  fillColor=77))),
          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[2, 2],
            component=[20, 20]),
          Window(
            x=0.23,
            y=0.08,
            width=0.6,
            height=0.6));


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
      Partial model for joining connector
      Modelica.Blocks.Interfaces.InPort
      to connectors defined in TechThermo

</p>

<p>   connector: InSignal(n)
      parameter n defines dimension of signal vector
</p>

<p>
      -no declaration of variables
      -no equations
</p>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>

<b>Identification:</b> TechThermo AeS1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        //---------End Documentation------------------------------

      end InSignalPortCIM;

      partial model OutSignalPortCIM
        "partial model connector Modelica.Blocks.Interfaces.OutPort with graphics"


        parameter Integer n=1 "dimension of signal vector";
        Modelica.Blocks.Interfaces.OutPort OutSignal(n=n)
          annotation (extent=[-100, 10; -120, -10]);

        annotation (
          Icon(Line(points=[-100, 0; 0, 50; 0, -50; -100, 0], style(thickness=2))),

          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[2, 2],
            component=[20, 20]),
          Window(
            x=0.23,
            y=0.08,
            width=0.6,
            height=0.6));


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
      Partial model for joining connector
      Modelica.Blocks.Interfaces.OutPort
      to connectors defined in TechThermo

</p>

<p>   connector: OutSignal(n)
      parameter n defines dimension of signal vector
</p>

<p>
      -no declaration of variables
      -no equations
</p>



<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>

<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>

<b>Identification:</b> TechThermo AeS2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        //---------End Documentation------------------------------

      end OutSignalPortCIM;

    end Support;

  end Adapter;

end Interface;
