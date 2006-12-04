package Medium "correlations for thermophysical properties TTcode:C"
  //wds 07.08.01 14:00
  extends Modelica.Icons.Library;

  package SIunits = Modelica.SIunits;
  //using Modelica type-definition
  package GeneralConstants = Modelica.Constants;

  package TT = TechThermo;
  package TTInterface = TT.Interface;
  package TTSource = TT.Source;
  package TTMedium = TT.Medium;

  annotation (Documentation(info="
content package: models containing thermophysical correlations


identification: TechThermo C
"));

  annotation (
    Icon(
      Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)),
      Rectangle(extent=[-91, 38; 69, -90]),
      Polygon(points=[-11, 30; -37, -12; 16, -12; -10, 29; -11, 30], style(
            fillColor=41)),
      Polygon(points=[-57, -44; 37, -44; 15, -11; -36, -11; -57, -44], style(
            fillColor=69)),
      Polygon(points=[-80, -80; 60, -80; 37, -44; -57, -44; -80, -80], style(
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

  package Gas "thermophysical correlations single component gas TTcode:Ca"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations single component gas

identification: TechThermo Ca
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Polygon(points=[-11, 30; -37, -12; 16, -12; -10, 29; -11, 30], style(
              fillColor=41)),
        Polygon(points=[-57, -44; 37, -44; 15, -11; -36, -11; -57, -44], style(
              Color=69)),
        Polygon(points=[-80, -80; 60, -80; 37, -44; -57, -44; -80, -80], style(
              Color=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model AirIdealGasVolumetric "p/rho=RT for Air TTcode:Ca1"
      extends TTMedium.Gas.Support.IdealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.AirThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=67,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=0, fillPattern=1))));

    end AirIdealGasVolumetric;

    model AirPerfectGasCaloric
      "correlation h,u,s for air, cp defined by parameters TTcode:Ca2"

      extends TTMedium.Gas.Support.PerfectGasCaloricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.AirThermoFundamentalConstants
          SpecificConstants, cp_const=1004.);

      annotation (Icon(Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60],
               style(
              color=0,
              fillColor=67,
              fillPattern=1)), Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45,
                -5; 75, -5], style(color=0, fillPattern=1))));

    end AirPerfectGasCaloric;

    model AirPerfectGasCalVol
      "combination of AirIdealGasVolumetric AirPerfectGasCaloric TTcode:Ca3"
      extends TTMedium.Gas.Support.PerfectGasCalVolNoProp(redeclare
          TTMedium.Gas.AirIdealGasVolumetric IdealGasVolumetric, redeclare
          TTMedium.Gas.AirPerfectGasCaloric PerfectGasCaloric);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=67,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=67,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=0, fillPattern=1))));

    end AirPerfectGasCalVol;

    model AirRealGasVolumetric
      "p-rho-t correlation for Air using Redlich-Kwong equation TTcode:Ca4"
      extends TTMedium.Gas.Support.RealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.AirThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=67,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=0, fillPattern=1))));

    end AirRealGasVolumetric;

    model H2oIdealGasVolumetric
      "p/rho=RT for H2O superheated steam  TTcode:Ca5"
      extends TTMedium.Gas.Support.IdealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.H2oThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end H2oIdealGasVolumetric;

    model H2oPerfectGasCaloric
      "correlation h,u,s for superheated H2O steam, cp defined by parameters  TTcode:Ca6"


      extends TTMedium.Gas.Support.PerfectGasCaloricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.H2oThermoFundamentalConstants
          SpecificConstants, cp_const=1004.);

      annotation (Icon(Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60],
               style(
              color=0,
              fillColor=70,
              fillPattern=1)), Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45,
                -5; 75, -5], style(color=7, fillPattern=1))));

    end H2oPerfectGasCaloric;

    model H2oPerfectGasCalVol
      "combination of H2oIdealGasVolumetric H2oPerfectGasCaloric  TTcode:Ca7"

      extends TTMedium.Gas.Support.PerfectGasCalVolNoProp(redeclare
          TTMedium.Gas.H2oIdealGasVolumetric IdealGasVolumetric, redeclare
          TTMedium.Gas.H2oPerfectGasCaloric PerfectGasCaloric);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1))));

    end H2oPerfectGasCalVol;

    model H2oRealGasVolumetric
      "p-rho-t correlation for H2o using Redlich-Kwong equation TTcode:Ca8"
      extends TTMedium.Gas.Support.RealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.H2oThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end H2oRealGasVolumetric;

    model H2IdealGasVolumetric "p/rho=RT for hydrogen TTcode:Ca9"
      extends TTMedium.Gas.Support.IdealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.H2ThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=1,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end H2IdealGasVolumetric;

    model H2PerfectGasCaloric
      "correlation h,u,s for H2 gas, cp defined by parameters TTcode:Ca10"

      extends TTMedium.Gas.Support.PerfectGasCaloricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.H2ThermoFundamentalConstants
          SpecificConstants, cp_const=1004.);

      annotation (Icon(Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60],
               style(
              color=0,
              fillColor=1,
              fillPattern=1)), Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45,
                -5; 75, -5], style(color=7, fillPattern=1))));

    end H2PerfectGasCaloric;

    model H2PerfectGasCalVol
      "combination of H2IdealGasVolumetric H2PerfectGasCaloric TTcode:Ca11"
      extends TTInterface.ThermalState.PropertyPort;

      extends TTMedium.Gas.Support.PerfectGasCalVolNoProp(redeclare
          TTMedium.Gas.H2IdealGasVolumetric IdealGasVolumetric, redeclare
          TTMedium.Gas.H2PerfectGasCaloric PerfectGasCaloric);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=1,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=1,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1))));

    end H2PerfectGasCalVol;

    model H2RealGasVolumetric
      "p-rho-t correlation for H2 using Redlich-Kwong equation TTcode:Ca12"
      extends TTMedium.Gas.Support.RealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.H2oThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=1,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end H2RealGasVolumetric;

    model CO2IdealGasVolumetric "p/rho=RT for hydrogen TTcode:Ca13"
      extends TTMedium.Gas.Support.IdealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.CO2ThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=46,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end CO2IdealGasVolumetric;

    model CO2PerfectGasCaloric
      "correlation h,u,s for constant cp for CO2-Gas TTcode:Ca14"

      extends TTMedium.Gas.Support.PerfectGasCaloricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.CO2ThermoFundamentalConstants
          SpecificConstants, cp_const=1004.);

      annotation (Icon(Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60],
               style(
              color=0,
              fillColor=46,
              fillPattern=1)), Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45,
                -5; 75, -5], style(color=7, fillPattern=1))));

    end CO2PerfectGasCaloric;

    model CO2PerfectGasCalVol
      "combination of CO2IdealGasVolumetric CO2PerfectGasCaloric TTcode:Ca15"

      extends TTMedium.Gas.Support.PerfectGasCalVolNoProp(redeclare
          TTMedium.Gas.CO2IdealGasVolumetric IdealGasVolumetric, redeclare
          TTMedium.Gas.CO2PerfectGasCaloric PerfectGasCaloric);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1))));

    end CO2PerfectGasCalVol;

    model CO2RealGasVolumetric
      "p-rho-t correlation for CO2 using Redlich-Kwong equation TTcode:Ca16"
      extends TTMedium.Gas.Support.RealGasVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.CO2ThermoFundamentalConstants
          SpecificConstants);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=46,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end CO2RealGasVolumetric;

    package Support
      "models supporting correlations of thermophysical properties of gases TTcode:CaS"

      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Medium.Gas


identification: TechThermo CaS
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

      model IdealGasVolumetricNoProp
        "p/rho=RT without specification of medium TTcode:CaS1"
        extends TTInterface.ThermalState.PropertyPort;

        replaceable
          TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
          SpecificConstants "record with medium specific constants";

        SIunits.SpecificHeatCapacity r_gas "spec. gas constant";
        //     SIunits.SpecificHeatCapacity cp;
        //     SIunits.SpecificHeatCapacity cv;

        //     parameter SIunits.SpecificHeatCapacity cp_const;

        parameter Boolean switch_r_gas_const=true
          "if switch_r_gas_const==true then specific gas constant r_gas is defined by using parameter molar mass SpecificConstants.m_mol";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>




<p>Ideal Gas law:</p>
<p></p>
<p>p = r_gas*(t+273.15)*rho </p>


<p>r_gas: specific gas constant
<p>r_gas is defined by parameters, if switch_r_gas_const==true then
<p>r_gas = GeneralConstants.R/SpecificConstants.m_mol </p>
<p></p>
<p>medium is defined by fundamental constants in record SpecificConstants </p>


<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>NO<td>-
</tr>
<tr>
<td>p<td>YES<td>-
</tr>
<tr>
<td>rho<td>YES<td>-
</tr>
<tr>
<td>s<td>NO<td>-
</tr>
<tr>
<td>t<td>YES<td>-
</tr>
<tr>
<td>u<td>NO<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> Ideal Gas law is valid for single component gas at low pressure / high temperatures
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_r_gas_const<td>r_gas = GeneralConstants.R/SpecificConstants.m_mol
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>


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

<b>Identification:</b> TechThermo Ca1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[0, 20; -32, -20; 32, -20; 0, 20], style(
                color=41,
                fillColor=41,
                fillPattern=1))));
      equation


          //--------------------------end documentation------------------------------

        if switch_r_gas_const == true then
          r_gas = GeneralConstants.R/SpecificConstants.m_mol;
        end if;
        StateCut.p = r_gas*(StateCut.t + 273.15)*StateCut.rho;

      end IdealGasVolumetricNoProp;

      model PerfectGasCaloricNoProp
        "correlation h,u,s for parametric cp TTcode:CaS2"
        extends TTInterface.ThermalState.PropertyPort;

        replaceable
          TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
          SpecificConstants "record with medium specific constants"
          annotation (extent=[-88, -22; -18, 48]);

        replaceable TTMedium.MediumSpecificData.Data.ReferenceState
          ReferenceState
          "record with values of thermal state variables at reference state";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p><b>Air</b></p>
<p>correlations for caloric thermal state variables enthalpy h, internal energy u and entropy s</p>
<p>all values mass specific </p>
<p>value for specific heat capacity cp_const is defined by parameter</p>
<p></p>

<p>r_gas = GeneralConstants.R/SpecificConstants.m_mol </p>
<p></p>
<p>Definition of medium:
<ul>
<li>record SpecificConstants: molar mass</li>
<li>record ReferenceState: values of state variables at referece state</li>
<li>cp_const: value for spec. heat capacity if switch_cp_const==true</li>
</ul>



<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Parameter<td>Value Parameter<td>h<td>p<td>t<td>rho<td>u<td>s<td>x<td>x_i</tr>
<tr>
<tr><td><b>option_h_u_correlations</b><td>1<td>+<td>-<td>+<td>-<td>+<td>-<td>-<td>-</tr>
</tr>

<tr>
<tr><td><td>2<td>+<td>+<td>-<td>+<td>+<td>-<td>-<td>-</tr>
</tr>

<tr>
<tr><td><td>3<td>+<td>-<td>+<td>-<td>-<td>-<td>-<td>-</tr>
</tr>

<tr>
<tr><td><td>4<td>-<td>-<td>+<td>-<td>+<td>-<td>-<td>-</tr>
</tr>

<tr>
<tr><td><b>option_s_correlation</b><td>1<td>-<td>-<td>+<td>+<td>-<td>+<td>-<td>-</tr>
</tr>

<tr>
<tr><td><td>2<td>-<td>+<td>+<td>-<td>-<td>+<td>-<td>-</tr>
</tr>



</table>
<p>


<br>

</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>

<b> ASSUMPTIONS:</b>
<p>spec. enthalpy and internal energy independent from pressure</p>
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_cp_const<td>cp=cp_const
</tr>
<tr>
<td>switch_r_gas_const<td>r_gas=GeneralConstants.R/SpecificConstants.m_mol
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
<tr>
<td>  <b>option_h_u_correlations </b><td>correlation between spec. enthalpy and internal energy u
</tr>

<tr>
<td>1<td> StateCut.h=cp*(StateCut.t-ReferenceState.t0)+ReferenceState.h0
<p>StateCut.u=cv*(StateCut.t-ReferenceState.t0)+ReferenceState.u0
</tr>

<tr>
<td>2<td>StateCut.u = StateCut.h - StateCut.p/StateCut.rho
</tr>

<tr>
<td>3<td>StateCut.h = cp*(StateCut.t - ReferenceState.t0) + ReferenceState.h0
</tr>

<tr>
<td>4<td>StateCut.u = cv*(StateCut.t - ReferenceState.t0) + ReferenceState.u0
</tr>

<tr><td>  <b>option_s_correlation </b><td>correlation for spec. entropy s
</tr>
<tr>
<td>1<td> StateCut.s=(cp_const-r_gas)*Modelica.Math.log((StateCut.t+273.15)/(ReferenceState.t0+273.15))+
						r_gas*Modelica.Math.log(ReferenceState.rho0/StateCut.rho)+ReferenceState.s0;

</tr>
<tr>
<td>2<td>StateCut.s=cp_const*Modelica.Math.log((StateCut.t+273.15)/(ReferenceState.t0+273.15))+
						r_gas*Modelica.Math.log(StateCut.p/ReferenceState.p0)+ReferenceState.s0;
</tr>



</table>
</p>
<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>cp_const<td> spec. heat capacity if switch_cp_const==true<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>


</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo CaS2<br>
<b>Example:</b> TechThermo Ca2


