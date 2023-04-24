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
  HelpCircle,
  GitHub,
  Link,
} from "react-feather";

const analyticsSection = [
  {
    href: "/user",
    icon: Users,
    title: "User Profiles",
  },
  {
    href: "/activity",
    icon: Activity,
    title: "Player Activity",
  },
  {
    href: "/performance",
    icon: Crosshair,
    title: "Part Performance",
    children: [
      {
        href: "/performance/weapon",
        title: "Weapons",
      },
      {
        href: "/performance/movement",
        title: "Movement",
      },
      {
        href: "/performance/cabin",
        title: "Cabins",
      },
    ],
  },
  {
    href: "/meta",
    icon: BarChart2,
    title: "Meta Analaysis",
    children: [
      {
        href: "/meta/cw",
        title: "Clan Wars",
      },
      {
        href: "/meta/8v8",
        title: "8 vs 8",
      },
      {
        href: "/meta/brawl",
        title: "Brawl",
      },
      {
        href: "/meta/pve",
        title: "PvE",
      },
    ],
  },
  {
    href: "/revenue",
    icon: DollarSign,
    title: "Revenue",
  },
] as SidebarItemsType[];

const leaderboardSection = [
  {
    href: "/mmr",
    icon: TrendingUp,
    title: "Match Making Rank",
  },
  {
    href: "/leader",
    icon: List,
    title: "Part Leaders",
    children: [
      {
        href: "/leader/weapon",
        title: "Weapons",
      },
      {
        href: "/leader/movement",
        title: "Movement",
      },
      {
        href: "/leader/cabin",
        title: "Cabins",
      },
    ],
  },
  {
    href: "/speedrunning",
    icon: Watch,
    title: "Speed Running",
  },
] as SidebarItemsType[];

const toolsSection = [
  {
    href: "/sched",
    icon: Calendar,
    title: "Schedules",
    children: [
      {
        href: "/sched/cw",
        title: "Clan War Schedule",
      },
      {
        href: "/sched/brawl",
        title: "Brawl Schedule",
      },
    ],
  },
  {
    href: "/fcalc",
    icon: DivideSquare,
    title: "Fusion Calculator",
  },
  {
    href: "/parts",
    icon: Layout,
    title: "Part Picker",
  },
  {
    href: "/buildopt",
    icon: Cpu,
    title: "Build Optimization",
  },
] as SidebarItemsType[];

const aboutSection = [
  {
    href: "/",
    icon: HelpCircle,
    title: "About",
  },
  {
    href: "/",
    icon: GitHub,
    title: "GitHub",
  },
  {
    href: "/",
    icon: Link,
    title: "Community Links",
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
  {
    title: "About",
    pages: aboutSection,
  },
];

export default navItems;
