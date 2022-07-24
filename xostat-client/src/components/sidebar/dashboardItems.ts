import { SidebarItemsType } from "../../types/sidebar";

import {
  List,
  Users,
  Activity,
  Crosshair,
  BarChart2,
  DollarSign,
  TrendingUp,
  Watch,
  Calendar,
  DivideSquare,
  Cpu,
  Layout,
} from "react-feather";

const analyticsSection = [
  {
    href: "/user",
    icon: Users,
    title: "User Profiles",
  },
  {
    href: "/user",
    icon: Activity,
    title: "Player Activity",
  },
  {
    href: "/user",
    icon: Crosshair,
    title: "Part Performance",
    children: [
      {
        href: "/dashboard/default",
        title: "Weapons",
      },
      {
        href: "/dashboard/default",
        title: "Movement",
      },
      {
        href: "/dashboard/default",
        title: "Cabins",
      },
    ],
  },
  {
    href: "/user",
    icon: BarChart2,
    title: "Meta Analaysis",
    children: [
      {
        href: "/dashboard/default",
        title: "Clan Wars",
      },
      {
        href: "/dashboard/default",
        title: "8 vs 8",
      },
      {
        href: "/dashboard/default",
        title: "Brawl",
      },
      {
        href: "/dashboard/default",
        title: "PvE",
      },
    ],
  },
  {
    href: "/user",
    icon: DollarSign,
    title: "Coin Revenue",
  },
] as SidebarItemsType[];

const leaderboardSection = [
  {
    href: "/user",
    icon: TrendingUp,
    title: "Match Making Rank",
  },
  {
    href: "/user",
    icon: List,
    title: "Part Leaders",
    children: [
      {
        href: "/dashboard/default",
        title: "Weapons",
      },
      {
        href: "/dashboard/default",
        title: "Movement",
      },
      {
        href: "/dashboard/default",
        title: "Cabins",
      },
    ],
  },
  {
    href: "/user",
    icon: Watch,
    title: "Speed Running",
  },
] as SidebarItemsType[];

const toolsSection = [
  {
    href: "/user",
    icon: Calendar,
    title: "Schedules",
    children: [
      {
        href: "/dashboard/default",
        title: "Clan War Schedule",
      },
      {
        href: "/dashboard/default",
        title: "Brawl Schedule",
      },
    ],
  },
  {
    href: "/user",
    icon: DivideSquare,
    title: "Fusion Calculator",
  },
  {
    href: "/user",
    icon: Layout,
    title: "Part Picker",
  },
  {
    href: "/user",
    icon: Cpu,
    title: "Build Optimization",
  },
] as SidebarItemsType[];

const navItems = [
  {
    title: "Analytics",
    pages: analyticsSection,
  },
  {
    title: "Leaderboards",
    pages: leaderboardSection,
  },
  {
    title: "Tools",
    pages: toolsSection,
  },
];

export default navItems;