</p>
</HTML>"));

        annotation (Icon(
            Polygon(points=[0, 20; -32, -20; 32, -20; 0, 20], style(
                color=41,
                fillColor=41,
                fillPattern=1)),
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1))));

        parameter Integer option_h_u_correlations=1
          "correlations for h and u, s.info";
        parameter Integer option_s_correlation=1 "correlation for s, s. info";

        parameter Boolean switch_cp_const=true
          "if switch_cp_const==true then cp=cp_const";

        parameter Boolean switch_r_gas_const=true
          "if switch_r_gas_const==true then r_gas=GeneralConstants.R/SpecificConstants.m_mol";

        parameter SIunits.SpecificHeatCapacity cp_const=1004
          "spec. heat capacity";

        SIunits.SpecificHeatCapacity cv "spec. heat capacity";

        SIunits.SpecificHeatCapacity cp "spec. heat capacity";

        SIunits.SpecificHeatCapacity r_gas "spec. gas constant";
      equation

        // SIunits.SpecificHeatCapacity r_gas;

        if switch_cp_const == true then
          cp = cp_const;
          // cp defined by parameter
        end if;

        if switch_r_gas_const == true then
          r_gas = GeneralConstants.R/SpecificConstants.m_mol;
        end if;

        cv = cp - r_gas;

        if option_h_u_correlations == 1 then
          StateCut.h = cp*(StateCut.t - ReferenceState.t0) + ReferenceState.h0;
          StateCut.u = cv*(StateCut.t - ReferenceState.t0) + ReferenceState.u0;
        end if;

        if option_h_u_correlations == 2 then
          StateCut.u = StateCut.h - StateCut.p/StateCut.rho;
        end if;

        if option_h_u_correlations == 3 then
          StateCut.h = cp*(StateCut.t - ReferenceState.t0) + ReferenceState.h0;
        end if;

        if option_h_u_correlations == 4 then
          StateCut.u = cv*(StateCut.t - ReferenceState.t0) + ReferenceState.u0;
        end if;

        if option_s_correlation == 1 then
          StateCut.s = cv*Modelica.Math.log((StateCut.t + 273.15)/(
            ReferenceState.t0 + 273.15)) + SpecificConstants.r_gas*
            Modelica.Math.log(ReferenceState.rho0/StateCut.rho) +
            ReferenceState.s0;
        end if;

        if option_s_correlation == 2 then
          StateCut.s = cp*Modelica.Math.log((StateCut.t + 273.15)/(
            ReferenceState.t0 + 273.15)) - SpecificConstants.r_gas*
            Modelica.Math.log(StateCut.p/ReferenceState.p0) + ReferenceState.s0;
        end if;

      end PerfectGasCaloricNoProp;

      model PerfectGasCalVolNoProp
        "combination of AirIdealGasVolumetric AirPerfectGasCaloric TTcode:CaS3"

        extends TTInterface.ThermalState.PropertyPort;

        parameter Integer option_h_u_correlations=1
          "correlations for h and u, s.info";
        parameter Integer option_s_correlation=1 "correlation for s, s. info";


          //--------------------------start documentation------------------------------
        annotation (
          Documentation(info="

<html>


<p><b>Air</b></p>

<p>Ideal Gas law:</p>
<p></p>
<p>p = r_gas*(t+273.15)*rho </p>
<p>r_gas = GeneralConstants.R/SpecificConstants.m_mol </p>
<p></p>
<p>medium is defined by fundamental constants in record SpecificConstants </p>
<p>reference state is defined in record ReferenceState</p>

<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>YES<td>-
</tr>
<tr>
<td>p<td>YES<td>-
</tr>
<tr>
<td>rho<td>YES<td>-
</tr>
<tr>
<td>s<td>YES<td>-
</tr>
<tr>
<td>t<td>YES<td>-
</tr>
<tr>
<td>u<td>YES<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> Ideal Gas law is valid for single component gas at low pressure / high temperatures
<hr>



<b>SWITCH-PARAMETERS:</b>-none-
<hr>

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

<b>Identification:</b> TechThermo CaS3<br>
<b>Example:</b> TechThermo Ca3


</p>
</HTML>"),
          Coordsys(grid=[2, 2], component=[70, 70]),
          Diagram);

        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1)),
            Polygon(points=[0, 20; -32, -20; 34, -20; 0, 22; 0, 20], style(
                color=41,
                fillColor=41,
                fillPattern=1))));


          //--------------------------end documentation------------------------------

        replaceable IdealGasVolumetricNoProp IdealGasVolumetric
          annotation (extent=[-88, -22; -18, 48]);
        replaceable PerfectGasCaloricNoProp PerfectGasCaloric(
            option_h_u_correlations=option_h_u_correlations,
            option_s_correlation=option_s_correlation)
          annotation (extent=[0, -22; 70, 48]);
      equation
        connect(IdealGasVolumetric.StateCut, StateCut) annotation (points=[-52,
               -28; -52, -64; -2, -64; -2, -102], style(color=8));
        connect(PerfectGasCaloric.StateCut, StateCut) annotation (points=[34, -28;
               34, -64; -2, -64; -2, -100], style(color=8));
      end PerfectGasCalVolNoProp;


      model RealGasVolumetricNoProp
        "p-rho-t correlation for H2o using Redlich-Kwong equation"
        extends TTInterface.ThermalState.PropertyPort;

        TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
          SpecificConstants "record with medium specific constants";

        parameter Integer option_correlation=3;

        parameter Real c_rk[2]=TTMedium.Gas.Support.CoeffRedlichKwong(
            SpecificConstants=SpecificConstants);
        parameter Real a_rk=c_rk[1];
        parameter Real b_rk=c_rk[2];


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p><b>H2O</b></p>
<p>Redlich Kwong correlation for rho, p, t:</p>
<p></p>
<p>p = r_gas*(t+273.15)/(1./rho-b)-a/(t+273.15)^0.5/(1./rho)/(1./rho+b) </p>
<p></p>
<p>medium is defined by fundamental constants in record SpecificConstants </p>
<ul>
<li>r_gas: medium specific gas constant SpecificConstants.r_gas</li>
<li>a:0.42748*SpecificConstants.r_gas^2*SpecificConstants.t_critical^2.5/SpecificConstants.p_critical</li>
<li>b:0.08664*SpecificConstants.r_gas*SpecificConstants.t_critical/SpecificConstants.p_critical</li>
</ul>
<p>a,b are calculated in function TTMedium.Gas.Support.CoeffRedlichKwong</p>
<p>
<p>depending on parameter option_correlation different correlations are available:
<ul>
<li>p=f(rho,t), acausal equation</li>
<li>rho=f(p,t), function TTMedium.Gas.Support.RhoFromPTRedlichKwong is used</li>
<li>t=f(p,rho), function TTMedium.Gas.Support.RhoFromPTRedlichKwong is used</li>
</ul>





<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>NO<td>-
</tr>
<tr>
<td>p<td>YES<td>-
</tr>
<tr>
<td>rho<td>YES<td>-
</tr>
<tr>
<td>s<td>NO<td>-
</tr>
<tr>
<td>t<td>YES<td>-
</tr>
<tr>
<td>u<td>NO<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> -none-
<hr>



<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<hr>



<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td>  <b>option_correlation</b><td>
</tr>

<tr>
<td>1<td>acausal equation
</tr>
<tr>
<td>2<td>StateCut.rho=TTMedium.Gas.Support.RhoFromPTRedlichKwong
</tr>
<tr>
<td>3<td>StateCut.t=TTMedium.Gas.Support.TFromPRhoRedlichKwong
</tr>

</table>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>SpecificConstants<td>record with medium specific constants<td>MediumThermoFundamentalConstants<td>[-]
</tr>
</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo <br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[0, 20; -32, -20; 32, -20; 0, 20], style(
                color=41,
                fillColor=41,
                fillPattern=1))));
      equation

        if option_correlation == 1 then
          StateCut.p = SpecificConstants.r_gas*(StateCut.t + 273.15)/(1./
            StateCut.rho - b_rk) - a_rk/(sqrt(StateCut.t + 273.15))/(1./
            StateCut.rho*(1./StateCut.rho + b_rk));
        end if;

        if option_correlation == 2 then
          StateCut.rho = TTMedium.Gas.Support.RhoFromPTRedlichKwong(
            SpecificConstants=SpecificConstants, t=StateCut.t, p=StateCut.p);
        end if;

        if option_correlation == 3 then
          StateCut.t = TTMedium.Gas.Support.TFromPRhoRedlichKwong(
            SpecificConstants=SpecificConstants, rho=StateCut.rho, p=StateCut.p);
        end if;

      end RealGasVolumetricNoProp;



      function CoeffRedlichKwong "constants a and b for Redlich-Kwong equation TTcode:CaS5"


        //definition of thermo-physical constants by record Medium
        input TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
           SpecificConstants;

        output Real rk_constants_i[2];
        // constant a(=rk_constants[1]) and b(=rk_constants[2])
        // of Redlich-Kwong equation


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="
      function calculating constants of Redlich-Kwong state equation
      for real gases

      Redlich-Kwong:
      p=(rgas*T)/(v-b)-a/(T**0.5*v*(v+b))

      r_gas is specific gas-constant [J/kg/K]

      constants a,b are calculated from critical state values t_critical, p_critical of gas:

      a=0.42748*r_gas^2*t_critical^2.5/p_critical
      b=0.08664*r_gas*t_critical/p_critical

      input:
//	SIunits.ThermodynamicTemperature t_critical;// critical temperature [K]
//	SIunits.Pressure p_critical;// critical pressure [N/m**2]
//	SIunits.MolarMass m_mol;// molar mass [kg/mol]

