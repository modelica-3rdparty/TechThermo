package Subsystem
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
  package TTSubsystem = TT.Subsystem;

  annotation (Documentation(info="
content package: models describing subsystems of thermodynamic systems

Date of last modification:27-09-01, 16:00
Description last modification: s. package info
Author last modification:wds

identification: TechThermo f
"));

  annotation (
    Icon(
      Rectangle(extent=[-91, 38; 69, -90]),
      Rectangle(extent=[-89, 38; 71, -90], style(fillColor=55, fillPattern=1)),

      Rectangle(extent=[-61, 18; 57, -69], style(
          color=7,
          fillColor=0,
          fillPattern=1)),
      Polygon(points=[2, 37; -32, -14; 43, -13; 2, 37], style(
          color=2,
          fillColor=2,
          fillPattern=1)),
      Polygon(points=[4, -34; -30, -85; 45, -84; 4, -34], style(
          color=67,
          fillColor=4,
          fillPattern=1)),
      Polygon(points=[-42, 1; -42, -56; -84, -27; -83, -27; -42, 1], style(
          color=45,
          fillColor=45,
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

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package Cycle
    //wds 14.01.02 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
Date of last modification:14-01-02, 14:00
Description last modification: s. package info
Author last modification:wds
content package: models for thermodynamic cycles

identification: TechThermo f1
"));

    //ppppppppppppppppppppppppppppppppppppppppppppppppp

    package Support
      extends Modelica.Icons.Library;

      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

      annotation (
        Documentation(info="

content package:
supporting models for package Subsystem.PowerCycle

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo xxx
"),
        Coordsys(
          extent=[0, 0; 312, 194],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.04,
          y=0.03,
          width=0.4,
          height=0.4,
          library=1,
          autolayout=1));

      model BasicProcess "basic thermodynamic process step"
        extends BasicProcessCM;


          //-----switch-parameters------------------------------------------------

        parameter Boolean switch_energy_balance=true
          "if switch_energy_balance=true then stationary energy balance is applied (s. info)";

        parameter Boolean switch_m_dot_const=true
          "if switch_m_dot_const=true then InMassFlow.m_dot+OutMassFlow.m_dot=0";
        parameter Boolean switch_h_const=false
          "if switch_h_const==true then InThermalState.h=OutThermalState.h (default:switch_h=false)";
        parameter Boolean switch_p_const=false
          "if  switch_p_const==true then InThermalState.p=OutThermalState.p (default:switch_p=false)";
        parameter Boolean switch_rho_const=false
          "if  switch_rho_const==true then InThermalState.rho=OutThermalState.rho (default:switch_rho=false)";
        parameter Boolean switch_s_const=false
          "if  switch_s_const==true then InThermalState.s=OutThermalState.s (default:switch_s=false)";
        parameter Boolean switch_t_const=false
          "if  switch_t_const==true then InThermalState.t=OutThermalState.t (default:switch_t=false)";
        parameter Boolean switch_u_const=false
          "if  switch_u_const==true then InThermalState.u=OutThermalState.u (default:switch_u=false)";
        parameter Boolean switch_x_const=false
          "if  switch_x_const==true then InThermalState.x=OutThermalState.x (default:switch_x=false)";
        parameter Boolean switch_x_i_const=true
          "if  switch_x_i_const==true then InThermalState._x_i=OutThermalState._x_i (default:switch_x_i=false)";


          //-------------------------start Icon graphics-----------------------------------
        annotation (Icon(
            Line(points=[-70, 60; -60, 80; -50, 60], style(color=0)),
            Line(points=[-60, 80; -60, -50; 70, -50], style(color=0)),
            Line(points=[60, -40; 70, -50; 60, -60], style(color=0)),
            Polygon(points=[-46, -14; -24, -8; -6, 0; 14, 26; 28, 62; 36, 84;
                  36, -40; -46, -40; -46, -14], style(
                color=45,
                fillColor=7,
                fillPattern=7))));
      equation


          //--------------------------end graphics--------------------------------------

        if switch_m_dot_const then
          InMassFlow.m_dot + OutMassFlow.m_dot = 0.0;
        end if;

        if ((switch_energy_balance == true) and (switch_h_const == false)) then


            // change in enthalpy is equal to work and heat transferred to process
          InMassFlow.m_dot*InMassFlow.h + OutMassFlow.m_dot*OutMassFlow.h +
            InHeatFlow.q_dot + InExergyFlow.exergy_dot = 0.0;
        end if;

        // corresponding variables at mass-flow connectors and thermal state
        // connectors are equal
        InMassFlow.h = InThermalState.h;
        InMassFlow.p = InThermalState.p;
        InMassFlow.x_i = InThermalState.x_i;

        OutMassFlow.h = OutThermalState.h;
        OutMassFlow.p = OutThermalState.p;
        OutMassFlow.x_i = OutThermalState.x_i;

        if switch_h_const then
          InThermalState.h = OutThermalState.h;
        end if;

        if switch_p_const then
          InThermalState.p = OutThermalState.p;
        end if;

        if switch_rho_const then
          InThermalState.rho = OutThermalState.rho;
        end if;

        if switch_s_const then
          InThermalState.s = OutThermalState.s;
        end if;

        if switch_t_const then
          InThermalState.t = OutThermalState.t;
        end if;

        if switch_u_const then
          InThermalState.u = OutThermalState.u;
        end if;

        if switch_x_const then
          InThermalState.x = OutThermalState.x;
        end if;

        if switch_x_i_const then
          InThermalState.x_i = OutThermalState.x_i;
        end if;

      end BasicProcess;

      model BasicProcessCM "connectors for thermal process "
        extends TTInterface.ThermalState.Support.TwoPortIC;

        //---------- connector for heat transferred to process-----------------
        TTInterface.HeatFlow.In InHeatFlow
          annotation (extent=[-50, 100; -30, 120]);


          //----------connector for exergy transferred to process-----------------
        TTInterface.ExergyFlow.In InExergyFlow
          annotation (extent=[30, 100; 50, 120]);


          //-----------------connector for mass flow at inlet------------------------------
        TTInterface.MassFlow.In InMassFlow(n_comp=n_comp)
          annotation (extent=[-100, -60; -120, -80]);


          //-----------------connector for mass flow at outlet------------------------------
        TTInterface.MassFlow.Out OutMassFlow(n_comp=n_comp)
          annotation (extent=[100, -60; 120, -80]);

      end BasicProcessCM;

    end Support;

    //ppppppppppppppppppppppppppppppppppppppppppppppppp

  end Cycle;

  //ppppppppppppppppppppppppppppppppppppppppppppppppp

  package SolarCollector
    //wds 14.01.02 14:00
    extends Modelica.Icons.Library;

    model DSGCollector "parabolic trough solar collector for direct steam generation"


      extends TTSubsystem.SolarCollector.Support.TroughCIM;

      parameter Real x_steam_outlet=1 "steam quality at exit of collector";

    equation

    end DSGCollector;

    //ppppppppppppppppppppppppppppppppppppppppppppppppp

    package Support
      extends Modelica.Icons.Library;

      //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

      annotation (
        Documentation(info="

content package:
supporting models for package Subsystem.PowerCycle

Date of last modification:
Description last modification:
Author last modification:wds

identification: TechThermo xxx
"),
        Coordsys(
          extent=[0, 0; 312, 194],
          grid=[1, 1],
          component=[20, 20]),
        Window(
          x=0.04,
          y=0.03,
          width=0.4,
          height=0.4,
          library=1,
          autolayout=1));

      model TroughCIM

        extends TTInterface.MassFlow.TwoPort;

        TTInterface.HeatFlow.In HeatFromSun
          annotation (extent=[10, 100; -10, 120]);


          //-------------------------start Icon graphics-----------------------------------
        annotation (Icon(
            Ellipse(extent=[60, 100; 100, -60], style(
                color=7,
                pattern=0,
                fillColor=7,
                fillPattern=1)),
            Ellipse(extent=[-40, 94; -42, 90], style(
                color=7,
                fillColor=7,
                fillPattern=1)),
            Rectangle(extent=[-80, 100; 80, -60], style(
                color=69,
                gradient=2,
                fillColor=71)),
            Rectangle(extent=[-100, 32; 100, 10], style(
                color=71,
                gradient=2,
                fillColor=9)),
            Polygon(points=[-74, 32; -74, 52; -72, 74; -66, 94; -62, 100; -80,
                  100; -80, 32; -74, 32], style(
                color=7,
                gradient=2,
                fillColor=7)),
            Polygon(points=[-80, 10; -74, 10; -74, -14; -72, -20; -68, -40; -60,
                   -60; -80, -60; -80, 10], style(
                color=7,
                gradient=2,
                fillColor=7)),
            Polygon(points=[64, 32; 64, 40; 64, 54; 66, 72; 70, 88; 76, 100; 82,
                   100; 84, 32; 80, 32; 64, 32], style(
                color=7,
                gradient=2,
                fillColor=7)),
            Polygon(points=[64, 10; 64, -14; 68, -36; 80, -60; 82, 10; 64, 10],
                 style(
                color=7,
                gradient=2,
                fillColor=7))), Diagram);
        //Line(points=[-100, 0; -60, 0], style(color=47)),
        annotation (Diagram(
            Rectangle(extent=[-78, -64; -70, -70], style(
                color=0,
                arrow=1,
                fillColor=45)),
            Rectangle(extent=[-46, -64; -30, -70], style(
                color=0,
                arrow=1,
                fillColor=45)),
            Ellipse(extent=[-26, -58; -6, -76], style(
                color=0,
                arrow=1,
                fillColor=45)),
            Rectangle(extent=[-2, -64; 14, -72], style(
                color=0,
                arrow=1,
                fillColor=45)),
            Ellipse(extent=[18, -58; 38, -76], style(
                color=0,
                arrow=1,
                fillColor=45)),
            Rectangle(extent=[42, -64; 58, -70], style(
                color=0,
                arrow=1,
                fillColor=45)),
            Rectangle(extent=[80, -64; 88, -70], style(
                color=0,
                arrow=1,
                fillColor=45)),
            Line(points=[-78, -64; -78, -50], style(
                color=0,
                fillColor=45,
                fillPattern=1)),
            Line(points=[-70, -64; -70, -50], style(
                color=0,
                fillColor=45,
                fillPattern=1)),
            Line(points=[-88, -52; -78, -52], style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-70, -52; -60, -52], style(
                color=0,
                arrow=2,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-46, -64; -46, -50], style(
                color=0,
                fillColor=45,
                fillPattern=1)),
            Line(points=[-30, -64; -30, -50], style(
                color=0,
                fillColor=45,
                fillPattern=1)),
            Line(points=[-46, -52; -30, -52], style(
                color=0,
                arrow=3,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-70, -66; -64, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-50, -66; -46, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-30, -66; -26, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-6, -66; -2, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[14, -66; 18, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[38, -66; 42, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[58, -66; 62, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[76, -66; 80, -66], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Text(
              extent=[-90, -44; -62, -48],
              style(
                color=0,
                fillColor=0,
                fillPattern=1),
              string="dz_segment / 2"),
            Text(
              extent=[-28, -32; 10, -36],
              style(
                color=0,
                fillColor=0,
                fillPattern=1),
              string="m_segment_i "),
            Line(points=[-16, -58; -12, -36], style(
                color=0,
                arrow=2,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, -70; -78, -94], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-56, -68; -56, -84], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-16, -68; -16, -92], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, -82; -56, -82], style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-78, -92; -16, -92], style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1)),
            Text(
              extent=[-98, -32; -18, -22],
              style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1),
              string="discretization scheme if n_segment > 1 :"),
            Text(
              extent=[-74, -96; -24, -96],
              style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1),
              string="z_segment [2]"),
            Text(
              extent=[-90, -86; -40, -86],
              style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1),
              string="z_segment [1]"),
            Polygon(points=[20, 94; 32, 94; 42, 84; 46, 68; 44, 54; 38, 44; 28,
                   36; 12, 36; 20, 94], style(
                color=0,
                arrow=1,
                fillColor=8,
                fillPattern=1)),
            Polygon(points=[8, 94; 20, 94; 30, 84; 34, 68; 32, 54; 26, 44; 16,
                  36; 0, 36; 8, 94], style(
                color=0,
                arrow=1,
                fillColor=8,
                fillPattern=1)),
            Polygon(points=[-4, 94; 8, 94; 18, 84; 22, 68; 20, 54; 14, 44; 4,
                  36; -12, 36; -4, 94], style(
                color=0,
                arrow=1,
                fillColor=8,
                fillPattern=1)),
            Polygon(points=[-16, 94; -4, 94; 6, 84; 10, 68; 8, 54; 2, 44; -8,
                  36; -24, 36; -16, 94], style(
                color=0,
                arrow=1,
                fillColor=8,
                fillPattern=1)),
            Polygon(points=[-28, 94; -16, 94; -6, 84; -2, 68; -4, 54; -10, 44;
                  -20, 36; -36, 36; -28, 94], style(
                color=0,
                arrow=1,
                fillColor=8,
                fillPattern=1)),
            Polygon(points=[-28, 94; -16, 94; -6, 84; -2, 68; -4, 54; -10, 44;
                  -20, 36; -36, 36; -46, 44; -52, 56; -52, 72; -48, 84; -38, 92;
                   -28, 94], style(
                color=0,
                arrow=1,
                fillColor=30,
                fillPattern=1)),
            Line(points=[-28, 36; -28, 22], style(
                color=0,
                fillColor=30,
                fillPattern=1)),
            Line(points=[28, 36; 28, 22], style(
                color=0,
                fillColor=30,
                fillPattern=1)),
            Line(points=[-28, 26; 28, 26], style(
                color=0,
                arrow=3,
                fillColor=0,
                fillPattern=1)),
            Text(
              extent=[-10, 34; 14, 28],
              style(
                color=0,
                arrow=3,
                fillColor=0,
                fillPattern=1),
              string="dz_plate"),
            Text(
              extent=[-82, 86; -52, 80],
              style(
                color=0,
                arrow=3,
                fillColor=0,
                fillPattern=1),
              string="cross_area"),
            Line(points=[-62, 80; -30, 62], style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1))));

      end TroughCIM;


	  model EtaCollectorTHFlux "thermal efficiency of solar collector dependent on temperature and heat flux"
		  extends TTInterface.HeatFlow.TwoPort(switch_q_dot_const=false, switch_t_const=true);

		  SIunits.HeatFlux solar_heatflux	"area specific solar insolation";
	      SIunits.Efficiency thermal_efficiency "thermal efficiency of solar collector";

		  parameter SIunits.Area area_collector=1.0	"optical surface area collector";
		  parameter SIunits.Efficiency	eta_reference=0.65 "thermal efficiency at reference temperature and reference heat flow rate";
		  parameter SIunits.HeatFlux heatflux_reference=800 "reference value for area specific heat flux";
		  parameter SIunits.CelsiusTemperature t_reference=300 "reference temperature";
		  parameter Real heatflux_factor=3.67e-4 "variation of efficiency with heat flux, s. info";
		  parameter Real t_factor=-0.117e-2 "variation of efficiency with temperature s. info";






    annotation (
      Icon(
        Polygon(points=[60, 60; 60, -20; 100, 20; 60, 60], style(
            color=45,
            gradient=3,
            fillColor=7)),
        Polygon(points=[-100, 100; -20, 20; -100, -60; -100, 100], style(color=
                45, fillColor=45)),
        Line(points=[-12, 20; -12, 80; 40, 80; 40, -42], style(
            color=0,
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
      Diagram);

    annotation (Diagram);


	  equation

		  solar_heatflux=q_in_dot/area_collector;


		  thermal_efficiency=eta_reference*(1+(solar_heatflux-heatflux_reference)*heatflux_factor)*
		  (1+(t_out-t_reference)*t_factor);

		  0.0=(q_in_dot*thermal_efficiency)+q_out_dot;

	  end EtaCollectorTHFlux;



    end Support;

  end SolarCollector;

end Subsystem;
