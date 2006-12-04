package TechThermo
    annotation (
      Icon(
        Rectangle(extent=[-80, 100; -11, 31], style(
            color=45,
            gradient=1,
            fillColor=1)),
        Rectangle(extent=[-80, 31; -11, 10], style(
            color=0,
            gradient=1,
            fillColor=7)),
        Rectangle(extent=[-80, 11; -12, -71], style(
            color=45,
            gradient=1,
            fillColor=71)),
        Rectangle(extent=[-57, 11; -36, -98], style(
            color=45,
            gradient=1,
            fillColor=7)),
        Rectangle(extent=[-100, 100; -80, 69], style(
            color=45,
            gradient=2,
            fillColor=1)),
        Rectangle(extent=[-11, 100; 12, 70], style(
            color=45,
            gradient=2,
            fillColor=1)),
        Rectangle(extent=[12, 100; 81, 31], style(
            color=45,
            gradient=1,
            fillColor=1)),
        Rectangle(extent=[12, 31; 81, 10], style(
            color=45,
            gradient=1,
            fillColor=7)),
        Rectangle(extent=[12, 11; 80, -71], style(
            color=45,
            gradient=1,
            fillColor=71)),
        Rectangle(extent=[35, 11; 56, -98], style(
            color=45,
            gradient=1,
            fillColor=7)),
        Rectangle(extent=[81, 100; 100, 70], style(
            color=45,
            gradient=2,
            fillColor=1))),
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

end TechThermo;