//definition of thermo-physical constants by record Medium
input TTMedium.Specific.Data.MediumThermoFundamentalConstants Medium;


      output:
	rk_constants_i: vector containing a(=rk_constants_i[1])
                        and b(=rk_constants_i[2])


      Identification: TechThermo TTcode:CaS5
      Example: TechThermo
      "));
      algorithm


          //--------------------------end documentation------------------------------

        rk_constants_i[1] := 0.42748*SpecificConstants.r_gas^2.0*
          SpecificConstants.t_critical^2.5/SpecificConstants.p_critical;
        rk_constants_i[2] := 0.08664*SpecificConstants.r_gas*SpecificConstants.
          t_critical/SpecificConstants.p_critical;

      end CoeffRedlichKwong;

      function RealGasDensity
        "calculation density of real-gas as function of pressure and temperature according to Redlich-Kwong TTcode:CaS6"


        input SIunits.CelsiusTemperature t;
        input SIunits.Pressure p;

        //input SIunits.ThermodynamicTemperature t_critical;
        //input SIunits.Pressure p_critical;
        //input SIunits.MolarMass m_mol;

        //definition of thermo-physical constants by record Medium
        input TTMedium.Specific.Data.MediumThermoFundamentalConstants Medium;

        output SIunits.Density rho;
        //output SIunits.SpecificVolume v_i[4];

        constant SIunits.SpecificHeatCapacity r_gas_uni=GeneralConstants.R;

      protected
        Real c_rk[2]=CoeffRedlichKwong(Medium=Medium);
        Real a_rk=c_rk[1];
        Real b_rk=c_rk[2];
        Real c1;
        Real c2;
        Real c3;
        Real c4;
        SIunits.SpecificVolume v_i[4];


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="
        Calculation density as function of temperature and pressure
        for a real gas using Redlich-Kwong equation

        input:  t temperature [Degree Celsius]
                p Pressure [N/m**2]

                t_critical critical temperature [Kelvin]
                p_critical critical pressure [N/m**2]
                m_mol molar mass [kg/mol]

        output: rho density [kg/m*+3]

        uses function SolveCubicCardano (TechThermo d3d4) for solution of
        cubic equation


      Identification: TechThermo CaS6
      Example: TechThermo
      "));

          annotation (
      Icon(
        Ellipse(extent=[-80, 100; 80, -60], style(color=0)),
        Polygon(points=[0, 100; -68, -20; 68, -20; 0, 100], style(color=0)),
        Polygon(points=[0, 100; -24, 58; 24, 58; 0, 100], style(color=1,
              fillColor=1)),
        Line(points=[-46, 20; 46, 20], style(
            color=0,
            fillColor=1,
            fillPattern=1)),
        Line(points=[-64, 60; -50, 30; -34, 60], style(
            color=0,
            fillColor=1,
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

    annotation (Diagram);



      algorithm


          //--------------------------end documentation------------------------------

        //      coefficients Redlich-Kwong equation:
        c1 := 1;
        c2 := -r_gas_uni*(t + 273.15)/p;
        c3 := a_rk/p/(sqrt(t + 273.15)) - b_rk^2.0 - r_gas_uni*(t + 273.15)*
          b_rk/p;
        c4 := a_rk*b_rk/p/(sqrt(t + 273.15));

        v_i := SolveCubicCardano(c1=c1, c2=c2, c3=c3, c4=c4);
        v_i[1:3] := v_i[1:3];

        if v_i[4] > 1 then
          //	more than a single real solution


            //      proper solution for superheated gas is biggest value of v_i[1],v_i[2],v_i[3]
          if (v_i[1] > v_i[2]) then
            if (v_i[1] > v_i[3]) then
              rho := Medium.m_mol/v_i[1];
            else
              rho := Medium.m_mol/v_i[3];
            end if;
          else
            if (v_i[2] > v_i[3]) then
              rho := Medium.m_mol/v_i[2];
            else
              rho := Medium.m_mol/v_i[3];
            end if;
          end if;
        else
          //      v_i[1] is single r eal solution
          rho := Medium.m_mol/v_i[1];
        end if;

      end RealGasDensity;

      function RhoFromPTRedlichKwong
        "calculation density of real-gas as function of pressure and temperature according to Redlich-Kwong TTcode:CaS7"


        input SIunits.CelsiusTemperature t;
        input SIunits.Pressure p;

        //input SIunits.ThermodynamicTemperature t_critical;
        //input SIunits.Pressure p_critical;
        //input SIunits.MolarMass m_mol;

        //definition of thermo-physical constants by record Medium
        input TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
           SpecificConstants;

        output SIunits.Density rho;
        //output SIunits.SpecificVolume v_i[4];

        //constant SIunits.SpecificHeatCapacity r_gas_uni=GeneralConstants.R;

      protected
        Real c_rk[2]=CoeffRedlichKwong(SpecificConstants=SpecificConstants);
        Real a_rk=c_rk[1];
        Real b_rk=c_rk[2];
        Real c1;
        Real c2;
        Real c3;
        Real c4;
        SIunits.SpecificVolume v_i[4];


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="
        Calculation density as function of temperature and pressure
        for a real gas using Redlich-Kwong equation

        input:  t temperature [Degree Celsius]
                p Pressure [N/m**2]

                t_critical critical temperature [Kelvin]
                p_critical critical pressure [N/m**2]
                m_mol molar mass [kg/mol]

        output: rho density [kg/m*+3]

        uses function SolveCubicCardano (TechThermo d3d4) for solution of
        cubic equation


      Identification: TechThermo CaS7
      Example: TechThermo
      "));

          annotation (
      Icon(
        Ellipse(extent=[-80, 100; 80, -60], style(color=0)),
        Polygon(points=[0, 100; -68, -20; 68, -20; 0, 100], style(color=0)),
        Polygon(points=[0, 100; -24, 58; 24, 58; 0, 100], style(color=1,
              fillColor=1)),
        Line(points=[-46, 20; 46, 20], style(
            color=0,
            fillColor=1,
            fillPattern=1)),
        Line(points=[-64, 60; -50, 30; -34, 60], style(
            color=0,
            fillColor=1,
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

    annotation (Diagram);



      algorithm


          //--------------------------end documentation------------------------------

        //      coefficients Redlich-Kwong equation:
        c1 := 1;
        c2 := -SpecificConstants.r_gas*(t + 273.15)/p;
        c3 := a_rk/p/(sqrt(t + 273.15)) - b_rk^2.0 - SpecificConstants.r_gas*(t
           + 273.15)*b_rk/p;
        c4 := -a_rk*b_rk/p/(sqrt(t + 273.15));

        v_i := TTMedium.MathTool.Support.SolveCubicCardano(c1=c1, c2=c2, c3=c3,
           c4=c4);
        v_i[1:3] := v_i[1:3];

        rho := 1.0/v_i[1];

      end RhoFromPTRedlichKwong;

      function TFromPRhoRedlichKwong
        "calculation temperature of real-gas as function of pressure and density according to Redlich-Kwong TTcode:CaS8"


        input SIunits.Density rho;
        input SIunits.Pressure p;

        //definition of thermo-physical constants by record Medium
        input TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
           SpecificConstants;

        output SIunits.CelsiusTemperature t;
        //output SIunits.SpecificVolume v_i[4];

        //constant SIunits.SpecificHeatCapacity r_gas_uni=GeneralConstants.R;

      protected
        Real c_rk[2]=CoeffRedlichKwong(SpecificConstants=SpecificConstants);
        Real a_rk=c_rk[1];
        Real b_rk=c_rk[2];
        Real c1;
        Real c2;
        Real c3;
        Real c4;
        SIunits.SpecificVolume y_i[4];


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="
        Calculation density as function of temperature and pressure
        for a real gas using Redlich-Kwong equation

        input:  rho Density [kg/m³]
                p Pressure [N/m**2]

                t_critical critical temperature [Kelvin]
                p_critical critical pressure [N/m**2]
                m_mol molar mass [kg/mol]

        output: rho density [kg/m*+3]

        uses function SolveCubicCardano (TechThermo d3d4) for solution of
        cubic equation


      Identification: TechThermo CaS8
      Example: TechThermo
      "));

          annotation (
      Icon(
        Ellipse(extent=[-80, 100; 80, -60], style(color=0)),
        Polygon(points=[0, 100; -68, -20; 68, -20; 0, 100], style(color=0)),
        Polygon(points=[0, 100; -24, 58; 24, 58; 0, 100], style(color=1,
              fillColor=1)),
        Line(points=[-46, 20; 46, 20], style(
            color=0,
            fillColor=1,
            fillPattern=1)),
        Line(points=[-64, 60; -50, 30; -34, 60], style(
            color=0,
            fillColor=1,
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

    annotation (Diagram);




      algorithm


          //--------------------------end documentation------------------------------

        //      coefficients Redlich-Kwong equation:
        c1 := SpecificConstants.r_gas/(1./rho - b_rk);
        c2 := 0.0;
        c3 := -p;
        c4 := -a_rk/(1./rho*(1./rho + b_rk));

        y_i := TTMedium.MathTool.Support.SolveCubicCardano(c1=c1, c2=c2, c3=c3,
           c4=c4);

        t := y_i[1]^2 - 273.15;

      end TFromPRhoRedlichKwong;





    end Support;

  end Gas;

  package Liquid
    "thermophysical correlations single component liquid phase TTcode:Cb"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations single component liquid

identification: TechThermo Cb
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Polygon(points=[-11, 30; -37, -12; 16, -12; -10, 29; -11, 30], style(
              color=41)),
        Polygon(points=[-57, -44; 37, -44; 15, -11; -36, -11; -57, -44], style(
              fillColor=69)),
        Polygon(points=[-80, -80; 60, -80; 37, -44; -57, -44; -80, -80], style(
              color=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model H2oConstRhoVolumetric "provides constant value for density of H2O TTcode:Cb1"

      extends TTMedium.Liquid.Support.ConstRhoVolumetricNoProp;
      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end H2oConstRhoVolumetric;

    model H2oCaloricConstCp "H2O: correlation h,u,s for constant c_heat TTcode:Cb2"
      extends TTMedium.Liquid.Support.CaloricConstCpNoProp(redeclare
          TTMedium.Liquid.Data.H2oLiquidReferenceState ReferenceState);

      annotation (Icon(
          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1)),
          Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
              style(
              color=69,
              fillColor=69,
              fillPattern=1))));


        //    Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
      //        color=0,
      //        fillColor=7,
      //        fillPattern=1)),

    end H2oCaloricConstCp;

    model H2oVariableRhoVolumetric "correlations for density rho of liquid H2O TTcode:Cb3"


      extends TTMedium.Liquid.Support.VariableRhoVolumetricNoProp(redeclare
          TTMedium.MediumSpecificData.Data.H2oThermoFundamentalConstants
          SpecificConstants);

      // correlations for complete liquid region included:
      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
              style(
              color=69,
              fillColor=69,
              fillPattern=1))));

    end H2oVariableRhoVolumetric;

    model H2oConstRhoCalVol
      "combination of H2oConstRhoVolumetric and H2oConstRhoCaloric TTcode:Cb4"

      extends TTMedium.Liquid.Support.ConstRhoCalVolNoProp(redeclare
          TTMedium.Liquid.H2oConstRhoVolumetric ConstRhoVolumetric, redeclare
          TTMedium.Liquid.H2oCaloricConstCp Caloric);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1)),
          Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
              style(
              color=69,
              fillColor=69,
              fillPattern=1))));

    end H2oConstRhoCalVol;

    model H2oVariableRhoCalVol
      "combination of H2oVariableRhoVolumetric and H2oConstRhoCaloric TTcode:Cb5"

      extends TTMedium.Liquid.Support.VariableRhoCalVolNoProp(redeclare
          TTMedium.Liquid.H2oVariableRhoVolumetric VariableRhoVolumetric,
          redeclare TTMedium.Liquid.H2oCaloricConstCp Caloric);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1)),
          Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
              style(
              color=69,
              fillColor=69,
              fillPattern=1))));

    end H2oVariableRhoCalVol;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Medium.Liquid
Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo CbS
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

      model ConstRhoVolumetricNoProp
        "provides constant value for density of medium TTcode:CbS1"

        extends TTInterface.ThermalState.PropertyPort;

        parameter SIunits.Density rho_const=1000 "const. value for density";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
model provides constant value for density at connector StateCut
</p>
<p>if this model is connected to another model, the other model must not define the variable rho at connector StateCut



<hr>

<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>NO<td>-
</tr>
<tr>
<td>p<td>NO<td>-
</tr>
<tr>
<td>rho<td>YES<td>-
</tr>
<tr>
<td>s<td>NO<td>-
</tr>
<tr>
<td>t<td>NO<td>-
</tr>
<tr>
<td>u<td>NO<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> no correlation between temperature, pressure and density, small variations of temperature and pressure
<hr>



<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>rho_const<td> const. value for density <td>Density<td>[kg/m3]
</tr>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CbS1<br>
<b>Example:</b> TechThermo Cb1


</p>
</HTML>"));

        // correlations for complete liquid region included:
        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=69,
                fillPattern=1))));
      equation

        StateCut.rho = rho_const;

      end ConstRhoVolumetricNoProp;

      model CaloricConstCpNoProp "correlation h,u,s for constant c_heat TTcode:CbS2"
        extends TTInterface.ThermalState.PropertyPort;

        TTMedium.MediumSpecificData.Data.ReferenceState ReferenceState
          "record with values of thermal state variables at reference state";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>

<p>correlations for caloric thermal state variables enthalpy h, internal energy u and entropy s</p>
<p>all values mass specific </p>
<p>value for specific heat capacity c_heat is constant </p>
<p></p>
<p>c_heat can be calculated before the start of the simulation for a constant average temperature value
t_average:</p>
<p>c_heat=cp_0+c1*delta_t+c2*delta_t^2+c3*delta_t^3+c4*delta_t^4</p>
<p></p>
<p>delta_t=t_average-t_0</p>
<p></p>
<p> medium is defined by constant parameter values for heat capacity  c_heat and density rho_const</p>
<p></p>
<p>The definition of density at connector StateCut can be avoided by setting switch-parameter switch_rho_const=false.
This is necessary if model is connected to other model with definition of density<p>

<hr>
<p><b>used thermal state variables of connector StateCut:</b></p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>Optional<td>option_h_u_correlations
</tr>
<tr>
<td>p<td>Optional<td>option_h_u_correlations
<p>option_s_correlation</p>
</tr>
<tr>
<td>rho<td>Optional<td>option_h_u_correlations
<p>option_s_correlation</p>
</tr>
<tr>
<td>s<td>Optional<td>option_s_correlation
</tr>
<tr>
<td>t<td>Optional<td>option_h_u_correlations
<p>option_s_correlation</p>
</tr>
<tr>
<td>u<td>Optional<td>option_h_u_correlations
</tr>
<tr>
<td>x<td>No<td>-
</tr>
<tr>
<td>x_is<td>No<td>-
</tr>




</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>

<b> ASSUMPTIONS:</b>
<ul>
<li>density is constant</li>
<li>internal energy not dependant on pressure</li>
<li>specific heat capacity at constant pressure is identical with specific heat capacity at constant volume</li>
</ul>
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_rho_const<td>StateCut.rho=rho_const
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
<tr>
<td>  <b>option_h_u_correlations </b><td>
</tr>

<tr>
<td>1<td> StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
          .h0+(StateCut.p - ReferenceState.p0)/StateCut.rho;
<p>StateCut.u = c_heat*(StateCut.t - ReferenceState.t0) +
          ReferenceState.u0;
</tr>

<tr>
<td>2<td>StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
          .h0+(StateCut.p - ReferenceState.p0)/StateCut.rho;
<p>StateCut.u = StateCut.h - StateCut.p/StateCut.rho + ReferenceState.u0;
</tr>

<tr>
<td>3<td> StateCut.h = StateCut.u + StateCut.p/StateCut.rho + ReferenceState.h0;
<p>StateCut.u = c_heat*(StateCut.t - ReferenceState.t0) +
          ReferenceState.u0;</p>
</tr>
<tr>
<td>4<td>         StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
          .h0+(StateCut.p - ReferenceState.p0)/StateCut.rho;

</tr>
<tr>
<td>5<td> StateCut.u=(cp_const-r_gas)*(StateCut.t-ReferenceState.t0)+ReferenceState.u0;
</tr>
<tr><td>  <b>option_s_correlation </b><td>
</tr>
<tr>
<td>1<td>StateCut.s=ReferenceState.s0+c_heat*Modelica.Math.log((StateCut.t + 273.15)
				   /(ReferenceState.t0 + 273.15));
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

<b>Identification:</b> TechThermo CbS2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));


          //--------------------------end documentation------------------------------

        parameter SIunits.CelsiusTemperature t_average=20
          "average temperature for which heat capacity cp and cv are valid";

        parameter SIunits.CelsiusTemperature t_0=20
          "temperature for which heat capacity cp_0 is valid";

        parameter SIunits.SpecificHeatCapacity cp_0=4018
          "spec. heat capacity at temperature t_0";

        parameter Real c1=0.0
          "coefficient c1 for calculation of cp for average temperature value t_average";
        parameter Real c2=0.0
          "coefficient c2 for calculation of cp for average temperature value t_average";
        parameter Real c3=0.0
          "coefficient c3 for calculation of cp for average temperature value t_average";
        parameter Real c4=0.0
          "coefficient c4 for calculation of cp for average temperature value t_average";

        parameter SIunits.CelsiusTemperature delta_t=t_average - t_0
          "temperature difference t_average - t_0";
        parameter SIunits.SpecificHeatCapacity c_heat=cp_0 + c1*delta_t + c1*
            delta_t + c2*delta_t^2 + c3*delta_t^3 + c4*delta_t^4
          "const. value for cp calculated with polynome (s.info)";

        parameter Integer option_h_u_correlations=1
          "correlations for h and u, s.info";
        parameter Integer option_s_correlation=1 "correlation for s, s. info";

        // correlations for complete liquid region included:
        annotation (Icon(
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=69,
                fillPattern=1))));
      equation


          //    Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
        //        color=0,
        //        fillColor=7,
        //        fillPattern=1)),

        if option_h_u_correlations == 1 then
          StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
            .h0 + (StateCut.p - ReferenceState.p0)/StateCut.rho;
          StateCut.u = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
            .u0;
        end if;

        //      if option_h_u_correlations == 2 then


          //        StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState.


          //          h0 + StateCut.p/StateCut.rho - ReferenceState.p0/ReferenceState.rho0;


          //        StateCut.u = StateCut.h - StateCut.p/StateCut.rho + ReferenceState.u0;
        //      end if;

        if option_h_u_correlations == 2 then
          StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
            .h0 + StateCut.p/StateCut.rho - ReferenceState.p0/ReferenceState.
            rho0;
          StateCut.u = StateCut.h - StateCut.p/StateCut.rho + ReferenceState.u0;
        end if;

        if option_h_u_correlations == 3 then
          StateCut.h = StateCut.u + StateCut.p/StateCut.rho + ReferenceState.h0;
          StateCut.u = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
            .u0;
        end if;

        if option_h_u_correlations == 4 then
          StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
            .h0 + (StateCut.p - ReferenceState.p0)/StateCut.rho;
        end if;

        if option_h_u_correlations == 5 then
          StateCut.u = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
            .u0;
        end if;

        if option_s_correlation == 1 then
          StateCut.s = ReferenceState.s0 + c_heat*Modelica.Math.log((StateCut.t
             + 273.15)/(ReferenceState.t0 + 273.15));
        end if;

      end CaloricConstCpNoProp;

      model VariableRhoVolumetricNoProp
        "correlations for density rho of liquid H2O TTcode:CbS3"

        extends TTInterface.ThermalState.PropertyPort;

        TTMedium.MediumSpecificData.Data.ReferenceState ReferenceState(h0=
              2674000)
          "record with values of thermal state variables at reference state";

        TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
          SpecificConstants "record with medium specific constants";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>

