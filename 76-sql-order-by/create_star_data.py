# watsontechworld.com

import pandas as pd

# star data from https://www.astronexus.com/projects/hyg
# first download https://www.astronexus.com/downloads/catalogs/hygdata_v41.csv.gz

# read in the compressed file directly
df = pd.read_csv('hygdata_v41.csv.gz')

# map for constellation abbreviations to their full names
constellation_map = {
    'And': 'Andromeda',
    'Aqr': 'Aquarius',
    'Aql': 'Aquila',
    'Ara': 'Ara',
    'Ari': 'Aries',
    'Aur': 'Auriga',
    'Boo': 'Boötes',
    'Cam': 'Camelopardalis',
    'Cap': 'Capricornus',
    'Car': 'Carina',
    'Cas': 'Cassiopeia',
    'Cen': 'Centaurus',
    'Cep': 'Cepheus',
    'Cet': 'Cetus',
    'CMa': 'Canis Major',
    'CMi': 'Canis Minor',
    'Cnc': 'Cancer',
    'Col': 'Columba',
    'Com': 'Coma Berenices',
    'CrB': 'Corona Borealis',
    'Cru': 'Crux',
    'Crv': 'Corvus',
    'Cyg': 'Cygnus',
    'Del': 'Delphinus',
    'Dra': 'Draco',
    'Eri': 'Eridanus',
    'Gem': 'Gemini',
    'Gru': 'Grus',
    'Her': 'Hercules',
    'Hor': 'Horologium',
    'Hya': 'Hydra',
    'Ind': 'Indus',
    'Lac': 'Lacerta',
    'Leo': 'Leo',
    'Lep': 'Lepus',
    'Lib': 'Libra',
    'Lup': 'Lupus',
    'Lyn': 'Lynx',
    'Lyr': 'Lyra',
    'Mic': 'Microscopium',
    'Mon': 'Monoceros',
    'Mus': 'Musca',
    'Nor': 'Norma',
    'Oph': 'Ophiuchus',
    'Ori': 'Orion',
    'Pav': 'Pavo',
    'Peg': 'Pegasus',
    'Per': 'Perseus',
    'Phe': 'Phoenix',
    'Pic': 'Pictor',
    'Pis': 'Pisces',
    'PsA': 'Piscis Austrinus',
    'Pup': 'Puppis',
    'Pyx': 'Pyxis',
    'Ret': 'Reticulum',
    'Scl': 'Sculptor',
    'Sco': 'Scorpius',
    'Sct': 'Scutum',
    'Ser': 'Serpens',
    'Sex': 'Sextans',
    'Sge': 'Sagitta',
    'Sgr': 'Sagittarius',
    'Tau': 'Taurus',
    'Tel': 'Telescopium',
    'TrA': 'Triangulum Australe',
    'Tri': 'Triangulum',
    'Tuc': 'Tucana',
    'UMa': 'Ursa Major',
    'UMi': 'Ursa Minor',
    'Vel': 'Vela',
    'Vir': 'Virgo',
    'Vol': 'Volans',
    'Vul': 'Vulpecula'
}

# map the abbreviated constellation names to their full names and make a column of that
df['constellation_full_name'] = df['con'].map(constellation_map)

# convert parsecs to light years
# Distance in parsecs (1 parsec ≈ 3.26 light years).
df['distance_ly'] = df['dist'] * 3.26156

# rename columns
df = df.rename(columns={'distance_ly': 'light_years_from_earth', 
                        'dist': 'parsecs_from_earth',
                        'mag': 'apparent_magnitude',
                        'proper': 'proper_star_name'
                        })

# just get the columns I want to keep
df = df[['proper_star_name', 'parsecs_from_earth', 'light_years_from_earth', 
                'constellation_full_name', 'apparent_magnitude']]

# write the data to a file called star_data.csv and have tab as the delimiter
df.to_csv('star_data.csv', sep='\t', index=False)