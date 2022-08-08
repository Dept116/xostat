import { createSlice, Dispatch, PayloadAction } from "@reduxjs/toolkit";
import axios from "axios";

export interface profileData {
  upload_count: number;
  record_count: number;
  mmr: number;
  games: number;
  tot_wins: number;
  tot_mvp: number;
  tot_kills: number;
  tot_assists: number;
  tot_deaths: number;
  tot_damage: number;
  tot_damage_rec: number;
  tot_score: number;
  tot_duration: number;
  min_wins: number;
  min_mvp: number;
  min_kills: number;
  min_assists: number;
  min_deaths: number;
  min_damage: number;
  min_damage_rec: number;
  min_score: number;
  min_duration: number;
  max_wins: number;
  max_mvp: number;
  max_kills: number;
  max_assists: number;
  max_deaths: number;
  max_damage: number;
  max_damage_rec: number;
  max_score: number;
  max_duration: number;
  avg_wins: number;
  avg_mvp: number;
  avg_kills: number;
  avg_assists: number;
  avg_deaths: number;
  avg_damage: number;
  avg_damage_rec: number;
  avg_score: number;
  avg_duration: number;
}

const initialState: profileData = {
  upload_count: 0,
  record_count: 0,
  mmr: 0,
  games: 0,
  tot_wins: 0,
  tot_mvp: 0,
  tot_kills: 0,
  tot_assists: 0,
  tot_deaths: 0,
  tot_damage: 0,
  tot_damage_rec: 0,
  tot_score: 0,
  tot_duration: 0,
  min_wins: 0,
  min_mvp: 0,
  min_kills: 0,
  min_assists: 0,
  min_deaths: 0,
  min_damage: 0,
  min_damage_rec: 0,
  min_score: 0,
  min_duration: 0,
  max_wins: 0,
  max_mvp: 0,
  max_kills: 0,
  max_assists: 0,
  max_deaths: 0,
  max_damage: 0,
  max_damage_rec: 0,
  max_score: 0,
  max_duration: 0,
  avg_wins: 0,
  avg_mvp: 0,
  avg_kills: 0,
  avg_assists: 0,
  avg_deaths: 0,
  avg_damage: 0,
  avg_damage_rec: 0,
  avg_score: 0,
  avg_duration: 0,
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
        parseProfileDatum("upload_count", state, action.payload);
        parseProfileDatum("record_count", state, action.payload);
        parseProfileDatum("mmr", state, action.payload);
        parseProfileDatum("games", state, action.payload);
        parseProfileDatum("tot_wins", state, action.payload);
        parseProfileDatum("tot_mvp", state, action.payload);
        parseProfileDatum("tot_kills", state, action.payload);
        parseProfileDatum("tot_assists", state, action.payload);
        parseProfileDatum("tot_deaths", state, action.payload);
        parseProfileDatum("tot_damage", state, action.payload);
        parseProfileDatum("tot_damage_rec", state, action.payload);
        parseProfileDatum("tot_score", state, action.payload);
        parseProfileDatum("tot_duration", state, action.payload);
        parseProfileDatum("min_wins", state, action.payload);
        parseProfileDatum("min_mvp", state, action.payload);
        parseProfileDatum("min_kills", state, action.payload);
        parseProfileDatum("min_assists", state, action.payload);
        parseProfileDatum("min_deaths", state, action.payload);
        parseProfileDatum("min_damage", state, action.payload);
        parseProfileDatum("min_damage_rec", state, action.payload);
        parseProfileDatum("min_score", state, action.payload);
        parseProfileDatum("min_duration", state, action.payload);
        parseProfileDatum("max_wins", state, action.payload);
        parseProfileDatum("max_mvp", state, action.payload);
        parseProfileDatum("max_kills", state, action.payload);
        parseProfileDatum("max_assists", state, action.payload);
        parseProfileDatum("max_deaths", state, action.payload);
        parseProfileDatum("max_damage", state, action.payload);
        parseProfileDatum("max_damage_rec", state, action.payload);
        parseProfileDatum("max_score", state, action.payload);
        parseProfileDatum("max_duration", state, action.payload);
        parseProfileDatum("avg_wins", state, action.payload);
        parseProfileDatum("avg_mvp", state, action.payload);
        parseProfileDatum("avg_kills", state, action.payload);
        parseProfileDatum("avg_assists", state, action.payload);
        parseProfileDatum("avg_deaths", state, action.payload);
        parseProfileDatum("avg_damage", state, action.payload);
        parseProfileDatum("avg_damage_rec", state, action.payload);
        parseProfileDatum("avg_score", state, action.payload);
        parseProfileDatum("avg_duration", state, action.payload);
      }
    },
  },
});

export default slice;

export const { reducer } = slice;

export function getProfileData(id: string) {
  return async (dispatch: Dispatch) => {
    if (!id || id.length === 0) return;

    const response = await axios.get(`/player/${id}`);
    dispatch(slice.actions.setProfileData(response.data));
  };
}