<p>correlations for caloric thermal state variables enthalpy h, internal energy u and entropy s</p>
<p>all values mass specific </p>
<p>value for specific heat capacity c_heat is constant </p>
<p></p>
<p>c_heat can be calculated before the start of the simulation for a constant average temperature value
t_average:</p>
<p>c_heat=cp_0+c1*delta_t+c2*delta_t^2+c3*delta_t^3+c4*delta_t^4</p>
<p></p>
<p>delta_t=t_average-t_0</p>
<p></p>
<p> medium is defined by constant parameter values for heat capacity  c_heat and density rho_const</p>
<p></p>
<p>The definition of density at connector StateCut can be avoided by setting switch-parameter switch_rho_const=false.
This is necessary if model is connected to other model with definition of density<p>

<hr>
<p><b>used thermal state variables of connector StateCut:</b></p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>Optional<td>option_h_u_correlations
</tr>
<tr>
<td>p<td>Optional<td>option_h_u_correlations
<p>option_s_correlation</p>
</tr>
<tr>
<td>rho<td>Optional<td>option_h_u_correlations
<p>option_s_correlation</p>
</tr>
<tr>
<td>s<td>Optional<td>option_s_correlation
</tr>
<tr>
<td>t<td>Optional<td>option_h_u_correlations
<p>option_s_correlation</p>
</tr>
<tr>
<td>u<td>Optional<td>option_h_u_correlations
</tr>
<tr>
<td>x<td>No<td>-
</tr>
<tr>
<td>x_is<td>No<td>-
</tr>




</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>

<b> ASSUMPTIONS:</b>
<ul>
<li>density is constant</li>
<li>internal energy not dependant on pressure</li>
<li>specific heat capacity at constant pressure is identical with specific heat capacity at constant volume</li>
</ul>
<hr>

<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_rho_const<td>StateCut.rho=rho_const
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
<tr>
<td>  <b>option_h_u_correlations </b><td>
</tr>

<tr>
<td>1<td> StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
          .h0+(StateCut.p - ReferenceState.p0)/StateCut.rho;
<p>StateCut.u = c_heat*(StateCut.t - ReferenceState.t0) +
          ReferenceState.u0;
</tr>

<tr>
<td>2<td>StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
          .h0+(StateCut.p - ReferenceState.p0)/StateCut.rho;
<p>StateCut.u = StateCut.h - StateCut.p/StateCut.rho + ReferenceState.u0;
</tr>

<tr>
<td>3<td> StateCut.h = StateCut.u + StateCut.p/StateCut.rho + ReferenceState.h0;
<p>StateCut.u = c_heat*(StateCut.t - ReferenceState.t0) +
          ReferenceState.u0;</p>
</tr>
<tr>
<td>4<td>         StateCut.h = c_heat*(StateCut.t - ReferenceState.t0) + ReferenceState
          .h0+(StateCut.p - ReferenceState.p0)/StateCut.rho;

</tr>
<tr>
<td>5<td> StateCut.u=(cp_const-r_gas)*(StateCut.t-ReferenceState.t0)+ReferenceState.u0;
</tr>
<tr><td>  <b>option_s_correlation </b><td>
</tr>
<tr>
<td>1<td>        StateCut.s=ReferenceState.s0+c_heat*Modelica.Math.log((StateCut.t + 273.15)
				   /(ReferenceState.t0 + 273.15));
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

<b>Identification:</b> TechThermo CbS3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));


          //--------------------------end documentation------------------------------

        parameter SIunits.Density rho_const=1000
          "const. value density, if soption_rho_correlations==0 then StateCut.rho=rho_const";

        parameter SIunits.CelsiusTemperature t1=100
          "temperature for which density rho1 ist known, needed if option_rho_correlations==1 or option_rho_correlations==2";

        parameter SIunits.SpecificEnthalpy h1=420000
          "spec. enthalpy for which density rho1 ist known, needed if option_rho_correlations==3";

        parameter SIunits.Density rho1=958.6
          "known density, needed if option_rho_correlations==1 or option_rho_correlations==2 or option_rho_correlations==3";

        Real zra
          "variable needed for Rackett equation (if option_rho_correlations=1)";

        Real vra
          "variable needed for Rackett equation (if option_rho_correlations=1)";

        parameter SIunits.Density rho2=798.9
          "second value for known density, needed if option_rho_correlations==2 or option_rho_correlations==3";

        parameter SIunits.CelsiusTemperature t2=250
          "temperature for which density rho2 ist known, needed if option_rho_correlations==2";

        parameter SIunits.SpecificEnthalpy h2=1085000.0
          "spec. enthalpy for which density rho2 ist known, needed if option_rho_correlations==3";

        parameter Real t_grad_rho=(rho2 - rho1)/(t2 - t1)
          "gradient density dependant on temperature, needed if option_rho_correlations==2";
        parameter Real h_grad_rho=(rho2 - rho1)/(h2 - h1)
          "gradient density dependant on spec. enthalpy, needed if option_rho_correlations==3";

        parameter Integer option_rho_correlation=1
          "correlation chosen for calculation of density rho, s. info";

        // correlations for complete liquid region included:
        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=69,
                fillPattern=1))));
      equation

        if option_rho_correlation == 0 then


            // calculation of temperature dependant density using Rackett-equation
          StateCut.rho = rho_const;
          zra = 42;
          //dummy-value
          vra = 42;
          //dummy-value

        end if;

        if option_rho_correlation == 1 then


            // calculation of temperature dependant density using Rackett-equation

          zra = (SpecificConstants.p_critical/rho1/SpecificConstants.r_gas/
            SpecificConstants.t_critical)^(1/(1 + (1 - (t1 + 273.15)/
            SpecificConstants.t_critical)^(2/7)));

          vra = zra*SpecificConstants.r_gas*SpecificConstants.t_critical/
            SpecificConstants.p_critical;

          StateCut.rho = 1./(vra*zra^((1.0 - (StateCut.t + 273.15)/
            SpecificConstants.t_critical)^(2./7.)));
        end if;

        if option_rho_correlation == 2 then
          // interpolation of density rho dependant on temperature
          StateCut.rho = rho1 + t_grad_rho*(StateCut.t - t1);
          zra = 42;
          //dummy-value
          vra = 42;
          //dummy-value

        end if;

        if option_rho_correlation == 3 then
          // interpolation of density rho dependant on spec. enthalpy
          StateCut.rho = rho1 + h_grad_rho*(StateCut.h - h1);
          zra = 42;
          //dummy-value
          vra = 42;
          //dummy-value

        end if;

      end VariableRhoVolumetricNoProp;

      model ConstRhoCalVolNoProp
        "combination of ConstRhoVolumetricNoProp and CaloricConstCpNoProp TTcode:CbS4"

        extends TTInterface.ThermalState.PropertyPort;


          //-----Start Documentation----------------------------------------------
        annotation (
          Documentation(info="

<html>
<p>
model provides constant value for density at connector StateCut
</p>
<p>if this model is connected to another model, the other model must not define the variable rho at connector StateCut



<hr>

<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>NO<td>-
</tr>
<tr>
<td>p<td>NO<td>-
</tr>
<tr>
<td>rho<td>YES<td>-
</tr>
<tr>
<td>s<td>NO<td>-
</tr>
<tr>
<td>t<td>NO<td>-
</tr>
<tr>
<td>u<td>NO<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> no correlation between temperature, pressure and density, small variations of temperature and pressure
<hr>



<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>rho_const<td> const. value for density <td>Density<td>[kg/m3]
</tr>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CbS4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"),
          Coordsys(grid=[2, 2], component=[70, 70]),
          Diagram);

        // correlations for complete liquid region included:
        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=69,
                fillPattern=1))));

        replaceable ConstRhoVolumetricNoProp ConstRhoVolumetric
          annotation (extent=[-82, -50; -12, 20]);
        replaceable CaloricConstCpNoProp Caloric(switch_rho_const=false)
          annotation (extent=[10, -48; 80, 22]);
      equation
        connect(ConstRhoVolumetric.StateCut, StateCut) annotation (points=[-46,
               -52; -46, -76; -4, -76; -4, -100], style(
            color=8,
            fillColor=1,
            fillPattern=1));
        connect(Caloric.StateCut, StateCut) annotation (points=[46, -54; 46, -76;
               2, -76; 2, -100], style(
            color=8,
            fillColor=1,
            fillPattern=1));
      end ConstRhoCalVolNoProp;

      model VariableRhoCalVolNoProp
        "combination of VariableRhoVolumetricNoProp and CaloricConstCpNoProp TTcode:CbS5"

        extends TTInterface.ThermalState.PropertyPort;


          //-----Start Documentation----------------------------------------------
        annotation (
          Documentation(info="

<html>
<p>
model provides constant value for density at connector StateCut
</p>
<p>if this model is connected to another model, the other model must not define the variable rho at connector StateCut



<hr>

<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>NO<td>-
</tr>
<tr>
<td>p<td>NO<td>-
</tr>
<tr>
<td>rho<td>YES<td>-
</tr>
<tr>
<td>s<td>NO<td>-
</tr>
<tr>
<td>t<td>NO<td>-
</tr>
<tr>
<td>u<td>NO<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> no correlation between temperature, pressure and density, small variations of temperature and pressure
<hr>



<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>rho_const<td> const. value for density <td>Density<td>[kg/m3]
</tr>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CbS5<br>
<b>Example:</b> TechThermo


</p>
</HTML>"),
          Coordsys(grid=[2, 2], component=[70, 70]),
          Diagram);

        // correlations for complete liquid region included:
        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=69,
                fillPattern=1))));

        parameter Integer option_rho_correlation=1
          "correlation chosen for calculation of density rho, s. info for H2oVariableRhoVolumetric";

        parameter Integer option_h_u_correlations=1
          "correlations for h and u, s.info for H2oCaloric Caloric";
        parameter Integer option_s_correlation=1
          "correlation for s, s. info for H2oCaloric Caloric";

        replaceable VariableRhoVolumetricNoProp VariableRhoVolumetric(
            option_rho_correlation=option_rho_correlation)
          annotation (extent=[-82, -50; -12, 20]);
        replaceable CaloricConstCpNoProp Caloric(option_h_u_correlations=
              option_h_u_correlations, option_s_correlation=
              option_s_correlation) annotation (extent=[10, -48; 80, 22]);
      equation
        connect(VariableRhoVolumetric.StateCut, StateCut) annotation (points=[-46,
               -52; -46, -76; -4, -76; -4, -100], style(
            color=8,
            fillColor=1,
            fillPattern=1));
        connect(Caloric.StateCut, StateCut) annotation (points=[46, -54; 46, -76;
               2, -76; 2, -100], style(
            color=8,
            fillColor=1,
            fillPattern=1));
      end VariableRhoCalVolNoProp;

    end Support;

    package Data
      extends Modelica.Icons.Library;

      annotation (Documentation(info="
content package: Data for calculation of physical properties of media in liquid phase

Date of last modification:27-09-01, 16:00
Description last modification: s. package info
Author last modification:wds

identification: TechThermo CfD
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Rectangle(extent=[-18, 29; 53, -74], style(color=0, fillColor=7)),
          Line(points=[-12, 19; 48, 19], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-12, 10; 48, 10], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-12, 2; 48, 2], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Rectangle(extent=[-44, 23; 27, -80], style(color=0, fillColor=7)),
          Line(points=[-38, 13; 22, 13], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-38, 4; 22, 4], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-38, -4; 22, -4], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Rectangle(extent=[-72, 17; -1, -86], style(color=0, fillColor=7)),
          Line(points=[-66, 7; -6, 7], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-66, -2; -6, -2], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-66, -10; -6, -10], style(
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
          height=0.6));

      record H2oLiquidReferenceState "reference state for liquid H2o"

        extends TTMedium.MediumSpecificData.Data.ReferenceState(
          h0=104930,
          s0=367.2,
          t0=25,
          p0=1e5,
          rho0=997);

      end H2oLiquidReferenceState;

    end Data;

  end Liquid;

  package Solid
    "thermophysical correlations single component solid medium TTcode:Cc"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations single component liquid

identification: TechThermo Cc

