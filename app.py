import googlemaps as gmaps
import pandas as pd

place_name = 'Tipsport praha smichov'

places_result = gmaps.places(place_name)
place_id = places_result['results'][0]['place_id']

place = gmaps.place(place_id = place_id)
df = pd.DataFrame(place['result']['reviews'])
df = df[["author_name","language","rating","text","time"]]
df['datetime'] = pd.to_datetime(df['time'], unit='s')


from google.cloud import bigquery

client = bigquery.Client()

project_id = "sandbox-filip-bar"  
dataset_id = "google_reviews"  
table_id = "GoogleReviews"    


table_ref = f"{project_id}.{dataset_id}.{table_id}"


job = client.load_table_from_dataframe(df, table_ref)


job.result()

print(f"Tabulka {table_id} byla úspěšně nahrána do datasetu {dataset_id}.")