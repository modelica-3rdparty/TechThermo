package Basis "basic physical processes in technical thermodynamics TTcode:D"
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

  annotation (Documentation(info="
content package: models describing basic processes in thermodynamics


identification: TechThermo D
"));

  annotation (
    Icon(
      Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
      Rectangle(extent=[-91, 38; 69, -90]),
      Rectangle(extent=[-84, -10; -13, -40], style(color=0)),
      Rectangle(extent=[-9, -10; 62, -40], style(color=0)),
      Rectangle(extent=[-48, 24; 23, -6], style(color=0)),
      Rectangle(extent=[-47, -44; 24, -74], style(color=0))),
    Coordsys(
      extent=[-100, -100; 100, 100],
      grid=[1, 1],
      component=[20, 20]),
    Window(
      x=0.01,
      y=0.05,
      width=0.6,
      height=0.6));

  package HeatTransport "correlation for heat transfer TTcode:Da"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations describing heat transport

identification: TechThermo Da
"));
    annotation (
      Icon(
        Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Polygon(points=[-72, 26; -21, -24; -72, -74; -72, 26], style(color=47,
              fillColor=47)),
        Polygon(points=[2, 26; 53, -24; 2, -74; 2, 26], style(color=47,
              fillColor=47))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    model PlateHeatConducting
      "plate with finite mass and length dz in direction of heat conduction, optional discretization"


      extends TTInterface.HeatFlow.TwoPort(final switch_q_dot_const=false,
          final switch_t_const=false);

      parameter Integer n_segment=1
        "number of segments in direction of heat conduction";
      //  parameter Integer n_nodes=n_segment + 1
      //    "number of nodes, including inlet and outlet";

      parameter SIunits.ThermalConductivity k_thermal_const=1.5
        "const. value thermal conductivity";
      parameter SIunits.SpecificHeatCapacity c_heat_const=1100
        "const. value heat-capacity";
      parameter SIunits.Density rho_material_const=7700
        "const. value density of plate material, must be >0.0 if switch_zero_mass ==false";

      //  plate-geometry

      parameter SIunits.Distance dz_plate=0.5
        "thickness of plate in direction of heat conduction";
      parameter SIunits.Distance dz_segment=dz_plate/n_segment
        "length segment in direction of heat conduction";
      parameter SIunits.Area cross_area=0.25
        "cross area orthogonal to heat flow";

      parameter SIunits.CelsiusTemperature t_initial=300
        "initial temperature plate material, only used if option_initial==2";

      parameter Real q_internal_volumetric_const=0.0
        "const. volume-specific internal heat generation rate [W/m3]";

      //      SIunits.CelsiusTemperature t_segment_i[n_segment](fixed=not


        //            switch_t_steady and switch_zero_mass, start=fill(t_initial,
      //            n_segment)) "temperature of segment i_segment";

      SIunits.CelsiusTemperature t_segment_i[n_segment]
        "temperature of segment i_segment";

      SIunits.Mass m_segment_i "mass of segment i_segment";

      parameter SIunits.Volume volume_segment_i=cross_area*dz_segment
        "volume of segment i_segment";

      SIunits.ThermalConductivity k_thermal
        "thermal conductivity plate material; if switch_k_const==true then k_thermal=k_thermal_const";
      SIunits.SpecificHeatCapacity c_heat
        "specific heat capacity plate material: if switch_c_const==true then c_heat=c_heat_const";
      SIunits.Density rho_material
        "density of plate material: if switch_rho_const==true then rho_material=rho_material_const";

      Real q_internal_volumetric
        "volume-specific power of internal heat source: if switch_q_internal_const==true then q_internal_volumetric=q_internal_volumetric_const";

      SIunits.Distance z_segment_i[n_segment]
        "position for temperature t_segment_i";

      //switch-parameters
      parameter Boolean switch_zero_mass=true
        "if switch_zero_mass==true then heat conducting element has no thermal capacity";

      parameter Boolean switch_k_const=true
        "if switch_k_const==true then k_thermal=k_thermal_const";
      parameter Boolean switch_c_const=true
        "if switch_c_const==true then c_heat=c_heat_const";
      parameter Boolean switch_rho_material_const=true
        "if switch_rho_const==true then rho_material_const";

      parameter Boolean switch_q_internal_const=true
        "if switch_q_internal_const==true then power generated by internal heat source is constant";

      //     parameter Boolean switch_t_steady=true


        //       "if switch_t_steady==true and switch_zero_mass=false then initial equation der(t_segment_i)=0.0";

      parameter Integer option_initial=1
        "initial conditions: 1-der(der(t_segment_i) = zeros(n_segment), 2- t_segment_i=t_initial";


        //-------------------------start Icon graphics-----------------------------------
      annotation (Icon(
          Line(points=[0, 60; 0, 100], style(color=47)),
          Line(points=[0, -60; 0, -100], style(color=47)),
          Line(points=[60, 0; 100, 0], style(color=47)),
          Polygon(points=[-60, 0; -80, 10; -80, -10; -60, 0], style(color=47,
                fillColor=47)),
          Rectangle(extent=[-100, 5; -80, -5], style(
              color=47,
              fillColor=47,
              fillPattern=1)),
          Polygon(points=[-60, 60; 40, 60; 100, 100; 0, 100; -60, 60], style(
              color=0,
              fillColor=47,
              fillPattern=1)),
          Line(points=[-40, 60; 18, 100], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[-20, 60; 38, 100], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[0, 60; 58, 100], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[20, 60; 78, 100], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Rectangle(extent=[-60, 60; 40, -60], style(
              color=0,
              fillColor=45,
              fillPattern=1)),
          Polygon(points=[40, -60; 100, -20; 100, 100; 40, 60; 40, -60], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[-40, 60; -40, -60], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[-20, 60; -20, -60], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[0, 60; 0, -60], style(
              color=0,
              fillColor=46,
              fillPattern=1)),
          Line(points=[20, 60; 20, -60], style(
              color=0,
              fillColor=46,
              fillPattern=1))));
      //Line(points=[-100, 0; -60, 0], style(color=47)),
      annotation (Diagram(
          Rectangle(extent=[-78, -24; -70, -30], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Rectangle(extent=[-46, -24; -30, -30], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Ellipse(extent=[-64, -20; -50, -34], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Ellipse(extent=[-26, -18; -6, -36], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Rectangle(extent=[-2, -24; 14, -32], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Ellipse(extent=[18, -18; 38, -36], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Rectangle(extent=[42, -24; 58, -30], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Ellipse(extent=[62, -20; 76, -34], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Rectangle(extent=[80, -24; 88, -30], style(
              color=0,
              arrow=1,
              fillColor=45)),
          Line(points=[-78, -24; -78, -10], style(
              color=0,
              fillColor=45,
              fillPattern=1)),
          Line(points=[-70, -24; -70, -10], style(
              color=0,
              fillColor=45,
              fillPattern=1)),
          Line(points=[-88, -12; -78, -12], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-70, -12; -60, -12], style(
              color=0,
              arrow=2,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-46, -24; -46, -10], style(
              color=0,
              fillColor=45,
              fillPattern=1)),
          Line(points=[-30, -24; -30, -10], style(
              color=0,
              fillColor=45,
              fillPattern=1)),
          Line(points=[-46, -12; -30, -12], style(
              color=0,
              arrow=3,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-70, -26; -64, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-50, -26; -46, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-30, -26; -26, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-6, -26; -2, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[14, -26; 18, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[38, -26; 42, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[58, -26; 62, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[76, -26; 80, -26], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-52, -4; -24, -8],
            style(
              color=0,
              fillColor=0,
              fillPattern=1),
            string="dz_segment"),
          Text(
            extent=[-90, -4; -62, -8],
            style(
              color=0,
              fillColor=0,
              fillPattern=1),
            string="dz_segment / 2"),
          Text(
            extent=[-68, 6; -40, 2],
            style(
              color=0,
              fillColor=0,
              fillPattern=1),
            string="m_segment_i / 2"),
          Line(points=[-56, -20; -52, 2], style(
              color=0,
              arrow=2,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-28, 8; 0, 4],
            style(
              color=0,
              fillColor=0,
              fillPattern=1),
            string="m_segment_i "),
          Line(points=[-16, -18; -12, 4], style(
              color=0,
              arrow=2,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-78, -30; -78, -54], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-56, -28; -56, -44], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-16, -28; -16, -52], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-78, -42; -56, -42], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-78, -52; -16, -52], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-42, 8; 38, 18],
            style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1),
            string="discretization scheme if n_segment > 1 :"),
          Text(
            extent=[-74, -56; -24, -56],
            style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1),
            string="z_segment [2]"),
          Text(
            extent=[-90, -46; -40, -46],
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
          Polygon(points=[8, 94; 20, 94; 30, 84; 34, 68; 32, 54; 26, 44; 16, 36;
                 0, 36; 8, 94], style(
              color=0,
              arrow=1,
              fillColor=8,
              fillPattern=1)),
          Polygon(points=[-4, 94; 8, 94; 18, 84; 22, 68; 20, 54; 14, 44; 4, 36;
                 -12, 36; -4, 94], style(
              color=0,
              arrow=1,
              fillColor=8,
              fillPattern=1)),
          Polygon(points=[-16, 94; -4, 94; 6, 84; 10, 68; 8, 54; 2, 44; -8, 36;
                 -24, 36; -16, 94], style(
              color=0,
              arrow=1,
              fillColor=8,
              fillPattern=1)),
          Polygon(points=[-28, 94; -16, 94; -6, 84; -2, 68; -4, 54; -10, 44; -20,
                 36; -36, 36; -28, 94], style(
              color=0,
              arrow=1,
              fillColor=8,
              fillPattern=1)),
          Polygon(points=[-28, 94; -16, 94; -6, 84; -2, 68; -4, 54; -10, 44; -20,
                 36; -36, 36; -46, 44; -52, 56; -52, 72; -48, 84; -38, 92; -28,
                 94], style(
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


        //--------------------------end graphics--------------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
heat conducting element with constant cross-area orthogonal to direction of heat flow
      </p>

<ul>
<li><p>optional spatial discretization in direction of heat flow:</p>
<p>element can be divided into n_segment segments with temperature t_segment_i[n_segment]
at position z_segment_i[n_segment]<p></li>
<li><p>thermal capacity might be neglected by setting of parameter switch_zero_mass=true<p></li>
<li><p>optional internal heat source; volume-specific power of internal heat source defined by
q_volume_internal /q_volume_internal_const</li>
<ul>
<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>
<ul>
<li>material is homogenous</li>
<li>one-dimensional heat conduction</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_k_const<td>k_thermal=k_thermal_const
</tr>
<tr>
<td>switch_c_const=true<td>c_heat=c_heat_const
</tr>
<tr>
<td>switch_zero_mass<td>no thermal capacity
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b><br>

<br>

<table border=1>
<tr><td>  <b>option_initial (switch_zero_mass==false)</b></tr>
<tr>
<td>1<td>initial equation: der(der(t_segment_i) = zeros(n_segment)
</tr>
<tr>
<td>2<td> initial equation: t_segment_i = t_initial*ones(n_segment)
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>




<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</tr>
<tr>
<td>dz_plate<td> thickness of plate in direction of heat conduction <td>Distance<td>[m]
</tr>
<tr>
<td>rho_material<td> density of plate material, must be >0.0 if switch_zero_mass ==false<td>Density<td>[kg/m3]
</tr>
<tr>
<td>cross_area<td>cross area orthogonal to heat flow<td>[m2]
</tr>
<tr>
<td>n_segment<td> number of segments in direction of heat conduction <td>Integer<td>[-]
</tr>
<tr>
<td>k_thermal_const<td> const. value thermal conductivity <td>ThermalConductivity<td>[W/m/K]
</tr>
<tr>
<td>c_heat_const<td> const. value thermal conductivity <td>ThermalConductivity<td>[J/kg/K]
</tr>
<tr>
<td>t_initial<td> initial temperature plate material, only used if option_initial==2<td>CelsiusTemperature<td>[°C]
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
    equation

      //---------End Documentation------------------------------

      m_segment_i = rho_material*cross_area*dz_segment;
      //mass of segment

      //plate material properties:
      if switch_k_const == true then
        k_thermal = k_thermal_const;
      end if;

      if switch_c_const == true then
        c_heat = c_heat_const;
      end if;

      if switch_rho_material_const == true then
        rho_material = rho_material_const;
      end if;

      // internal heat source
      if switch_q_internal_const == true then
        q_internal_volumetric = q_internal_volumetric_const;
      end if;

      if switch_zero_mass == true then


          //heat conducting element has no thermal capacity: m_segment_i=0.0, no storage of energy in element
        0.0 = q_in_dot + q_out_dot + volume_segment_i*q_internal_volumetric;


          // no discretization, only a single segment in direction of heat flow, no storage of energy in element
        q_in_dot = k_thermal*cross_area/dz_segment*(t_in - t_out);
        t_segment_i[1] = (t_in + t_out)/2.0;
        z_segment_i[1] = dz_segment/2.0;
        // end calculation heat conducting element with zero thermal capacity

      else


          // heat conducting element has a finite thermal capacity, energy is stored during transients

        if n_segment == 1 then
          // no discretization, only a single segment in direction of heat flow
          // center of thermal mass at dz_plate/2.
          0.0 = -m_segment_i*c_heat*der(t_segment_i[1]) + k_thermal*cross_area/
            (dz_segment/2.0)*(t_in - t_segment_i[1]) + k_thermal*cross_area/(
            dz_segment/2.0)*(t_out - t_segment_i[1]);
          z_segment_i[1] = dz_segment/2.0;
        else
          // discretization with (n_segment)segments

          //energy balance for segment[1]
          //distance from connecter InHeatFlow:dz_segment/2
          //distance to connecter center of sement 2: z_segment
          0.0 = -m_segment_i*c_heat*der(t_segment_i[1]) + k_thermal*cross_area/
            (dz_segment/2)*(t_in - t_segment_i[1]) + k_thermal*cross_area/
            dz_segment*(t_segment_i[2] - t_segment_i[1]);
          z_segment_i[1] = dz_segment/2.0;

          if n_segment > 2 then
            //if n_segment>2:
            //energy balance for segment[2]  to segment[n_segment - 1]
            for i_segment in 2:(n_segment - 1) loop
              0.0 = -m_segment_i*c_heat*der(t_segment_i[i_segment]) + k_thermal
                *cross_area/dz_segment*(t_segment_i[i_segment - 1] -
                t_segment_i[i_segment]) + k_thermal*cross_area/dz_segment*(
                t_segment_i[i_segment + 1] - t_segment_i[i_segment]);
              z_segment_i[i_segment] = z_segment_i[i_segment - 1] + dz_segment;
            end for;

          end if;

          //energy balance for segment[n_segment]
          //distance to connector:dz_segment/2
          //distance to connecter center of sement [n_segment-1]: z_segment

          0.0 = -m_segment_i*c_heat*der(t_segment_i[n_segment]) + k_thermal*
            cross_area/(dz_segment/2.)*(t_out - t_segment_i[n_segment]) +
            k_thermal*cross_area/dz_segment*(t_segment_i[n_segment - 1] -
            t_segment_i[n_segment]);
          z_segment_i[n_segment] = dz_plate - dz_segment/2.0;
        end if;

        //heat flow rate at inlet and outlet
        q_in_dot = k_thermal*cross_area/(dz_segment/2)*(t_in - t_segment_i[1]);
        q_out_dot = k_thermal*cross_area/(dz_segment/2)*(t_out - t_segment_i[
          n_segment]);

      end if;

    initial equation

      //      if switch_t_steady == true and not switch_zero_mass then
      //        der(t_segment_i) = zeros(n_segment);
      //      end if;

      if option_initial == 1 and not switch_zero_mass then
        der(t_segment_i) = zeros(n_segment);
      end if;

      if option_initial == 2 and not switch_zero_mass then
        t_segment_i = t_initial*ones(n_segment);
      end if;

    end PlateHeatConducting;

    model CylinderHeatConducting
      "heat conducting cylinder segment, optional discretization in radial direction"


      extends TTInterface.HeatFlow.TwoPort;

      //switch-parameters
      parameter Boolean switch_zero_mass=true
        "if switch_zero_mass==true then heat conducting element has no thermal capacity";

      parameter Boolean switch_k_const=true
        "if switch_k_const==true then k_thermal=k_thermal_const";
      parameter Boolean switch_c_const=true
        "if switch_c_const==true then c_heat=c_heat_const";
      parameter Boolean switch_rho_material_const=true
        "if switch_rho_const==true then rho_material_const";

      parameter Boolean switch_solid=false
        "if switch_solid==true, cylinder is solid; parameter d_inner is ignored";

      //      parameter Boolean switch_t_steady=true

        //        "if switch_t_steady==true and switch_zero_mass=false then initial equation der(t_segment_i)=0.0";

      parameter Integer n_radial=1 "number of segments radial direction";

      parameter SIunits.ThermalConductivity k_thermal_const=1.5
        "const. value thermal conductivity";
      parameter SIunits.SpecificHeatCapacity c_heat_const=1100
        "const. value heat-capacity";
      parameter SIunits.Density rho_material_const=2200
        "const. value density of material cylinder, must be >0.0 if switch_zero_mass ==false";

      constant Real pi=GeneralConstants.pi;

      //  pipe-geometry
      parameter SIunits.Diameter d_outer=0.05 "outer diameter cylinder ";

      parameter SIunits.Diameter d_inner=0.01
        "inner diameter cylinder; ignored, if switch_solid==true; d_inner < d_outer";
      parameter SIunits.Distance dz_zylinder=1.0
        "length cylinder in axial direction";
      parameter SIunits.Angle phi_segment=360
        "angle in circumferential direction, 0<phi_segment<360";
      parameter Real phi_fraction=phi_segment/360;

      //  grid-geometry
      SIunits.Distance d_grid
        "difference in diameter for two following segments";

      parameter SIunits.CelsiusTemperature t_initial=300
        "initial temperature if option_initial==2";

      parameter Integer option_initial=1
        "initial conditions: 1-der(der(t_segment_i) = zeros(n_radial), 2- t_segment_i=t_initial";


        //      SIunits.CelsiusTemperature t_segment_i[n_radial](start=fill(t_initial,
      //            n_radial)) "temperature of segment i_radial";

      //      SIunits.CelsiusTemperature t_segment_i[n_radial](fixed=not
      //            switch_t_steady and switch_zero_mass, start=fill(t_initial,
      //            n_radial)) "temperature of segment i_radial";

      SIunits.CelsiusTemperature t_segment_i[n_radial];

      SIunits.Mass m_segment_i[n_radial] "mass of cylinder segment i_radial";
      //mass of storage segment
      SIunits.Area outer_surface_segment_i[n_radial]
        "outer surface of cylinder segment i_radial";

      SIunits.Area inner_surface_segment_i[n_radial]
        "inner surface of cylinder segment i_radial";

      SIunits.Diameter d_segment_i[n_radial]
        "diameter for temperature t_segment_i";

      SIunits.ThermalConductivity k_thermal
        "thermal conductivity plate material; if switch_k_const==true then k_thermal=k_thermal_const";
      SIunits.SpecificHeatCapacity c_heat
        "specific heat capacity plate material: if switch_c_const==true then c_heat=c_heat_const";
      SIunits.Density rho_material
        "density of plate material: if switch_rho_const==true then rho_material=rho_material_const";

      SIunits.Distance t_wall
        "thickness cylinder wall, depends on d_outer, d_inner and switch_solid";

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
cylinder with heat conduction in radial direction
</p>

<ul>
<li>optional spatial discretization in direction of heat flow
<p>element can be divided into n_radial segments with temperature t_segment_i[n_segment]
at position z_segment_i[n_segment]<p></li>
<li>thermal capacity might be neglected by setting of parameter switch_zero_mass=true</li>
<li>optional internal heat source; volume-specific power of internal heat source defined by
q_volume_internal /q_volume_internal_const</li>
</ul>
<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>
<ul>
<li>material is homogenous</li>
<li>one-dimensional heat conduction</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_k_const<td>k_thermal=k_thermal_const
</tr>
<tr>
<td>switch_c_const=true<td>c_heat=c_heat_const
</tr>
<tr>
<td>switch_zero_mass<td>no thermal capacity
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b><br>

<br>

<table border=1>
<tr><td>  <b>option_initial (switch_zero_mass==false)</b></tr>
<tr>
<td>1<td>initial equation: der(der(t_segment_i) = zeros(n_radial)
</tr>
<tr>
<td>2<td> initial equation: t_segment_i = t_initial*ones(n_radial)
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>



<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</tr>
<tr>
<td>d_outer<td> outer diameter cylinder <td>Diameter<td>[m]
</tr>
<tr>
<td>d_inner<td> inner diameter cylinder <td>Diameter<td>[m]
</tr>

<tr>
<td>dz_zylinder<td> length cylinder in axial direction <td>Distance<td>[m]
</tr>

<tr>
<td>rho_material<td> density of cylinder material, must be >0.0 if switch_zero_mass ==false<td>Density<td>[kg/m3]
</tr>
<tr>
<td>phi_segment<td>angle in circumferential direction, 0<phi_segment<360<td>Density<td>[kg/m3]
</tr>
<tr>
<td>n_segment<td> number of segments in direction of heat conduction <td>Integer<td>[-]
</tr>
<tr>
<td>k_thermal_const<td> const. value thermal conductivity <td>ThermalConductivity<td>[W/m/K]
</tr>
<tr>
<td>c_heat_const<td> const. value thermal conductivity <td>ThermalConductivity<td>[J/kg/K]
</tr>
<tr>
<td>t_initial<td> initial temperature cylinder material if option_initial==2<td>CelsiusTemperature<td>[°C]
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


        //-------------------------start Icon graphics-----------------------------------
      annotation (Icon(
          Ellipse(extent=[60, -60; -60, 60], style(color=47)),
          Ellipse(extent=[100, -100; -100, 100], style(color=47)),
          Line(points=[0, 60; 0, 100], style(color=47)),
          Line(points=[0, -60; 0, -100], style(color=47)),
          Line(points=[60, 0; 100, 0], style(color=47)),
          Rectangle(extent=[-100, 5; -80, -5], style(
              color=47,
              fillColor=47,
              fillPattern=1)),
          Polygon(points=[-80, 40; -80, -40; 0, 0; -80, 40], style(color=47,
                fillColor=47))));
    equation

      //cylinder material properties:
      if switch_k_const == true then
        // thermal heat conductivity
        k_thermal = k_thermal_const;
      end if;

      if switch_c_const == true then
        // thermal heat capacity
        c_heat = c_heat_const;
      end if;

      if switch_rho_material_const == true then
        rho_material = rho_material_const;
      end if;

      if switch_solid == true then
        t_wall = d_outer/2.0;
      else
        t_wall = (d_outer - d_inner)/2.0;
      end if;
      d_grid = 2*t_wall/n_radial;

      if switch_zero_mass == true then


          //heat conducting element has no thermal capacity: m_segment_i=0.0, no storage of energy in element

        if n_radial == 1 then


            // no discretization, only a single cylinder segment in radial direction of heat flow with average temperature
          // t_segment_i[1] at diameter (d_inner+d_outer)/2.0
          m_segment_i[1] = 0.0;
          d_segment_i[1] = (d_outer + d_inner)/2.0;
          outer_surface_segment_i[1] = pi*d_outer*dz_zylinder*phi_fraction;
          inner_surface_segment_i[1] = pi*d_inner*dz_zylinder*phi_fraction;

          0.0 = q_in_dot + q_out_dot;

          // no storage of energy in element
          q_in_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_in - t_out)/
            Modelica.Math.log(d_outer/d_inner);

          // temperature t_segment_i[1] at diameter d_segment_i[1];
          q_in_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_in -
            t_segment_i[1])/Modelica.Math.log(d_segment_i[1]/d_inner);

        else

          // discretization in radial direction, no storage of energy

          m_segment_i[1] = 0.0;

          if switch_solid == false then
            // hollow cylinder
            d_segment_i[1] = d_inner + d_grid/2.0;
            0.0 = q_in_dot + 2*pi*k_thermal*dz_zylinder*phi_fraction*(
              t_segment_i[1] - t_segment_i[2])/Modelica.Math.log(d_segment_i[1]
              /d_segment_i[2]);
            q_in_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_in -
              t_segment_i[1])/Modelica.Math.log(d_segment_i[1]/d_inner);
            outer_surface_segment_i[1] = pi*d_outer*dz_zylinder*phi_fraction;
            inner_surface_segment_i[1] = pi*d_inner*dz_zylinder*phi_fraction;

          else

            //solid cylinder


              //no temperature difference between inlet and temperature at d_grid/2.0
            d_segment_i[1] = d_grid/2.0;
            0.0 = q_in_dot + 2*pi*k_thermal*dz_zylinder*phi_fraction*(
              t_segment_i[1] - t_segment_i[2])/Modelica.Math.log(d_segment_i[1]
              /d_segment_i[2]);
            t_in = t_segment_i[1];

          end if;

          for i_radial in 2:(n_radial - 1) loop
            // cylinder segments 2 to (n_radial - 1)
            d_segment_i[i_radial] = d_segment_i[i_radial - 1] + d_grid;
            m_segment_i[i_radial] = 0.0;
            outer_surface_segment_i[i_radial] = pi*(d_segment_i[i_radial] +
              d_grid/2.0)*dz_zylinder*phi_fraction;
            inner_surface_segment_i[i_radial] = pi*(d_segment_i[i_radial] -
              d_grid/2.0)*dz_zylinder*phi_fraction;

            // energy balance segment i_radial
            0.0 = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_segment_i[i_radial
               - 1] - t_segment_i[i_radial])/Modelica.Math.log(d_segment_i[
              i_radial]/d_segment_i[i_radial - 1]) + 2*pi*k_thermal*dz_zylinder
              *phi_fraction*(t_segment_i[i_radial] - t_segment_i[i_radial + 1])
              /Modelica.Math.log(d_segment_i[i_radial]/d_segment_i[i_radial + 1]);

          end for;

          //segment at outer radius
          m_segment_i[n_radial] = 0.0;
          d_segment_i[n_radial] = d_outer - d_grid/2.0;
          outer_surface_segment_i[n_radial] = pi*(d_segment_i[n_radial] +
            d_grid/2.0)*dz_zylinder*phi_fraction;
          inner_surface_segment_i[n_radial] = pi*(d_segment_i[n_radial] -
            d_grid/2.0)*dz_zylinder*phi_fraction;

          0.0 = q_out_dot + 2*pi*k_thermal*dz_zylinder*phi_fraction*(
            t_segment_i[n_radial - 1] - t_segment_i[n_radial])/
            Modelica.Math.log(d_segment_i[n_radial]/d_segment_i[n_radial - 1]);

          q_out_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_segment_i[
            n_radial] - t_out)/Modelica.Math.log(d_segment_i[n_radial]/(
            d_segment_i[n_radial] + d_grid));

        end if;

      else


          // heat conducting element has a finite thermal capacity, energy is stored during transients

        if n_radial == 1 then


            // no discretization, only a single cylinder segment in radial direction of heat flow with average temperature
          // t_segment_i[1] at diameter (d_inner+d_outer)/2.0

          m_segment_i[1] = phi_fraction*rho_material*dz_zylinder*pi/4.0*(
            d_outer^2.0 - d_inner^2.0);
          d_segment_i[1] = (d_outer + d_inner)/2.0;
          outer_surface_segment_i[1] = pi*d_outer*dz_zylinder*phi_fraction;
          inner_surface_segment_i[1] = pi*d_inner*dz_zylinder*phi_fraction;

          0.0 = -m_segment_i[1]*c_heat*der(t_segment_i[1]) + q_in_dot +
            q_out_dot;

          q_in_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_in -
            t_segment_i[1])/Modelica.Math.log(d_segment_i[1]/d_inner);
          q_out_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_segment_i[1]
             - t_out)/Modelica.Math.log(d_segment_i[1]/d_outer);

        else
          // discretization in radial direction

          // first element at inner diameter

          if switch_solid == false then
            //hollow cylinder
            m_segment_i[1] = phi_fraction*rho_material*dz_zylinder*pi/4.0*((
              d_inner + d_grid)^2.0 - d_inner^2.0);
            d_segment_i[1] = d_inner + d_grid/2.0;
            outer_surface_segment_i[1] = pi*(d_segment_i[1] + d_grid/2.0)*
              dz_zylinder*phi_fraction;
            inner_surface_segment_i[1] = pi*(d_segment_i[1] - d_grid/2.0)*
              dz_zylinder*phi_fraction;

            0.0 = -m_segment_i[1]*c_heat*der(t_segment_i[1]) + q_in_dot + 2*pi*
              k_thermal*dz_zylinder*phi_fraction*(t_segment_i[1] - t_segment_i[
              2])/Modelica.Math.log(d_segment_i[1]/d_segment_i[2]);

            q_in_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_in -
              t_segment_i[1])/Modelica.Math.log(d_segment_i[1]/d_inner);

          else
            // solid cylinder
            m_segment_i[1] = phi_fraction*rho_material*dz_zylinder*pi/4.0*
              d_grid^2.0;
            d_segment_i[1] = d_grid/2.0;
            outer_surface_segment_i[1] = pi*d_grid*dz_zylinder*phi_fraction;
            inner_surface_segment_i[1] = 0.0;

            0.0 = -m_segment_i[1]*c_heat*der(t_segment_i[1]) + q_in_dot + 2*pi*
              k_thermal*dz_zylinder*phi_fraction*(t_segment_i[1] - t_segment_i[
              2])/Modelica.Math.log(d_segment_i[1]/d_segment_i[2]);
            t_in = t_segment_i[1];
            // temperature at radius d_grid/2 is assumed equal to t_in

          end if;

          for i_radial in 2:(n_radial - 1) loop
            // cylinder segments 2 to (n_radial - 1)
            d_segment_i[i_radial] = d_segment_i[i_radial - 1] + d_grid;
            m_segment_i[i_radial] = phi_fraction*rho_material*dz_zylinder*pi/
              4.0*((d_segment_i[i_radial] + d_grid/2.0)^2.0 - (d_segment_i[
              i_radial - 1] + d_grid/2.0)^2.0);

            // energy balance segment i_radial
            0.0 = -m_segment_i[i_radial]*c_heat*der(t_segment_i[i_radial]) + 2*
              pi*k_thermal*dz_zylinder*phi_fraction*(t_segment_i[i_radial - 1]
               - t_segment_i[i_radial])/Modelica.Math.log(d_segment_i[i_radial]
              /d_segment_i[i_radial - 1]) + 2*pi*k_thermal*dz_zylinder*
              phi_fraction*(t_segment_i[i_radial] - t_segment_i[i_radial + 1])/
              Modelica.Math.log(d_segment_i[i_radial]/d_segment_i[i_radial + 1]);

            outer_surface_segment_i[i_radial] = pi*(d_segment_i[i_radial] +
              d_grid/2.0)*dz_zylinder*phi_fraction;
            inner_surface_segment_i[i_radial] = pi*(d_segment_i[i_radial] -
              d_grid/2.0)*dz_zylinder*phi_fraction;
          end for;

          //segment at outer radius
          m_segment_i[n_radial] = phi_fraction*rho_material*dz_zylinder*pi/4.0*
            ((d_outer)^2.0 - (d_outer - d_grid)^2.0);
          d_segment_i[n_radial] = d_outer - d_grid/2.0;
          outer_surface_segment_i[n_radial] = pi*(d_segment_i[n_radial] +
            d_grid/2.0)*dz_zylinder*phi_fraction;
          inner_surface_segment_i[n_radial] = pi*(d_segment_i[n_radial] -
            d_grid/2.0)*dz_zylinder*phi_fraction;
          0.0 = -m_segment_i[n_radial]*c_heat*der(t_segment_i[n_radial]) + q_out_dot
             + 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_segment_i[n_radial -
            1] - t_segment_i[n_radial])/Modelica.Math.log(d_segment_i[n_radial]
            /d_segment_i[n_radial - 1]);

          q_out_dot = 2*pi*k_thermal*dz_zylinder*phi_fraction*(t_segment_i[
            n_radial] - t_out)/Modelica.Math.log(d_segment_i[n_radial]/(
            d_segment_i[n_radial] + d_grid));

        end if;

      end if;

    initial equation

      //      if switch_t_steady == true and not switch_zero_mass then
      //        der(t_segment_i) = zeros(n_radial);
      //      end if;

      if option_initial == 1 and not switch_zero_mass then
        der(t_segment_i) = zeros(n_radial);
      end if;

      if option_initial == 2 and not switch_zero_mass then
        t_segment_i = t_initial*ones(n_radial);
      end if;

    end CylinderHeatConducting;

    model SphereHeatConducting
      "heat conducting sphere, optional discretization in radial direction"

      extends TTInterface.HeatFlow.TwoPort;

      //switch-parameters
      parameter Boolean switch_zero_mass=true
        "if switch_zero_mass==true then heat conducting element has no thermal capacity";

      parameter Boolean switch_k_const=true
        "if switch_k_const==true then k_thermal=k_thermal_const";
      parameter Boolean switch_c_const=true
        "if switch_c_const==true then c_heat=c_heat_const";
      parameter Boolean switch_rho_material_const=true
        "if switch_rho_const==true then rho_material_const";

      parameter Boolean switch_solid=false
        "if switch_solid==true, sphere is solid; parameter d_inner is ignored";

      //      parameter Boolean switch_t_steady=true

        //        "if switch_t_steady==true and switch_zero_mass=false then initial equation der(t_segment_i)=0.0";

      parameter Integer n_radial=1 "number of segments radial direction";

      parameter SIunits.ThermalConductivity k_thermal_const=1.5
        "const. value thermal conductivity";
      parameter SIunits.SpecificHeatCapacity c_heat_const=1100
        "const. value heat-capacity";
      parameter SIunits.Density rho_material_const=2200
        "const. value density material of sphere, must be >0.0 if switch_zero_mass ==false";

      constant Real pi=GeneralConstants.pi;

      //  sphere-geometry
      parameter SIunits.Diameter d_outer=0.05 "outer diameter sphere ";

      parameter SIunits.Diameter d_inner=0.01
        "inner diameter sphere; ignored, if switch_solid==true; d_inner < d_outer";
      parameter SIunits.Angle phi_segment=360
        "angle in circumferential direction, 0<phi_segment<360";
      parameter Real phi_fraction=phi_segment/360;

      //  grid-geometry
      SIunits.Distance d_grid
        "difference in diameter for two following segments";

      parameter SIunits.CelsiusTemperature t_initial=300
        "initial temperature if option_initial==2";

      parameter Integer option_initial=1
        "initial conditions: 1-der(der(t_segment_i) = zeros(n_radial), 2- t_segment_i=t_initial";


        //      SIunits.CelsiusTemperature t_segment_i[n_radial](start=fill(t_initial,
      //            n_radial)) "temperature of segment i_radial";

      //      SIunits.CelsiusTemperature t_segment_i[n_radial](fixed=not
      //            switch_t_steady and switch_zero_mass, start=fill(t_initial,
      //            n_radial)) "temperature of segment i_radial";

      SIunits.CelsiusTemperature t_segment_i[n_radial];

      SIunits.Mass m_segment_i[n_radial] "mass of cylinder segment i_radial";
      //mass of storage segment
      SIunits.Area outer_surface_segment_i[n_radial]
        "outer surface of sphere segment i_radial";

      SIunits.Area inner_surface_segment_i[n_radial]
        "inner surface of sphere segment i_radial";

      SIunits.Diameter d_segment_i[n_radial]
        "diameter for temperature t_segment_i";

      SIunits.ThermalConductivity k_thermal
        "thermal conductivity sphere material; if switch_k_const==true then k_thermal=k_thermal_const";
      SIunits.SpecificHeatCapacity c_heat
        "specific heat capacity sphere material: if switch_c_const==true then c_heat=c_heat_const";
      SIunits.Density rho_material
        "density of sphere material: if switch_rho_const==true then rho_material=rho_material_const";

      SIunits.Distance t_wall
        "thickness sphere wall, depends on d_outer, d_inner and switch_solid";

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
cylinder with heat conduction in radial direction
</p>

<ul>
<li>optional spatial discretization in direction of heat flow
<p>element can be divided into n_radial segments with temperature t_segment_i[n_segment]
at position z_segment_i[n_segment]<p></li>
<li>thermal capacity might be neglected by setting of parameter switch_zero_mass=true</li>
<li>optional internal heat source; volume-specific power of internal heat source defined by
q_volume_internal /q_volume_internal_const</li>
</ul>
<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b>
<ul>
<li>material is homogenous</li>
<li>one-dimensional heat conduction</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_k_const<td>k_thermal=k_thermal_const
</tr>
<tr>
<td>switch_c_const=true<td>c_heat=c_heat_const
</tr>
<tr>
<td>switch_zero_mass<td>no thermal capacity
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b><br>

<br>

<table border=1>
<tr><td>  <b>option_initial (switch_zero_mass==false)</b></tr>
<tr>
<td>1<td>initial equation: der(der(t_segment_i) = zeros(n_radial)
</tr>
<tr>
<td>2<td> initial equation: t_segment_i = t_initial*ones(n_radial)
</tr>

</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>



<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</tr>
<tr>
<td>d_outer<td> outer diameter cylinder <td>Diameter<td>[m]
</tr>
<tr>
<td>d_inner<td> inner diameter cylinder <td>Diameter<td>[m]
</tr>

<tr>
<td>dz_zylinder<td> length cylinder in axial direction <td>Distance<td>[m]
</tr>

<tr>
<td>rho_material<td> density of cylinder material, must be >0.0 if switch_zero_mass ==false<td>Density<td>[kg/m3]
</tr>
<tr>
<td>phi_segment<td>angle in circumferential direction, 0<phi_segment<360<td>Density<td>[kg/m3]
</tr>
<tr>
<td>n_segment<td> number of segments in direction of heat conduction <td>Integer<td>[-]
</tr>
<tr>
<td>k_thermal_const<td> const. value thermal conductivity <td>ThermalConductivity<td>[W/m/K]
</tr>
<tr>
<td>c_heat_const<td> const. value thermal conductivity <td>ThermalConductivity<td>[J/kg/K]
</tr>
<tr>
<td>t_initial<td> initial temperature cylinder material if option_initial==2<td>CelsiusTemperature<td>[°C]
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


        //-------------------------start Icon graphics-----------------------------------
      annotation (
        Icon(
          Ellipse(extent=[-60, 60; 60, -60], style(
              color=8,
              gradient=3,
              fillColor=8)),
          Polygon(points=[-100, 40; -60, 40; 0, 0; -60, -40; -100, -40; -100,
                40], style(
              color=45,
              gradient=3,
              fillColor=45)),
          Polygon(points=[60, 40; 60, -40; 100, 0; 60, 40], style(
              color=45,
              gradient=3,
              fillColor=7))),
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

      //cylinder material properties:
      if switch_k_const == true then
        // thermal heat conductivity
        k_thermal = k_thermal_const;
      end if;

      if switch_c_const == true then
        // thermal heat capacity
        c_heat = c_heat_const;
      end if;

      if switch_rho_material_const == true then
        rho_material = rho_material_const;
      end if;

      if switch_solid == true then
        t_wall = d_outer/2.0;
      else
        t_wall = (d_outer - d_inner)/2.0;
      end if;
      d_grid = 2*t_wall/n_radial;

    end SphereHeatConducting;

    model ForcedConvectionFlatPlateParaProp
      "forced convection heat transfer for flat plate, definition of fluid properties by parameters"


      extends TTBasis.HeatTransport.Support.ForcedConvectionFlatPlateCIM(
          switch_q_dot_const=true, switch_t_const=false);


        //-----------------additional connector for thermal state------------------------------
      //        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
      //          annotation (extent=[-10, 100; 10, 120]);

      parameter Integer option_convective_model=2
        "1:laminar 2:turbulent 3:mixed laminar/turbulent -1:alpha=alpha_const";

      parameter Boolean switch_eta_const=true
        "if switch_eta_const==true then dynamic viscosity eta=eta_const";
      parameter Boolean switch_lambda_const=true
        "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
      parameter Boolean switch_cp_const=true
        "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";

      parameter SIunits.Length dz_plate=1.0
        "Length of plate in direction of flow";
      parameter SIunits.Length width_plate=0.5
        "Width of plate in, vertical to dz_plate";

      parameter SIunits.Area across_flow=0.5
        "cross-sectional area mass flow, used to determine flow velocity from mass flow rate";
      parameter SIunits.Area area_heat_transfer=dz_plate*width_plate
        "relevant area for convective heat transfer";

      parameter SIunits.DynamicViscosity eta_const=0.15e-3
        "value for dynamic viscosity if switch_eta_const==true";
      parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
        "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
      parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
        "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";
      parameter SIunits.CoefficientOfHeatTransfer alpha_const=1000
        "const value coefficient of heat transfer, only used if option_convective_model==-1";

      SIunits.NusseltNumber nu "Nusselt number";

      SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
      SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
      SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
      SIunits.PrandtlNumber pr "Prandtl-number";
      SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";

      //SIunits.Density rho_average(start=1.0) " average density in pipe";

      SIunits.ReynoldsNumber re_positive
        "positve Reynoldsnumber if m_in_dot>0.0";

      SIunits.ReynoldsNumber re_negative
        "positve Reynoldsnumber if m_in_dot<0.0";
      Integer regime "flow regime";

      //SIunits.Velocity w_flow "flow velocity in pipe";


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing over flat plate:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables. Calculation of
flow velocity from mass flow rate demands the definition of the cross sectional area of fluid flow.
</p>
<br>


Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_convective_model=-1: <b>definition by parameter alpha_const</b> </li>
<li>option_convective_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_convective_model=2: <b>turbulent flow</b> </li>
<li>option_convective_model=3: <b>mixed turbulent and laminar flow</b> </li>

</ul>


</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>


<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>StateCut<td>rho<td>t,u,x,x_i,h,p,s</tr>

</table>




<br>


</p>


<hr>

<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>



<tr>
<td><b>switch_laminar_const_temp</b><td>if switch_laminar_const_temp==true then for laminar flow constant wall temperature is assumed
if switch_laminar_const_temp==false constant heat flux is assumed
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>-1<td> heat transfer coefficient defined by parameter alpha_const
</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> turbulent flow assumed
</tr>
<tr>
<td>3<td> mixed turbulent/laminar flow assumed
</tr>


</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz_plate<td> length of plate in direction of flow
</tr>
<tr>
<td>width_plate<td>  width of plate transversal to direction of flow
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>alpha_const<td>parametric value for heat transfer coefficient; only used if option_convective_model==-1
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
    equation


        //--------------------------end documentation------------------------------


        //--------------------------end documentation------------------------------

      //StateCut.rho = rho_average;


        //mass-flow connectors only used to determine Reynolds-number; connector-variables at inlet and outlet are equal
      0.0 = InletMass.m_dot + OutletMass.m_dot;
      InletMass.p = OutletMass.p;
      InletMass.h = OutletMass.h;
      InletMass.x_i = OutletMass.x_i;

      // calculation Reynolds-number
      //Re-number InletMass.m_dot>0.0 assumed:
      re_positive = InletMass.m_dot*dz_plate/eta/across_flow;

      //Re-number InletMass.m_dot<0.0 assumed:
      re_negative = -InletMass.m_dot*dz_plate/eta/across_flow;

      //flow velocity, only for information
      //w_flow = InletMass.m_dot/across_flow/rho_average;

      if switch_eta_const == true then
        eta = eta_const;
      end if;

      if switch_cp_const == true then
        cp_fluid = cp_fluid_const;
      end if;

      if switch_lambda_const == true then
        lambda_fluid = lambda_fluid_const;
      end if;

      //m_dot_max_laminar = 2300/4*3.14159*di_pipe*eta;

      pr = eta*cp_fluid/lambda_fluid;

      if (option_convective_model == -1) then

        // heat transfer coefficient defined by parameter alpha_const

        nu = alpha_const*dz_plate/lambda_fluid;

        regime = -1;

      end if;

      if (option_convective_model == 1) then

        // laminar flow

        if (InletMass.m_dot < 0.0) then
          nu = 0.664*re_negative^0.5*pr^(1./3.);
        else
          nu = 0.664*re_positive^0.5*pr^(1./3.);
        end if;
        regime = 1;

      end if;

      if (option_convective_model == 2) then

        //turbulent flow
        regime = 2;

        if (InletMass.m_dot < 0.0) then

          nu = 0.037*re_negative^0.8*pr/(1 + 2.443*re_negative^(-0.1)*(pr^(2./
            3.) - 1));

        else

          nu = 0.037*re_positive^0.8*pr/(1 + 2.443*re_positive^(-0.1)*(pr^(2./
            3.) - 1));

        end if;

      end if;

      if (option_convective_model == 3) then
        // mixed laminar and turbulent

        regime = 3;

        if (InletMass.m_dot < 0.0) then

          nu = sqrt((0.037*re_negative^0.8*pr/(1 + 2.443*re_negative^(-0.1)*(pr
            ^(2./3.) - 1)))^2.0 + (0.664*re_negative^0.5*pr^(1./3.))^2.0);

        else

          nu = sqrt((0.037*re_positive^0.8*pr/(1 + 2.443*re_positive^(-0.1)*(pr
            ^(2./3.) - 1)))^2.0 + (0.664*re_positive^0.5*pr^(1./3.))^2.0);

        end if;

      end if;

      alpha = nu*lambda_fluid/dz_plate;
      q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

    end ForcedConvectionFlatPlateParaProp;

    model NaturalConvectionExternalFlowParaProp
      "natural convection heat transfer for body with external flow"

      extends TTBasis.HeatTransport.Support.NaturalConvectionExternalFlowCIM(
          switch_q_dot_const=true, switch_t_const=false);


        //-----------------additional connector for thermal state------------------------------
      //        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
      //          annotation (extent=[-10, 100; 10, 120]);

      //        parameter Integer option_convective_model=1
      //          "selection of Nusselt-correlation, s. info";

      parameter Integer option_geometry=1 "geometry in cross flow: 1-vertical plate; 2-vertical cylinder 3-inclined heated surface, facing down
\t\t 4-inclined cooled surface, facing up  5-horizontal cylinder 6-sphere";

      parameter Boolean switch_pr_const=true
        "if switch_pr_const==true then Prandtl-number  pr=pr_const";
      parameter Boolean switch_ny_const=true
        "if switch_ny_const==true then kinematic viscosity of fluid ny_fluid=ny_fluid_const";
      parameter Boolean switch_area_const=true
        "if switch_area_const==true then area_heat_transfer  is defined by parameter dependent on geometry";

      //        parameter Boolean switch_mean_temperature=true

        //          "if switch_mean_temperature==true then StateCut.t=(t_in+t_out)/2.0";

      //        parameter Boolean switch_beta_ideal_gas=true

        //          "if switch_beta_ideal_gas==true then thermal expansion coefficient beta=1/(t_in +273.15)";
      parameter Integer option_beta=1 "calculation of thermal expansion coefficient beta: 1:beta=1/((t_in + t_out)/2.0 +273.15)[valid for ideal gas]
          2:beta=beta_const";
      parameter SIunits.LinearExpansionCoefficient beta_const
        "expansion coefficient fluid, used in Grashof number correlation";

      //        parameter Boolean switch_gas=true

        //          "if switch_gas==true then fluid is gas, else fluid is liquid; relevant for selection of physical model";

      parameter Boolean switch_lambda_const=true
        "if switch_lambda_const==true then thermal conductivity of fluid lambda=lambda_const";

      parameter SIunits.Diameter d_body=0.05
        "diameter of body in cross flow, used if option_geometry=2 or 5 or 6";
      parameter SIunits.Length l_parallel_flow_direction=1
        "length of body parallel to flow direction; used if option_geometry =1 or 2 or 3 or 4";
      parameter SIunits.Length l_orthogonal_flow_direction=1
        "length of body transverse to flow direction; used if option_geometry 1 or 3 or 4 or 5";

      SIunits.Length l_characteristic
        "characteristic length for Reynolds and Nusselt numbers";

      SIunits.Area area_heat_transfer
        "relevant area for convective heat transfer";
      SIunits.LinearExpansionCoefficient beta
        "expansion coefficient fluid, used in Grashof number correlation";

      //        parameter SIunits.DynamicViscosity eta_const=0.15e-3
      //          "value for dynamic viscosity if switch_eta_const==true";
      //        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100

        //          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";

      parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
        "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

      parameter SIunits.KinematicViscosity ny_fluid_const=1.511e-5
        "value for kinematic viscosity ny_fluid=ny_fluid_const";
      parameter SIunits.PrandtlNumber pr_const=0.7
        "value for Prandtl-number pr if switch_pr_const==true";

      parameter SIunits.Angle phi_surface=0.0
        "angle between inclind surface and direction of gravitation";

      SIunits.NusseltNumber nu "Nusselt number";
      SIunits.GrashofNumber gr "Grashof number";
      SIunits.RayleighNumber ra "Rayleight number";

      //        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";

        //        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
      SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
      SIunits.KinematicViscosity ny_fluid "kinematic viscosity flow medium";
      SIunits.PrandtlNumber pr "Prandtl-number";


        //        SIunits.Density rho_average(start=1.0) " average density fluid";
      SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";
      Real a_churchill "coefficient needed for Churchill correlation";
      Real b_churchill "coefficient needed for Churchill correlation";
      SIunits.CelsiusTemperature delta_t
        "temperature difference between surface and fluid";
      //        SIunits.Acceleration g_grashof
      //          "gravitation value used for Grashof-number";

      Real g_factor "necessary for inclined geometry";


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing in pipe:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables.
</p>
<br>




Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Gnielinski</b> </li>
<li>option_dp_model=3: <b>model of Dittus-Boelter</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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
    equation


        //--------------------------end documentation------------------------------

      //        StateCut.rho = rho_average;

      //        if switch_mean_temperature == true then
      //          StateCut.t = (t_in + t_out)/2.0;
      //        end if;

      if option_beta == 1 then
        //
        beta = 1./((t_in + t_out)/2.0 + 273.15);
      end if;
      if option_beta == 2 then
        beta = beta_const;
      end if;

      if switch_ny_const == true then
        ny_fluid = ny_fluid_const;
      end if;

      if switch_pr_const == true then
        pr = pr_const;
      end if;

      if switch_lambda_const == true then
        lambda_fluid = lambda_fluid_const;
      end if;

      //        pr = eta*cp_fluid/lambda_fluid;

      if t_in > t_out then
        delta_t = t_in - t_out;
      else
        delta_t = t_out - t_in;
      end if;

      if option_geometry == 1 then
        // vertical plate-geometry
        l_characteristic = l_parallel_flow_direction;
        area_heat_transfer = l_parallel_flow_direction*
          l_orthogonal_flow_direction;
        a_churchill = 0.825;
        g_factor = 1.0;

      end if;

      if option_geometry == 2 then
        // vertical cylinder-geometry
        l_characteristic = l_parallel_flow_direction;
        area_heat_transfer = l_parallel_flow_direction*d_body*GeneralConstants.
          pi;
        a_churchill = 0.825;
        g_factor = 1.0;
      end if;

      if option_geometry == 3 then
        // inclined surface, heated side facing down
        l_characteristic = l_parallel_flow_direction;
        area_heat_transfer = l_parallel_flow_direction*
          l_orthogonal_flow_direction;
        a_churchill = 0.825;
        g_factor = GeneralConstants.g_n*cos(phi_surface);
      end if;

      if option_geometry == 4 then
        // inclined surface, cooled surface facing up
        l_characteristic = l_parallel_flow_direction;
        area_heat_transfer = l_parallel_flow_direction*
          l_orthogonal_flow_direction;
        a_churchill = 0.825;
        g_factor = GeneralConstants.g_n*cos(phi_surface);
      end if;

      if option_geometry == 5 then
        // horizontal cylinder-geometry
        l_characteristic = GeneralConstants.pi*d_body;
        area_heat_transfer = l_orthogonal_flow_direction*d_body*
          GeneralConstants.pi;
        a_churchill = 1.06;
        g_factor = 1.0;
      end if;

      if option_geometry == 6 then
        // sphere-geometry
        l_characteristic = GeneralConstants.pi/2.0*d_body;
        area_heat_transfer = 2*d_body*GeneralConstants.pi;
        a_churchill = 1.77;
        g_factor = 1.0;
      end if;

      gr = g_factor*TTBasis.HeatTransport.Support.Gr_number(delta_t=delta_t,
        ny_fluid=ny_fluid, beta=beta, d_characteristic=l_characteristic);
      //g_grashof*d_hot_cold^3/(eta^2)*beta*(delta_t)*rho_average^2;
      // Grashof number according to Churchill
      ra = TTBasis.HeatTransport.Support.Ra_number(pr=pr, gr=gr);

      nu = (a_churchill + 0.331*b_churchill*ra^(1/6.))^2;

      b_churchill = 1.17/((1 + (0.5/pr)^(9/16))^(8/27));

      alpha = nu*lambda_fluid/l_characteristic;
      q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

    end NaturalConvectionExternalFlowParaProp;

    model NaturalConvectionHorizontalSurfaceParaProp
      "natural convection heat transfer over horizontal plate"

      extends
        TTBasis.HeatTransport.Support.NaturalConvectionHorizontalSurfaceCIM(
          switch_q_dot_const=true, switch_t_const=false);


        //-----------------additional connector for thermal state------------------------------
      //        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
      //          annotation (extent=[-10, 100; 10, 120]);

      //        parameter Integer option_convective_model=1
      //          "selection of Nusselt-correlation, s. info";

      parameter Integer option_orientation=1
        "orientation of heat flow; 1-hot surface up or cold surface down  2-hot surface down or cold surface up";

      //        parameter Boolean switch_eta_const=true

        //          "if switch_eta_const==true then dynamic viscosity eta=eta_const";
      parameter Boolean switch_lambda_const=true
        "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
      parameter Boolean switch_pr_const=true
        "if switch_pr_const==true then Prandtl-number  pr=pr_const";
      parameter Boolean switch_ny_const=true
        "if switch_ny_const==true then kinematic viscosity of fluid ny_fluid=ny_fluid_const";

      //        parameter Boolean switch_cp_const=true

        //          "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";

      parameter Integer option_beta=1 "calculation of thermal expansion coefficient beta: 1:beta=1/((t_in + t_out)/2.0 +273.15)[valid for ideal gas]
          2:beta=beta_const";
      parameter SIunits.LinearExpansionCoefficient beta_const
        "expansion coefficient fluid, used in Grashof number correlation";

      parameter SIunits.Area a_surface=1 "area of surface";
      parameter SIunits.Length p_surface=4 "perimeter of surface";

      SIunits.Length l_characteristic
        "characteristic length for Reynolds and Nusselt numbers";

      SIunits.Area area_heat_transfer
        "relevant area for convective heat transfer";
      SIunits.LinearExpansionCoefficient beta
        "expansion coefficient fluid, used in Grashof number correlation";

      //        parameter SIunits.DynamicViscosity eta_const=0.15e-3
      //          "value for dynamic viscosity if switch_eta_const==true";
      //        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100

        //          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
      parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
        "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";
      parameter SIunits.KinematicViscosity ny_fluid_const=1.511e-5
        "value for kinematic viscosity ny_fluid=ny_fluid_const";
      parameter SIunits.PrandtlNumber pr_const=0.7
        "value for Prandtl-number pr if switch_pr_const==true";

      SIunits.NusseltNumber nu "Nusselt number";
      SIunits.GrashofNumber gr "Grashof number";
      SIunits.RayleighNumber ra "Rayleight number";

      //        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";

        //        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
      SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
      SIunits.PrandtlNumber pr "Prandtl-number";
      SIunits.KinematicViscosity ny_fluid "kinematic viscosity flow medium";


        //        SIunits.Density rho_average(start=1.0) " average density fluid";
      SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";
      Real b_coefficient "coefficient needed for Nusselt-correlation";
      Real m_exponent "exponent needed for Churchill correlation";
      SIunits.CelsiusTemperature delta_t
        "temperature difference between surface and fluid";


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing in pipe:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables.
</p>
<br>




Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Gnielinski</b> </li>
<li>option_dp_model=3: <b>model of Dittus-Boelter</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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
    equation


        //--------------------------end documentation------------------------------

      //        StateCut.rho = rho_average;
      //        StateCut.t = (t_in + t_out)/2.0;

      if option_beta == 1 then
        //
        beta = 1./((t_in + t_out)/2.0 + 273.15);
      end if;
      if option_beta == 2 then
        beta = beta_const;
      end if;

      if switch_ny_const == true then
        ny_fluid = ny_fluid_const;
      end if;

      if switch_pr_const == true then
        pr = pr_const;
      end if;

      //        if switch_eta_const == true then
      //          eta = eta_const;
      //        end if;

      //        if switch_cp_const == true then
      //          cp_fluid = cp_fluid_const;
      //        end if;

      if switch_lambda_const == true then
        lambda_fluid = lambda_fluid_const;
      end if;

      //        pr = eta*cp_fluid/lambda_fluid;

      if t_in > t_out then
        delta_t = t_in - t_out;
      else
        delta_t = t_out - t_in;
      end if;

      l_characteristic = a_surface/p_surface;
      area_heat_transfer = a_surface;

      if option_orientation == 1 then
        // horizontal surface, hot surace up or cold surface down

        if ra < 1.e7 then

          b_coefficient = 0.54;
          m_exponent = 1./4.;
        else
          b_coefficient = 0.15;
          m_exponent = 1./3.;
        end if;

      end if;

      if option_orientation == 2 then
        // horizontal surface, hot surace down or cold surface up

        b_coefficient = 0.27;
        m_exponent = 1./4.;

      end if;

      gr = TTBasis.HeatTransport.Support.Gr_number(delta_t=delta_t, ny_fluid=
        ny_fluid, beta=beta, d_characteristic=l_characteristic);
      //g_grashof*d_hot_cold^3/(eta^2)*beta*(delta_t)*rho_average^2;
      // Grashof number according to Churchill
      ra = TTBasis.HeatTransport.Support.Ra_number(pr=pr, gr=gr);

      nu = b_coefficient*ra^m_exponent;

      alpha = nu*lambda_fluid/l_characteristic;
      q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

    end NaturalConvectionHorizontalSurfaceParaProp;

    model NaturalConvectionEnclosureParaProp
      "natural convection heat transfer in enclosures, thermophysical properties of fluid defined by parameters"


      extends TTBasis.HeatTransport.Support.NaturalConvectionEnclosureCIM(
          final switch_q_dot_const=true, final switch_t_const=false);


        //-----------------additional connector for thermal state------------------------------
      //        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
      //          annotation (extent=[-10, 100; 10, 120]);

      //        parameter Integer option_convective_model=1
      //          "selection of Nusselt-correlation, s. info";

      parameter Integer option_geometry=1 "geometry in cross flow: 1-vertical rectangular enclosure; 2-inclined rectangular enclosure;
\t;3-horizontal rectangular enclosure, hot surface at the top;4-horizontal rectangular enclosure, hot surface at the bottom ;5-concentric cylinders 6-concentric spheres";

      parameter Boolean switch_pr_const=true
        "if switch_pr_const==true then Prandtl-number  pr=pr_const";
      parameter Boolean switch_ny_const=true
        "if switch_ny_const==true then kinematic viscosity of fluid ny_fluid=ny_fluid_const";
      parameter Boolean switch_area_const=true
        "if switch_area_const==true then area_heat_transfer  is defined by parameter dependent on geometry";

      //        parameter Boolean switch_mean_temperature=true

        //          "if switch_mean_temperature==true then StateCut.t=(t_in+t_out)/2.0";

      parameter Integer option_beta=1 "calculation of thermal expansion coefficient beta: 1:beta=1/((t_in + t_out)/2.0 +273.15)[valid for ideal gas]
          2:beta=beta_const";
      parameter SIunits.LinearExpansionCoefficient beta_const
        "expansion coefficient fluid, used in Grashof number correlation";

      parameter Boolean switch_gas=true
        "if switch_gas==true then fluid is gas, else fluid is liquid; relevant for selection of physical model";

      parameter Boolean switch_lambda_const=true
        "if switch_lambda_const==true then thermal conductivity of fluid lambda=lambda_const";

      parameter SIunits.Distance d_plates=1
        "distance between hot and cold surfaces; used if option_geometry ==1,2,3 or 4";
      parameter SIunits.Length h_enclosure=1
        "height of rectangular enclosure; used if option_geometry ==1 or 2";

      parameter SIunits.Diameter d_inner=0.02 "inner diameter of concentric cylinders or concentric spheres, used
\t\tif option_geometry ==5 or 6 ";

      parameter SIunits.Diameter d_outer=0.025 "outer diameter of concentric cylinders or concentric spheres, used
\tif option_geometry ==5 or 6 ";

      parameter SIunits.Length l_cylinder=1 "length of concentric cylinders,
\ttused if option_geometry ==5";

      parameter SIunits.Area area_rectangular_enclosure="area of surfaces othogonal to heat flow,
	tused if option_geometry ==1 or 2 or 3 or 4";

      SIunits.Area area_heat_transfer
        "relevant area for convective heat transfer";

      SIunits.LinearExpansionCoefficient beta
        "expansion coefficient fluid, used in Grashof number correlation";

      //        parameter SIunits.DynamicViscosity eta_const=0.15e-3
      //          "value for dynamic viscosity if switch_eta_const==true";
      //        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100

        //          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
      parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
        "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

      parameter SIunits.KinematicViscosity ny_fluid_const=1.46e-5
        "value for kinematic viscosity ny_fluid=ny_fluid_const";
      parameter SIunits.PrandtlNumber pr_const=0.7
        "value for Prandtl-number pr if switch_pr_const==true";

      parameter SIunits.Angle phi_enclosure=0.0
        "angle between cold top of inclind rectangular enclosure and direction of gravitation";

      SIunits.PrandtlNumber pr "Prandtl-number";
      SIunits.NusseltNumber nu "Nusselt number";
      SIunits.GrashofNumber gr "Grashof number";
      SIunits.RayleighNumber ra "Rayleigh number";

      //      SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
      SIunits.KinematicViscosity ny_fluid "kinematic viscosity flow medium";

        //      SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
      SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";

      //      SIunits.Density rho_average(start=1.0) " average density fluid";
      SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";

      SIunits.CelsiusTemperature delta_t
        "temperature difference between hot side and cold side ";
      //      SIunits.Acceleration g_grashof

        //        "gravitation value used for Grashof-number, needed for inclined enclosures";

      SIunits.Distance d_hot_cold "distance between hot and cold surface";


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="

<html>
<p>
calculatin of free convective heat transfer between hot and cold side of an enclosure:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
The fluid in the enclosure is identified by parametric values for
<ul>
<li>Prandtl-number pr </li>
<li>kinematic viscosity of fluid ny_fluid</li>
<li>thermal expansion coefficient beta of fluid (see also switch_beta_ideal_gas)</li>
</ul>


</p>
<br>


Before compilation, the geometry of the enclosure must be selected by defining the valur of parameter
option_geometry:


<ul>
<li>option_geometry=1: <b>vertical rectangular enclosure:</li>
<li>option_geometry=2: <b>inclinded rectangular enclosure</b> </li>
<li>option_geometry=3: <b>horizontal rectangular enclosure (hot surface at top)</b> </li>
<li>option_geometry=4: <b>horizontal rectangular enclosure (hot surface at bottom)</b> </li>
<li>option_geometry=5: <b>horizontal rectangular enclosure (hot surface at bottom)</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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

      annotation (Diagram(
          Rectangle(extent=[-52, 92; -32, 60], style(
              color=67,
              fillColor=67,
              fillPattern=1)),
          Rectangle(extent=[-58, 92; -52, 60], style(
              color=45,
              fillColor=1,
              fillPattern=1)),
          Rectangle(extent=[-32, 92; -26, 60], style(
              color=69,
              fillColor=69,
              fillPattern=1)),
          Text(
            extent=[-96, 96; -60, 88],
            string="option_geometry",
            style(
              color=0,
              fillColor=69,
              fillPattern=1)),
          Text(
            extent=[-88, 84; -68, 68],
            string="1",
            style(
              color=0,
              fillColor=69,
              fillPattern=1)),
          Polygon(points=[-36, 26; -30, 22; -48, -6; -54, -2; -36, 26], style(
              color=0,
              fillColor=69,
              fillPattern=1)),
          Polygon(points=[-16, 14; -10, 10; -28, -18; -34, -14; -16, 14], style(
              color=1,
              fillColor=1,
              fillPattern=1)),
          Polygon(points=[-30, 22; -16, 14; -34, -14; -48, -6; -30, 22], style(
              color=67,
              fillColor=67,
              fillPattern=1)),
          Line(points=[-26, 92; -12, 92], style(
              color=0,
              fillColor=67,
              fillPattern=1)),
          Line(points=[-26, 60; -12, 60], style(
              color=0,
              fillColor=67,
              fillPattern=1)),
          Line(points=[-16, 92; -16, 60], style(
              color=0,
              arrow=3,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-10, 80; 18, 74],
            style(
              color=0,
              arrow=3,
              fillColor=0,
              fillPattern=1),
            string="h_enclosure"),
          Line(points=[-52, 60; -52, 50], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-32, 60; -32, 50], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-52, 52; -32, 52], style(
              color=0,
              arrow=3,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-36, 56; 0, 48],
            style(
              color=0,
              arrow=3,
              fillColor=0,
              fillPattern=1),
            string="d_plates"),
          Line(points=[-54, -2; -54, 36], style(
              color=0,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-54, 28; -44, 28; -38, 26], style(
              color=0,
              arrow=3,
              fillColor=0,
              fillPattern=1)),
          Text(
            extent=[-86, 28; -66, 12],
            style(
              color=0,
              fillColor=69,
              fillPattern=1),
            string="2"),
          Text(
            extent=[-42, 38; 8, 30],
            style(
              color=0,
              arrow=3,
              fillColor=0,
              fillPattern=1),
            string="phi_enclosure"),
          Rectangle(extent=[-56, -32; -10, -48], style(
              color=67,
              arrow=3,
              fillColor=67,
              fillPattern=1)),
          Rectangle(extent=[-56, -32; -10, -26], style(
              color=45,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Rectangle(extent=[-56, -48; -10, -54], style(
              color=69,
              arrow=3,
              fillColor=69,
              fillPattern=1)),
          Text(
            extent=[-86, -30; -66, -46],
            style(
              color=0,
              fillColor=69,
              fillPattern=1),
            string="3"),
          Rectangle(extent=[34, -32; 80, -48], style(
              color=67,
              arrow=3,
              fillColor=67,
              fillPattern=1)),
          Rectangle(extent=[34, -32; 80, -26], style(
              color=69,
              arrow=3,
              fillColor=69,
              fillPattern=1)),
          Rectangle(extent=[34, -48; 80, -54], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Text(
            extent=[4, -30; 24, -46],
            style(
              color=0,
              fillColor=69,
              fillPattern=1),
            string="4")));
    equation


        //--------------------------end documentation------------------------------

      //        StateCut.rho = rho_average;

      //        if switch_mean_temperature == true then
      //          StateCut.t = (t_in + t_out)/2.0;
      //        end if;

      if option_beta == 1 then
        //
        beta = 1./((t_in + t_out)/2.0 + 273.15);
      end if;
      if option_beta == 2 then
        beta = beta_const;
      end if;

      if switch_ny_const == true then
        ny_fluid = ny_fluid_const;
      end if;

      if switch_pr_const == true then
        pr = pr_const;
      end if;

      if switch_area_const == true then

        if ((option_geometry > 0) and (option_geometry < 5)) then
          //rectangular enclosure
          area_heat_transfer = area_rectangular_enclosure;
        end if;

        if (option_geometry == 5) then
          //concentric cylinders
          area_heat_transfer = GeneralConstants.pi*l_cylinder*(d_outer -
            d_inner)/Modelica.Math.log(d_outer/d_inner);
        end if;

        if (option_geometry == 6) then
          //concentric spheres
          area_heat_transfer = GeneralConstants.pi*d_outer*d_inner;
        end if;

      end if;

      //        if switch_cp_const == true then
      //          cp_fluid = cp_fluid_const;
      //        end if;

      if switch_lambda_const == true then
        lambda_fluid = lambda_fluid_const;
      end if;

      //        pr = eta*cp_fluid/lambda_fluid;

      if t_in > t_out then
        delta_t = t_in - t_out;
      else
        delta_t = t_out - t_in;
      end if;

      if option_geometry == 1 then
        // vertical rectangular enclosure
        d_hot_cold = d_plates;
        if (ra < 2000) then
          nu = 1;
        else

          if switch_gas == true then
            if (ra < 2e5) then
              nu = 0.197*ra^0.25*(h_enclosure/d_hot_cold)^(-1./9);
            else
              nu = 0.073*ra^(1./3.)*(h_enclosure/d_hot_cold)^(-1./9);
            end if;

          else
            nu = 0.42*(pr^0.012)*ra^0.25*(h_enclosure/d_hot_cold)^(0.3);
          end if;

        end if;
        // g_grashof = GeneralConstants.g_n;
        // d_hot_cold = d_hot_cold_rectangular;
      end if;

      if option_geometry == 2 then

        d_hot_cold = d_plates;

          // inclined rectangular enclosure, cold side on top, parameter phi_enclosure


          // defines angle between cold top of inclind rectangular enclosure and direction of gravitation

        if ((ra*cos(phi_enclosure)) < 2000) then
          nu = 1;
        else

          if switch_gas == true then
            if ((ra*cos(phi_enclosure)) < 2e5) then
              nu = 0.197*(ra*cos(phi_enclosure))^0.25*(h_enclosure/d_hot_cold)^
                (-1./9);
            else
              nu = 0.073*(ra*cos(phi_enclosure))^(1./3.)*(h_enclosure/
                d_hot_cold)^(-1./9);
            end if;

          else
            nu = 0.42*(pr^0.012)*(ra*cos(phi_enclosure))^0.25*(h_enclosure/
              d_hot_cold)^(0.3);
          end if;

        end if;

        //          g_grashof = GeneralConstants.g_n*cos(phi_enclosure);
      end if;

      if option_geometry == 3 then
        // horizontal enclosure, hot surface at the top
        nu = 1;
        d_hot_cold = d_plates;

      end if;

      if option_geometry == 4 then
        // horizontal enclosure, cold side at the top

        if ra < 1700 then
          nu = 1;
          //g_grashof = GeneralConstants.g_n;
          d_hot_cold = d_plates;

        else

          if switch_gas == true then

            if (ra < 7e3) then
              nu = 0.059*ra^0.4;
            else
              if (ra < 3.2e5) then
                nu = 0.212*ra^(1./4.);
              else
                nu = 0.061*ra^(1./3.);
              end if;
            end if;

          else

            if (ra < 6e3) then
              nu = 0.012*ra^(0.6);
            else
              if (ra < 3.7e4) then
                nu = 0.375*ra^0.2;
              else
                if (ra < 1.e8) then
                  nu = 0.13*ra^0.3;
                else
                  nu = 0.057*ra^(1./3.);
                end if;
              end if;
            end if;
          end if;
        end if;

        //          g_grashof = GeneralConstants.g_n;

      end if;

      if option_geometry == 5 then
        // concentric cylinders
        if (ra < 1e6) then
          nu = 0.11*ra^0.29;
        else
          nu = 0.4*ra^0.2;
        end if;
        d_hot_cold = (d_outer - d_inner)/2.0;
      end if;

      if option_geometry == 6 then
        // concentric spheres

        nu = 0.228*ra^0.226;
        d_hot_cold = (d_outer - d_inner)/2.0;
      end if;

      gr = TTBasis.HeatTransport.Support.Gr_number(delta_t=delta_t, ny_fluid=
        ny_fluid, beta=beta, d_characteristic=d_hot_cold);
      //g_grashof*d_hot_cold^3/(eta^2)*beta*(delta_t)*rho_average^2;
      // Grashof number according to Churchill
      ra = g_factor*TTBasis.HeatTransport.Support.Ra_number(pr=pr, gr=gr);

      //ra = gr*pr;
      // Rayleight number

      alpha = nu*lambda_fluid/d_hot_cold;
      q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

    end NaturalConvectionEnclosureParaProp;

    model RadiationHeatEmission
      "calculation of heat emitted from a finite surface to an infinite environment by thermal radiation"


      //      TTInterface.HeatFlow.In EmittingSurface
      //        "connector for heatflow emitted by radiation"
      //        annotation (extent=[-120, -10; -100, 10]);

      extends TTInterface.HeatFlow.TwoPort(final switch_q_dot_const=true,
          final switch_t_const=false);

      SIunits.Emissivity epsilon;
      SIunits.Area surface_area "area emitting thermal radiation";
      parameter SIunits.Emissivity epsilon_const=1.0 "const. value emissivity";
      parameter SIunits.Area surface_area_const=1.0
        "const. value area emitting thermal radiation";

      //-------switch-parameter--------------------------------
      parameter Boolean switch_epsilon_const=true
        "if switch_epsilon_const==true then epsilon=epsilon_const";
      parameter Boolean switch_area_const=true
        "if switch_area_const==true then surface_area = surface_area_const";


        //-------------------------start Icon graphics-----------------------------------

      annotation (Icon(
          Polygon(points=[-100, -100; -80, -100; -80, 100; -100, 100; -100, -100],
               style(
              color=7,
              pattern=0,
              fillColor=47,
              fillPattern=7)),
          Line(points=[-80, 0; -50, 100], style(color=41, fillColor=41)),
          Line(points=[-80, 0; -30, 80], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 0, 60], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 30, 40], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 60, 20], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 100, 0], style(color=41, fillColor=41)),
          Line(points=[-80, 0; -50, -100], style(color=41, fillColor=41)),
          Line(points=[-80, 0; -30, -80], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 0, -60], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 30, -40], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 60, -20], style(color=41, fillColor=41))));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
radiation_heat_transfer is basic model for thermal radiation
emitted from a surface with temperature t_in[°C] </p>

<p>
q_in_dot=surface_area*epsilon*GeneralConstants.sigma*(t_in+273.15)**4
</p>





</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> no storage of energy
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_area_const<td>surface_area = surface_area_const
</tr>
<tr>
<td>switch_epsilon_const<td>epsilon = epsilon_const
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b>None<br>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>surface_area_const<td>const. value for radiating surface<td>Area<td>[m**2]
</tr>
<tr>
<td>epsilon_const<td>const. value for emissivity<td>Emissivity<td>[-]
</tr>

</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Da3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation


        //--------------------------end graphics--------------------------------------

      if switch_epsilon_const then
        epsilon = epsilon_const;
      end if;

      if switch_area_const then
        surface_area = surface_area_const;
      end if;

      q_in_dot = surface_area*epsilon*GeneralConstants.sigma*((t_in + 273.15)^4
         - (t_out + 273.15)^4);

    end RadiationHeatEmission;

    model RadiationHeatExchange
      "model describing radiation heat transfer between two surfaces"

      extends TTInterface.HeatFlow.TwoPort(final switch_q_dot_const=true,
          final switch_t_const=false);

      SIunits.Emissivity epsilon1 "emissivity of surface 1";
      SIunits.Emissivity epsilon2 "emissivity of surface 2";

      parameter SIunits.Emissivity epsilon1_const=1.0
        "const. value emissivity area 1";
      parameter SIunits.Emissivity epsilon2_const=1.0
        "const. value emissivity area 2";
      parameter SIunits.Area surface_area1_const=1.0
        "const. value for area of surface 1 ";
      parameter SIunits.Area surface_area2_const=1.0
        "const. value for area of surface 2 ";
      SIunits.Area surface_area1 "area of surface 1 ";
      SIunits.Area surface_area2 "area of surface 2 ";

      //-------switch-parameter--------------------------------
      parameter Boolean switch_epsilon1_const=true
        "if switch_epsilon1_const==true then epsilon1=epsilon1_const";

      parameter Boolean switch_epsilon2_const=true
        "if switch_epsilon2_const==true then epsilon2=epsilon2_const";

      parameter Boolean switch_area1_const=true
        "if switch_area1_const==true then area1=area1_const";

      parameter Boolean switch_area2_const=true
        "if switch_area2_const==true then area2=area2_const";

      parameter Integer option_geometry=1
        "selection of geometry; 1-parallel plate 2-concentric cylinder or sphere";

      Real view_factor "view factor between surfaces";


        //-------------------------start Icon graphics-----------------------------------

      annotation (Icon(
          Polygon(points=[-100, -100; -80, -100; -80, 100; -100, 100; -100, -100],
               style(
              color=7,
              pattern=0,
              fillColor=47,
              fillPattern=7)),
          Line(points=[-80, 0; -50, 100], style(color=41, fillColor=41)),
          Line(points=[-80, 0; -30, 80], style(color=41, fillColor=41)),
          Line(points=[-80, 0; 100, 0], style(color=41, fillColor=41)),
          Line(points=[-80, 0; -50, -100], style(color=41, fillColor=41)),
          Line(points=[-80, 0; -30, -80], style(color=41, fillColor=41)),
          Polygon(points=[80, -102; 100, -102; 100, 98; 80, 98; 80, -102],
              style(
              color=7,
              pattern=0,
              fillColor=47,
              fillPattern=7)),
          Polygon(points=[-74, 80; -60, 96; -52, 96; -52, 60; -60, 58; -60, 88;
                 -68, 80; -74, 80], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Polygon(points=[56, 94; 76, 94; 76, 86; 58, 66; 76, 66; 76, 60; 50,
                60; 50, 68; 68, 86; 50, 86; 56, 94], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Line(points=[-80, 0; 0, 40], style(color=1)),
          Line(points=[-80, -2; 0, -40], style(color=1)),
          Line(points=[0, -20; 80, 0], style(color=1)),
          Line(points=[0, 20; 80, 0], style(color=1)),
          Line(points=[20, 60; 80, 0], style(color=1)),
          Line(points=[80, 0; 20, -60], style(color=1))));

      annotation (Diagram(
          Polygon(points=[0, 98; 0, -2; 0, 98], style(
              color=0,
              pattern=2,
              arrow=3,
              fillColor=0,
              fillPattern=1)),
          Polygon(points=[-72, 70; -88, 70; -94, 54; -94, 34; -88, 10; -74, 2;
                -58, 12; -52, 36; -52, 40; -52, 56; -60, 68; -72, 70], style(
              color=0,
              arrow=3,
              fillColor=8,
              fillPattern=1)),
          Polygon(points=[-32, 70; -48, 70; -54, 54; -54, 34; -48, 10; -34, 2;
                -18, 12; -12, 36; -12, 40; -12, 56; -20, 68; -32, 70], style(
              color=0,
              arrow=3,
              fillColor=8,
              fillPattern=1)),
          Line(points=[-74, 64; -50, 64], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Line(points=[-84, 50; -54, 50], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Line(points=[-72, 36; -54, 36], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Line(points=[-82, 26; -52, 26], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Line(points=[-74, 14; -50, 14], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Text(
            extent=[-96, 90; -6, 82],
            string="option_geometry = 1",
            style(color=0)),
          Text(
            extent=[4, 90; 94, 82],
            style(color=0),
            string="option_geometry = 2"),
          Text(
            extent=[-78, -8; -20, -16],
            string="surface_area1",
            style(
              color=0,
              arrow=1,
              fillColor=0)),
          Line(points=[-72, 8; -50, -6], style(color=0, arrow=2)),
          Line(points=[-36, 12; -50, -6], style(color=0, arrow=2)),
          Ellipse(extent=[42, 48; 60, 32], style(
              color=0,
              gradient=3,
              arrow=2,
              fillColor=8)),
          Ellipse(extent=[26, 64; 74, 16], style(color=0, arrow=2)),
          Text(
            extent=[46, 74; 94, 66],
            style(
              color=0,
              gradient=3,
              arrow=2,
              fillColor=8),
            string="concentric spheres"),
          Ellipse(extent=[48, 0; 92, -44], style(color=0, arrow=2)),
          Text(
            extent=[44, -48; 92, -56],
            style(
              color=0,
              gradient=3,
              arrow=2,
              fillColor=8),
            string="concentric cylinders"),
          Line(points=[26, 38; 42, 38], style(
              color=1,
              gradient=3,
              arrow=3,
              fillColor=1)),
          Line(points=[48, 64; 50, 48], style(
              color=1,
              gradient=3,
              arrow=3,
              fillColor=1)),
          Line(points=[52, 32; 52, 16], style(
              color=1,
              gradient=3,
              arrow=3,
              fillColor=1)),
          Line(points=[74, 40; 60, 40], style(
              color=1,
              gradient=3,
              arrow=3,
              fillColor=1)),
          Rectangle(extent=[38, 0; 70, -44], style(
              color=7,
              arrow=3,
              fillColor=7)),
          Ellipse(extent=[20, 0; 64, -44], style(
              color=0,
              arrow=2,
              fillColor=7)),
          Line(points=[42, 0; 70, 0], style(
              color=0,
              arrow=3,
              fillColor=7,
              fillPattern=1)),
          Line(points=[42, -44; 70, -44], style(
              color=0,
              arrow=3,
              fillColor=7,
              fillPattern=1)),
          Ellipse(extent=[34, -14; 50, -30], style(
              color=0,
              arrow=3,
              fillColor=7,
              fillPattern=1)),
          Line(points=[42, -14; 62, -14], style(
              color=0,
              arrow=3,
              fillColor=7,
              fillPattern=1)),
          Line(points=[44, -30; 62, -30], style(
              color=0,
              arrow=3,
              fillColor=7,
              fillPattern=1)),
          Line(points=[20, -20; 34, -20], style(
              color=0,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Line(points=[50, -22; 64, -22], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Line(points=[42, -30; 42, -44], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Line(points=[42, -14; 42, 0], style(
              color=1,
              arrow=3,
              fillColor=1,
              fillPattern=1)),
          Text(
            extent=[-4, 14; 54, 6],
            style(color=0),
            string="surface_area1"),
          Text(
            extent=[46, 14; 104, 6],
            style(color=0),
            string="surface_area2"),
          Line(points=[22, 6; 38, -16], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Line(points=[18, 16; 44, 34], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Line(points=[80, 16; 72, 30], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1)),
          Line(points=[80, 6; 66, -24], style(
              color=0,
              arrow=1,
              fillColor=0,
              fillPattern=1))));

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
radiation_heat_transfer is basic model for thermal radiation
emitted from a surface with temperature t_in[°C] to a surface
with temperature t_out[°C]  </p>

<p>
q_in_dot=view_factor*surface_area*GeneralConstants.sigma*((t_in+273.15)**4-(t_out+273.15)**4)
</p>
<p>
<ul>geometry defined by parameter option_geometry
<li>1-two parallel plates</li>
<li>2-concentric spheres or cylinders</li>
</ul>



<p>
<p>extends TTInterface.MassFlow.TwoPort</p>
<p></p>




</p>
<hr>

<b> NECESSARY ADDITIONS:</b>-none-
<hr>


<b> ASSUMPTIONS:</b> no storage of energy
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_area1_const<td>surface_area1 = surface_area1_const
</tr>
<tr>
<td>switch_area2_const<td>surface_area2 = surface_area2_const
</tr>


<tr>
<td>switch_epsilon1_const<td>epsilon1 = epsilon1_const
</tr>
<tr>
<td>switch_epsilon2_const<td>epsilon2 = epsilon2_const
</tr>



</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<p>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_geometry </b><td> geometry of radiating surfaces</tr>
<tr>
<td>1<td> <p>two parallel plates </p>
view_factor=1./(1./epsilon1+1./epsilon2-1.0)
</tr>
<tr>
<td>2<td> <p>concentric spheres or cylinders</p>view_factor=1./(1./epsilon1+surface_area1/surface_area2*(1./epsilon2-1.0))
</tr>
</table>
</p>
<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>surface_area1_const<td>const. value area for radiating surface 1<td>Area<td>[m**2]
</tr>
<tr>
<td>surface_area2_const<td>const. value area for radiating surface 2<td>Area<td>[m**2]
</tr>




<tr>
<td>epsilon1_const<td>const. value for emissivity of surface 1<td>Emissivity<td>[-]
</tr>
<tr>
<td>epsilon2_const<td>const. value for emissivity of surface 2<td>Emissivity<td>[-]
</tr>

</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Da3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation


        //--------------------------end graphics--------------------------------------

      if switch_epsilon1_const then
        epsilon1 = epsilon1_const;
      end if;

      if switch_epsilon2_const then
        epsilon2 = epsilon2_const;
      end if;

      if switch_area1_const then
        surface_area1 = surface_area1_const;
      end if;

      if switch_area2_const then
        surface_area2 = surface_area2_const;
      end if;

      if option_geometry == 1 then
        // two parallel plates
        view_factor = 1./(1./epsilon1 + 1./epsilon2 - 1.0);
      end if;

      if option_geometry == 2 then
        // concentric spheres or cylinders
        view_factor = 1./(1./epsilon1 + surface_area1/surface_area2*(1./
          epsilon2 - 1.0));
      end if;

      q_in_dot = view_factor*surface_area1*GeneralConstants.sigma*((t_in +
        273.15)^4 - (t_out + 273.15)^4);

    end RadiationHeatExchange;

    package Support
      "supporting models for package Basis.HeatTransport TTcode:DaS"
      extends Modelica.Icons.Library;

      annotation (Documentation(info="
identification: TechThermo DaS

content package:
supporting models for package Basis.HeatTransport


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

      model ForcedConvectionPipeNoProp
        "forced convection heat transfer for pipe flow without specification density of fluid"


        extends TTBasis.HeatTransport.Support.ForcedConvectionPipeCIM(
            switch_q_dot_const=true, switch_t_const=false);


          //-----------------additional connector for thermal state------------------------------
        //        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
        //          annotation (extent=[-10, 100; 10, 120]);

        parameter Integer option_convective_model=2
          "1:laminar(Re<2300) 2:Gnielinski 3:Dittus-Boelter";

        parameter Boolean switch_turbulent_and_laminar=true
          "if switch_turbulent_and_laminar==true then laminar pressure loss is assumed if Re<2300";

        parameter Boolean switch_laminar_const_temp=true
          "if switch_laminar_const_temp==true then for laminar flow constant wall temperature is assumed";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";
        parameter Boolean switch_lambda_const=true
          "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
        parameter Boolean switch_cp_const=true
          "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";
        parameter Boolean switch_mean_temperature=true
          "if switch_mean_temperature==true then StateCut.t=(t_in+t_out)/2.0";

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

        parameter SIunits.NusseltNumber t_const_nu_laminar=3.66
          "Nusselt number fully developed laminar flow, constant wall temperature";

        parameter SIunits.NusseltNumber q_const_nu_laminar=4.364
          "Nusselt number fully developed laminar flow, constant wall heat flux";

        parameter Real factor_dittus_boelter=0.023
          "Nu=factor_dittus_boelter*(re^re_exponent_dittus_boelter) * (pr^pr_exponent_dittus_boelter)";

        parameter Real re_exponent_dittus_boelter=0.8
          "Nu=factor_dittus_boelter*(re^re_exponent_dittus_boelter) * (pr^pr_exponent_dittus_boelter)";

        parameter Real pr_exponent_dittus_boelter=0.4
          "Nu=factor_dittus_boelter*(re^re_exponent_dittus_boelter) * (pr^pr_exponent_dittus_boelter)";

        parameter SIunits.MassFlowRate m_minimal_turbulent_dot=1.e-8
          "if abs(massflow)< m_minimal_turbulent_dot then dp=0.0";

        SIunits.MassFlowRate m_dot_max_laminar
          "max. mass flow rate for laminar flow";

        Real quad_m_dot_max_laminar;

        SIunits.NusseltNumber nu "Nusselt number";
        SIunits.NusseltNumber nu_laminar "Nusselt number laminar flow";

        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
        SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
        SIunits.PrandtlNumber pr "Prandtl-number";
        SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";

        //SIunits.Density rho_average(start=1.0) " average density in pipe";

        SIunits.ReynoldsNumber re_positive
          "positve Reynoldsnumber if m_in_dot>0.0";

        SIunits.ReynoldsNumber re_negative
          "positve Reynoldsnumber if m_in_dot<0.0";
        Integer regime "flow regime";

        //SIunits.Velocity w_flow "flow velocity in pipe";

        Real ksi_gnielinski
          "variable used in Nusselt-correlation according to Gnielinski";
        Real turb_factor;
        Real verhaeltnis;


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing in pipe:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables.
</p>
<br>




Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Gnielinski</b> </li>
<li>option_dp_model=3: <b>model of Dittus-Boelter</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>
<p>
with factor_dittus_boelter, re_exponent_dittus_boelter, pr_exponent_dittus_boelter
</p>

<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>StateCut<td>rho<td>t,u,x,x_i,h,p,s</tr>

</table>




<br>


</p>


<hr>

<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>

<tr>
<td><b>switch_laminar_const_temp</b><td>if switch_laminar_const_temp==true then for laminar flow constant wall temperature is assumed
if switch_laminar_const_temp==false constant heat flux is assumed
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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
      equation


          //--------------------------end documentation------------------------------


          //--------------------------end documentation------------------------------

        //        StateCut.rho = rho_average;

        //        if switch_mean_temperature == true then
        //          StateCut.t = (t_in + t_out)/2.0;
        //        end if;


          //mass-flow connectors only used to determine Reynolds-number; connector-variables at inlet and outlet are equal
        0.0 = InletMass.m_dot + OutletMass.m_dot;
        InletMass.p = OutletMass.p;
        InletMass.h = OutletMass.h;
        InletMass.x_i = OutletMass.x_i;

        // calculation Reynolds-number
        //Re-number InletMass.m_dot>0.0 assumed:
        re_positive = noEvent(if InletMass.m_dot > 0.0 then InletMass.m_dot*4.0
          /eta/di_pipe/GeneralConstants.pi else -InletMass.m_dot*4.0/eta/
          di_pipe/GeneralConstants.pi);

        //Re-number InletMass.m_dot<0.0 assumed:
        //re_negative = -InletMass.m_dot*4.0/eta/di_pipe/GeneralConstants.pi;
        re_negative = re_positive;

        //flow velocity, only for information
        //        w_flow = InletMass.m_dot/across_pipe/rho_average;

        if switch_eta_const == true then
          eta = eta_const;
        end if;

        if switch_cp_const == true then
          cp_fluid = cp_fluid_const;
        end if;

        if switch_lambda_const == true then
          lambda_fluid = lambda_fluid_const;
        end if;

        if switch_laminar_const_temp == true then
          nu_laminar = t_const_nu_laminar;
          // constant wall temperature assumed
        else
          nu_laminar = q_const_nu_laminar;
          // constant heat flux assumed
        end if;

        m_dot_max_laminar = 2300/4*3.14159*di_pipe*eta;

        quad_m_dot_max_laminar = m_dot_max_laminar^2;

        pr = eta*cp_fluid/lambda_fluid;

        if (option_convective_model == 1) then

          // laminar pipe-flow, fully developed flow
          nu = nu_laminar;

          regime = 1;

          turb_factor = 42;
          //dummy values
          verhaeltnis = 42;
          //dummy values
          ksi_gnielinski = 42;
          //dummy value

        end if;

        if (option_convective_model == 2) and (switch_turbulent_and_laminar ==
            false) then
          // Nusselt number according to Gnielinski; no check of flow regime

          regime = 2;

          if (re_negative > 0.0) then
            ksi_gnielinski = (1.8*Modelica.Math.log10(re_negative) - 1.5)^(-2);
            nu = (ksi_gnielinski/8.)*re_negative*pr/(1 + 12.7*sqrt(
              ksi_gnielinski/8.)*(pr^(2./3.) - 1.));

          else

            ksi_gnielinski = (1.8*Modelica.Math.log10(re_positive) - 1.5)^(-2);
            nu = (ksi_gnielinski/8.)*re_positive*pr/(1 + 12.7*sqrt(
              ksi_gnielinski/8.)*(pr^(2./3.) - 1.));

          end if;

          turb_factor = 42;
          //dummy values
          verhaeltnis = 42;
          //dummy values

        end if;

        if (option_convective_model == 2) and (switch_turbulent_and_laminar ==
            true) then
          // Nusselt number according to Gnielinski if turbulent


            // check of flow regime; if re<2300 then laminar pressure loss is assumed

          nu = (1 + turb_factor)*nu_laminar;

          verhaeltnis = (InletMass.m_dot^2.0)/(m_dot_max_laminar^2.0);

          if verhaeltnis > 1.0 then
            //turbulent flow regime
            if re_positive >= 0.0 then
              ksi_gnielinski = (1.8*Modelica.Math.log10(re_positive) - 1.5)^(-2);
              turb_factor = ((ksi_gnielinski/8.)*re_positive*pr/(1 + 12.7*sqrt(
                ksi_gnielinski/8.)*(pr^(2./3.) - 1.)))/nu_laminar - 1.0;

              regime = 9;

            else

              ksi_gnielinski = (1.8*Modelica.Math.log10(re_negative) - 1.5)^(-2);
              turb_factor = ((ksi_gnielinski/8.)*re_negative*pr/(1 + 12.7*sqrt(
                ksi_gnielinski/8.)*(pr^(2./3.) - 1.)))/nu_laminar - 1.0;
              regime = 10;

            end if;
          else
            if verhaeltnis < 0.9 then
              // laminar pipe flow
              turb_factor = 0.0;
              ksi_gnielinski = 42;
              //dummy-value
              regime = 11;

            else

              if InletMass.m_dot >= 0.0 then

                ksi_gnielinski = (1.8*Modelica.Math.log10(re_positive) - 1.5)^(
                  -2);


                  //0.9<verhaeltnis<1.0, transition between laminar and turbulent, positive flow direction
                turb_factor = (((ksi_gnielinski/8.)*re_positive*pr/(1 + 12.7*
                  sqrt(ksi_gnielinski/8.)*(pr^(2./3.) - 1.)))/nu_laminar - 1.0)
                  *(verhaeltnis - 0.9)/0.1;
                regime = 12;

              else


                  //0.9<verhaeltnis<1.0, transition between laminar and turbulent, negative flow direction
                ksi_gnielinski = (1.8*Modelica.Math.log10(re_negative) - 1.5)^(
                  -2);
                turb_factor = (((ksi_gnielinski/8.)*re_negative*pr/(1 + 12.7*
                  sqrt(ksi_gnielinski/8.)*(pr^(2./3.) - 1.)))/nu_laminar - 1.0)
                  *(verhaeltnis - 0.9)/0.1;
                regime = 13;
              end if;

            end if;

          end if;

        end if;

        if (option_convective_model == 3) and (switch_turbulent_and_laminar ==
            false) then


            // Nusselt number according to Dittus-Boelter; exponents defined by parameters re_exponent_dittus_boelter
          // and pr_exponent_dittus_boelter;

          regime = 14;

          if (InletMass.m_dot < 0.0) then

            nu = factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*
              pr^pr_exponent_dittus_boelter);

          else

            nu = factor_dittus_boelter*(re_positive^re_exponent_dittus_boelter*
              pr^pr_exponent_dittus_boelter);

          end if;

          turb_factor = 42;
          //dummy values
          verhaeltnis = 42;
          //dummy values
          ksi_gnielinski = 42;

        end if;

        if (option_convective_model == 3) and (switch_turbulent_and_laminar ==
            true) then
          // Nusselt number according to Gnielinski if turbulent


            // check of flow regime; if re<2300 then laminar pressure loss is assumed
          ksi_gnielinski = 42;
          nu = (1 + turb_factor)*nu_laminar;

          verhaeltnis = (InletMass.m_dot^2.0)/(m_dot_max_laminar^2.0);

          if verhaeltnis > 1.0 then
            //turbulent flow regime
            if InletMass.m_dot >= 0.0 then
              turb_factor = (factor_dittus_boelter*(re_positive^
                re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter))/
                nu_laminar - 1.0;

              regime = 15;

            else

              turb_factor = (factor_dittus_boelter*(re_negative^
                re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter))/
                nu_laminar - 1.0;
              regime = 16;

            end if;
          else
            if verhaeltnis < 0.9 then
              // laminar pipe flow
              turb_factor = 0.0;
              regime = 17;

            else

              if InletMass.m_dot >= 0.0 then

                turb_factor = ((factor_dittus_boelter*(re_positive^
                  re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter))/
                  nu_laminar - 1.0)*(verhaeltnis - 0.9)/0.1;
                regime = 18;

              else


                  //0.9<verhaeltnis<1.0, transition between laminar and turbulent, negative flow direction
                turb_factor = ((factor_dittus_boelter*(re_negative^
                  re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter))/
                  nu_laminar - 1.0)*(verhaeltnis - 0.9)/0.1;
                regime = 19;
              end if;

            end if;

          end if;

        end if;

        alpha = nu*lambda_fluid/di_pipe;
        q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

      end ForcedConvectionPipeNoProp;

      model ForcedConvectionPipeCIM
        "connectors and icon for convective heat transfer pipe flow"

        extends TTInterface.HeatFlow.TwoPort;

        parameter Integer n_comp=1;


          //-----------------additional connector for thermal state------------------------------

        TTInterface.MassFlow.In InletMass
          annotation (extent=[-120, 60; -100, 80]);

        TTInterface.MassFlow.Out OutletMass
          annotation (extent=[120, 60; 100, 80]);

        annotation (Icon(
            Polygon(points=[-100, -40; 20, 32; -100, 100; -100, -40], style(
                  color=67, fillColor=67)),
            Ellipse(extent=[-20, 100; 100, -20], style(color=50, fillColor=50)),

            Ellipse(extent=[2, 80; 80, 0], style(color=67, fillColor=67)),
            Polygon(points=[-90, 80; -2, 30; -90, -20; -90, 80], style(
                color=47,
                fillColor=47,
                fillPattern=1))));

      end ForcedConvectionPipeCIM;

      model ForcedConvectionFlatPlateNoProp
        "forced convection heat transfer for flat plate without specification density of fluid"


        extends TTBasis.HeatTransport.Support.ForcedConvectionFlatPlateCIM(
            switch_q_dot_const=true, switch_t_const=false);


          //-----------------additional connector for thermal state------------------------------
        //        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
        //          annotation (extent=[-10, 100; 10, 120]);

        parameter Integer option_convective_model=2
          "1:laminar 2:turbulent 3:mixed laminar/turbulent";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";
        parameter Boolean switch_lambda_const=true
          "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
        parameter Boolean switch_cp_const=true
          "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";

        parameter SIunits.Length dz_plate=1.0
          "Length of plate in direction of flow";
        parameter SIunits.Length width_plate=0.5
          "Width of plate in, vertical to dz_plate";

        parameter SIunits.Area across_flow=0.5
          "cross-sectional area mass flow, used to determine flow velocity from mass flow rate";
        parameter SIunits.Area area_heat_transfer=dz_plate*width_plate
          "relevant area for convective heat transfer";

        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
        parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
          "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

        SIunits.NusseltNumber nu "Nusselt number";

        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
        SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
        SIunits.PrandtlNumber pr "Prandtl-number";
        SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";

        //SIunits.Density rho_average(start=1.0) " average density in pipe";

        SIunits.ReynoldsNumber re_positive
          "positve Reynoldsnumber if m_in_dot>0.0";

        SIunits.ReynoldsNumber re_negative
          "positve Reynoldsnumber if m_in_dot<0.0";
        Integer regime "flow regime";

        //SIunits.Velocity w_flow "flow velocity in pipe";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing over flat plate:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables. Calculation of
flow velocity from mass flow rate demands the definition of the cross sectional area of fluid flow.
</p>
<br>


Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=-1: <b>definition by parameter alpha_const</b> </li>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>turbulent flow</b> </li>
<li>option_dp_model=3: <b>mixed turbulent and laminar flow</b> </li>

</ul>


</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>


<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>StateCut<td>rho<td>t,u,x,x_i,h,p,s</tr>

</table>




<br>


</p>


<hr>

<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>



<tr>
<td><b>switch_laminar_const_temp</b><td>if switch_laminar_const_temp==true then for laminar flow constant wall temperature is assumed
if switch_laminar_const_temp==false constant heat flux is assumed
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>-1<td> heat transfer coefficient defined by parameter alpha_const
</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> turbulent flow assumed
</tr>
<tr>
<td>3<td> mixed turbulent/laminar flow assumed
</tr>


</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz_plate<td> length of plate in direction of flow
</tr>
<tr>
<td>width_plate<td>  width of plate transversal to direction of flow
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>alpha_const<td>parametric value for heat transfer coefficient; only used if option_convective_model==-1
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
      equation


          //--------------------------end documentation------------------------------


          //--------------------------end documentation------------------------------

        //StateCut.rho = rho_average;


          //mass-flow connectors only used to determine Reynolds-number; connector-variables at inlet and outlet are equal
        0.0 = InletMass.m_dot + OutletMass.m_dot;
        InletMass.p = OutletMass.p;
        InletMass.h = OutletMass.h;
        InletMass.x_i = OutletMass.x_i;

        // calculation Reynolds-number
        //Re-number InletMass.m_dot>0.0 assumed:
        re_positive = InletMass.m_dot*dz_plate/eta/across_flow;

        //Re-number InletMass.m_dot<0.0 assumed:
        re_negative = -InletMass.m_dot*dz_plate/eta/across_flow;

        //flow velocity, only for information
        //w_flow = InletMass.m_dot/across_flow/rho_average;

        if switch_eta_const == true then
          eta = eta_const;
        end if;

        if switch_cp_const == true then
          cp_fluid = cp_fluid_const;
        end if;

        if switch_lambda_const == true then
          lambda_fluid = lambda_fluid_const;
        end if;

        //m_dot_max_laminar = 2300/4*3.14159*di_pipe*eta;

        pr = eta*cp_fluid/lambda_fluid;

        if (option_convective_model == -1) then

          // heat transfer coefficient defined by parameter alpha_const

          nu = alpha_const*dz_plate/lambda_fluid;

          regime = -1;

        end if;

        if (option_convective_model == 1) then

          // laminar flow

          if (InletMass.m_dot < 0.0) then
            nu = 0.664*re_negative^0.5*pr^(1./3.);
          else
            nu = 0.664*re_positive^0.5*pr^(1./3.);
          end if;
          regime = 1;

        end if;

        if (option_convective_model == 2) then

          //turbulent flow
          regime = 2;

          if (InletMass.m_dot < 0.0) then

            nu = 0.037*re_negative^0.8*pr/(1 + 2.443*re_negative^(-0.1)*(pr^(2.
              /3.) - 1));

          else

            nu = 0.037*re_positive^0.8*pr/(1 + 2.443*re_positive^(-0.1)*(pr^(2.
              /3.) - 1));

          end if;

        end if;

        if (option_convective_model == 3) then
          // mixed laminar and turbulent

          regime = 3;

          if (InletMass.m_dot < 0.0) then

            nu = sqrt((0.037*re_negative^0.8*pr/(1 + 2.443*re_negative^(-0.1)*(
              pr^(2./3.) - 1)))^2.0 + (0.664*re_negative^0.5*pr^(1./3.))^2.0);

          else

            nu = sqrt((0.037*re_positive^0.8*pr/(1 + 2.443*re_positive^(-0.1)*(
              pr^(2./3.) - 1)))^2.0 + (0.664*re_positive^0.5*pr^(1./3.))^2.0);

          end if;

        end if;

        alpha = nu*lambda_fluid/dz_plate;
        q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

      end ForcedConvectionFlatPlateNoProp;

      model ForcedConvectionFlatPlateCIM
        "connectors and icon for convective heat transfer pipe flow"

        extends TTInterface.HeatFlow.TwoPort;

        parameter Integer n_comp=1;


          //-----------------additional connector for thermal state------------------------------

        TTInterface.MassFlow.In InletMass
          annotation (extent=[-120, 60; -100, 80]);

        TTInterface.MassFlow.Out OutletMass
          annotation (extent=[120, 60; 100, 80]);

        annotation (Icon(
            Polygon(points=[-100, -40; 20, 32; -100, 100; -100, -40], style(
                  color=67, fillColor=67)),
            Polygon(points=[0, 32; -88, -18; -88, 82; 0, 32], style(
                color=47,
                fillColor=47,
                fillPattern=1)),
            Rectangle(extent=[-40, -4; 100, -40], style(
                color=10,
                fillColor=50,
                fillPattern=1))));

      end ForcedConvectionFlatPlateCIM;

      model ForcedConvectionCrossFlowNoProp
        "forced convection heat transfer for body in cross flow"

        extends TTBasis.HeatTransport.Support.ForcedConvectionCrossFlowCIM(
            switch_q_dot_const=true, switch_t_const=false);


          //-----------------additional connector for thermal state------------------------------
        //        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
        //          annotation (extent=[-10, 100; 10, 120]);

        //        parameter Integer option_convective_model=1
        //          "selection of Nusselt-correlation, s. info";

        parameter Integer option_geometry=1
          "geometry in cross flow: 1-cylinder; 2-sphere";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";
        parameter Boolean switch_lambda_const=true
          "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
        parameter Boolean switch_cp_const=true
          "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";

        parameter SIunits.Diameter d_body=0.05 "diameter of body in cross flow";
        parameter SIunits.Length l_cylinder=1
          "length of cylinder orthognoal to flow direction; only used if option_geometry==1";
        SIunits.Length l_characteristic
          "characteristic length for Reynolds and Nusselt numbers";

        parameter SIunits.Area across_flow=0.5
          "cross-sectional area mass flow, used to determine flow velocity from mass flow rate";
        SIunits.Area area_heat_transfer
          "relevant area for convective heat transfer";

        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
        parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
          "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

        SIunits.NusseltNumber nu "Nusselt number";

        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
        SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
        SIunits.PrandtlNumber pr "Prandtl-number";
        SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";

        //SIunits.Density rho_average(start=1.0) " average density in pipe";

        SIunits.ReynoldsNumber re_positive
          "positve Reynoldsnumber if m_in_dot>0.0";

        SIunits.ReynoldsNumber re_negative
          "positve Reynoldsnumber if m_in_dot<0.0";
        Integer regime "flow regime";

        //SIunits.Velocity w_flow "flow velocity in pipe";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing in pipe:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables.
</p>
<br>




Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Gnielinski</b> </li>
<li>option_dp_model=3: <b>model of Dittus-Boelter</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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
      equation


          //--------------------------end documentation------------------------------


          //--------------------------end documentation------------------------------

        //StateCut.rho = rho_average;


          //mass-flow connectors only used to determine Reynolds-number; connector-variables at inlet and outlet are equal
        0.0 = InletMass.m_dot + OutletMass.m_dot;
        InletMass.p = OutletMass.p;
        InletMass.h = OutletMass.h;
        InletMass.x_i = OutletMass.x_i;

        if option_geometry == 1 then
          // cylinder-geometry
          l_characteristic = GeneralConstants.pi/2.0*d_body;
          area_heat_transfer = d_body*GeneralConstants.pi*l_cylinder;
        end if;

        if option_geometry == 2 then
          // sphere-geometry
          l_characteristic = d_body;
          area_heat_transfer = d_body^2.*GeneralConstants.pi;
        end if;

        // calculation Reynolds-number
        //Re-number InletMass.m_dot>0.0 assumed:
        re_positive = InletMass.m_dot*l_characteristic/eta/across_flow;

        //Re-number InletMass.m_dot<0.0 assumed:
        re_negative = -InletMass.m_dot*l_characteristic/eta/across_flow;

        //flow velocity, only for information
        //w_flow = InletMass.m_dot/across_flow/rho_average;

        if switch_eta_const == true then
          eta = eta_const;
        end if;

        if switch_cp_const == true then
          cp_fluid = cp_fluid_const;
        end if;

        if switch_lambda_const == true then
          lambda_fluid = lambda_fluid_const;
        end if;

        //m_dot_max_laminar = 2300/4*3.14159*di_pipe*eta;

        pr = eta*cp_fluid/lambda_fluid;

        if (option_geometry == 1) then
          // cylinder-geometry

          regime = 1;

          if (InletMass.m_dot < 0.0) then

            nu = 0.3 + sqrt((0.037*re_negative^0.8*pr/(1 + 2.443*re_negative^(-0.1)
              *(pr^(2./3.) - 1)))^2.0 + (0.664*re_negative^0.5*pr^(1./3.))^2.0);

          else

            nu = 0.3 + sqrt((0.037*re_positive^0.8*pr/(1 + 2.443*re_positive^(-0.1)
              *(pr^(2./3.) - 1)))^2.0 + (0.664*re_positive^0.5*pr^(1./3.))^2.0);

          end if;

        end if;

        if (option_geometry == 2) then

          //turbulent flow
          regime = 2;

          if (InletMass.m_dot < 0.0) then

            nu = 2.0 + sqrt((0.037*re_negative^0.8*pr/(1 + 2.443*re_negative^(-0.1)
              *(pr^(2./3.) - 1)))^2.0 + (0.664*re_negative^0.5*pr^(1./3.))^2.0);

          else

            nu = 2.0 + sqrt((0.037*re_positive^0.8*pr/(1 + 2.443*re_positive^(-0.1)
              *(pr^(2./3.) - 1)))^2.0 + (0.664*re_positive^0.5*pr^(1./3.))^2.0);

          end if;

        end if;

        alpha = nu*lambda_fluid/l_characteristic;
        q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

      end ForcedConvectionCrossFlowNoProp;

      model ForcedConvectionCrossFlowCIM
        "connectors and icon for convective heat body in cross flow"

        extends TTInterface.HeatFlow.TwoPort;

        parameter Integer n_comp=1;


          //-----------------additional connector for thermal state------------------------------

        TTInterface.MassFlow.In InletMass
          annotation (extent=[-120, 60; -100, 80]);

        TTInterface.MassFlow.Out OutletMass
          annotation (extent=[120, 60; 100, 80]);

        annotation (Icon(
            Polygon(points=[-100, -40; 20, 32; -100, 100; -100, -40], style(
                  color=67, fillColor=67)),
            Ellipse(extent=[22, 74; 100, -6], style(color=50, fillColor=50)),
            Polygon(points=[-90, 80; -2, 30; -90, -20; -90, 80], style(
                color=47,
                fillColor=47,
                fillPattern=1))));

      end ForcedConvectionCrossFlowCIM;

      model NaturalConvectionExternalFlowNoProp
        "natural convection heat transfer for body with external flow"

        extends TTBasis.HeatTransport.Support.NaturalConvectionExternalFlowCIM(
            switch_q_dot_const=true, switch_t_const=false);


          //-----------------additional connector for thermal state------------------------------
        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
          annotation (extent=[-10, 100; 10, 120]);

        //        parameter Integer option_convective_model=1
        //          "selection of Nusselt-correlation, s. info";

        parameter Integer option_geometry=1 "geometry in cross flow: 1-vertical plate; 2-vertical cylinder 3-inclined heated surface, facing down
\t\t 4-inclined cooled surface, facing up  5-horizontal cylinder 6-sphere";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";
        parameter Boolean switch_lambda_const=true
          "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
        parameter Boolean switch_cp_const=true
          "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";
        parameter Boolean switch_mean_temperature=true
          "if switch_mean_temperature==true then StateCut.t=(t_in+t_out)/2.0";

        parameter Boolean switch_beta_ideal_gas=true
          "if switch_beta_ideal_gas==true then thermal expansion coefficient beta=1/(t_in +273.15)";

        parameter SIunits.Diameter d_body=0.05
          "diameter of body in cross flow, used if option_geometry=2 or 5 or 6";
        parameter SIunits.Length l_parallel_flow_direction=1
          "length of body parallel to flow direction; used if option_geometry =1 or 2 or 3 or 4";
        parameter SIunits.Length l_orthogonal_flow_direction=1
          "length of body transverse to flow direction; used if option_geometry 1 or 3 or 4 or 5";

        SIunits.Length l_characteristic
          "characteristic length for Reynolds and Nusselt numbers";

        SIunits.Area area_heat_transfer
          "relevant area for convective heat transfer";
        SIunits.LinearExpansionCoefficient beta
          "expansion coefficient fluid, used in Grashof number correlation";

        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
        parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
          "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

        parameter SIunits.Angle phi_surface=0.0
          "angle between inclind surface and direction of gravitation";

        SIunits.NusseltNumber nu "Nusselt number";
        SIunits.GrashofNumber gr "Grashof number";
        SIunits.RayleighNumber ra "Rayleight number";

        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
        SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
        SIunits.PrandtlNumber pr "Prandtl-number";

        SIunits.Density rho_average(start=1.0) " average density fluid";
        SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";
        Real a_churchill "coefficient needed for Churchill correlation";
        Real b_churchill "coefficient needed for Churchill correlation";
        SIunits.CelsiusTemperature delta_t
          "temperature difference between surface and fluid";
        SIunits.Acceleration g_grashof
          "gravitation value used for Grashof-number";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing in pipe:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables.
</p>
<br>




Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Gnielinski</b> </li>
<li>option_dp_model=3: <b>model of Dittus-Boelter</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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
      equation


          //--------------------------end documentation------------------------------

        StateCut.rho = rho_average;

        if switch_mean_temperature == true then
          StateCut.t = (t_in + t_out)/2.0;
        end if;

        if switch_beta_ideal_gas == true then
          beta = 1./(t_in + 273.15);
        end if;

        if switch_eta_const == true then
          eta = eta_const;
        end if;

        if switch_cp_const == true then
          cp_fluid = cp_fluid_const;
        end if;

        if switch_lambda_const == true then
          lambda_fluid = lambda_fluid_const;
        end if;

        pr = eta*cp_fluid/lambda_fluid;

        if t_in > t_out then
          delta_t = t_in - t_out;
        else
          delta_t = t_out - t_in;
        end if;

        if option_geometry == 1 then
          // vertical plate-geometry
          l_characteristic = l_parallel_flow_direction;
          area_heat_transfer = l_parallel_flow_direction*
            l_orthogonal_flow_direction;
          a_churchill = 0.825;
          g_grashof = GeneralConstants.g_n;

        end if;

        if option_geometry == 2 then
          // vertical cylinder-geometry
          l_characteristic = l_parallel_flow_direction;
          area_heat_transfer = l_parallel_flow_direction*d_body*
            GeneralConstants.pi;
          a_churchill = 0.825;
          g_grashof = GeneralConstants.g_n;
        end if;

        if option_geometry == 3 then
          // inclined surface, heated side facing down
          l_characteristic = l_parallel_flow_direction;
          area_heat_transfer = l_parallel_flow_direction*
            l_orthogonal_flow_direction;
          a_churchill = 0.825;
          g_grashof = GeneralConstants.g_n*cos(phi_surface);
        end if;

        if option_geometry == 4 then
          // inclined surface, cooled surface facing up
          l_characteristic = l_parallel_flow_direction;
          area_heat_transfer = l_parallel_flow_direction*
            l_orthogonal_flow_direction;
          a_churchill = 0.825;
          g_grashof = GeneralConstants.g_n*cos(phi_surface);
        end if;

        if option_geometry == 5 then
          // horizontal cylinder-geometry
          l_characteristic = GeneralConstants.pi*d_body;
          area_heat_transfer = l_orthogonal_flow_direction*d_body*
            GeneralConstants.pi;
          a_churchill = 1.06;
          g_grashof = GeneralConstants.g_n;
        end if;

        if option_geometry == 6 then
          // sphere-geometry
          l_characteristic = GeneralConstants.pi/2.0*d_body;
          area_heat_transfer = 2*d_body*GeneralConstants.pi;
          a_churchill = 1.77;
          g_grashof = GeneralConstants.g_n;
        end if;

        gr = g_grashof*l_characteristic^3/(eta^2)*beta*(delta_t)*rho_average^2;
        // Grashof number according to Churchill
        ra = gr*pr;
        // Rayleight number

        nu = (a_churchill + 0.331*b_churchill*ra^(1/6.))^2;

        b_churchill = 1.17/((1 + (0.5/pr)^(9/16))^(8/27));

        alpha = nu*lambda_fluid/l_characteristic;
        q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

      end NaturalConvectionExternalFlowNoProp;

      model NaturalConvectionExternalFlowCIM
        "connectors and icon for convective heat body in cross flow"

        extends TTInterface.HeatFlow.TwoPort;

        parameter Integer n_comp=1;

        annotation (Icon(
            Rectangle(extent=[60, 98; 100, -40], style(color=50, fillColor=50)),

            Polygon(points=[-80, 100; -52, 52; -80, 8; -60, -40; -40, -40; -60,
                   10; -38, 54; -80, 100], style(
                color=4,
                fillColor=4,
                fillPattern=1)),
            Polygon(points=[-40, 100; -12, 52; -40, 8; -20, -40; 0, -40; -20,
                  10; 2, 54; -40, 100], style(
                color=4,
                fillColor=4,
                fillPattern=1)),
            Polygon(points=[0, 100; 28, 52; 0, 8; 20, -40; 40, -40; 20, 10; 42,
                   54; 0, 100], style(
                color=4,
                fillColor=4,
                fillPattern=1)),
            Polygon(points=[-60, 80; 60, 30; -60, -20; -60, 80], style(
                color=45,
                fillColor=45,
                fillPattern=1))));

      end NaturalConvectionExternalFlowCIM;

      model NaturalConvectionHorizontalSurfaceNoProp
        "natural convection heat transfer over horizontal plate"

        extends
          TTBasis.HeatTransport.Support.NaturalConvectionHorizontalSurfaceCIM(
            switch_q_dot_const=true, switch_t_const=false);


          //-----------------additional connector for thermal state------------------------------
        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
          annotation (extent=[-10, 100; 10, 120]);

        //        parameter Integer option_convective_model=1
        //          "selection of Nusselt-correlation, s. info";

        parameter Integer option_orientation=1
          "orientation of heat flow; 1-hot surface up or cold surface down  2-hot surface down or cold surface up";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";
        parameter Boolean switch_lambda_const=true
          "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
        parameter Boolean switch_cp_const=true
          "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";

        parameter Boolean switch_beta_ideal_gas=true
          "if switch_beta_ideal_gas==true then thermal expansion coefficient beta=1/(t_in +273.15)";

        parameter SIunits.Area a_surface=1 "area of surface";
        parameter SIunits.Length p_surface=4 "perimeter of surface";

        SIunits.Length l_characteristic
          "characteristic length for Reynolds and Nusselt numbers";

        SIunits.Area area_heat_transfer
          "relevant area for convective heat transfer";
        SIunits.LinearExpansionCoefficient beta
          "expansion coefficient fluid, used in Grashof number correlation";

        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
        parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
          "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

        SIunits.NusseltNumber nu "Nusselt number";
        SIunits.GrashofNumber gr "Grashof number";
        SIunits.RayleighNumber ra "Rayleight number";

        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
        SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
        SIunits.PrandtlNumber pr "Prandtl-number";

        SIunits.Density rho_average(start=1.0) " average density fluid";
        SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";
        Real b_coefficient "coefficient needed for Nusselt-correlation";
        Real m_exponent "exponent needed for Churchill correlation";
        SIunits.CelsiusTemperature delta_t
          "temperature difference between surface and fluid";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing in pipe:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables.
</p>
<br>




Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Gnielinski</b> </li>
<li>option_dp_model=3: <b>model of Dittus-Boelter</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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
      equation


          //--------------------------end documentation------------------------------

        StateCut.rho = rho_average;
        StateCut.t = (t_in + t_out)/2.0;

        if switch_beta_ideal_gas == true then
          beta = 1./(t_in + 273.15);
        end if;

        if switch_eta_const == true then
          eta = eta_const;
        end if;

        if switch_cp_const == true then
          cp_fluid = cp_fluid_const;
        end if;

        if switch_lambda_const == true then
          lambda_fluid = lambda_fluid_const;
        end if;

        pr = eta*cp_fluid/lambda_fluid;

        if t_in > t_out then
          delta_t = t_in - t_out;
        else
          delta_t = t_out - t_in;
        end if;

        l_characteristic = a_surface/p_surface;
        area_heat_transfer = a_surface;

        if option_orientation == 1 then
          // horizontal surface, hot surace up or cold surface down

          if ra < 1.e7 then

            b_coefficient = 0.54;
            m_exponent = 1./4.;
          else
            b_coefficient = 0.15;
            m_exponent = 1./3.;
          end if;

        end if;

        if option_orientation == 2 then
          // horizontal surface, hot surace down or cold surface up

          b_coefficient = 0.27;
          m_exponent = 1./4.;

        end if;

        gr = GeneralConstants.g_n*l_characteristic^3/(eta^2)*beta*(delta_t)*
          rho_average^2;
        // Grashof number according to Churchill
        ra = gr*pr;
        // Rayleight number

        nu = b_coefficient*ra^m_exponent;

        alpha = nu*lambda_fluid/l_characteristic;
        q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

      end NaturalConvectionHorizontalSurfaceNoProp;

      model NaturalConvectionHorizontalSurfaceCIM
        "connectors and icon for convective heat body in cross flow"

        extends TTInterface.HeatFlow.TwoPort;

        parameter Integer n_comp=1;

        annotation (Icon(
            Rectangle(extent=[60, 98; 100, -40], style(color=50, fillColor=50)),

            Polygon(points=[-80, 100; -52, 52; -80, 8; -60, -40; -40, -40; -60,
                   10; -38, 54; -80, 100], style(
                color=4,
                fillColor=4,
                fillPattern=1)),
            Polygon(points=[-40, 100; -12, 52; -40, 8; -20, -40; 0, -40; -20,
                  10; 2, 54; -40, 100], style(
                color=4,
                fillColor=4,
                fillPattern=1)),
            Polygon(points=[0, 100; 28, 52; 0, 8; 20, -40; 40, -40; 20, 10; 42,
                   54; 0, 100], style(
                color=4,
                fillColor=4,
                fillPattern=1)),
            Polygon(points=[-60, 80; 60, 30; -60, -20; -60, 80], style(
                color=45,
                fillColor=45,
                fillPattern=1))), Diagram(
            Text(
              extent=[-92, -6; -30, 4],
              style(
                color=0,
                fillColor=50,
                fillPattern=1),
              string="connector to fluid:"),
            Text(
              extent=[28, -6; 92, 4],
              style(
                color=0,
                fillColor=50,
                fillPattern=1),
              string="connector to surface:"),
            Text(
              extent=[-30, 88; 26, 80],
              string="p_surface",
              style(
                color=58,
                fillColor=50,
                fillPattern=1)),
            Polygon(points=[-40, 60; -20, 76; 10, 76; 46, 64; 34, 36; -14, 30;
                  -40, 60], style(
                color=0,
                arrow=3,
                fillColor=7,
                fillPattern=7)),
            Line(points=[10, 80; 50, 68; 36, 32; -16, 26; -46, 60; -22, 80; -14,
                   80], style(
                color=58,
                arrow=2,
                fillColor=58,
                fillPattern=1)),
            Text(
              extent=[-92, 44; -36, 36],
              string="a_surface",
              style(
                color=0,
                fillColor=50,
                fillPattern=1)),
            Line(points=[-48, 40; -14, 54], style(
                color=0,
                arrow=1,
                fillColor=0,
                fillPattern=1))));

      end NaturalConvectionHorizontalSurfaceCIM;

      model NaturalConvectionEnclosureNoProp
        "natural convection heat transfer for body with external flow"

        extends TTBasis.HeatTransport.Support.NaturalConvectionEnclosureCIM(
            switch_q_dot_const=true, switch_t_const=false);


          //-----------------additional connector for thermal state------------------------------
        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
          annotation (extent=[-10, 100; 10, 120]);

        //        parameter Integer option_convective_model=1
        //          "selection of Nusselt-correlation, s. info";

        parameter Integer option_geometry=1 "geometry in cross flow: 1-vertical rectangular enclosure; 2-inclined rectangular enclosure;
\t\t3-horizontal enclosure, hot surface at the top; 4-concentric cylinders 5-concentric spheres";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";
        parameter Boolean switch_lambda_const=true
          "if switch_lambda_const==true then thermal heat conductivity of fluid lambda_fluid=lambda_fluid_const";
        parameter Boolean switch_cp_const=true
          "if switch_cp_const==true then specific heat capacity cp_fluid=cp_fluid_const";
        parameter Boolean switch_area_const=true
          "if switch_area_const==true then area_heat_transfer  is defined by parameter dependent on geometry";

        parameter Boolean switch_mean_temperature=true
          "if switch_mean_temperature==true then StateCut.t=(t_in+t_out)/2.0";

        parameter Boolean switch_beta_ideal_gas=true
          "if switch_beta_ideal_gas==true then thermal expansion coefficient beta=1/(t_in +273.15)";

        parameter Boolean switch_gas=true
          "if switch_gas==true then fluid is gas, else fluid is liquid";

        //        parameter SIunits.Distance d_hot_cold_rectangular=1

          //          "distance between hot and cold surface of rectangular enclosure, used if option_geometry ==1 or 2 or 3 or 4";
        parameter SIunits.Length h_enclosure=1
          "height of rectangular enclosure; used if option_geometry ==1 or 2";

        parameter SIunits.Diameter d_inner "inner diameter of concentric cylinders or concentric spheres, used
\t\tif option_geometry ==5 or 6 ";

        parameter SIunits.Diameter d_outer "outer diameter of concentric cylinders or concentric spheres, used
\t\tif option_geometry ==5 or 6 ";

        parameter SIunits.Length l_cylinder=1 "length of concentric cylinders,
\t\tused if option_geometry ==5";

        parameter SIunits.Area area_rectangular_enclosure=1 "area of surfaces othogonal to heat flow,
\t\tused if option_geometry ==1 or 2 or 3 or 4";

        SIunits.Area area_heat_transfer
          "relevant area for convective heat transfer";

        SIunits.LinearExpansionCoefficient beta
          "expansion coefficient fluid, used in Grashof number correlation";

        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.SpecificHeatCapacity cp_fluid_const=4100
          "value for specific heat capacity of fluid, if switch_cp_const==true, used to determine Prandtl-number";
        parameter SIunits.ThermalConductivity lambda_fluid_const=660.e-3
          "value for heat coductivity of fluid,  if switch_lambda_const==true, used to determine Prandtl-number";

        parameter SIunits.Angle phi_enclosure=0.0
          "angle between cold top of inclind rectangular enclosure and direction of gravitation";

        SIunits.NusseltNumber nu "Nusselt number";
        SIunits.GrashofNumber gr "Grashof number";
        SIunits.RayleighNumber ra "Rayleight number";

        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";
        SIunits.SpecificHeatCapacity cp_fluid "specific heat capacity of fluid";
        SIunits.ThermalConductivity lambda_fluid "heat coductivity of fluid";
        SIunits.PrandtlNumber pr "Prandtl-number";

        SIunits.Density rho_average(start=1.0) " average density fluid";
        SIunits.CoefficientOfHeatTransfer alpha "coefficient of heat transfer";

        SIunits.CelsiusTemperature delta_t
          "temperature difference between surface and fluid";
        SIunits.Acceleration g_grashof
          "gravitation value used for Grashof-number, needed for inclined enclosures";

        SIunits.Distance d_hot_cold "distance between hot and cold surface";


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p>
calculatin of forced convective heat transfer to fluid flowing in pipe:<br>
<p>
correlation between heat flow rate q_in_dot, coefficient of heat transfer alpha, area of heat tranfer
area_heat_transfer, and temperature difference:
</p>
<p>
q_in_dot=alpha*area_heat_transfer*(t_in-t_out);
<br></p>
<p>
information about flow velocity is provided by mass flow connectors; flow enters at connector InletMass
and exits at connector OutletMass without modifications of the connector variables.
</p>
<br>




Before compilation, a single procedure for calcuation of alpha can be selected by setting
the value of parameter option_convective_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Gnielinski</b> </li>
<li>option_dp_model=3: <b>model of Dittus-Boelter</b> </li>

</ul>


</p>

<p>
model of Dittus-Boelter is given as: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</p>


<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>

<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.
<li>the thermal heat conductivity lambda_fluid is constant : lambda_fluid=lambda_fluid_const (switch_lambda_const = true). If eta should be variable, set
switch_lambda_const = false and introduce procedure for calculation of lambda_fluid.
<li>the specific heat capacity cp_fluid is constant : cp_fluid=cp_fluid_const (switch_cp_const = true). If cp_fluid should be variable, set
switch_cp_const = false and introduce procedure for calculation of lambda_fluid.
<li>for Dittus-Boelter: exponent pr_exponent_dittus_boelter is parameter, no check for heated or cooled flow



</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_lambda_const</b><td>if switch_lambda_const==true then lambda_fluid=lambda_fluid_const
</tr>
<tr>
<td><b>switch_cp_const</b><td>if switch_cp_const==true then cp_fluid=cp_fluid_const
</tr>

<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Gnielinski model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
</tr>
<tr>
<td>lambda_fluid_const<td> value for thermal heat conductivity of fluid if switch_lambda_const==true
</tr>
<tr>
<td>cp_fluid_const<td> value for thermal specific heat capacity cp_fluid of fluid if switch_cp_const==true
</tr>
<tr>
<td>t_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall temperature
</tr>
<tr>
<td>q_const_nu_laminar<td> Nusselt number fully developed laminar flow, constant wall heat flux
</tr>
<tr>
<td>factor_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>
<tr>
<td>re_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
</tr>

<tr>
<td>pr_exponent_dittus_boelter<td> Dittus-Boelter correlation: Nu=factor_dittus_boelter*(re_negative^re_exponent_dittus_boelter*pr^pr_exponent_dittus_boelter)
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
      equation


          //--------------------------end documentation------------------------------

        StateCut.rho = rho_average;

        if switch_mean_temperature == true then
          StateCut.t = (t_in + t_out)/2.0;
        end if;

        if switch_beta_ideal_gas == true then
          beta = 1./(t_in + 273.15);
        end if;

        if switch_eta_const == true then
          eta = eta_const;
        end if;

        if switch_area_const == true then

          if ((option_geometry > 0) and (option_geometry < 5)) then
            //rectangular enclosure
            area_heat_transfer = area_rectangular_enclosure;
          end if;

          if (option_geometry == 5) then
            //concentric cylinders
            area_heat_transfer = GeneralConstants.pi*l_cylinder*(d_outer -
              d_inner)/Modelica.Math.log(d_outer/d_inner);
          end if;

          if (option_geometry == 6) then
            //concentric spheres
            area_heat_transfer = GeneralConstants.pi*d_outer*d_inner;
          end if;

        end if;

        if switch_cp_const == true then
          cp_fluid = cp_fluid_const;
        end if;

        if switch_lambda_const == true then
          lambda_fluid = lambda_fluid_const;
        end if;

        pr = eta*cp_fluid/lambda_fluid;

        if t_in > t_out then
          delta_t = t_in - t_out;
        else
          delta_t = t_out - t_in;
        end if;

        if option_geometry == 1 then
          // vertical rectangular enclosure

          if (ra < 2000) then
            nu = 1;
          else

            if switch_gas == true then
              if (ra < 2e5) then
                nu = 0.197*ra^0.25*(h_enclosure/d_hot_cold)^(-1./9);
              else
                nu = 0.073*ra^(1./3.)*(h_enclosure/d_hot_cold)^(-1./9);
              end if;

            else
              nu = 0.42*(pr^0.012)*ra^0.25*(h_enclosure/d_hot_cold)^(0.3);
            end if;

          end if;
          g_grashof = GeneralConstants.g_n;
          d_hot_cold = d_hot_cold_rectangular;
        end if;

        if option_geometry == 2 then


            // inclined rectangular enclosure, cold side on top, parameter phi_enclosure


            // defines angle between cold top of inclind rectangular enclosure and direction of gravitation

          if (ra < 2000) then
            nu = 1;
          else

            if switch_gas == true then
              if (ra < 2e5) then
                nu = 0.197*ra^0.25*(h_enclosure/d_hot_cold)^(-1./9);
              else
                nu = 0.073*ra^(1./3.)*(h_enclosure/d_hot_cold)^(-1./9);
              end if;

            else
              nu = 0.42*(pr^0.012)*ra^0.25*(h_enclosure/d_hot_cold)^(0.3);
            end if;
            d_hot_cold = d_hot_cold_rectangular;
          end if;

          g_grashof = GeneralConstants.g_n*cos(phi_enclosure);
        end if;

        if option_geometry == 3 then
          // horizontal enclosure, hot surface at the top
          nu = 1;
          d_hot_cold = d_hot_cold_rectangular;

        end if;

        if option_geometry == 4 then
          // horizontal enclosure, cold side at the top

          if ra < 1700 then
            nu = 1;
            g_grashof = GeneralConstants.g_n;

            d_hot_cold = d_hot_cold_rectangular;

          else

            if switch_gas == true then

              if (ra < 7e3) then
                nu = 0.059*ra^0.4;
              else
                if (ra < 3.2e5) then
                  nu = 0.212*ra^(1./4.);
                else
                  nu = 0.061*ra^(1./3.);
                end if;
              end if;

            else

              if (ra < 6e3) then
                nu = 0.012*ra^(0.6);
              else
                if (ra < 3.7e4) then
                  nu = 0.375*ra^0.2;
                else
                  if (ra < 1.e8) then
                    nu = 0.13*ra^0.3;
                  else
                    nu = 0.057*ra^(1./3.);
                  end if;
                end if;
              end if;
            end if;
          end if;

          g_grashof = GeneralConstants.g_n;

        end if;

        if option_geometry == 5 then
          // concentric cylinders
          if (ra < 1e6) then
            nu = 0.11*ra^0.29;
          else
            nu = 0.4*ra^0.2;
          end if;
          g_grashof = GeneralConstants.g_n;
          d_hot_cold = (d_outer - d_inner)/2.0;
        end if;

        if option_geometry == 6 then
          // concentric spheres

          nu = 0.228*ra^0.226;
          g_grashof = GeneralConstants.g_n;
          d_hot_cold = (d_outer - d_inner)/2.0;
        end if;

        gr = g_grashof*d_hot_cold^3/(eta^2)*beta*(delta_t)*rho_average^2;
        // Grashof number according to Churchill
        ra = gr*pr;
        // Rayleight number

        alpha = nu*lambda_fluid/d_hot_cold;
        q_in_dot = alpha*area_heat_transfer*(t_in - t_out);

      end NaturalConvectionEnclosureNoProp;

      model NaturalConvectionEnclosureCIM
        "connectors and icon for convective heat body in cross flow"

        extends TTInterface.HeatFlow.TwoPort;

        annotation (Icon(
            Rectangle(extent=[-100, 100; -60, -60], style(color=1, fillColor=1)),

            Rectangle(extent=[60, 100; 100, -60], style(color=69, fillColor=69)),

            Rectangle(extent=[-60, 100; 60, -60], style(
                color=67,
                fillColor=67,
                fillPattern=1)),
            Rectangle(extent=[-40, 76; 34, 66], style(
                color=1,
                fillColor=1,
                fillPattern=1)),
            Polygon(points=[34, 84; 34, 56; 60, 72; 34, 84], style(
                color=1,
                fillColor=1,
                fillPattern=1)),
            Rectangle(extent=[-24, -22; 50, -32], style(
                color=69,
                fillColor=69,
                fillPattern=1)),
            Polygon(points=[-24, -14; -24, -42; -44, -28; -24, -14], style(
                color=69,
                fillColor=69,
                fillPattern=1))));

      end NaturalConvectionEnclosureCIM;

      function Gr_number "calculates Grashof number from kinematic viscosity ny, characteristic length l, volumetric
thermal expansion coefficient beta and temperature difference delta_temp"

        input SIunits.CelsiusTemperature delta_t
          "temperature difference between hot side and cold side ";
        input SIunits.KinematicViscosity ny_fluid
          "kinematic viscosity flow medium";
        input SIunits.LinearExpansionCoefficient beta
          "coefficient of volume expansion of fluid";
        input SIunits.Distance d_characteristic
          "characteristic length of geometry";

        output SIunits.GrashofNumber gr "Grashof number";

        annotation (Icon(Rectangle(extent=[-100, 80; 100, -80], style(color=45,
                   fillColor=47)), Text(
              extent=[-76, 68; 64, -50],
              style(
                color=0,
                fillColor=45,
                fillPattern=1),
              string="Gr")));

        annotation (Documentation(info="
<html>
<p>
function for calculation Grashof number from temperature difference, coefficient of volume expansion, characteristic length
of geometry and kinematic viscosity
</p>

input:
<ul>
<li>temperature difference (SIunits.CelsiusTemperature delta_t)</li>
<li>kinematic viscosity flow medium (SIunits.KinematicViscosity ny_fluid)</li>
<li>coefficient of volume expansion of fluid (SIunits.LinearExpansionCoefficient beta)</li>
<li>characteristic length of geometry (SIunits.Distance d_characteristic)</li>
</ul>
output:GrashofNumber (SIunits.GrashofNumber gr)




</HTML>"));
      algorithm

        gr := GeneralConstants.g_n*abs(delta_t)*beta*(d_characteristic^3)/(
          ny_fluid^2);
      end Gr_number;

      function Ra_number
        "calculates Rayleigh number from Grashof number and Prandtl number"

        output SIunits.RayleighNumber ra "Rayleigh number";
        input SIunits.GrashofNumber gr "Grashof number";
        input SIunits.PrandtlNumber pr "Prandtl-number";

        annotation (Icon(Rectangle(extent=[-100, 80; 100, -80], style(color=45,
                   fillColor=47)), Text(
              extent=[-76, 68; 64, -50],
              style(
                color=0,
                fillColor=45,
                fillPattern=1),
              string="Ra")));

        annotation (Documentation(info="
<html>
<p>
function for calculation Rayleigh number from Prandtl number and Grashof number
</p>

input:
<ul>
<li>Grashof number (SIunits.GrashofNumber gr)</li>
<li>Prandtl number (SIunits.PrandtlNumber pr)</li>
</ul>
output:RayleighNumber (SIunits.RayleighNumber ra)




</HTML>"));
      algorithm

        ra := gr*pr;

      end Ra_number;

    end Support;

  end HeatTransport;

  package MassTransport "correlations describing mass transport TTcode:Db"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: thermophysical correlations describing mass transport

identification: TechThermo Db
"));
    annotation (
      Icon(
        Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Polygon(points=[-72, 26; -21, -24; -72, -74; -72, 26], style(color=0,
              fillColor=4)),
        Polygon(points=[2, 26; 53, -24; 2, -74; 2, 26], style(color=0,
              fillColor=4))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6));

    package Support "correlations describing mass transport TTcode:DbS"
      extends Modelica.Icons.Library;

      annotation (Documentation(info="

content package:
supporting models for package Basis.MassTransport

identification: TechThermo DbS
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

      model PressureLossPipeNoProp
        "friction pressure loss in smooth pipe without medium specification"

        extends TTBasis.MassTransport.Support.FlowResistorCIM(
          switch_m_dot_const=true,
          switch_h_const=true,
          switch_p_const=false,
          switch_x_i_const=true);


          //-----------------additional connector for thermal state------------------------------
        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
          annotation (extent=[-10, 100; 10, 120]);

        parameter Integer option_dp_model=2
          "1:laminar(Re<2300) 2:Blasius (3000<Re<100000) 3:Nikuradse (1.e5<re<1.e8)";

        parameter Boolean switch_turbulent_and_laminar=true
          "if switch_turbulent_and_laminar==true then laminar pressure loss is assumed if Re<2300";

        parameter Boolean switch_eta_const=true
          "if switch_eta_const==true then dynamic viscosity eta=eta_const";

        parameter SIunits.Length dz_pipe=1.0 "Length of pipe";
        parameter SIunits.Diameter di_pipe=0.01 "Inner Diameter of pipe";
        parameter SIunits.Area across_pipe=di_pipe^2.0*3.14159/4.0;
        parameter SIunits.DynamicViscosity eta_const=0.15e-3
          "value for dynamic viscosity if switch_eta_const==true";
        parameter SIunits.MassFlowRate m_minimal_turbulent_dot=1.e-8
          "if abs(massflow)< m_minimal_turbulent_dot then dp=0.0";

        //        SIunits.Pressure dp_max_laminar
        //        "max.pressure difference for laminar flow";

        SIunits.MassFlowRate m_dot_max_laminar
          "max. mass flow rate for laminar flow";


          //------------internal variables------------------------------------------------

        //        SIunits.MassFlowRate m_in_dot_positive;
        //        SIunits.Pressure d_p_positive;

        Real delta_p "length specific pressure loss in pipe";


          //SIunits.Pressure laminar_delta_p "laminar flow regime:pressure loss in pipe";
        SIunits.DynamicViscosity eta "dynamic viscosity flow medium";


          //        SIunits.Velocity w_laminar "flow velocity if laminar flow is assumed";
        SIunits.Density rho_average(start=1.0) " average density in pipe";

        //SIunits.ReynoldsNumber re_number "Reynoldsnumber";

        SIunits.ReynoldsNumber re_positive
          "positve Reynoldsnumber if m_in_dot>0.0";

        SIunits.ReynoldsNumber re_negative
          "positve Reynoldsnumber if m_in_dot<0.0";
        Integer regime "flow regime";

        SIunits.Velocity w_flow "flow velocity in pipe";

        //        SIunits.ReynoldsNumber re_turb_negative;
        //        SIunits.ReynoldsNumber re_turb_positive;
        //        SIunits.MassFlowRate m_dot_turb;
        //		SIunits.MassFlowRate m_dot_laminar;

        //		Real x_laminar;
        //		Real x_turb;
        //		Real laminar_delta_p,turb_delta_p;


          //		Real dp_m_dot_max_laminar;//Maximalwert Produkt Druckverlust mal Massenstrom fuer laminare Stroemung
        //Real ksi;
        Real turb_factor;
        Real verhaeltnis;

        //Real delta_p_turb;


          //--------------------------start documentation------------------------------
        annotation (Documentation(info="

<html>
<p>
calculatin of pressure loss delta_p due to friction in pipe:<br>
p_out = p_in - dz_pipe*delta_p<br>
<br>

Before compilation, a single procedure for calcuation of delta_p can be selected by setting
the value of parameter option_dp_model. This selection should consider the expected range of
the Reynolds-number Re=4*m_in_dot/GeneralConstants.pi/eta/di_pipe
<ul>
<li>option_dp_model=1: <b>Laminar flow</b> (Re &#60 2300):</li>
<li>option_dp_model=2: <b>model of Blasius</b> (3000 &#60 Re &#60 1.e5)</li>
<li>option_dp_model=3: <b>model of Nikuradse</b> (1.e5 &#60 Re &#60 1.e8)</li>
</ul>


</p>
<hr>
<p>
<b> NECESSARY ADDITIONS:</b></p>

value for density rho of flow medium must be provided at connector StateCut<br>
no correlation between variables at StateCut and variables at mass-flow onnectors
InMassFlow or OutMassFlow
<hr>


<b> ASSUMPTIONS:</b></p>

<UL>
<LI>isenthalpic (switch_h_const = true)</li>
<li>no storage of mass in element (switch_m_dot_const = true)</li>
<li>no variation of mass fractions (switch_x_i_const = true)</li>
<li>to avoid division by zero: for turbulent flow, pressure loss is 0.0 if abs(m_in_dot)<m_minimal_turbulent_dot
<li>the validity of the correlation chosen for the pressure drop is not checked</li>
<li>the dynamic viscosity is constant:eta=eta_const (switch_eta_const = true). If eta should be variable, set
switch_eta_const = false and introduce procedure for calculation of eta.

</ul>

<hr>



<p>

<b>SWITCH-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr>
<td><b>switch_eta_const</b><td>if switch_eta_const==true then eta=eta_const
</tr>
<tr>
<td><b>switch_turbulent_and_laminar</b><td>if switch_turbulent_and_laminar==true then check laminar/turbulent flow is included
</tr>



</table>


</p>


<p>
<hr>
<b>OPTION-PARAMETERS: </b><br>
(modifications become only effective after new compilation)<br>
<br>

<table border=1>
<tr><td>  <b>option_model </b><td> selection correlation for calculation of pressure loss</tr>
<tr>
<td>1<td> laminar flow assumed
</tr>
<tr>
<td>2<td> application of Blasius model
</tr>
<tr>
<td>3<td> application of Nikuradse model
</tr>
</table>
</p>
<hr>


<p>
<b>PARAMETERS</b>
</p>
<table border=1>
<tr>
<td>dz<td> length of pipe
</tr>
<tr>
<td>di<td> diameter of pipe
</tr>
<tr>
<td>eta_const<td> value for dynamic viscosity if switch_eta_const==true
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
      equation


          //--------------------------end documentation------------------------------

        StateCut.rho = rho_average;

        // calculation Reynolds-number
        //Re-number m_in_dot>0.0 assumed:
        //        re_positive = m_in_dot*4.0/eta/di_pipe/GeneralConstants.pi;

        //Re-number m_in_dot<0.0 assumed:
        //        re_negative = -m_in_dot*4.0/eta/di_pipe/GeneralConstants.pi;

        // calculation Reynolds-number
        //Re-number InletMass.m_dot>0.0 assumed:
        re_positive = noEvent(if m_in_dot > 0.0 then m_in_dot*4.0/eta/di_pipe/
          GeneralConstants.pi else -m_in_dot*4.0/eta/di_pipe/GeneralConstants.
          pi);

        //Re-number InletMass.m_dot<0.0 assumed:
        //re_negative = -InletMass.m_dot*4.0/eta/di_pipe/GeneralConstants.pi;
        re_negative = re_positive;

        //flow velocity, only for information
        w_flow = m_in_dot/across_pipe/rho_average;

        if switch_eta_const == true then
          eta = eta_const;
        end if;


          //dp_max_laminar=32*eta^2/di_pipe^3*2300/rho_average;// max. pressure difference for laminar flow length-specific
        m_dot_max_laminar = 2300/4*3.14159*di_pipe*eta;
        // max. mass flow rate for laminar flow


          //dp_m_dot_max_laminar=dp_max_laminar*m_dot_max_laminar;//max. positive value for product dp_max_laminar*m_dot_max_laminar

        if (option_dp_model == 1) then


            // laminar pipe-flow, lenght specific pressure-loss according to Hagen-Poisseuille

          delta_p = 128*eta*m_in_dot/GeneralConstants.pi/(di_pipe^4.0)/
            rho_average;

          regime = 1;

          turb_factor = 42;
          //dummy values
          verhaeltnis = 42;
          //dummy values

        end if;

        if (option_dp_model == 2) and (switch_turbulent_and_laminar == false)
             then
          // lenght specific pressure loss according to Blasius (3000<re<1.e5)
          // no check of flow regime
          regime = 2;

          if ((m_in_dot < 0.0) or (delta_p < 0.0)) then
            delta_p = -(0.3164/(re_negative^0.25))*8*(m_in_dot^2.0)/(di_pipe^
              5.0)/rho_average/(GeneralConstants.pi^2.0);
          else

            delta_p = (0.3164/(re_positive^0.25))*8*(m_in_dot^2.0)/(di_pipe^5.0)
              /rho_average/(GeneralConstants.pi^2.0);
            //m_in_dot_positive=m_in_dot;
            //d_p_positive=delta_p;
          end if;

          turb_factor = 42;
          //dummy values
          verhaeltnis = 42;
          //dummy values

        end if;

        if (option_dp_model == 2) and (switch_turbulent_and_laminar == true)
             then
          // lenght specific pressure loss according to Blasius (3000<re<1.e5)


            // check of flow regime; if re<2300 then laminar pressure loss is assumed

          delta_p = (1 + turb_factor)*128*eta*m_in_dot/GeneralConstants.pi/(
            di_pipe^4.0)/rho_average;

          verhaeltnis = (m_in_dot^2.0)/(m_dot_max_laminar^2.0);

          if verhaeltnis > 1.0 then
            //turbulent flow regime
            if m_in_dot >= 0.0 then
              turb_factor = 0.3164/64*re_positive^0.75 - 1.0;
              regime = 9;

            else
              turb_factor = 0.3164/64*re_negative^0.75 - 1.0;
              regime = 10;
            end if;
          else
            if verhaeltnis < 0.9 then
              // laminar pipe flow
              turb_factor = 0.0;
              regime = 11;

            else

              if m_in_dot >= 0.0 then


                  //0.9<verhaeltnis<1.0, transition between laminar and turbulent, positive flow direction
                turb_factor = (0.3164/64*re_positive^0.75 - 1.0)*(verhaeltnis
                   - 0.9)/0.1;
                regime = 12;

              else


                  //0.9<verhaeltnis<1.0, transition between laminar and turbulent, negative flow direction
                turb_factor = (0.3164/64*re_negative^0.75 - 1.0)*(verhaeltnis
                   - 0.9)/0.1;
                regime = 13;
              end if;

            end if;

          end if;

        end if;

        if (option_dp_model == 3) and (switch_turbulent_and_laminar == false)
             then


            // lenght specific pressure loss according to Nikuradse (1.e5<re<1.e8)
          // no check of flow regime;

          regime = 14;
          // lenght specific pressure loss according to Nikuradse (1e5<re<1e8)

          if m_in_dot > m_minimal_turbulent_dot then
            delta_p = (0.0032 + 0.221/(re_positive^0.237))*8*(m_in_dot^2.0)/(
              di_pipe^5.0)/rho_average/(GeneralConstants.pi^2.0);

          else
            if (m_in_dot < -m_minimal_turbulent_dot) then
              delta_p = -(0.0032 + 0.221/(re_negative^0.237))*8*(m_in_dot^2.0)/
                (di_pipe^5.0)/rho_average/(GeneralConstants.pi^2.0);
            else
              delta_p = 0.0;
            end if;

          end if;

          turb_factor = 42;
          //dummy values
          verhaeltnis = 42;
          //dummy values

        end if;

        if (option_dp_model == 3) and (switch_turbulent_and_laminar == true)
             then


            // lenght specific pressure loss according to Nikuradse (1.e5<re<1.e8)
          // check of flow regime; if Re<2300 laminar flow is assumed

          // lenght specific pressure loss according to Nikuradse (1e5<re<1e8)

          delta_p = (1 + turb_factor)*128*eta*m_in_dot/GeneralConstants.pi/(
            di_pipe^4.0)/rho_average;

          verhaeltnis = (m_in_dot^2.0)/(m_dot_max_laminar^2.0);

          if verhaeltnis > 1.0 then
            //turbulent flow regime
            if m_in_dot >= 0.0 then
              turb_factor = 0.0032/64*re_positive + 0.221/64*re_positive^0.763
                 - 1.0;
              regime = 15;

            else
              turb_factor = (0.0032/64*re_negative + 0.221/64*re_negative^0.763
                 - 1.0);
              regime = 16;
            end if;
          else
            if verhaeltnis < 0.9 then
              // laminar pipe flow
              turb_factor = 0.0;
              regime = 17;

            else

              if m_in_dot >= 0.0 then


                  //0.9<verhaeltnis<1.0, transition between laminar and turbulent, positive flow direction
                turb_factor = (0.0032/64*re_positive + 0.221/64*re_positive^
                  0.763 - 1.0)*(verhaeltnis - 0.9)/0.1;
                regime = 18;

              else


                  //0.9<verhaeltnis<1.0, transition between laminar and turbulent, negative flow direction
                turb_factor = (0.0032/64*re_negative + 0.221/64*re_negative^
                  0.763 - 1.0)*(verhaeltnis - 0.9)/0.1;
                regime = 19;
              end if;

            end if;

          end if;

        end if;

        p_out = p_in - dz_pipe*delta_p;

      end PressureLossPipeNoProp;

      model FlowResistorCIM "connectors and icon for mass-flow resistor"

        extends TTInterface.MassFlow.TwoPort;

        annotation (extent=[-10, 100; 10, 120]);


          //-------------------------start Icon graphics-----------------------------------

        annotation (Icon(
            Ellipse(extent=[25, 100; -25, 50], style(color=0)),
            Polygon(points=[-100, 10; 0, -40; -100, -90; -100, 10], style(
                  fillColor=4, fillPattern=1)),
            Polygon(points=[0, -40; 100, -15; 100, -65; 0, -40], style(
                  fillColor=4, fillPattern=1))));


          //--------------------------end graphics--------------------------------------


          //-------------------------start documentaion-----------------------------------
        annotation (Documentation(info="<html>
<p>

	model including connectors and icon for friction pressure loss in pipe

</p>
</HTML>"));

      end FlowResistorCIM;

      model CrtlPressureLossPipeNoProp
        extends QuadPolResistor;

      end CrtlPressureLossPipeNoProp;

      model IsentropicExpansion
        extends IsentropicExpansionCIM(
          final switch_m_dot_const=true,
          final switch_x_i_const=true,
          final switch_h_const=false,
          final switch_p_const=false);

        TTInterface.ThermalState.In InThermalState(n_comp=n_comp)
          annotation (extent=[-120, 40; -100, 60]);

        TTInterface.ThermalState.Out OutThermalState(n_comp=n_comp)
          annotation (extent=[100, 40; 120, 60]);

        parameter SIunits.Area in_cross_sectional_area=1.0
          "cross sectional area for mass-flow at connector InMassFlow";

        parameter SIunits.Area out_cross_sectional_area=1.0
          "cross sectional area for mass-flow at connector OutMassFlow";

        SIunits.SpecificEnthalpy dh_expansion "change in specific enthalpy";
      equation


          // corresponding state variables at connectors InThermalState and InMassFlow are equal:
        InThermalState.p = p_in;
        InThermalState.h = h_in;
        InThermalState.x_i = x_in_i;


          // corresponding state variables at connectors OutThermalState and OutMassFlow are equal:
        OutThermalState.p = p_out;
        OutThermalState.h = h_out;
        OutThermalState.x_i = x_out_i;

        InThermalState.s = OutThermalState.s;

        dh_expansion = h_in - h_out;

        dh_expansion = noEvent(if (InThermalState.rho > 0.0 and OutThermalState
          .rho > 0.0) then m_in_dot^2*(1./out_cross_sectional_area/
          OutThermalState.rho - 1./in_cross_sectional_area/InThermalState.rho)/
          2 else 0.0);

      end IsentropicExpansion;

      model IsentropicExpansionCIM
        extends TTInterface.MassFlow.TwoPort;

      end IsentropicExpansionCIM;

    end Support;

  end MassTransport;

  package Compartment "conservation laws for control volumes TTcode:Dc"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: conservation laws for control volumes

identification: TechThermo Dc
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Line(points=[38, 15; -62, 15; -2, -31; -62, -74; 38, -74], style(color=
                0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6),
      Diagram(
        Rectangle(extent=[-81, 48; 79, -80]),
        Polygon(points=[-61, 30; -10, -20; -60, -70; -61, 30]),
        Line(points=[50, 30; -50, 30; 10, -16; -50, -59; 50, -59])));

    model ThermalCapacity "control volume finite thermal capacity"

      TTInterface.HeatFlow.In HeatCut annotation (extent=[-10, 100; 10, 120]);

      SIunits.Mass m;
      // mass of thermal capacity
      SIunits.SpecificHeatCapacity c_heat;
      // specific heat capacity

      parameter SIunits.Mass m_const=1
        "const. value mass if switch_m_const==true";
      parameter SIunits.SpecificHeatCapacity c_heat_const=500
        "const. value heat-capacity if switch_c_heat_const==true";

      //      Boolean switches
      parameter Boolean switch_m_const=true
        "if switch_m_const==true then m=m_const";

      parameter Boolean switch_c_heat_const=true
        "if switch_c_heat_const==true then c_heat=c_heat_const";

      parameter Integer option_initial=1
        "initial conditions: 1-der(t_capacity) = 0.0, 2- t_capacity=t_initial";

      parameter SIunits.CelsiusTemperature t_initial=25 "initial temperature";

    protected
      SIunits.CelsiusTemperature t_capacity(start=t_initial);


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="
      energy conservation for finite thermal mass
      with connector HeatCut for heat flow:


      t_capacity=HeatCut.t

      HeatCut.q_dot=m*c_heat*der(t_capacity)

      values for mass m and specific heat capacity c_heat
      are controlled by parameters:

      c_heat=c_heat_const if switch_c_heat_const==true
      (default:switch_c_heat_const=true)

      m=m_const if switch_m_const==true
      (default:switch_m_const=true)


      initial value for t_capacity: t_initial


      Identification: TechThermo c3b
      Example: TechThermo
      "));

      annotation (
        Icon(Rectangle(extent=[-80, 50; 80, -60], style(color=0, fillColor=47)),
             Line(points=[33, 27; -37, 27; -7, -3; -37, -33; 33, -33], style(
              color=0,
              fillColor=47,
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
        Diagram(
          Rectangle(extent=[-81, 48; 79, -80]),
          Line(points=[-50, 30; 5, -20; 50, 30], style(color=0)),
          Line(points=[5, -20; 5, -62; 5, -63], style(color=0))));
    equation


        //--------------------------end documentation------------------------------

      if switch_c_heat_const then
        //      specific heat capacity is defined by parameter
        c_heat = c_heat_const;
      end if;

      if switch_m_const then
        //      mass is defined by parameter
        m = m_const;
      end if;

      HeatCut.t = t_capacity;

      //      transient energy conservation
      HeatCut.q_dot = m*c_heat*der(HeatCut.t);

    initial equation

      //      if switch_t_steady == true and not switch_zero_mass then
      //        der(t_segment_i) = zeros(n_segment);
      //      end if;

      if option_initial == 1 then
        der(t_capacity) = 0.0;
      end if;

      if option_initial == 2 then
        t_capacity = t_initial;
      end if;

    end ThermalCapacity;

    package Support
      "supporting models for package Basis.Compartment TTcode:DcS"
      extends Modelica.Icons.Library;

      annotation (Documentation(info="
identification: TechThermo DcS
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

      model SingleMassControlVolumeCIM
        "connector-icon model for control volume fluid with a single inlet/outlet"


        TTInterface.MassFlow.In MassFlow
          "mass flow into and out of control volume"
          annotation (extent=[10, -100; -10, -120]);
        TTInterface.HeatFlow.In HeatFlow
          "heat flow into and out of control volume"
          annotation (extent=[-100, -10; -120, 10]);

        annotation (
          Icon(
            Ellipse(extent=[-60, 100; 60, 60], style(
                pattern=0,
                gradient=3,
                fillColor=4)),
            Ellipse(extent=[-60, -60; 60, -100], style(
                pattern=0,
                gradient=3,
                fillColor=4)),
            Rectangle(extent=[-60, 80; 60, -80], style(
                pattern=0,
                gradient=1,
                fillColor=4)),
            Polygon(points=[-100, 40; -40, 0; -100, -40; -100, 40], style(
                color=45,
                gradient=1,
                fillColor=45)),
            Line(points=[30, -10; -30, -10; 10, 30; -30, 70; 30, 70], style(
                  color=0))),
          Coordsys(
            extent=[-100, -100; 100, 100],
            grid=[2, 2],
            component=[20, 20]),
          Window(
            x=0.25,
            y=0.11,
            width=0.6,
            height=0.6));

        annotation (Diagram);

      end SingleMassControlVolumeCIM;

      model SingleMassControlVolumeNoProp
        "control volume for energy and mass with a single mass-flow connector"

        extends TTBasis.Compartment.Support.SingleMassControlVolumeCIM;

        parameter Integer n_comp=1;

        parameter SIunits.Volume v_control=1 "size of control volume";

        parameter SIunits.Density rho_start=1.0
          "density of medium in volume at start of simulation";
        parameter SIunits.SpecificInternalEnergy u_start=-50000.0
          "Internal Energy  of medium in volume at start of simulation";
        //        parameter Boolean switch_start_steady=true

          //          "if switch_start_steady==true then initial equation: StateCut.h=InMassFlow.h";

        parameter SIunits.Pressure p_start=10.e5;
        parameter SIunits.CelsiusTemperature t_start=100.e5;

        //neu SIunits.Density rhodummy(start=rho_start, fixed=true);

        SIunits.Density rhodummy;

        //SIunits.Pressure p_dummy (start=p_start,fixed=true);


          //---------- connector for thermal state fluid in ControlVolume-----------------
        TTInterface.ThermalState.In StateCut
          "thermal state of fluid in control volume"
          annotation (extent=[10, 100; -10, 120]);


          //neu SIunits.Energy energy_in_volume(start=rho_start*u_start*v_control,
        //neu fixed=true);
      protected
        SIunits.Energy energy_in_volume;
        SIunits.Mass mass_in_volume;

        annotation (Documentation(info="

<html>
<p>
constant volume with conservation of mass and energy.
Optional transfer of heat and mass to/from environment by corrsponding connectors MassFlow and HeatFlow.
</p>
<ul>
<li>conservation of mass: der(mass_in_volume)=MassFlow.m_dot</li>
<li>conservation of energy: der(energy_in_volume)=MassFlow.m_dot*MassFlow.h+HeatFlow.q_dot</li>
</ul>
<b>demands definition of spec. enthalpy at exit in case of outflowing mass</b>

<hr>
<p><b>connectors</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>HeatFlow<td>HeatFlow.Out<td>.t, .q_dot </tr>
<tr><td>MassFlow<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>StateCut<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>StateCut<td>x_i,h,p,rho,u<td>t,s,x</tr>


</table>




<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>
<ul>
<li>in case of outflowing mass (connector MassFlow): enthalpy of outflowing mass must be defined </li>
<li>in case of outflowing heat (connector HeatFlow): temperature of heatflow must be defined </li>
</ul>
<hr>


<b> ASSUMPTIONS:</b>
thermal state of medium in control volume is homogenous
<hr>

<b> SWITCH-PARAMETERS:</b> none

<hr>

<b> OPTION-PARAMETERS:</b> none

<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>v_control<td> volume <td>Volume<td>[m^3]
</tr>


</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ab3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        //SIunits.Energy energy_in_volume;

        StateCut.rho = rhodummy;

        MassFlow.p = StateCut.p;
        MassFlow.x_i = StateCut.x_i;

        energy_in_volume = v_control*(StateCut.u*StateCut.rho);

        der(energy_in_volume) = MassFlow.m_dot*MassFlow.h + HeatFlow.q_dot;

        mass_in_volume = v_control*StateCut.rho;
        der(mass_in_volume) = MassFlow.m_dot;

      initial equation
        // if switch_start_steady==true then
        //der(StateCut.rho)=0.0;
        //	  InMassFlow.m_dot=0.0;
        //end if;

        StateCut.p = p_start;
        StateCut.t = t_start;

      end SingleMassControlVolumeNoProp;


	  model TwoPortMassControlVolumeCIM

	  extends TTInterface.MassFlow.TwoPort;

      TTInterface.HeatFlow.In HeatFlow
          "heat flow into and out of control volume"
          annotation (extent=[10, 100; -10, 120]);



    annotation (
      Icon(
        Ellipse(extent=[-100, 60; -60, -60], style(
            color=8,
            gradient=3,
            fillColor=30)),
        Ellipse(extent=[60, 60; 100, -60], style(
            color=8,
            gradient=3,
            fillColor=30)),
        Rectangle(extent=[-82, 60; 80, -60], style(
            color=8,
            gradient=2,
            fillColor=30)),
        Line(points=[28, -40; -32, -40; 8, 0; -32, 40; 28, 40], style(color=0,
              thickness=4)),
        Polygon(points=[-40, 100; 0, 60; 40, 100; -40, 100], style(
            color=45,
            gradient=2,
            fillColor=45))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[2, 2],
        component=[20, 20]),
      Window(
        x=0.25,
        y=0.11,
        width=0.6,
        height=0.6));


	  end TwoPortMassControlVolumeCIM;





      model TwoPortMassControlVolumeNoProp
        "control volume for energy and mass with a single mass-flow connector"



        extends TTBasis.Compartment.Support.TwoPortMassControlVolumeCIM(switch_p_const=true);

        parameter Integer n_comp=1;

        parameter SIunits.Volume v_control=1 "size of control volume";

        parameter SIunits.Density rho_start=1.0
          "density of medium in volume at start of simulation";
        parameter SIunits.SpecificInternalEnergy u_start=-50000.0
          "Internal Energy  of medium in volume at start of simulation";
        //        parameter Boolean switch_start_steady=true

          //          "if switch_start_steady==true then initial equation: StateCut.h=InMassFlow.h";

        parameter SIunits.Pressure p_start=10.e5 "initial value for pressure control volume";
        parameter SIunits.CelsiusTemperature t_start=100.e5 "initial value for temperature in control volume";

        //neu SIunits.Density rhodummy(start=rho_start, fixed=true);

        SIunits.Density rhodummy;

        //SIunits.Pressure p_dummy (start=p_start,fixed=true);


          //---------- connector for thermal state fluid in ControlVolume-----------------
        TTInterface.ThermalState.In StateCut
          "thermal state of fluid in control volume"
          annotation (extent=[10, -100; -10, -120]);


          //neu SIunits.Energy energy_in_volume(start=rho_start*u_start*v_control,
        //neu fixed=true);
      protected
        SIunits.Energy energy_in_volume;
        SIunits.Mass mass_in_volume;

        annotation (Documentation(info="

<html>
<p>
constant volume with conservation of mass and energy.
Optional transfer of heat and mass to/from environment by corrsponding connectors MassFlow and HeatFlow.
</p>
<ul>
<li>conservation of mass: der(mass_in_volume)=MassFlow.m_dot</li>
<li>conservation of energy: der(energy_in_volume)=MassFlow.m_dot*MassFlow.h+HeatFlow.q_dot</li>
</ul>
<b>demands definition of spec. enthalpy at exit in case of outflowing mass</b>

<hr>
<p><b>connectors</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>HeatFlow<td>HeatFlow.Out<td>.t, .q_dot </tr>
<tr><td>MassFlow<td>ExergyFlow.In<td>.t, .q_dot </tr>
<tr><td>StateCut<td>ThermalState.In<td>.h,.p,.s,.x_i</tr>
</table>

<hr>
<p><b>correlation needed at thermal state connectors:</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>needed correlation</b><td><b>not used variables</b></tr>
<tr><td>StateCut<td>x_i,h,p,rho,u<td>t,s,x</tr>


</table>




<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>
<ul>
<li>in case of outflowing mass (connector MassFlow): enthalpy of outflowing mass must be defined </li>
<li>in case of outflowing heat (connector HeatFlow): temperature of heatflow must be defined </li>
</ul>
<hr>


<b> ASSUMPTIONS:</b>
thermal state of medium in control volume is homogenous
<hr>

<b> SWITCH-PARAMETERS:</b> none

<hr>

<b> OPTION-PARAMETERS:</b> none

<hr>


<table border=1>
<tr><td><b>PARAMETERS:</b><td>meaning<td>type<td>unit</b></b></p>
<tr>
<td>n_comp<td> number of different components <td>Integer<td>[-]
</tr>
<tr>
<td>v_control<td> volume <td>Volume<td>[m^3]
</tr>


</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ab3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
      equation

        //SIunits.Energy energy_in_volume;

        StateCut.rho = rhodummy;

        p_in = StateCut.p;
        x_in_i = StateCut.x_i;

        energy_in_volume = v_control*(StateCut.u*StateCut.rho);

        der(energy_in_volume) = m_in_dot*h_in+m_out_dot*h_out+ HeatFlow.q_dot;

        mass_in_volume = v_control*StateCut.rho;
        der(mass_in_volume) = m_in_dot+m_out_dot;

      initial equation
        // if switch_start_steady==true then
        //der(StateCut.rho)=0.0;
        //	  InMassFlow.m_dot=0.0;
        //end if;

        StateCut.p = p_start;
        StateCut.t = t_start;

      end TwoPortMassControlVolumeNoProp;









      model MassCrtlVolumeTwoPortNoProp
        "control volume with single mass-flow connector"

        parameter Integer n_comp=1;
        TTInterface.MassFlow.In MassFlowIn(n_comp=n_comp)
          annotation (extent=[10, 100; -10, 120]);

        // thermal state cut for fluid inside control volume
        TTInterface.ThermalState.In StateCut(n_comp=n_comp)
          annotation (extent=[10, 100; -10, 120]);

        // connector for heat transfer to or from control volume
        TTInterface.HeatFlow.In HeatCut
          annotation (extent=[10, -100; -10, -120]);

        // connector to define flow direction
        Modelica.Blocks.Interfaces.InPort FlowDirection(n=1)
          annotation (extent=[-80, 100; -100, 120], rotation=-90);

        parameter SIunits.Length dz=1.0 "length of flow path through volume";
        parameter SIunits.Area cross_area=1.0 "cross sectional area";
        parameter SIunits.Volume crtl_volume=dz*cross_area
          "fluid volume of element";
        parameter SIunits.SpecificInternalEnergy u_initial=1393410;
        parameter SIunits.Density rho_initial=688.4;

        parameter Integer option_flow_direction=1 "defines direction of flow 1: from In to Out,
\t\t2: from Out to In, 3 defined by FlowDirection.signal[1]";
        //        parameter Boolean switch_rho_const=false
        //          "if rho_const==true then m_in_dot=m_out_dot";

        parameter Boolean switch_energy_fixed=false "if switch switch_energy_fixed==true and switch_energy_steady==false then initial value of energy_volume=
\t\tu_initial*rho_initial*crtl_volume";

        parameter Boolean switch_mass_fixed=false "if switch switch switch_mass_fixed=true and switch_mass_steady==false then initial value of mass_volume=
\t\trho_initial*crtl_volume";

        parameter Boolean switch_energy_steady=true
          "if switch_energy_steady==true then initial equation: der(energy_volume)=0.0";

        parameter Boolean switch_mass_steady=true
          "if switch_mass_steady==true then initial equation: der(mass_volume)=0.0";


          //        SIunits.Energy energy_volume(start=u_initial*rho_initial*crtl_volume)
        //          "energy of fluid in control volume";

        SIunits.Energy energy_volume(fixed=(switch_energy_fixed and not
              switch_energy_steady), start=u_initial*rho_initial*crtl_volume)
          "energy of fluid in control volume";

        //        SIunits.Mass mass_volume(start=rho_initial*crtl_volume)
        //          "mass of fluid in volume";
        SIunits.Mass mass_volume(fixed=(switch_mass_fixed and not
              switch_mass_steady), start=rho_initial*crtl_volume)
          "mass of fluid in volume";

        annotation (
          Icon(
            Rectangle(extent=[-80, 100; 79, 50], style(
                color=0,
                fillColor=10,
                fillPattern=1)),
            Rectangle(extent=[-100, 50; 100, -101], style(
                color=0,
                fillColor=67,
                fillPattern=1)),
            Polygon(points=[-101, -100; -1, -50; 99, -100; 99, -101; -101, -100],
                 style(
                color=0,
                fillColor=47,
                fillPattern=1)),
            Line(points=[40, 28; -43, 28; 2, 0; -40, -30; 42, -30], style(
                color=0,
                fillColor=47,
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

        annotation (Diagram(
            Text(
              extent=[-32, 74; -12, 66],
              string=".p",
              style(color=0)),
            Text(
              extent=[-16, 74; -4, 66],
              string="%show_p_used",
              style(color=1)),
            Text(
              extent=[-32, 66; -12, 58],
              style(color=0),
              string=".t"),
            Text(
              extent=[-16, 66; -4, 58],
              string="%show_t_used",
              style(color=1)),
            Text(
              extent=[-32, 58; -12, 50],
              style(color=0),
              string=".x"),
            Text(
              extent=[-16, 58; -4, 50],
              string="%show_x_used",
              style(color=1)),
            Text(
              extent=[-32, 50; -12, 42],
              style(color=0),
              string=".x_i"),
            Text(
              extent=[-16, 50; -4, 42],
              string="%show_x_i_used",
              style(color=1)),
            Text(
              extent=[-2, 74; 18, 66],
              style(color=0),
              string=".rho"),
            Text(
              extent=[18, 74; 30, 66],
              string="%show_rho_used",
              style(color=1)),
            Text(
              extent=[-2, 66; 18, 58],
              style(color=0),
              string=".h"),
            Text(
              extent=[18, 66; 30, 58],
              string="%show_h_used",
              style(color=1)),
            Text(
              extent=[-2, 58; 18, 50],
              style(color=0),
              string=".u"),
            Text(
              extent=[18, 58; 30, 50],
              string="%show_u_used",
              style(color=1)),
            Text(
              extent=[-2, 50; 18, 42],
              style(color=0),
              string=".s"),
            Text(
              extent=[18, 50; 30, 42],
              string="%show_s_used",
              style(color=1)),
            Text(
              extent=[-24, 90; 20, 80],
              string="checked: %show_checked",
              style(color=1)),
            Rectangle(extent=[-32, 92; 32, 40], style(color=0)),
            Text(
              extent=[-24, 82; 20, 74],
              style(color=45),
              string="used variables:")));
      equation

        StateCut.p = (p_in + p_out)/2.0;
        StateCut.x_i = (x_in_i + x_out_i)/2.0;
        mass_volume = StateCut.rho*crtl_volume;
        energy_volume = StateCut.u*mass_volume;
        HeatCut.t = StateCut.t;

        // mass-balance
        //        if switch_rho_const == true then
        // constant density, no storage of mass in control volume
        //          0.0 = m_in_dot + m_out_dot;
        //        else
        der(mass_volume) = m_in_dot + m_out_dot;
        //        end if;

        // energy-balance
        der(energy_volume) = HeatCut.q_dot + h_in*m_in_dot + h_out*m_out_dot;

        // definition of outflow-enthalpy
        if option_flow_direction == 1 then


            // fluid is flowing from massflow-connector In to massflow-connector Out, h_out is spec. enthalpy of
          // fluid leaving control volume
          h_out = StateCut.h;
          FlowDirection.signal[1] = 1.0;

        end if;

        if option_flow_direction == 2 then


            // fluid is flowing from massflow-connector Out to massflow-connector In, h_in is spec. enthalpy of
          // fluid leaving control volume
          h_in = StateCut.h;
          FlowDirection.signal[1] = -1.0;
        end if;

        if option_flow_direction == 3 then

          // flow direction defined by value of FlowDirection.signal[1]:


            // FlowDirection.signal[1]>0 then fluid is flowing from massflow-connector In to massflow-connector Out


            // FlowDirection.signal[1]<0 then fluid is flowing from massflow-connector Out to massflow-connector In

          if FlowDirection.signal[1] < 0 then


              // fluid is flowing from massflow-connector Out to massflow-connector In, h_in is spec. enthalpy of
            // fluid leaving control volume
            h_in = StateCut.h;

          else


              // fluid is flowing from massflow-connector In to massflow-connector Out, h_out is spec. enthalpy of
            // fluid leaving control volume
            h_out = StateCut.h;

          end if;

        end if;

      initial equation

        if switch_energy_steady == true then
          der(energy_volume) = 0.0;
        end if;

        if switch_mass_steady == true then
          der(mass_volume) = 0.0;
        end if;

      end MassCrtlVolumeTwoPortNoProp;

    end Support;

  end Compartment;

  package Junction "models for junctions TTcode:Dd"

    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: models for junctions
identification: TechThermo Dd
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 38; 69, -88], style(fillColor=55)),
        Rectangle(extent=[-91, 38; 69, -90]),
        Line(points=[-64, 22; -9, -28; 36, 22], style(color=0)),
        Line(points=[-9, -28; -9, -70; -9, -71], style(color=0))),
      Coordsys(
        extent=[-100, -100; 100, 100],
        grid=[1, 1],
        component=[20, 20]),
      Window(
        x=0.01,
        y=0.05,
        width=0.6,
        height=0.6),
      Diagram(
        Rectangle(extent=[-81, 48; 79, -80]),
        Line(points=[-50, 30; 5, -20; 50, 30], style(color=0)),
        Line(points=[5, -20; 5, -62; 5, -63], style(color=0))));

    model MassFlow3PortParaCrtl
      "junction of 3 mass-flow connectors; flow direction of a single connector defined by parameter"

      extends TTBasis.Junction.Support.MassFlow3Port(switch_energy_conservation
          =false, switch_mass_conservation=false);
      parameter Boolean switch_in_InOrOut=true
        "if switch_in_InOrOut==true connector InOrOut is regarded as an inflow connector";

      SIunits.SpecificEnthalpy h_mix
        "spec.enthalpy resulting from mixing all inflows";
      SIunits.MassFlowRate m_in_total "sum of all inflowing mass flows";
    equation
      //	  SIunits.MassFraction mix_x_i[n_comp];

      if switch_in_InOrOut == true then
        m_in_total = InOrOut.m_dot + In.m_dot;
        h_mix = noEvent(if m_in_total > 0.0 then ((InOrOut.h*InOrOut.m_dot + In
          .h*In.m_dot)/m_in_total) else In.h);
        Out.h = h_mix;
        Out.m_dot = -m_in_total;

      else
        m_in_total = In.m_dot;
        h_mix = In.h;
        InOrOut.h = h_mix;
        Out.h = h_mix;
        0.0 = Out.m_dot + InOrOut.m_dot;
      end if;

    end MassFlow3PortParaCrtl;

    model DividerMassFlow
      "reduces mass flow rate assuming n_flow identical mass flows"
      extends TTInterface.MassFlow.TwoPort(
        final switch_m_dot_const=false,
        switch_h_const=true,
        switch_p_const=true,
        final switch_x_i_const=true);
      parameter Real n_flow=1 "number of identical mass flows";


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="

      m_in_dot=-n_flow*m_out_dot

      h_in=h_out
      p_in=p_out
      x_in_i=x_out_i

      Model is used to simulate systems
      where a mass flow is divided into
      n_flow parallel mass flows undergoing identical processes.


      Identification: TechThermo a1h
      Example: TechThermo
      "));


        //--------------------------end documentation------------------------------

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model to divide mass flow into parallel mass flows undergoing identical processes
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
<b>Example:</b> TechThermo


</p>
</HTML>"));

      //---------End Documentation------------------------------

      //--Start Graphics-----------------------------------------

      annotation (Icon(
          Rectangle(extent=[-100, 30; 0, -30], style(color=4, fillColor=4)),
          Rectangle(extent=[-20, 100; 20, -30], style(color=4, fillColor=4)),
          Rectangle(extent=[20, 100; 100, 80], style(color=4, fillColor=4)),
          Rectangle(extent=[20, 45; 100, 25], style(color=4, fillColor=4)),
          Rectangle(extent=[20, -10; 100, -30], style(color=4, fillColor=4))));
    equation

      //--End Graphics-----------------------------------------

      0.0 = m_in_dot + n_flow*m_out_dot;

    end DividerMassFlow;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model DividerHeatFlow
      "reduces heat flow rate assuming n_flow identical heat flows"
      extends TTInterface.HeatFlow.TwoPort(final switch_q_dot_const=false,
          switch_t_const=true);
      parameter Integer n_flow=1 "number of identical heat flows";


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="

      q_in_dot=-n_flow*q_out_dot

      t_in=t_out

      Model is used to simulate systems
      where a heat flow is divided into
      n_flow parallel heat flows undergoing identical processes.


      Identification: TechThermo a2d
      Example: TechThermo
      "));


        //--------------------------end documentation------------------------------

      //--Start Graphics-----------------------------------------
      annotation (Icon(
          Rectangle(extent=[-100, 30; 0, -30], style(color=47, fillColor=47)),
          Rectangle(extent=[-20, 100; 20, -30], style(color=47, fillColor=47)),

          Rectangle(extent=[20, 100; 100, 80], style(color=47, fillColor=47)),
          Rectangle(extent=[20, 45; 100, 25], style(color=47, fillColor=47)),
          Rectangle(extent=[20, -10; 100, -30], style(color=47, fillColor=47))));
    equation

      //--End Graphics-----------------------------------------

      0.0 = q_in_dot + n_flow*q_out_dot;

    end DividerHeatFlow;

    //mmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm

    model DividerExergyFlow
      "reduces exergy flow rate assuming n_flow identical exergy flows"
      extends TTInterface.ExergyFlow.TwoPort(final switch_exergy_dot_const=
            false);

      parameter Integer n_flow=1 "number of identical exergy flows";


        //--------------------------start documentation------------------------------
      annotation (Documentation(info="

      exergy_in_dot=-n_flow*exergy_out_dot


      Model is used to simulate systems
      where a exergy flow is divided into
      n_flow parallel exergy flows undergoing identical processes.


      Identification: TechThermo a3d
      Example: TechThermo
      "));


        //--------------------------end documentation------------------------------

      //--Start Graphics-----------------------------------------

      annotation (Icon(
          Rectangle(extent=[-100, 30; 0, -30], style(color=2, fillColor=2)),
          Rectangle(extent=[-20, 100; 20, -30], style(color=2, fillColor=2)),
          Rectangle(extent=[20, 100; 100, 80], style(color=2, fillColor=2)),
          Rectangle(extent=[20, 45; 100, 25], style(color=2, fillColor=2)),
          Rectangle(extent=[20, -10; 100, -30], style(color=2, fillColor=2))));
    equation

      //--End Graphics-----------------------------------------

      0.0 = exergy_in_dot + n_flow*exergy_out_dot;

    end DividerExergyFlow;

    model MassFlowDouble "doubles a mass flow TTcode:Dd5"

      //------------parameters----------------------
      parameter Integer n_comp=1 "number of components in fluid";

      TTInterface.MassFlow.In Inlet(n_comp=n_comp)
        annotation (extent=[-100, 10; -120, -10]);

      TTInterface.MassFlow.Out Outlet1(n_comp=n_comp)
        annotation (extent=[100, 100; 120, 80]);
      TTInterface.MassFlow.Out Outlet2(n_comp=n_comp)
        annotation (extent=[100, -100; 120, -80]);

      annotation (
        Icon(
          Rectangle(extent=[-100, 20; 20, -20], style(color=4, fillColor=4)),
          Polygon(points=[-20, 20; 60, 100; 100, 100; 100, 60; 60, 60; 20, 20;
                -20, 20], style(color=67, fillColor=4)),
          Polygon(points=[20, -20; 60, -60; 100, -60; 100, -100; 60, -100; -20,
                 -20; 20, -20], style(color=67, fillColor=4)),
          Line(points=[60, 40; 100, 40], style(
              color=0,
              fillColor=67,
              fillPattern=1)),
          Line(points=[100, 40; 100, 20; 60, -20; 60, -40; 100, -40], style(
              color=0,
              fillColor=67,
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

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model with a single In-Massflow-connectors (Inlet) and two Out-Massflow connectors (Outlet1,Outlet2).
Thermal state at all connectors identical.
</p>
<ul>Correlation for mass flow rate:
<li>Inlet.m_dot=-Outlet1.m_dot</li>
<li>Inlet.m_dot=-Outlet2.m_dot</li>
</ul>

<p>
model is used to copy a mass flow e.g. for analysis
</p>




<hr>
<p><b>connectors</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Inlet<td>MassFlow.In<td>p,h,m_dot,x_i</tr>
<tr><td>Outlet1<td>MassFlow.Out<td>p,h,m_dot,x_i</tr>
<tr><td>Outlet2<td>MassFlow.Out<td>p,h,m_dot,x_i</tr>
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

<b>Identification:</b> TechThermo Dd5<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      0.0 = Inlet.m_dot + Outlet1.m_dot;
      Inlet.h = Outlet1.h;
      Inlet.p = Outlet1.p;
      Inlet.x_i = Outlet1.x_i;

      Outlet1.m_dot = Outlet2.m_dot;
      Outlet1.h = Outlet2.h;
      Outlet1.p = Outlet2.p;
      Outlet1.x_i = Outlet2.x_i;

    end MassFlowDouble;

    model HeatFlowDouble

      TTInterface.HeatFlow.In Inlet annotation (extent=[-100, 10; -120, -10]);

      TTInterface.HeatFlow.Out Outlet1 annotation (extent=[100, 100; 120, 80]);
      TTInterface.HeatFlow.Out Outlet2 annotation (extent=[100, -100; 120, -80]);

      annotation (
        Icon(
          Rectangle(extent=[-100, 20; 20, -20], style(color=47, fillColor=47)),

          Polygon(points=[-20, 20; 60, 100; 100, 100; 100, 60; 60, 60; 20, 20;
                -20, 20], style(color=47, fillColor=47)),
          Polygon(points=[20, -20; 60, -60; 100, -60; 100, -100; 60, -100; -20,
                 -20; 20, -20], style(color=47, fillColor=47)),
          Line(points=[60, 40; 100, 40], style(
              color=0,
              fillColor=67,
              fillPattern=1)),
          Line(points=[100, 40; 100, 20; 60, -20; 60, -40; 100, -40], style(
              color=0,
              fillColor=67,
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

      //-----Start Documentation----------------------------------------------
      annotation (Documentation(info="

<html>
<p>
model with a single In-Heatflow-connectors (Inlet) and two Out-Heatflow connectors (Outlet1,Outlet2).
Temperature at all connectors identical.
</p>
<ul>Correlation for heat flow rate:
<li>Inlet.q_dot=-Outlet1.q_dot</li>
<li>Inlet.q_dot=-Outlet2.q_dot</li>
</ul>

<p>
model is used to copy a heat flow e.g. for analysis
</p>




<hr>
<p><b>connectors</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Inlet<td>HeatFlow.In<td>q_dot,t</tr>
<tr><td>Outlet1<td>HeatFlow.Out<td>q_dot,t</tr>
<tr><td>Outlet2<td>HeatFlow.Out<td>q_dot,t</tr>
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


<b> PARAMETERS:</b>-none-
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Dd6<br>
<b>Example:</b> TechThermo Fd2, Fd4


</p>
</HTML>"));
    equation

      0.0 = Inlet.q_dot + Outlet1.q_dot;
      Inlet.t = Outlet1.t;

      Outlet1.q_dot = Outlet2.q_dot;
      Outlet1.t = Outlet2.t;

    end HeatFlowDouble;

    model ExergyFlowDouble

      TTInterface.ExergyFlow.In Inlet annotation (extent=[-100, 10; -120, -10]);

      TTInterface.ExergyFlow.Out Outlet1 annotation (extent=[100, 100; 120, 80]);
      TTInterface.ExergyFlow.Out Outlet2
        annotation (extent=[100, -100; 120, -80]);

      annotation (
        Icon(
          Rectangle(extent=[-100, 20; 20, -20], style(color=2, fillColor=2)),
          Polygon(points=[-20, 20; 60, 100; 100, 100; 100, 60; 60, 60; 20, 20;
                -20, 20], style(color=2, fillColor=2)),
          Polygon(points=[20, -20; 60, -60; 100, -60; 100, -100; 60, -100; -20,
                 -20; 20, -20], style(color=2, fillColor=2)),
          Line(points=[60, 40; 100, 40], style(
              color=0,
              fillColor=67,
              fillPattern=1)),
          Line(points=[100, 40; 100, 20; 60, -20; 60, -40; 100, -40], style(
              color=0,
              fillColor=67,
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

      0.0 = Inlet.exergy_dot + Outlet1.exergy_dot;

      Outlet1.exergy_dot = Outlet2.exergy_dot;

    end ExergyFlowDouble;

    package Support "supporting models for Basis.Junction TTcode:Dd"
      extends Modelica.Icons.Library;

      annotation (Documentation(info="
identification: TechThermo CdS

content package:
supporting models for Basis.Junction TTcode:Dd


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

      model MassFlow3Port
        "junction of 3 mass-flow connectors; flow direction of a single connector not fixed"


        parameter Integer n_comp=1 "number of components";

        TTInterface.MassFlow.In In "connector with massflow rate >=0.0"
          annotation (extent=[-120, -25; -100, -40]);
        TTInterface.MassFlow.Out Out "connector with massflow rate <=0.0"
          annotation (extent=[100, -25; 120, -40]);
        TTInterface.MassFlow.In InOrOut
          "direction of massflow of this connector fixed by value of variable direction"
          annotation (extent=[10, 100; -10, 120]);

        annotation (
          Icon(
            Text(
              extent=[-82, -26; -60, -60],
              style(
                color=0,
                fillColor=67,
                fillPattern=1),
              string="In"),
            Text(
              extent=[39, -20; 69, -64],
              style(
                color=0,
                fillColor=67,
                fillPattern=1),
              string="Out"),
            Text(
              extent=[-93, 96; -32, 60],
              style(
                color=0,
                fillColor=67,
                fillPattern=1),
              string="InOrOut"),
            Polygon(points=[-100, 20; -40, 20; -10, 0; -40, -20; -100, -20; -71,
                   0; -100, 20], style(color=4, fillColor=4)),
            Polygon(points=[10, 20; 70, 20; 100, 0; 70, -20; 10, -20; 39, 0; 10,
                   20], style(color=4, fillColor=4)),
            Ellipse(extent=[-10, 10; 10, -10], style(
                color=67,
                fillColor=67,
                fillPattern=1)),
            Polygon(points=[0, 100; -20, 60; -20, 50; 0, 20; 20, 49; 20, 60; 0,
                   100], style(
                color=67,
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
            height=0.6));

        parameter Real zero_vect[n_comp]=zeros(n_comp);


          //	  SIunits.SpecificEnthalpy h_mix "spec.enthalpy resulting from mixing all inflows";
        //	  SIunits.MassFlowRate m_in_total "sum of all inflowing mass flows";
        //	  SIunits.MassFraction mix_x_i[n_comp];
        //	  Real direction "direction of mass flow at connector InOrOut";

        parameter Boolean switch_energy_conservation=true
          "if switch_energy_conservation==true then sum(m_dot*h)=0.0 considering all connectors";

        parameter Boolean switch_mass_conservation=true
          "if switch_mass_conservation==true then sum(m_dot)=0.0 considering all connectors";
      equation

        //conservation of mass
        if switch_mass_conservation == true then
          0.0 = In.m_dot + Out.m_dot + InOrOut.m_dot;
        end if;

        if n_comp == 1 then
          //single component medium, composition identical at all connectors
          InOrOut.x_i = In.x_i;
          InOrOut.x_i = Out.x_i;
        else
          //composition-vector
          zero_vect = In.m_dot*In.x_i + Out.m_dot*Out.x_i + InOrOut.m_dot*
            InOrOut.x_i;
        end if;

        //pressure is constant
        InOrOut.p = In.p;
        InOrOut.p = Out.p;

        //conservation of energy

        if switch_energy_conservation == true then
          0.0 = In.m_dot*In.h + Out.m_dot*Out.h + InOrOut.m_dot*InOrOut.h;
        end if;

      end MassFlow3Port;

    end Support;

  end Junction;

  package BasicProcess
    "models for single step changes in thermal state TTcode:De"
    //wds 10.10.01 14:00
    extends Modelica.Icons.Library;

    annotation (Documentation(info="
content package: models for single step changes in thermal state

identification: TechThermo De
"));

    annotation (
      Icon(
        Rectangle(extent=[-91, 38; 69, -90]),
        Rectangle(extent=[-91, 38; 69, -90], style(
            color=0,
            fillColor=55,
            fillPattern=1)),
        Line(points=[-59, 12; -59, -57; 40, -57], style(color=0)),
        Polygon(points=[39, -57; 19, -53; 19, -57; 39, -57], style(color=0,
              fillColor=0)),
        Polygon(points=[-59, 11; -63, -7; -59, -7; -59, 11], style(
            color=0,
            fillColor=0,
            fillPattern=1)),
        Line(points=[-48, -42; -34, -42; -18, -39; -2, -32; 11, -17; 20, 5],
            style(
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

    model AirChangeState
      "general change in state for air assuming perfect gas model TTcode:De1"

      extends TTBasis.BasicProcess.Support.ChangeStateCIM;

      annotation (Coordsys(grid=[2, 2], component=[20, 20]), Diagram);
      Medium.Gas.AirPerfectGasCalVol AirPerfectGasCalVol1
        "correlations for thermal state variables at in-state of change in state"
        annotation (extent=[-76, 36; -36, 76]);
      Medium.Gas.AirPerfectGasCalVol AirPerfectGasCalVol2
        annotation (extent=[32, 36; 72, 76]);
      Support.ChangeStateNoProp ChangeStateNoProp1
        annotation (extent=[-22, -20; 18, 20]);

      annotation (Icon(Rectangle(extent=[-80, 100; 80, 80], style(color=3,
                fillColor=67))));
      Source.ThermalState.ParameterDefined InletParameter(x_const=1.0)
        "optional definition of state variable at inlet, definition of steam quality =1.0"
        annotation (extent=[-90, -4; -70, 16]);
      Source.ThermalState.ParameterDefined OutletParameter(switch_x_def=true,
          x_const=1.0)
        "definition of steam quality x=1.0, optional definition of state variables at outlet"
        annotation (extent=[70, -6; 90, 14]);
    equation

      connect(AirPerfectGasCalVol1.StateCut, ChangeStateNoProp1.InThermalState)
        annotation (points=[-56, 34; -56, 10; -24, 10], style(color=8));
      connect(ChangeStateNoProp1.OutThermalState, AirPerfectGasCalVol2.StateCut)
        annotation (points=[20, 10; 52, 10; 52, 34], style(color=8));
      connect(InHeatFlow, ChangeStateNoProp1.InHeatFlow)
        annotation (points=[0, 110; -2, 110; -2, 22; -2, 22], style(color=47));
      connect(InMassFlow, ChangeStateNoProp1.InMassFlow) annotation (points=[-110,
             -70; -92, -70; -92, -14; -24, -14], style(color=4));
      connect(ChangeStateNoProp1.OutMassFlow, OutMassFlow) annotation (points=[
            20, -14; 92, -14; 92, -70; 110, -70], style(color=4));
      connect(ChangeStateNoProp1.InExergyFlow, InExergyFlow)
        annotation (points=[-2, -22; -2, -110; 0, -110], style(color=2));
      connect(InletParameter.OutThermalState, AirPerfectGasCalVol1.StateCut)
        annotation (points=[-80, 17; -80, 34; -56, 34], style(color=8));
      connect(AirPerfectGasCalVol2.StateCut, OutletParameter.OutThermalState)
        annotation (points=[52, 34; 80, 34; 80, 15], style(color=8));
    end AirChangeState;

    model ThermalEfficiency
      "calculates thermal efficiency from exergy flow and exergy flow TTcode:De2"


      TTInterface.HeatFlow.In Heat annotation (extent=[-10, -100; 10, -120]);
      TTInterface.ExergyFlow.In Work annotation (extent=[-10, 100; 10, 120]);
      SIunits.Efficiency eta "thermal efficiency";

      annotation (
        Icon(
          Line(points=[-90, 32; -90, -36], style(color=0)),
          Line(points=[-90, 20; -60, 20; -60, -80], style(color=0)),
          Line(points=[-40, 20; 0, 20], style(color=0)),
          Line(points=[-40, 0; 0, 0], style(color=0)),
          Line(points=[20, 10; 100, 10], style(color=0)),
          Rectangle(extent=[30, 82; 94, 20], style(color=53, fillColor=53)),
          Rectangle(extent=[30, 0; 94, -96], style(
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
          height=0.6),
        Diagram);

      annotation (Diagram);
      annotation (Documentation(info="
<html>
<p>
calculation of thermal efficiency of a process from the provided exergy and consumed heat.
</p>



<hr>
<p><b>connectors</b></p>
<table border=1>
<tr><td><b>name connector</b><td><b>type connector</b><td><b>variables </b></tr>
<tr><td>Heat<td>HeatFlow.Out<td>.t, .q_dot </tr>
<tr><td>Work<td>ExergyFlow.In<td>exergy_dot</tr>
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

<b>OPTION-PARAMETERS: </b><br>

<br>

<table border=1>
<tr><td>  <b>option_defsignal </b></tr>
<tr>
<td>1<td> OutHeatFlow.q_dot = InSignal.signal[1]
</tr>
<tr>
<td>2<td> OutHeatFlow.t = InSignal.signal[1]
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
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo Ab3<br>
<b>Example:</b> TechThermo


</p>
</HTML>"));
    equation

      eta = noEvent(if Heat.q_dot > 0.0 then Work.exergy_dot/Heat.q_dot else
        0.0);

    end ThermalEfficiency;

    package Support
      "supporting models for package Basis.BasicProcess TTcode:DeS"
      extends Modelica.Icons.Library;

      annotation (Documentation(info="
identification: TechThermo DeS

content package:
supporting models for package Basis.BasicProcess


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

      model ChangeStateNoProp
        "single change in thermal state without specification of working fluid TTcode:DeS1"

        extends ChangeStateCIM(
          final switch_m_dot_const=true,
          final switch_x_i_const=true,
          final switch_h_const=false,
          final switch_p_const=false);

        TTInterface.ThermalState.In InThermalState(n_comp=n_comp)
          annotation (extent=[-120, 40; -100, 60]);

        TTInterface.ThermalState.Out OutThermalState(n_comp=n_comp)
          annotation (extent=[100, 40; 120, 60]);

        parameter Integer option_state_change=0 "defines kind of change in state; 1:isenthalpic, 2:isobaric, 3:isothermal,
\t\t4:isentropic, 5:u=const, 6:isochoric, 7:polytropic
\t\t  ";

        parameter Boolean switch_average_temperature_value=true
          "if switch_average_temperature_value==true then InHeatFlow.t=(InThermalState.t+OutThermalState.t)/2.0";

        parameter Real n_polytropic
          "exponent for polytropic change in state if option_state_change==8";

        parameter Boolean switch_x_const=true
          "if switch_x_const==true then InHeatFlow.x=(InThermalState.t+OutThermalState.t)/2.0";


          //-----Start Documentation----------------------------------------------
        annotation (Documentation(info="

<html>
<p>
general model for change in state of a mass flow between connectors InMassFlow and
OutMassFlow without definition of medium. Depending on the value of option parameter
option_state_change various processes are available:
</p>
<ul>
<li>constant enthalpy</li>
<li>constant pressure</li>
<li>constant temperature</li>
<li>constant entropy</li>
<li>constant internal energy<</li>
</ul>
<p>
Thermal state connector InThermalState corresponds to inlet mass flow connector
InMassFlow
<ul>
<li>InThermalState.h = InMassFlow.h</li>
<li>InThermalState.p = InMassFlow.p</li>
<li>InThermalState.x_i = InMassFlow.x_i</li>
</ul>
</p
<p>
Thermal state connector OutThermalState corresponds to outlet mass flow connector
OutMassFlow
<ul>
<li>OutThermalState.h = OutMassFlow.h</li>
<li>OutThermalState.p = OutMassFlow.p</li>
<li>OutThermalState.x_i = OutMassFlow.x_i</li>
</ul>
</p
<p>
correlation steam quality InThermalState.x and OutThermalState.x depends on switch-parameter
switch_x_const
</p>
<p>
correlation steam quality InThermalState.x_i and OutThermalState.x_i depends on switch-parameter
switch_x_i_const
</p>
<p>
model includes connectors for exergy(InExergyFlow) and heat(InHeatFlow) transferred to/from process
</p>
<p>
0.0 = m_in_dot*h_in + m_out_dot*h_out - InHeatFlow.q_dot - InExergyFlow
          .exergy_dot
</p>

<hr>



<p>includes six connectors:</p>
<table border=1>
<tr><td><b>name connector<td>variables<td>meaning</tr></b>

<tr><td>InMassFlow<td>[h_in,p_in,x_in_i,m_in_dot]<td> inlet of process</tr>
<tr><td>OutMassFlow<td>[h_out,p_out,x_out_i,m_out_dot]<td> outlet of process</tr>
<tr><td>InThermalState<td>[.h,.p,.t,.rho,.u,.s,.x,.x_i]<td> thermal state at inlet of process</tr>
<tr><td>OutThermalState<td>[.h,.p,.t,.rho,.u,.s,.x,.x_i]<td> thermal state at outlet of process</tr>
<tr><td>InHeatFlow <td>[.q_dot,.t]<td> heat consumed (q_dot>0) or produced during change in state </tr>
<tr><td>InExergyFlow <td>[.exergy_dot]<td>  exergy consumed (exergy_dot>0) or produced during change in state </tr>
</table>
<p>


<hr>
<p>used thermal state variables of connector <b>InThermalState</b>:</p>

<table border=1>
<tr><td>  Parameter<td>Value Parameter<td>h<td>p<td>t<td>rho<td>u<td>s<td>x<td>x_i</tr>
<tr>
<tr><td>  option_state_change<td>1<td>+<td>-<td>-<td>-<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>2<td>-<td>+<td>-<td>-<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>3<td>-<td>-<td>+<td>-<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>4<td>-<td>-<td>-<td>-<td>-<td>+<td>-<td>-</tr>
<tr><td>  option_state_change<td>5<td>-<td>-<td>-<td>-<td>+<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>6<td>-<td>-<td>-<td>+<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>7<td>-<td>+<td>-<td>+<td>-<td>-<td>-<td>-</tr>
</tr>
</table>
<p>
<p>used thermal state variables of connector <b>OutThermalState</b>:</p>

<table border=1>
<tr><td>  Parameter<td>Value Parameter<td>h<td>p<td>t<td>rho<td>u<td>s<td>x<td>x_i</tr>
<tr>
<tr><td>  *<td>*<td>+<td>+<td>+<td>-<td>-<td>-<td>-<td>+</tr>
<tr><td>  option_state_change<td>1<td>+<td>-<td>-<td>-<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>2<td>-<td>+<td>-<td>-<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>3<td>-<td>-<td>+<td>-<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>4<td>-<td>-<td>-<td>-<td>-<td>+<td>-<td>-</tr>
<tr><td>  option_state_change<td>5<td>-<td>-<td>-<td>-<td>+<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>6<td>-<td>-<td>-<td>+<td>-<td>-<td>-<td>-</tr>
<tr><td>  option_state_change<td>7<td>-<td>+<td>-<td>+<td>-<td>-<td>-<td>-</tr>
</tr>
</table>
<p>


<br>




<br>


</p>
<hr>

<b> NECESSARY ADDITIONS:</b>
<ul>
<li>property routines must be connected to InThermalState and OutThermalState to define the medium</li>
<li>sufficient information must be provided for energy conservation:        0.0 = m_in_dot*h_in + m_out_dot*h_out - InHeatFlow.q_dot - InExergyFlow
          .exergy_dot;

</li>
</ul>
<hr>


<b> ASSUMPTIONS:</b>
<ul>
<li>no storage of mass</li>
<li>no storage of energy</li>
</ul>
<hr>



<table border=1>
<tr><td>  <b><b>SWITCH-PARAMETERS:</b>:<td>if true </tr>
<tr>
<td>switch_average_temperature_value<td>InHeatFlow.t=(InThermalState.t+OutThermalState.t)/2.0
</tr>
<tr>
<td>switch_x_const<td>InThermalState.x = OutThermalState.x
</tr>
</table>

<p><b>
MODIFICATIONS BECOME ONLY EFFECTIVE AFTER NEW COMPILATION!
<p></b>

<hr>

<b>OPTION-PARAMETERS: </b><br>

<br>

<table border=1>
<tr><td>  <b>option_state_change </b></tr>
<tr>
<td>1<td> InThermalState.h = OutThermalState.h
</tr>
<tr>
<td>2<td> InThermalState.p = OutThermalState.p
</tr>
<tr>
<td>3<td> InThermalState.t = OutThermalState.t
</tr>
<tr>
<td>4<td> InThermalState.s=OutThermalState.s
</tr>
<tr>
<td>5<td> InThermalState.u = OutThermalState.u
</tr>
<tr>
<td>6<td> InThermalState.rho = OutThermalState.rho
</tr>
<tr>
<td>7<td> (InThermalState.p/InThermalState.rho)^n_polytropic = (OutThermalState
            .p/OutThermalState.rho)^n_polytropic;

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
<td>n_polytropic<td> exponent polytropic process <td>Real<td>[-]
</tr>
</table>
</p>
<hr>


</p>
<hr>



</pre>
</p>

<b>Identification:</b> TechThermo DeS1<br>
<b>Example:</b> TechThermo De1


</p>
</HTML>"));
      equation


          // corresponding state variables at connectors InThermalState and InMassFlow are equal:
        InThermalState.p = p_in;
        InThermalState.h = h_in;
        InThermalState.x_i = x_in_i;


          // corresponding state variables at connectors OutThermalState and OutMassFlow are equal:
        OutThermalState.p = p_out;
        OutThermalState.h = h_out;
        OutThermalState.x_i = x_out_i;

        if switch_average_temperature_value == true then
          InHeatFlow.t = (InThermalState.t + OutThermalState.t)/2.0;
        end if;

        if switch_x_const == true then
          InThermalState.x = OutThermalState.x;
        end if;

        //		if switch_adiabatic==true then
        //			InHeatFlow.q_dot=0.0;
        //		end if;

        //energy balance

        0.0 = m_in_dot*h_in + m_out_dot*h_out - InHeatFlow.q_dot - InExergyFlow
          .exergy_dot;

        if option_state_change == 1 then
          InThermalState.h = OutThermalState.h;
        end if;

        if option_state_change == 2 then
          InThermalState.p = OutThermalState.p;
        end if;

        if option_state_change == 3 then
          InThermalState.t = OutThermalState.t;
        end if;

        if option_state_change == 4 then
          InThermalState.s = OutThermalState.s;
        end if;

        if option_state_change == 5 then
          InThermalState.u = OutThermalState.u;
        end if;

        if option_state_change == 6 then
          InThermalState.rho = OutThermalState.rho;
        end if;

        if option_state_change == 7 then
          // polytropic process
          (InThermalState.p/InThermalState.rho)^n_polytropic = (OutThermalState
            .p/OutThermalState.rho)^n_polytropic;
        end if;

      end ChangeStateNoProp;

      model ChangeStateCIM
        "connector-icon model for general model change in state TTcode:DeS2"
        extends TTInterface.MassFlow.TwoPort;

        TTInterface.HeatFlow.In InHeatFlow
          annotation (extent=[-10, 100; 10, 120]);
        TTInterface.ExergyFlow.In InExergyFlow
          annotation (extent=[-10, -100; 10, -120]);

        annotation (Icon(
            Polygon(points=[80, -40; 52, -34; 52, -40; 80, -40], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Polygon(points=[-80, 80; -84, 60; -80, 60; -80, 80], style(
                color=0,
                fillColor=0,
                fillPattern=1)),
            Line(points=[-80, -40; 52, -40], style(color=0)),
            Line(points=[-80, 60; -80, -40], style(color=0)),
            Line(points=[-72, -32; -46, -28; -22, -18; 0, 0; 18, 32; 26, 64],
                style(color=0))), Diagram);

      end ChangeStateCIM;

    end Support;

  end BasicProcess;

end Basis;