"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Polygon(points=[-11, 30; -37, -12; 16, -12; -10, 29; -11, 30], style(
              color=41)),
        Polygon(points=[-57, -44; 37, -44; 15, -11; -36, -11; -57, -44], style(
              color=69)),
        Polygon(points=[-80, -80; 60, -80; 37, -44; -57, -44; -80, -80], style(
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

  end Solid;

  package MultiPhase "thermophysical correlations multiphase medium TTcode:Cd"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations multiphase system

identification: TechThermo Cd
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Polygon(points=[-11, 30; -37, -12; 16, -12; -10, 29; -11, 30], style(
            color=41,
            fillColor=7,
            fillPattern=8)),
        Polygon(points=[-57, -44; 37, -44; 15, -11; -36, -11; -57, -44], style(
            color=69,
            fillColor=7,
            fillPattern=7)),
        Polygon(points=[-80, -80; 60, -80; 37, -44; -57, -44; -80, -80], style(
            color=0,
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
        height=0.6));

    model H2oTSatPSatAntoine
      "boiling water; correlation temperature and pressure for saturation state according to Antoine TTcode:Cd1"


      extends TTMedium.MultiPhase.Support.TSatPSatAntoineNoProp(redeclare
          TTMedium.MultiPhase.Data.H2oSaturationAntoine AntoineData);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end H2oTSatPSatAntoine;

    model CO2TSatPSatAntoine
      "boiling CO2: correlation temperature and pressure for saturation state according to Antoine TTcode:Cd2"


      extends TTMedium.MultiPhase.Support.TSatPSatAntoineNoProp(redeclare
          TTMedium.MultiPhase.Data.CO2SaturationAntoine AntoineData);

      annotation (Icon(Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100,
                 60], style(
              color=0,
              fillColor=46,
              fillPattern=1)), Line(points=[-75, 45; -55, -5; -35, 45], style(
                color=7, fillPattern=1))));

    end CO2TSatPSatAntoine;

    model H2oHeatVaporization
      "enthalpy of vaporization from temperature for H2O TTcode:Cd3"

      extends TTMedium.MultiPhase.Support.HeatVaporizationNoProp(
        redeclare
          TTMedium.MediumSpecificData.Data.H2oThermoFundamentalConstants
          SpecificConstants,
        dh_ref=2256940,
        t_ref=100);

      annotation (Icon(Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60],
               style(
              color=0,
              fillColor=70,
              fillPattern=1)), Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45,
                -5; 75, -5], style(color=7, fillPattern=1))));

    end H2oHeatVaporization;

    model CO2HeatVaporization
      "enthalpy of vaporization from temperature for CO2 TTcode:Cd4"

      extends TTMedium.MultiPhase.Support.HeatVaporizationNoProp(
        redeclare
          TTMedium.MediumSpecificData.Data.CO2ThermoFundamentalConstants
          SpecificConstants,
        dh_ref=218300,
        t_ref=4);

      annotation (Icon(Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60],
               style(
              color=0,
              fillColor=46,
              fillPattern=1)), Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45,
                -5; 75, -5], style(color=7, fillPattern=1))));

    end CO2HeatVaporization;

    model H2oWetSteamV01
      "H2O: properties of wet steam TTcode:Cd5"

      extends TTMedium.MultiPhase.Support.WetSteamV01NoProp(
        redeclare TTMedium.MultiPhase.H2oTSatPSatAntoine TSatPSatAntoine,
        redeclare TTMedium.MultiPhase.H2oHeatVaporization HeatVaporization,
        redeclare TTMedium.Gas.H2oIdealGasVolumetric IdealGasVolumetric,
        redeclare TTMedium.Liquid.H2oVariableRhoCalVol VariableRhoCalVol);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1))));

    end H2oWetSteamV01;

    model H2oLiquidWetSteamV01
      extends TTMedium.MultiPhase.Support.LiquidWetSteamV01NoProp(redeclare
          TTMedium.MultiPhase.H2oWetSteamV01 WetSteam, redeclare
          TTMedium.Liquid.H2oVariableRhoCalVol Liquid);

      annotation (Icon(
          Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[-75, 45; -55, -5; -35, 45], style(color=7, fillPattern=1)),

          Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
              color=0,
              fillColor=70,
              fillPattern=1)),
          Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                color=7, fillPattern=1))));



    end H2oLiquidWetSteamV01;

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Medium.MultiPhase

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo CdS
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

      model TwoPhaseMix
        "model for calculating thermal state of two phase system from data given for liquid and gas phase"

        parameter Integer n_comp=1 "number of components in fluid";

        TTInterface.ThermalState.In SatLiquid(n_comp=n_comp)
          "thermal state boiling liquid"
          annotation (extent=[-120, -10; -100, 10]);

        TTInterface.ThermalState.In SatSteam(n_comp=n_comp)
          "thermal state saturated steam"
          annotation (extent=[100, -10; 120, 10]);

        TTInterface.ThermalState.In Evaporation(n_comp=n_comp)
          "evaporation enthalpy" annotation (extent=[-10, 100; 10, 120]);

        TTInterface.ThermalState.Out TwoPhase(n_comp=n_comp)
          "thermal state two phase system"
          annotation (extent=[-10, -100; 10, -120]);


          //      SIunits.SpecificEnthalpy h_sat_liquid "spec.enthalpy saturated liquid";


          //      SIunits.SpecificEnthalpy h_sat_gas "spec.enthalpy saturated steam";


          //      SIunits.SpecificInternalEnergy u_sat_liquid "spec. internal energy saturated liquid";


          //      SIunits.SpecificInternalEnergy u_sat_gas "spec. internal energy saturated steam";


          //      SIunits.SpecificEntropy s_sat_liquid "spec. entropy saturated liquid";


          //      SIunits.SpecificEntropy s_sat_gas "spec. entropy saturated steam";
        //      SIunits.Density rho_sat_liquid "density saturated liquid";
        //      SIunits.Density rho_sat_gas "density saturated steam";


          //      SIunits.SpecificEnthalpy h_evaporate "spec. enthalpy of evaporation";


          //      SIunits.SpecificEntropy s_evaporate "spec. entropy change of evaporation";


          //      SIunits.SpecificInternalEnergy u_evaporate "spec. internal energy change of evaporation";

        //parameter Boolean switch_use_evaporation_enthalpy=true


          //  "if switch_use_evaporation_enthalpy==true then caloric state variables of saturated liquid and saturated
        //  "
        //  ;

        annotation (Icon(
            Polygon(points=[-80, -60; 80, -60; 0, 100; -80, -60], style(
                  fillColor=1, fillPattern=10)),
            Text(
              extent=[-88, 72; -46, 56],
              string="Liquid",
              style(
                color=0,
                fillColor=7,
                fillPattern=10)),
            Text(
              extent=[-38, -68; 38, -96],
              style(
                color=0,
                fillColor=7,
                fillPattern=10),
              string="TwoPhase"),
            Polygon(points=[-100, 40; -30, 40; -100, -100; -100, 40], style(
                  fillColor=7, fillPattern=7)),
            Polygon(points=[30, 40; 100, 40; 100, -100; 30, 40], style(
                color=1,
                fillColor=7,
                fillPattern=7)),
            Text(
              extent=[-88, 88; -46, 72],
              style(
                color=0,
                fillColor=7,
                fillPattern=10),
              string="saturated"),
            Text(
              extent=[44, 72; 86, 56],
              style(
                color=0,
                fillColor=7,
                fillPattern=10),
              string="Gas"),
            Text(
              extent=[44, 88; 86, 72],
              style(
                color=0,
                fillColor=7,
                fillPattern=10),
              string="saturated")));

    //-----Start Documentation----------------------------------------------
    annotation (Documentation(info="

<html>
<p>
calculates wet steam properties from the data of the two single phases. Informations about single phase
properties are provided by external models linked to corresponding connectors of TwoPhaseMix.
</p>



<hr>

<hr>
<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>YES<td>-
</tr>
<tr>
<td>p<td>YES<td>-
</tr>
<tr>
<td>rho<td>YES<td>-
</tr>
<tr>
<td>s<td>YES<td>-
</tr>
<tr>
<td>t<td>YES<td>-
</tr>
<tr>
<td>u<td>YES<td>-
</tr>
<tr>
<td>x<td>YES<td>-
</tr>
<tr>
<td>x_i<td>YES<td>-
</tr>
</table>
<p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<ul>
<li>state variables for saturated liquid at connector SatLiquid</li>
<li>state variables for saturated steam at connector SatSteam</li>
<li>state variables for saturated steam at connector SatSteam</li>




<hr>


<b> ASSUMPTIONS:</b> no correlation between temperature, pressure and density, small variations of temperature and pressure
<hr>



<b>SWITCH-PARAMETERS:</b>-none-
<hr>

<hr>

<b>OPTION-PARAMETERS:</b>-none-
<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>rho_const<td> const. value for density <td>Density<td>[kg/m3]
</tr>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo Cb1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));






      equation

        //identical pressure at all thermal state connectors
        TwoPhase.p = SatSteam.p;
        TwoPhase.p = Evaporation.p;
        TwoPhase.p = SatLiquid.p;

        //identical temperature at all thermal state connectors
        TwoPhase.t = SatSteam.t;
        TwoPhase.t = Evaporation.t;
        TwoPhase.t = SatLiquid.t;

        //identical mass fraction at all thermal state connectors
        TwoPhase.x_i = SatSteam.x_i;
        TwoPhase.x_i = Evaporation.x_i;
        TwoPhase.x_i = SatLiquid.x_i;

        //steam quality
        SatSteam.x = 1.0;
        SatLiquid.x = 0.0;
        TwoPhase.x = Evaporation.x;


          //correlation evaporation enthalpy and enthalpies saturaterd liquid/saturated steam
        Evaporation.h = SatSteam.h - SatLiquid.h;


          //correlation change of entropy and entropies saturaterd liquid/saturated steam
        Evaporation.s = SatSteam.s - SatLiquid.s;

        //change of internal energy during evaporation
        Evaporation.u = Evaporation.h - Evaporation.p*(1./SatSteam.rho - 1./
          SatLiquid.rho);
        Evaporation.u = SatSteam.u - SatLiquid.u;

        //difference density saturaterd liquid/saturated steam
        Evaporation.rho = SatSteam.rho - SatLiquid.rho;


          // correlation between evaporation enthalpy, temperature and change of entropy is used
        Evaporation.s = Evaporation.h/(TwoPhase.t + 273.15);

        TwoPhase.h = SatLiquid.h + TwoPhase.x*Evaporation.h;

        TwoPhase.s = SatLiquid.s + TwoPhase.x*Evaporation.s;

        TwoPhase.u = SatLiquid.u + TwoPhase.x*Evaporation.u;

        TwoPhase.rho = 1./(1./SatLiquid.rho + TwoPhase.x*(1./SatSteam.rho - 1./
          SatLiquid.rho));

      end TwoPhaseMix;

      function TSatFromPSat
        "calculates saturation temperature ts for given saturation pressure ps according to Antoine"


        input Real a=-1 "coefficient a Antoine equation";
        input Real b=-1 "coefficient b Antoine equation";
        input Real c=-1 "coefficient c Antoine equation";
        input Real p_unit=100 "ps/p_unit is pressure in Pa";
        input Real t0_antoine=0.0 "ts+t0_antoine is temperature in °C";
        input Real log_correct
          "defines logarithmic basis; log10:log_correct=1.0 ; ln log_correct=0,4342945";

        input SIunits.Pressure ps "saturation pressure";
        output SIunits.CelsiusTemperature ts "saturation temperature";

        annotation (
          Icon(
            Rectangle(extent=[-100, 10; 100, -99], style(
                color=0,
                fillColor=71,
                fillPattern=1)),
            Rectangle(extent=[-100, 100; 100, 10], style(
                color=67,
                fillColor=7,
                fillPattern=8)),
            Text(
              extent=[-94, -5; 89, -79],
              string="Tsat",
              style(
                color=0,
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
            height=0.6));
      algorithm

        ts := b/(a - Modelica.Math.log10(ps/p_unit)/log_correct) - c -
          t0_antoine;

      end TSatFromPSat;

      function PSatFromTSat
        "calculates saturation pressure ps for given saturation temperature ts according to Antoine"


        input Real a "coefficient a Antoine equation";
        input Real b "coefficient b Antoine equation";
        input Real c "coefficient c Antoine equation";
        input Real p_unit "ps/p_unit is pressure in Pa";
        input Real t0_antoine "ts+t0_antoine is temperature in °C";
        input Real log_correct
          "defines logarithmic basis; log10:log_correct=1.0 ; ln log_correct=0,4342945";

        input SIunits.CelsiusTemperature ts "saturation temperature";
        output SIunits.Pressure ps "saturation pressure";

        annotation (
          Icon(
            Rectangle(extent=[-100, 10; 100, -99], style(
                color=0,
                fillColor=71,
                fillPattern=1)),
            Rectangle(extent=[-100, 100; 100, 10], style(
                color=67,
                fillColor=7,
                fillPattern=8)),
            Text(
              extent=[-94, -5; 89, -79],
              string="Psat",
              style(
                color=0,
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
            height=0.6));
      algorithm

        ps := 10.0^(log_correct*(a - b/(c + ts + t0_antoine)))*p_unit;

      end PSatFromTSat;

      model HeatVaporizationNoProp "enthalpy of vaporization from temperature"
        extends TTInterface.ThermalState.PropertyPort(final n_comp=1);

        annotation (Icon(
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1)),
            Polygon(points=[0, 20; -32, -20; 34, -20; 0, 22; 0, 20], style(
                color=41,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=7,
                fillPattern=7))));

        parameter Integer option_correlation=1
          "selects used correlation; =1:Pitzer acentric factor, =2:Watson";

        TTMedium.MediumSpecificData.Data.MediumThermoFundamentalConstants
          SpecificConstants "record with medium specific constants";

        parameter SIunits.SpecificEnthalpy dh_ref=2256940
          "if option_correlation==2: reference value enthalpy of vaporization for temperature t_ref";
        parameter SIunits.CelsiusTemperature t_ref=100
          "if option_correlation==2: temperature for reference value enthalpy  dh_ref of vaporization";
        parameter Real t_ref_red=(t_ref + 273.15)/SpecificConstants.t_critical;

      protected
        SIunits.SpecificEnthalpy dh_evaporate "enthalpy of vaporization";
        SIunits.CelsiusTemperature ts "saturation temperature";
        Real ts_red "=ts/t_critical";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p><b>H2O</b></p>

<p>
correlation between enthalpy of vaporization dh_evaporate and saturation temperature ts</p>



<p>dh_evaporate=StateCut.h</p>
<p>ts=StateCut.t</p>


<p>various correlations can be used depending on structural parameter option_correlation
<ul>
<li>Pitzer acentric factor correlation
<li>Watson correlation
</ul>

<p>
medium is defined by fundamental constants defined in SpecificConstants; spec. gas constant and acentric factor are
needed for option_correlation=1

</p>

<br>

<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>YES<td>-
</tr>
<tr>
<td>p<td>NO<td>-
</tr>
<tr>
<td>rho<td>NO<td>-
</tr>
<tr>
<td>s<td>NO<td>-
</tr>
<tr>
<td>t<td>YES<td>-
</tr>
<tr>
<td>u<td>NO<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>
<p>
<b><b>SWITCH-PARAMETERS:</b>:-none-

</p>

<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td>  <b>option_correlation</b><td> selects Modelica formulation of Antoine equation</tr>
</tr>

<tr>
<td>1<td> Pitzer acentric factor is used
</tr>

<tr>
<td>2<td>Watson correlation
</tr>

</table>
</p>
<hr>

<hr>



<table border=1>
<tr><td>PARAMETERS:<td>meaning<td>type<td>unit</b></b></p>
</tr>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>dh_ref<td> reference value enthalpy of vaporization <p><b> only needed for Watson correlation!</b><p> <td>SpecificEnthalpy<td>[J/kg/K]
</tr>
<tr>
<td>t_ref<td> temperature for reference value enthalpy of vaporization <p><b> only needed for Watson correlation!</b><p> <td>CelsiusTemperature<td>[°C]
</tr>
</table>
</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Cd3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        ts = StateCut.t;
        ts_red = (ts + 273.15)/SpecificConstants.t_critical;

        if option_correlation == 1 then
          // Pizer acentric factor correlation
          dh_evaporate = SpecificConstants.r_gas*SpecificConstants.t_critical*(
            7.08*(1.0 - ts_red)^0.354 + 10.95*SpecificConstants.omega_acentric*
            (1.0 - ts_red)^0.456);
        end if;

        if option_correlation == 2 then
          //
          dh_evaporate = dh_ref*((1 - ts_red)/(1.0 - t_ref_red))^0.38;
        end if;

        dh_evaporate = StateCut.h;

      end HeatVaporizationNoProp;

      model TSatPSatAntoineNoProp
        "correlation temperature and pressure for saturation state according to Antoine"


        extends TTInterface.ThermalState.PropertyPort(final n_comp=1);

        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[0, 20; -32, -20; 34, -20; 0, 22; 0, 20], style(
                color=41,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=7,
                fillPattern=7))));

        parameter Integer option_mode=1
          "selects calculation procedure; =1:acausal, =2:ts=f(ps), =3:ps=f(ts)";
        TTMedium.MultiPhase.Data.SaturationAntoine AntoineData
          "record with medium-specific constants needed for Antoine model";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p><b>H2O</b></p>

