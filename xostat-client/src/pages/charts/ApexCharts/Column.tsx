import React from "react";
import Chart from "react-apexcharts";
import { ApexOptions } from "apexcharts";
import { Card } from "react-bootstrap";

import usePalette from "../../../hooks/usePalette";

const ColumnChart = () => {
  const palette = usePalette();

  const data = [
    {
      name: "Net Profit",
      data: [44, 55, 57, 56, 61, 58, 63, 60, 66],
    },
    {
      name: "Revenue",
      data: [76, 85, 101, 98, 87, 105, 91, 114, 94],
    },
    {
      name: "Free Cash Flow",
      data: [35, 41, 36, 26, 45, 48, 52, 53, 41],
    },
  ];

  const options: ApexOptions = {
    plotOptions: {
      bar: {
        horizontal: false,
        columnWidth: "55%",
      },
    },
    dataLabels: {
      enabled: false,
    },
    stroke: {
      show: true,
      width: 2,
      colors: ["transparent"],
    },
    xaxis: {
      categories: [
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
      ],
    },
    yaxis: {
      title: {
        text: "$ (thousands)",
      },
    },
    fill: {
      opacity: 1,
    },
    colors: [
      palette.primary,
      palette.success,
      palette.warning,
      palette.danger,
      palette.info,
    ],
  };

  return (
    <Card>
      <Card.Header>
        <Card.Title>Column Chart</Card.Title>
        <h6 className="card-subtitle text-muted">
          A column chart uses vertical bars to display data and is used to
          compare values across categories.
        </h6>
      </Card.Header>
      <Card.Body>
        <div className="chart">
          <Chart options={options} series={data} type="bar" height="350" />
        </div>
      </Card.Body>
    </Card>
  );
};

export default ColumnChart;
