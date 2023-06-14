import { createSlice, Dispatch, PayloadAction } from "@reduxjs/toolkit";
import axios from "axios";

export interface profileData {
  min_deaths: number;
  mvp: number;
  max_kills: number;
  record_count: number;
  min_duration: number;
  min_drone_kills: number;
  max_deaths: number;
  losses: number;
  min_score: number;
  tot_deaths: number;
  tot_drone_kills: number;
  sk: number;
  round_wins: number;
  max_score: number;
  wins: number;
  tot_assists: number;
  round_losses: number;
  min_kills: number;
  tot_damage_rec: number;
  draws: number;
  min_damage: number;
  max_assists: number;
  tot_duration: number;
  rounds: number;
  tot_damage: number;
  max_damage: number;
  tot_score: number;
  games: number;
  max_drone_kills: number;
  max_damage_rec: number;
  mmr: number;
  min_assists: number;
  max_duration: number;
  round_draws: number;
  min_damage_rec: number;
  tot_kills: number;
  upload_count: number;
  pk: number;
}

const initialState: profileData = {
  min_deaths: 0,
  mvp: 0,
  max_kills: 0,
  record_count: 0,
  min_duration: 0,
  min_drone_kills: 0,
  max_deaths: 0,
  losses: 0,
  min_score: 0,
  tot_deaths: 0,
  tot_drone_kills: 0,
  sk: 0,
  round_wins: 0,
  max_score: 0,
  wins: 0,
  tot_assists: 0,
  round_losses: 0,
  min_kills: 0,
  tot_damage_rec: 0,
  draws: 0,
  min_damage: 0,
  max_assists: 0,
  tot_duration: 0,
  rounds: 0,
  tot_damage: 0,
  max_damage: 0,
  tot_score: 0,
  games: 0,
  max_drone_kills: 0,
  max_damage_rec: 0,
  mmr: 0,
  min_assists: 0,
  max_duration: 0,
  round_draws: 0,
  min_damage_rec: 0,
  tot_kills: 0,
  upload_count: 0,
  pk: 0,
};

function parseProfileDatum(
  key: keyof profileData,
  state: profileData,
  newState: any,
  parse = Number.parseInt
) {
  if (
    state &&
    newState &&
    key &&
    key in newState &&
    newState[key] &&
    typeof newState[key] == "string" &&
    newState[key].length > 0
  ) {
    const parsedValue = parse(newState[key]);

    if (!Number.isNaN(parsedValue)) state[key] = parsedValue;
  }
}

const slice = createSlice({
  name: "profile",
  initialState,
  reducers: {
    setProfileData(state, action: PayloadAction<number>) {
      if (action) {
        parseProfileDatum("min_deaths", state, action.payload);
        parseProfileDatum("mvp", state, action.payload);
        parseProfileDatum("max_kills", state, action.payload);
        parseProfileDatum("record_count", state, action.payload);
        parseProfileDatum("min_duration", state, action.payload);
        parseProfileDatum("min_drone_kills", state, action.payload);
        parseProfileDatum("max_deaths", state, action.payload);
        parseProfileDatum("losses", state, action.payload);
        parseProfileDatum("min_score", state, action.payload);
        parseProfileDatum("tot_deaths", state, action.payload);
        parseProfileDatum("tot_drone_kills", state, action.payload);
        parseProfileDatum("sk", state, action.payload);
        parseProfileDatum("round_wins", state, action.payload);
        parseProfileDatum("max_score", state, action.payload);
        parseProfileDatum("wins", state, action.payload);
        parseProfileDatum("tot_assists", state, action.payload);
        parseProfileDatum("round_losses", state, action.payload);
        parseProfileDatum("min_kills", state, action.payload);
        parseProfileDatum("tot_damage_rec", state, action.payload);
        parseProfileDatum("draws", state, action.payload);
        parseProfileDatum("min_damage", state, action.payload);
        parseProfileDatum("max_assists", state, action.payload);
        parseProfileDatum("tot_duration", state, action.payload);
        parseProfileDatum("rounds", state, action.payload);
        parseProfileDatum("tot_damage", state, action.payload);
        parseProfileDatum("max_damage", state, action.payload);
        parseProfileDatum("tot_score", state, action.payload);
        parseProfileDatum("games", state, action.payload);
        parseProfileDatum("max_drone_kills", state, action.payload);
        parseProfileDatum("max_damage_rec", state, action.payload);
        parseProfileDatum("mmr", state, action.payload);
        parseProfileDatum("min_assists", state, action.payload);
        parseProfileDatum("max_duration", state, action.payload);
        parseProfileDatum("round_draws", state, action.payload);
        parseProfileDatum("min_damage_rec", state, action.payload);
        parseProfileDatum("tot_kills", state, action.payload);
        parseProfileDatum("upload_count", state, action.payload);
        parseProfileDatum("pk", state, action.payload);
      }
    },
  },
});

export default slice;

export const { reducer } = slice;

export function getProfileData(id: string) {
  return async (dispatch: Dispatch) => {
    //7907969

    const response = await axios.get(
      `https://s0lfp19zc9.execute-api.us-east-2.amazonaws.com/dev/profile/${id}`
    ); // TODO points to dev
    dispatch(slice.actions.setProfileData(response.data));
  };
}