<p>
correlation between vapor pressure ps and saturation temperature ts according to Antoine</p>
<p>log10 (ps/p_unit) = a -b /((ts+t0)+c)</p>


<p>ps=StateCut.p</p>
<p>ts=StateCut.t</p>

<ul>
<li>medium-specific constants, stored in record AntoineData (s.TTMedium.Specific.Data.SaturationAntoine)</li>
<li>a=AntoineData.a</li>
<li>b=AntoineData.b</li>
<li>c=AntoineData.c</li>
</ul>

<p>constants p_unit and t0 are used to adapt units, if constants a,b,c are taken from formulations where
temperature is not in degree Celsius and pressure is not in Pa</p>
<p>(ps[Pa]/p_unit) provides unit of pressure in used Antoine formulation
(e.g. unit in equation is bar then p_unit=1e5)</p>
<p>(ts[°C]+t0) provides temperature in used Antoine formulation (e.g. unit in equation is K the t0 is 273.15)
<ul>
<li>unit constants are also stored in record AntoineData (s.TTMedium.Specific.Data.SaturationAntoine)</li>
<li>p_unit=AntoineData.p_unit</li>
<li>t0=AntoineData.t0</li>
</ul>

<p>
Antoine equation can either be used as euqation or as function (ts from ps or ps from ts) depending on
parameter option_mode
</p>

<br>

<p>used thermal state variables of connector StateCut:</p>

<table border=1>
<tr><td>  Variable<td>Used<td>if optional, depends on structural parameter</tr>
<tr>
<td>h<td>NO<td>-
</tr>
<tr>
<td>p<td>YES<td>-
</tr>
<tr>
<td>rho<td>NO<td>-
</tr>
<tr>
<td>s<td>NO<td>-
</tr>
<tr>
<td>t<td>YES<td>-
</tr>
<tr>
<td>u<td>NO<td>-
</tr>
<tr>
<td>x<td>NO<td>-
</tr>
<tr>
<td>x_i<td>NO<td>-
</tr>
</table>
<p>


<br>


<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>-none-
<hr>
<p>
<b><b>SWITCH-PARAMETERS:</b>:-none-

</p>

<hr>

<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td>  <b>option_mode</b><td> selects Modelica formulation of Antoine equation</tr>
</tr>

<tr>
<td>1<td> acausal equation is used
</tr>

<tr>
<td>2<td>ts=function(ts), using function TSatFromPSat
</tr>

<tr>
<td>3<td> ps=function(ps), using function PSatFromTSat
</tr>

</table>
</p>
<hr>

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

<b>Identification:</b> TechThermo Cd1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        if option_mode == 1 then
          // calculation by equation


            // StateCut.t=AntoineData.b/(AntoineData.a-Modelica.Math.log10(StateCut.p/AntoineData.p_unit))-
          // AntoineData.c-AntoineData.t0_antoine;

          StateCut.p = 10.^(AntoineData.log_correct*(AntoineData.a -
            AntoineData.b/(AntoineData.c + StateCut.t + AntoineData.t0_antoine)))
            *AntoineData.p_unit;

        end if;

        if option_mode == 2 then


            // calculation by function TSatFromPSat, saturation pressure is input, saturation temperature is output
          StateCut.t = TTMedium.MultiPhase.Support.TSatFromPSat(ps=StateCut.p,
            a=AntoineData.a, b=AntoineData.b, c=AntoineData.c, p_unit=
            AntoineData.p_unit, t0_antoine=AntoineData.t0_antoine, log_correct=
            AntoineData.log_correct);
        end if;

        if option_mode == 3 then


            // calculation by function PSatFromTSat, saturation temperature is input, saturation pressure is output
          StateCut.p = TTMedium.MultiPhase.Support.PSatFromTSat(ts=StateCut.t,
            a=AntoineData.a, b=AntoineData.b, c=AntoineData.c, p_unit=
            AntoineData.p_unit, t0_antoine=AntoineData.t0_antoine, log_correct=
            AntoineData.log_correct);
        end if;

      end TSatPSatAntoineNoProp;

      model WetSteamV01NoProp "correlations for thermal state variables in the wet steam region"

        extends TTInterface.ThermalState.PropertyPort(final n_comp=1);

        annotation (Diagram);
        TTMedium.MultiPhase.Support.TwoPhaseMix TwoPhaseMix1
          annotation (extent=[-14, 28; 6, 48]);
        replaceable TTMedium.MultiPhase.Support.TSatPSatAntoineNoProp
          TSatPSatAntoine annotation (extent=[-32, -6; -12, 14]);
        replaceable TTMedium.MultiPhase.Support.HeatVaporizationNoProp
          HeatVaporization annotation (extent=[-22, 64; -2, 84]);
        replaceable TTMedium.Gas.Support.IdealGasVolumetricNoProp
          IdealGasVolumetric annotation (extent=[28, 32; 48, 52]);
        replaceable TTMedium.Liquid.Support.VariableRhoCalVolNoProp
          VariableRhoCalVol annotation (extent=[-72, 32; -52, 52]);

            //-----Start Documentation----------------------------------------------
    annotation (Documentation(info="

<html>
<p>
correlations for caloric and volumetric state variable in wet steam region. No specification of
working medium.
</p>
combination of five property <b>models</b>:
<ul>
<li><b>TSatPSatAntoine</b>: correlation saturation temperature/ saturation pressure</li>
<li><b>HeatVaporization</b>: heat of vaporization for given pressure</li>
<li><b>IdealGasVolumetric</b>: volumetric properties of saturated steam</li>
<li><b>VariableRhoCalVolNoProp</b>: properties of saturated liquid</li>
<li><b>TwoPhaseMix1</b>: calculation of two-phase properties from input of the other four models</li>
</ul>
medium is specified by replaceable models TSatPSatAntoine, HeatVaporization, IdealGasVolumetric and
VariableRhoCalVolNoProp


<hr>
<p><b>used thermal state variables of connector StateCut:</b> depend on models selected as TSatPSatAntoine, HeatVaporization, IdealGasVolumetric and
VariableRhoCalVolNoProp</p>


<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b> redeclaration of TSatPSatAntoine, HeatVaporization, IdealGasVolumetric and
VariableRhoCalVolNoProp depending on medium
<hr>


<b> ASSUMPTIONS:</b> depend on models selected as TSatPSatAntoine, HeatVaporization, IdealGasVolumetric and
VariableRhoCalVolNoProp</p>
<hr>



<b>SWITCH-PARAMETERS:</b>depend on models selected as TSatPSatAntoine, HeatVaporization, IdealGasVolumetric and
VariableRhoCalVolNoProp</p>

<hr>

<b>OPTION-PARAMETERS:</b>depend on models selected as TSatPSatAntoine, HeatVaporization, IdealGasVolumetric and
VariableRhoCalVolNoProp</p>
<hr>

<b>PARAMETERS:</b>depend on models selected as TSatPSatAntoine, HeatVaporization, IdealGasVolumetric and
VariableRhoCalVolNoProp</p>
<hr>


<b>Identification:</b> TechThermo Cb1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));




        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1)),
            Polygon(points=[0, 20; -32, -20; 32, -20; 0, 20], style(
                color=41,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=7,
                fillPattern=7))));
      equation

        connect(TwoPhaseMix1.TwoPhase, TSatPSatAntoine.StateCut) annotation (
            points=[-4, 27; -2, 27; -2, -14; -22, -14; -22, -7], style(color=8));
        connect(HeatVaporization.StateCut, TwoPhaseMix1.Evaporation)
          annotation (points=[-12, 63; -8, 63; -8, 49; -4, 49], style(color=8));
        connect(TwoPhaseMix1.SatSteam, IdealGasVolumetric.StateCut) annotation
          (points=[7, 38; 14, 38; 14, 10; 40, 10; 40, 31; 38, 31], style(color=
                8));
        connect(VariableRhoCalVol.StateCut, TwoPhaseMix1.SatLiquid) annotation
          (points=[-62, 31; -62, 24; -24, 24; -24, 38; -15, 38], style(color=8));

        connect(TwoPhaseMix1.TwoPhase, StateCut) annotation (points=[-4, 27; 2,
               -100], style(
            color=8,
            fillColor=1,
            fillPattern=1));

      end WetSteamV01NoProp;

      model LiquidWetSteamV01NoProp
        extends TTInterface.ThermalState.PropertyPort(final n_comp=1);

        replaceable TTMedium.MultiPhase.Support.WetSteamV01NoProp WetSteam
          annotation (extent=[25, 25; 75, 75]);

        replaceable TTMedium.Liquid.Support.VariableRhoCalVolNoProp Liquid
          annotation (extent=[-75, 25; -25, 75]);

        parameter Boolean switch_p_selection=true
          "if switch_p_selection=true then pressure is used to determine steam quality";

        parameter Boolean switch_t_selection=false
          "if switch_t_selection=true then temperature t is used to determine steam quality";

        parameter Boolean switch_h_selection=true
          "if switch_h_selection=true then spec. enthalpy h is used to determine steam quality";

        parameter Boolean switch_rho_selection=false
          "if switch_rho_selection=true then density rho is used to determine steam quality";

        parameter Boolean switch_u_selection=false
          "if switch_u_selection=true then internal energy u is used to determine steam quality";

        parameter Boolean switch_s_selection=false
          "if switch_s_selection=true then spec. entropy s is used to determine steam quality";


          //-------------values of parameters used as dummy-values for the liquid state property routine

        parameter SIunits.Pressure p_liquid_dummy=1.e5 "dummy value for pressure liquid state property routine if
\t  steam quality>0";
        parameter SIunits.CelsiusTemperature t_liquid_dummy=50 "dummy value for temperature liquid state property routine if
\t  steam quality>0";

        annotation (Icon(
            Polygon(points=[-100, 60; 0, 60; 0, 20; -100, -100; -100, 60],
                style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[-75, 45; -55, -5; -35, 45], style(color=0, fillPattern
                  =1)),
            Polygon(points=[0, 60; 0, 20; 100, -100; 100, 60; 0, 60], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Line(points=[75, 45; 45, 45; 35, 35; 35, 5; 45, -5; 75, -5], style(
                  color=0, fillPattern=1)),
            Polygon(points=[0, 20; -32, -20; 32, -20; 0, 20], style(
                color=41,
                fillColor=7,
                fillPattern=8)),
            Polygon(points=[-32, -20; -66, -60; 68, -60; 34, -20; -32, -20],
                style(
                color=69,
                fillColor=69,
                fillPattern=1))));




      equation

        if switch_p_selection == true then
          WetSteam.StateCut.p = StateCut.p;
          Liquid.StateCut.p = StateCut.p;
        end if;

        if switch_t_selection == true then
          WetSteam.StateCut.t = StateCut.t;
          Liquid.StateCut.t = StateCut.t;
        end if;

        if switch_h_selection == true then
          WetSteam.StateCut.h = StateCut.h;
          Liquid.StateCut.h = StateCut.h;
        end if;

        if switch_rho_selection == true then
          WetSteam.StateCut.rho = StateCut.rho;
          Liquid.StateCut.rho = StateCut.rho;
        end if;

        if switch_u_selection == true then
          WetSteam.StateCut.u = StateCut.u;
          Liquid.StateCut.u = StateCut.u;
        end if;

        if switch_s_selection == true then
          WetSteam.StateCut.s = StateCut.s;
          Liquid.StateCut.s = StateCut.s;
        end if;

        if WetSteam.StateCut.x >= 0.0 then


            //wet steam condition; connector variables from property routine WetSteam are assigned to connector StateCut

          if switch_p_selection == false then
            WetSteam.StateCut.p = StateCut.p;
          end if;

          if switch_t_selection == false then
            WetSteam.StateCut.t = StateCut.t;
          end if;

          if switch_h_selection == false then
            WetSteam.StateCut.h = StateCut.h;
          end if;

          if switch_rho_selection == false then
            WetSteam.StateCut.rho = StateCut.rho;
          end if;

          if switch_u_selection == false then
            WetSteam.StateCut.u = StateCut.u;
          end if;

          if switch_s_selection == false then
            WetSteam.StateCut.s = StateCut.s;
          end if;

          WetSteam.StateCut.x = StateCut.x;

        else
          //liquid state condition

          if switch_p_selection == false then
            Liquid.StateCut.p = StateCut.p;
          end if;

          if switch_t_selection == false then
            Liquid.StateCut.t = StateCut.t;
          end if;

          if switch_h_selection == false then
            Liquid.StateCut.h = StateCut.h;
          end if;

          if switch_rho_selection == false then
            Liquid.StateCut.rho = StateCut.rho;
          end if;

          if switch_u_selection == false then
            Liquid.StateCut.u = StateCut.u;
          end if;

          if switch_s_selection == false then
            Liquid.StateCut.s = StateCut.s;
          end if;

          Liquid.StateCut.x = StateCut.x;

        end if;

        Liquid.StateCut.x = -1.0;
        Liquid.StateCut.x_i = StateCut.x_i;
        WetSteam.StateCut.x_i = StateCut.x_i;

      end LiquidWetSteamV01NoProp;

    end Support;

    package Data
      extends Modelica.Icons.Library;

      annotation (Documentation(info="
content package: Data for calculation of physical properties of multiphase media

Date of last modification:27-09-01, 16:00
Description last modification: s. package info
Author last modification:wds

identification: TechThermo CdD
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Rectangle(extent=[-18, 29; 53, -74], style(color=0, fillColor=7)),
          Line(points=[-12, 19; 48, 19], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-12, 10; 48, 10], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-12, 2; 48, 2], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Rectangle(extent=[-44, 23; 27, -80], style(color=0, fillColor=7)),
          Line(points=[-38, 13; 22, 13], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-38, 4; 22, 4], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-38, -4; 22, -4], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Rectangle(extent=[-72, 17; -1, -86], style(color=0, fillColor=7)),
          Line(points=[-66, 7; -6, 7], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-66, -2; -6, -2], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-66, -10; -6, -10], style(
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
          height=0.6));

      record SaturationAntoine
        "structure data-set needed for Antoine equation, not specified "

        parameter Real a=-1 "coefficient a Antoine equation";
        parameter Real b=-1 "coefficient b Antoine equation";
        parameter Real c=-1 "coefficient c Antoine equation";

        parameter Real p_unit=1 "factor to adapt pressure unit";
        parameter Real t0_antoine=0.0 "ts+t0_antoine is temperature in °C";
        parameter Real log_correct=1.0
          "adaptation of logarithmic basis: log10: log_correct=1.0, ln: log_correct=0,4342945";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p><b>
