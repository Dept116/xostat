import json
import datetime

class stats:
    def __init__(self):
        self.games = 0
        self.rounds = 0
        self.kills = 0
        self.deaths = 0
        self.assists = 0
        self.drone_kills = 0
        self.damage = 0
        self.cabin_damage = 0
        self.damage_recieved = 0
        self.score = 0
        self.duration = 0
        self.round_wins = 0
        self.round_losses = 0
        self.round_draws = 0
        self.round_unfinished = 0
        self.game_mvp = 0
        self.game_wins = 0
        self.game_losses = 0
        self.game_draws = 0
        self.game_unfinished = 0
        self.matchs = []
        self.nicknames = []

    def add_round(self, round):
        self.kills += round.get('kills', 0)
        self.deaths += round.get('deaths', 0)
        self.assists += round.get('assists', 0)
        self.drone_kills += round.get('drone_kills', 0)
        self.damage += float(round.get('damage', 0))
        self.cabin_damage += float(round.get('cabin_damage', 0))
        self.damage_recieved += float(round.get('damage_recieved', 0))
        self.score += round.get('score', 0)

        if round.get('nickname') not in self.nicknames:
            self.nicknames.append(round.get('nickname'))

        if round.get('round_start', None) != None and round.get('round_end', None) != None:
            self.duration += (datetime.datetime.strptime(round.get('round_end'), '%Y-%m-%dT%H:%M:%S.%fZ') -datetime.datetime.strptime(round.get('round_start'), '%Y-%m-%dT%H:%M:%S.%fZ')).total_seconds()
        
        self.rounds += 1
        if round.get('round_winning_team', -1) == -1 or round.get('team', -1) <= 0:
            self.round_unfinished += 1
        elif round.get('round_winning_team') == 0:
            self.round_draws += 1
        elif round.get('round_winning_team') == round.get('team'):
            self.round_wins += 1
        else:
            self.round_wins += 1

        if round.get('match_id') not in self.matchs:
            self.matchs.append(round.get('match_id'))
            self.games += 1

            if round.get('match_winning_team', -1) == -1 or round.get('team', -1) <= 0:
                self.game_unfinished += 1
            elif round.get('match_winning_team') == 0:
                self.game_draws += 1
            elif round.get('match_winning_team') == round.get('team'):
                self.game_wins += 1
            else:
                self.game_losses += 1

            if 'MvpWin' in round['medals']:
                self.game_mvp += 1
        

