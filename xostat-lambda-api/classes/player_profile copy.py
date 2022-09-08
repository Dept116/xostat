import datetime

class player_match:
    def __init__(self, match, round, player):
        # Player Attributes
        self.uid = player['uid']
        self.bot = player['bot']
        self.build_hash = player['build_hash']
        self.power_score = player['power_score']
        self.nickname = player['nickname']

        # Match Attributes
        self.match_id = match['match_id']
        self.rounds = 1
        self.match_type = match['match_type']
        self.match_classification = match['match_classification']
        self.match_start = match['match_start']
        self.match_end = match['match_end']
        self.map_name = match['map_name']
        self.map_display_name = match['map_display_name']
        self.client_version = match['client_version']
        self.co_driver_version = match['co_driver_version']
        self.host_name = match['host_name']
        
        # Match Stats
        self.duration = (datetime.datetime.strptime(round['round_end'], '%Y-%m-%dT%H:%M:%S.%fZ') - datetime.datetime.strptime(round['round_start'], '%Y-%m-%dT%H:%M:%S.%fZ')).total_seconds()
        self.team = 0
        self.kills = player['kills']
        self.assists = player['assists']
        self.drone_kills = player['drone_kills']
        self.deaths = player['deaths']
        self.score = player['score']
        self.damage = player['damage']
        self.cabin_damage = player['cabin_damage']
        self.damage_recieved = player['damage_taken']
        self.score = player['score']

        # Round Stats 
        self.r_kills = [player['kills']]
        self.r_assists = [player['assists']]
        self.r_drone_kills = [player['drone_kills']]
        self.r_deaths = [player['deaths']]
        self.r_score = [player['score']]
        self.r_damage = [player['damage']]
        self.r_cabin_damage = [player['cabin_damage']]
        self.r_damage_recieved = [player['damage_taken']]
        self.r_score = [player['score']]
        self.r_start = [round['round_start']]
        self.r_end = [round['round_end']]
        self.r_winning_teams = [round['winning_team']]

        # Medals and Resources
        self.medals = player['medals']
        self.resources = match['resources']

    def add_round(self, match, round, player):
        self.rounds += 1
        self.r_kills.append([player['kills']])
        self.r_assists.append(player['assists'])
        self.r_drone_kills.append(player['drone_kills'])
        self.r_deaths.append(player['deaths'])
        self.r_score.append(player['score'])
        self.r_damage.append(player['damage'])
        self.r_cabin_damage.append(player['cabin_damage'])
        self.r_damage_recieved.append(player['damage_taken'])
        self.r_score.append(player['score'])
        self.r_start.append(round['round_start'])
        self.r_end.append(round['round_end'])
        self.r_winning_teams.append(round['winning_team'])

    def db_item(self):
        item = {}
        return item
    