general data structure, not medium specific:
</b></p>
<p>
record with parameters needed for correlation between saturation temperature and saturation
pressure according to Antoine
</p>
<p>
</p>
<p>In literature different definitions are given for the Antoine equation. Three different parameters
(p_unit, t0_antoine, log_correct) are introduce to adapt the values for the three parameters a,b,c
</p>
<p></p>
<ul>
<li><b>Pressure Unit:</b>parameter p_unit is used to adapt the pressure unit to Pa (=N/m2); p_unit is the relation
pressure unit Pascal (N/m2) to the pressure unit used in the formulation from which the parameters a,b,c are
taken. Examples: formulation uses bar as pressure, then p_unit is 1e5; if pressure unit is Torr (mm Hg) then
p_unit is 133.</li>
<li><b>Temperature Unit:</b>parameter t0_antoine is used to adapt the temperature unit to degree Celsius;
if formulation uses Kelvin, t0_antoine is -273.15</li>
<li><b>basis of logarithmus</b>TechThermo uses basis 10 for logarithmus; if e is used, parameter
log_correct is </li>
</ul>
<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>a<td>1<td>parameter a Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>b<td>1<td>parameter b Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>c<td>1<td>parameter c Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>p_unit<td>1.0<td>factor to adapt pressure unit<td>Real<td>[-]
</tr>
<tr>
<td>t0_antoine<td>0.0<td>parameter to adapt temperature unit<td>Real<td>[-]
</tr>
<tr>
<td>log_correct<td>1.0<td>factor to adapt basis of logarithmus<td>Real<td>[-]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CdD1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(
            Line(points=[-120, 0; -60, 0], style(color=71, fillPattern=1)),
            Line(points=[60, 0; 120, 0], style(color=71, fillPattern=1)),
            Rectangle(extent=[-120, 120; 120, -120], style(color=0)),
            Rectangle(extent=[-122, 120; 80, -82], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Polygon(points=[-122, -82; -80, -120; 120, -120; 120, 80; 80, 120;
                  80, -82; -122, -82], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, 34; -6, 34], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, 104; -6, 104], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, 104; -78, -64], style(color=0)),
            Line(points=[-4, 104; -4, -64], style(color=0))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end SaturationAntoine;

      record H2oSaturationAntoine
        "data for calculation saturation-state water according to Antoine"

        extends SaturationAntoine(
          a=8.0732991,
          b=1656.39,
          c=226.86,
          p_unit=100,
          t0_antoine=0.0,
          log_correct=1.0);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p><b>
Water:
</b></p>
<p>
record with parameters needed for correlation between saturation temperature and saturation
pressure according to Antoine
</p>
<p>
</p>
<p>In literature different definitions are given for the Antoine equation. Three different parameters
(p_unit, t0_antoine, log_correct) are introduced to adapt the values for the three parameters a,b,c
</p>
<p></p>
<ul>
<li><b>Pressure Unit:</b>parameter p_unit is used to adapt the pressure unit to Pa (=N/m2); p_unit is the relation
pressure unit Pascal (N/m2) to the pressure unit used in the formulation from which the parameters a,b,c are
taken. Examples: formulation uses bar as pressure, then p_unit is 1e5; if pressure unit is Torr (mm Hg) then
p_unit is 133.</li>
<li><b>Temperature Unit:</b>parameter t0_antoine is used to adapt the temperature unit to degree Celsius;
if formulation uses Kelvin, t0_antoine is -273.15</li>
<li><b>basis of logarithmus</b>TechThermo uses basis 10 for logarithmus; if e is used, parameter
log_correct is </li>
</ul>
<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>a<td>8.0732991<td>parameter a Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>b<td>1656.39<td>parameter b Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>c<td>226.86<td>parameter c Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>p_unit<td>100.0<td>factor to adapt pressure unit<td>Real<td>[-]
</tr>
<tr>
<td>t0_antoine<td>0.0<td>parameter to adapt temperature unit<td>Real<td>[-]
</tr>
<tr>
<td>log_correct<td>1.0<td>factor to adapt basis of logarithmus<td>Real<td>[-]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CdD2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));


          //--------------------------end documentation------------------------------

      end H2oSaturationAntoine;

      record CO2SaturationAntoine
        "data for calculation saturation-state CO2 according to Antoine"

        extends SaturationAntoine(
          a=6.6794,
          b=849.48,
          c=271.04,
          p_unit=1000,
          t0_antoine=0.0,
          log_correct=1.0);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p><b>
Water:
</b></p>
<p>
record with parameters needed for correlation between saturation temperature and saturation
pressure according to Antoine
</p>
<p>
</p>
<p>In literature different definitions are given for the Antoine equation. Three different parameters
(p_unit, t0_antoine, log_correct) are introduced to adapt the values for the three parameters a,b,c
</p>
<p></p>
<ul>
<li><b>Pressure Unit:</b>parameter p_unit is used to adapt the pressure unit to Pa (=N/m2); p_unit is the relation
pressure unit Pascal (N/m2) to the pressure unit used in the formulation from which the parameters a,b,c are
taken. Examples: formulation uses bar as pressure, then p_unit is 1e5; if pressure unit is Torr (mm Hg) then
p_unit is 133.</li>
<li><b>Temperature Unit:</b>parameter t0_antoine is used to adapt the temperature unit to degree Celsius;
if formulation uses Kelvin, t0_antoine is -273.15</li>
<li><b>basis of logarithmus</b>TechThermo uses basis 10 for logarithmus; if e is used, parameter
log_correct is </li>
</ul>
<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>a<td>6.6794<td>parameter a Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>b<td>849.48<td>parameter b Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>c<td>271.04<td>parameter c Antoine correlation<td>Real<td>[-]
</tr>
<tr>
<td>p_unit<td>1000.0<td>factor to adapt pressure unit<td>Real<td>[-]
</tr>
<tr>
<td>t0_antoine<td>0.0<td>parameter to adapt temperature unit<td>Real<td>[-]
</tr>
<tr>
<td>log_correct<td>1.0<td>factor to adapt basis of logarithmus<td>Real<td>[-]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo Cb1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));


          //--------------------------end documentation------------------------------

      end CO2SaturationAntoine;

    end Data;

  end MultiPhase;

  package MultiComponent
    "thermophysical correlations multi-component medium TTcode:Ce"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations single component liquid

identification: TechThermo Ce
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 37; 69, -89], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Polygon(points=[-11, 30; -37, -12; 16, -12; -10, 29; -11, 30], style(
              fillColor=41)),
        Polygon(points=[-57, -44; 37, -44; 15, -11; -36, -11; -57, -44], style(
              fillColor=69)),
        Polygon(points=[-80, -80; 60, -80; 37, -44; -57, -44; -80, -80], style(
              fillColor=0)),
        Line(points=[-85, 14; -85, 21; -77, 28; -66, 28; -60, 21; -60, 14; -85,
               -1; -85, -9; -61, -9], style(color=0)),
        Line(points=[40, 30; 40, -12], style(color=0)),
        Line(points=[20, 10; 60, 10], style(color=0))),
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

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Medium.MultiComponent

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo CeS
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

      model MixFractionsMolarToMass
        "correlates mass fractions to mole (volume) fractions in a mixture"

        parameter Integer n_comp=4 "number of components";
        TTInterface.ThermalState.In MassFraction(n_comp=n_comp)
          "thermal state boiling liquid" annotation (extent=[-10, 100; 10, 120]);

        parameter SIunits.MolarMass molmass_const[n_comp]=ones(n_comp) "vector with parameter values for molar masses of components,
\t used if switch_molmass_parameter==true";
        SIunits.MolarMass molmass[n_comp]
          "vector with values for molar masses of components";

        SIunits.MoleFraction y_i[n_comp] "molar (volume) fraction vector";

        SIunits.MolarMass m_mol_mix "apparent molecular weight of mixture";

        parameter Boolean switch_molmass_parameter=true
          "if switch_molmass_parameter==true then molmass=molmass_const";
      equation

        if switch_molmass_parameter == true then


            // molar masses of components defined by parameters in vector molmass_const
          molmass = molmass_const;
        end if;

        m_mol_mix = (1 - sum(y_i[2:n_comp]))*molmass[1] + y_i[2:n_comp]*molmass[
          2:n_comp];
        MassFraction.x_i[2:n_comp] = diagonal(molmass[2:n_comp])*y_i[2:n_comp]/
          m_mol_mix;

        y_i[1] = 1 - sum(y_i[2:n_comp]);

      end MixFractionsMolarToMass;

      model MixGasFundamentals
        "correlation for gas constant, heat capacity, molar fractions, partial pressures for mixtures from  mass fractions and molar masses of components"


        parameter Integer n_comp=4 "number of components";
        TTInterface.ThermalState.In MassFraction(n_comp=n_comp)
          "thermal state boiling liquid" annotation (extent=[-10, 100; 10, 120]);

        parameter SIunits.MolarMass molmass_const[n_comp]=ones(n_comp) "vector with parameter values for molar masses of components,
\t used if switch_molmass_parameter==true";
        SIunits.MolarMass molmass[n_comp]
          "vector with values for molar masses of components";

        parameter Boolean switch_molmass_parameter=true
          "if switch_molmass_parameter==true then molmass=molmass_const";

        SIunits.SpecificHeatCapacity r_gas_mix "gas constant for mixture";

        SIunits.MolarMass m_mol_mix "apparent molecular weight of mixture";

        SIunits.MoleFraction y_i[n_comp] "molar (volume) fraction vector";

        SIunits.Pressure p_partial[n_comp] "partial pressure of components";

      protected
        SIunits.SpecificHeatCapacity r_gas_comp[n_comp]
          "gas constants for components";
      equation

        if switch_molmass_parameter == true then


            // molar masses of components defined by parameters in vector molmass_const
          molmass = molmass_const;
        end if;

        for i_comp in 1:n_comp loop
          // calculation of gas-constants for components
          r_gas_comp[i_comp] = GeneralConstants.R/molmass[i_comp];
        end for;

        // gas constant mixture
        r_gas_mix = (1 - sum(MassFraction.x_i[2:n_comp]))*r_gas_comp[1] +
          MassFraction.x_i[2:n_comp]*r_gas_comp[2:n_comp];

        // apparent molecular weight of mixture
        m_mol_mix*r_gas_mix = GeneralConstants.R;

        // mass fraction of components 2-n_comp:
        MassFraction.x_i[2:n_comp] = diagonal(molmass[2:n_comp])*y_i[2:n_comp]/
          m_mol_mix;

        // sum mass fractions =1.0
        y_i[1] = 1 - sum(y_i[2:n_comp]);

        // partial pressure
        p_partial = y_i*MassFraction.p;

      end MixGasFundamentals;

    end Support;

  end MultiComponent;

  package MediumSpecificData "thermophysical data TTcode:Cf"
    extends Modelica.Icons.Library;

    annotation (
      Icon(
        Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Rectangle(extent=[-18, 29; 53, -74], style(color=0, fillColor=7)),
        Line(points=[-12, 19; 48, 19], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-12, 10; 48, 10], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-12, 2; 48, 2], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Rectangle(extent=[-44, 23; 27, -80], style(color=0, fillColor=7)),
        Line(points=[-38, 13; 22, 13], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-38, 4; 22, 4], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-38, -4; 22, -4], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Rectangle(extent=[-72, 17; -1, -86], style(color=0, fillColor=7)),
        Line(points=[-66, 7; -6, 7], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-66, -2; -6, -2], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[-66, -10; -6, -10], style(
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
        height=0.6));

    package Data
      "Data for calculation of physical properties of specific media CfD"
      extends Modelica.Icons.Library;

      annotation (Documentation(info="
content package: Data for calculation of physical properties of specific media

Date of last modification:27-09-01, 16:00
Description last modification: s. package info
Author last modification:wds

identification: TechThermo CfD
"));

      annotation (
        Icon(
          Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
          Rectangle(extent=[-91, 38; 69, -90]),
          Rectangle(extent=[-18, 29; 53, -74], style(color=0, fillColor=7)),
          Line(points=[-12, 19; 48, 19], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-12, 10; 48, 10], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-12, 2; 48, 2], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Rectangle(extent=[-44, 23; 27, -80], style(color=0, fillColor=7)),
          Line(points=[-38, 13; 22, 13], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-38, 4; 22, 4], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-38, -4; 22, -4], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Rectangle(extent=[-72, 17; -1, -86], style(color=0, fillColor=7)),
          Line(points=[-66, 7; -6, 7], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-66, -2; -6, -2], style(
              color=0,
              fillColor=7,
              fillPattern=1)),
          Line(points=[-66, -10; -6, -10], style(
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
          height=0.6));

      record ReferenceState
        "record defining reference state for thermophyscial properties TTcode:CfD1"



          //---------------parameters defining reference point -------------------------------------
        parameter SIunits.SpecificEnthalpy h0=0.0
          "spec. enthalpy reference state";
        parameter SIunits.SpecificEntropy s0=0.0
          "spec. entropy reference state";
        parameter SIunits.CelsiusTemperature t0=0.0 "reference temperature";
        parameter SIunits.Pressure p0=1e5
          "pressure reference state MUST NOT BE ZERO!";
        parameter SIunits.Density rho0=1.0
          "density reference state MUST NOT BE ZERO!";
        parameter SIunits.SpecificInternalEnergy u0=h0 - p0/rho0
          "spec. internal energy";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
record with declaration of parameters definig reference state:
</p>
<p>
</p>
<p><b>p0 and rho0 MUST NOT BE ZERO DUE TO CALCULATION OF SPEC. ENTROPY!</b></p>
<p>reference value internal energy is calculated from reference values h, rho and p<p>


<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>h0<td>0.0<td>reference value spec. enthalpy<td>SpecificEnthalpy<td>[J/kg]
</tr>
<tr>
<td>s0<td>0.0<td>reference value spec. entropy<td>SpecificEntropy<td>[J/kg/K]
</tr>
<tr>
<td>t0<td>0.0<td>reference temperature<td>CelsiusTemperature<td>[°C]
</tr>
<tr>
<td>rho0<td>1.0<td>density reference state MUST NOT BE ZERO!<td>Density<td>[kg/m3]
</tr>
<tr>
<td>p0<td>1.013e5<td>pressure reference state MUST NOT BE ZERO!<td>Pressure<td>[Pa]
</tr>
<tr>
<td>u0<td>=h0 - p0/rho0<td>specific gas constant<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CfD1<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(
            Line(points=[-120, 0; -60, 0], style(color=71, fillPattern=1)),
            Line(points=[60, 0; 120, 0], style(color=71, fillPattern=1)),
            Rectangle(extent=[-120, 120; 120, -120], style(color=0)),
            Rectangle(extent=[-122, 120; 80, -82], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Polygon(points=[-122, -82; -80, -120; 120, -120; 120, 80; 80, 120;
                  80, -82; -122, -82], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, 34; -6, 34], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, 104; -6, 104], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, 104; -78, -64], style(color=0)),
            Line(points=[-6, 104; -6, 34], style(color=0)),
            Line(points=[-78, 34; -4, -62], style(color=0))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end ReferenceState;

      record MediumThermoFundamentalConstants
        "thermophysical constants of a medium TTcode:CfD2"
        parameter SIunits.MolarMass m_mol "molar mass";
        // molar mass [kg/mol]
        parameter SIunits.ThermodynamicTemperature t_critical
          "critical temperature";
        // critical temperature [Kelvin]
        parameter SIunits.Pressure p_critical "critical pressure";
        //critical pressure [N/m**2]
        parameter SIunits.Density rho_critical "critical density";
        //critical density [kg/m**3]

        parameter SIunits.SpecificHeatCapacity r_gas=GeneralConstants.R/m_mol
          "specific gas constant";

        parameter Real omega_acentric "acentric factor";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
record with definition of types for fundamental constants of a working fluid
</p>
<p>no definition of specific values</p>



<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>m_mol<td>-<td>molar mass<td>MolarMass<td>[kg/mol]
</tr>
<tr>
<td>t_critical<td>-<td>critical temperature<td>ThermodynamicTemperature<td>[K]
</tr>
<tr>
<td>p_critical<td>-<td>critical pressure<td>Pressure<td>[Pa]
</tr>
<tr>
<td>rho_critical<td>-<td>critical density<td>Density<td>[kg/m3]
</tr>
<tr>
<td>r_gas<td>GeneralConstants.R/m_mol<td>specific gas constant<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>
<tr>
<td>omega_acentric<td>-<td>acentric factor<td>Real<td>-
</tr>
</table>
</p>
<hr>
</pre>
</p>

<b>Identification:</b> TechThermo CfD2<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(
            Line(points=[-120, 0; -60, 0], style(color=71, fillPattern=1)),
            Line(points=[60, 0; 120, 0], style(color=71, fillPattern=1)),
            Rectangle(extent=[-120, 120; 120, -120], style(color=0)),
            Rectangle(extent=[-122, 120; 80, -82], style(
                color=0,
                fillColor=7,
                fillPattern=1)),
            Polygon(points=[-122, -82; -80, -120; 120, -120; 120, 80; 80, 120;
                  80, -82; -122, -82], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-112, 102; 30, 102], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-112, 80; 30, 80], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-112, 56; 30, 56], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-112, 32; -40, 32], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-112, 16; -40, 16], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-112, -2; -40, -2], style(
                color=0,
                fillColor=0,
                fillPattern=1))), Coordsys(
            extent=[-120, -120; 120, 120],
            grid=[2, 2],
            component=[60, 60]));

      end MediumThermoFundamentalConstants;

      record AirThermoFundamentalConstants
        extends MediumThermoFundamentalConstants(
          m_mol=0.028953,
          t_critical=132.5,
          p_critical=37.66e5,
          rho_critical=312.989);


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
record with values for fundamental constants of dry air
</p>
<p>extends MediumThermoFundamentalConstants</p>



<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>m_mol<td>0.028953<td>molar mass<td>MolarMass<td>[kg/mol]
</tr>
<tr>
<td>t_critical<td>132.5<td>critical temperature<td>ThermodynamicTemperature<td>[K]
</tr>
<tr>
<td>p_critical<td>37.66e5<td>critical pressure<td>Pressure<td>[Pa]
</tr>
<tr>
<td>rho_critical<td>312.989<td>critical density<td>Density<td>[kg/m3]
</tr>
<tr>
<td>r_gas<td>GeneralConstants.R/m_mol<td>specific gas constant<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>
</table>
</p>
<hr>
</pre>
</p>

<b>Identification:</b> TechThermo CfD3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

        annotation (Icon(Rectangle(extent=[-112, -12; 66, -72], style(fillColor
                  =67))));

      end AirThermoFundamentalConstants;

      record CO2ThermoFundamentalConstants "thermophysical constants of CO2"

        extends MediumThermoFundamentalConstants(
          m_mol=0.0440098,
          t_critical=304.1,
          p_critical=73.77e5,
          rho_critical=467.50818,
          omega_acentric=0.239);

        annotation (Icon(Rectangle(extent=[-112, -12; 66, -72], style(fillColor
                  =46))));


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
record with values for fundamental constants of CO2
</p>
<p>extends MediumThermoFundamentalConstants</p>



<hr>
<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>m_mol<td>0.0440098<td>molar mass<td>MolarMass<td>[kg/mol]
</tr>
<tr>
<td>t_critical<td>304.1<td>critical temperature<td>ThermodynamicTemperature<td>[K]
</tr>
<tr>
<td>p_critical<td>73.77e5<td>critical pressure<td>Pressure<td>[Pa]
</tr>
<tr>
<td>rho_critical<td>467,50818<td>critical density<td>Density<td>[kg/m3]
</tr>
<tr>
<td>r_gas<td>GeneralConstants.R/m_mol<td>specific gas constant<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CfD4<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      end CO2ThermoFundamentalConstants;

      record HeThermoFundamentalConstants
        "thermophysical constants of helium He"

        extends MediumThermoFundamentalConstants(
          m_mol=0.0040026,
          t_critical=5.19,
          p_critical=2.27e5,
          rho_critical=69.979,
          omega_acentric=-0.365);

        annotation (Icon(Rectangle(extent=[-112, -12; 66, -72], style(fillColor
                  =1))));


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
record with values for fundamental constants of CO2
</p>
<p>extends MediumThermoFundamentalConstants</p>



<hr>

<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>m_mol<td>0.0040026<td>molar mass<td>MolarMass<td>[kg/mol]
</tr>
<tr>
<td>t_critical<td>5.19<td>critical temperature<td>ThermodynamicTemperature<td>[K]
</tr>
<tr>
<td>p_critical<td>2.27e5<td>critical pressure<td>Pressure<td>[Pa]
</tr>
<tr>
<td>rho_critical<td>69,979<td>critical density<td>Density<td>[kg/m3]
</tr>
<tr>
<td>r_gas<td>GeneralConstants.R/m_mol<td>specific gas constant<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CfD5<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      end HeThermoFundamentalConstants;

      record H2oThermoFundamentalConstants "thermophysical constants of water"

        extends MediumThermoFundamentalConstants(
          m_mol=0.018,
          t_critical=647.13,
          p_critical=220.55e5,
          rho_critical=321.5434,
          omega_acentric=0.344);

        annotation (Icon(Rectangle(extent=[-112, -12; 66, -72], style(fillColor
                  =70))));


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
record with values for fundamental constants of H2O
</p>
<p>extends MediumThermoFundamentalConstants</p>



<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>m_mol<td>0.018<td>molar mass<td>MolarMass<td>[kg/mol]
</tr>
<tr>
<td>t_critical<td>647.13<td>critical temperature<td>ThermodynamicTemperature<td>[K]
</tr>
<tr>
<td>p_critical<td>220.55e5<td>critical pressure<td>Pressure<td>[Pa]
</tr>
<tr>
<td>rho_critical<td>321.5434<td>critical density<td>Density<td>[kg/m3]
</tr>
<tr>
<td>r_gas<td>GeneralConstants.R/m_mol<td>specific gas constant<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CfD6<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      end H2oThermoFundamentalConstants;

      record H2ThermoFundamentalConstants "thermophysical constants of H2"

        extends MediumThermoFundamentalConstants(
          m_mol=0.0020159,
          t_critical=33.2,
          p_critical=12.97,
          rho_critical=30.9981,
          omega_acentric=0.344);

        annotation (Icon(Rectangle(extent=[-112, -12; 66, -72], style(fillColor
                  =1))));


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
record with values for fundamental constants of H2
</p>
<p>extends MediumThermoFundamentalConstants</p>



<hr>


<table border=1>
<tr><td>PARAMETERS:<td>value<td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>m_mol<td>0.018<td>molar mass<td>MolarMass<td>[kg/mol]
</tr>
<tr>
<td>t_critical<td>647.13<td>critical temperature<td>ThermodynamicTemperature<td>[K]
</tr>
<tr>
<td>p_critical<td>220.55e5<td>critical pressure<td>Pressure<td>[Pa]
</tr>
<tr>
<td>rho_critical<td>321.5434<td>critical density<td>Density<td>[kg/m3]
</tr>
<tr>
<td>r_gas<td>GeneralConstants.R/m_mol<td>specific gas constant<td>SpecificHeatCapacity<td>[J/kg/K]
</tr>
</table>
</p>
<hr>

</pre>
</p>

<b>Identification:</b> TechThermo CfD6<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));

      end H2ThermoFundamentalConstants;

    end Data;

    //ppppppppppppppppppppppppppppppppppppppppppppppppp

  end MediumSpecificData;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package MathTool

    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: mathematical tools

identification: TechThermo Cg
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 38; 69, -90]),
        Rectangle(extent=[-91, 38; 69, -90], style(fillColor=7, fillPattern=1)),

        Line(points=[-60, -9; -42, -65; -24, 20; 39, 20], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[41, -17; 8, -61], style(
            color=0,
            fillColor=7,
            fillPattern=1)),
        Line(points=[4, -18; 43, -61], style(
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
        height=0.6));

    package Support
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Medium.MathTool

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo CgS
"));

      annotation (Documentation(info="

content package:
supporting models for package Medium.Gas

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo CaS
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

      function SolveCubicCardano "Solution cubic equation according to Cardano"


        input Real c1;
        input Real c2;
        input Real c3;
        input Real c4;
        //coefficients cubic equation c1*x**3+c2*x**2+c3*x+c4=0.0
        output Real x[4];
        //solution vector, x[4] is number of real solutions
        constant Real pi=Modelica.Constants.pi;
      protected
        Real p;
        Real q;
        Real r;
        Real z1;
        Real z2;
        Real z3;
        Real a;
        Real b;
        Real root;
        //local variables used for substitution
        Real phi;
        //local variables used in casus irreducibilis
        Real u;
        Real v;
        //local variables used in casus cardano


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

    function for solving cubic equation according to Cardano

    c1*x^3+c2*x^2+c3*x+c4=0.0

    input: coefficients c1,c2,c3,c4
    output: result vector with solutions x[4]
            x[4] indicates number of real solutions

 	ONLY REAL SOLUTIONS ARE CONSIDERED!


        distinction between
       1.casus Cardani (one real solution and two complex
       solutions): x[1]=real solution
                   x[2]=-42 (dummy value)
                   x[3]=-42 (dummy value)

       2.casus irreducibilis (three real solutions)
       x[1]=first real solutions
       x[2]=second real solutions
       x[3]=third real solutions

      Identification: TechThermo
      Example: TechThermo
      "));
      algorithm


          //--------------------------end documentation------------------------------

        //substitutions
        p := c2/c1;
        q := c3/c1;
        r := c4/c1;

        a := p^2/9.0 - q/3;
        b := p*q/6 - p^3.0/27 - r/2.0;

        //      decision: casus cardani or casus irreducibilis
        if (b^2.0) > (a^3) then


            //              casus cardani: one real solution and two complex solutions
          x[4] := 1;
          //number of real solutions

          root := sqrt(b^2.0 - a^3.0);
          if (b + root) > 0.0 then
            u := (b + root)^(1./3.);
          else
            u := -((-1*(b + root))^(1./3.));
          end if;
          if (b - root) > 0.0 then
            v := (b - root)^(1./3.);
          else
            v := -(-1.0*(b - root))^(1./3.);
          end if;

          //              only real solution is calculated:
          z1 := u + v;
          x[1] := z1 - p/3.0;
          // single real solution
          x[2] := -42;
          //dummy-value instead of complex solution
          x[3] := -42;
          //dummy-value instead of complex solution


            // dummy-values for local variables only needed for casus irreducibilis,
          // not relevant for casus cardano
          phi := -42;

        else
          //      casus irreducibilis: three real solutions
          x[4] := 3;
          //number of real solutions
          if a > 0.0 then
            root := sqrt(a);
          else
            root := sqrt(-a);
          end if;

          phi := Modelica.Math.acos(b/a/root);

          z1 := 2*root*cos(phi/3.0);
          z2 := 2*root*cos((phi + 2.0*pi)/3.0);
          z3 := 2*root*cos((phi + 4.0*pi)/3.0);

          x[1] := z1 - p/3.0;
          x[2] := z2 - p/3.0;
          x[3] := z3 - p/3.0;

          //                x[2]:=-23;
          //                 x[3]:=-23;

          // dummy-values for local variables only needed for casus Cardano
          // not relevant for casus irreducibilis:
          u := -42;
          v := -42;

        end if;

      end SolveCubicCardano;

    end Support;

  end MathTool;

end Medium;
